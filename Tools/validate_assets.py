#!/usr/bin/env python3
"""Differential check against original Z80 routines, for development only."""
from pathlib import Path
import json, wave
import z80
from PIL import Image
from extract_assets import bitmap,palette
ROOT=Path(__file__).resolve().parents[1]
mem=(ROOT/'Extracted/relocated.bin').read_bytes()
world=json.loads((ROOT/'Sources/SorceryMac/Resources/world.json').read_text())

def call(machine,address):
    machine.sp=0xbffe;machine.memory[0xbffe]=0;machine.memory[0xbfff]=0
    machine.pc=address;machine.set_breakpoint(0)
    for _ in range(100):
        machine.ticks_to_stop=1_000_000;machine.run()
        if machine.pc==0:return
    raise AssertionError(f'Routine {address:04x} did not return')

for room in world['rooms']:
    m=z80.Z80Machine();m.set_memory_block(0,mem);m.iy=0xab28
    m.set_input_callback(lambda port:1)
    m.memory[0xab30]=room['id']
    call(m,0xe4e)
    assert list(m.memory[0xaca8:0xaf78])==room['tiles'],f'RLE room {room["id"]}'
    call(m,0xe7b)
    # Original VRAM layout -> contiguous bytes -> decoded pixels.
    video=bytearray()
    for y in range(144):
        addr=0xc000+(y&7)*2048+(y>>3)*80
        video.extend(m.memory[addr:addr+80])
    actual=bitmap(video,80,144,palette(mem))
    exported=Image.open(ROOT/f'Sources/SorceryMac/Resources/room-{room["id"]:02d}.png').convert('RGBA')
    assert actual.tobytes()==exported.tobytes(),f'Pixels room {room["id"]}'
    call(m,0xeb4)
    expected=list(m.memory[0xaca8:0xaf78])
    assert expected==room['collision'],f'Collision room {room["id"]}: '+str([(i,a,b) for i,(a,b) in enumerate(zip(expected,room['collision'])) if a!=b][:6])
for path in (ROOT/'Sources/SorceryMac/Resources').glob('*.wav'):
    with wave.open(str(path)) as w:
        assert w.getframerate()==44100 and w.getnframes()>0
        assert any(w.readframes(w.getnframes())),path.name
print('PASS: 41 original RLE streams, 944640 pixel values, 29520 collision cells; 8 nonempty audio files.')
