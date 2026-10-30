#!/usr/bin/env python3
"""Reconstruct PCM from Sorcery's original note/effect data (50 Hz).

AY tone/noise generation is synthesized offline. This is not a cycle-accurate
analogue recording. No Z80 emulator or ROM is bundled with the app.
"""
from pathlib import Path
import json, math, struct, wave
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'Sources/SorceryMac/Resources'
RATE=44100
mem=(ROOT/'Extracted/relocated.bin').read_bytes()
LEVELS=[0,.009,.013,.019,.027,.04,.057,.083,.12,.17,.25,.36,.51,.71,.85,1]

def save(name,samples):
    with wave.open(str(OUT/(name+'.wav')),'wb') as w:
        w.setnchannels(1);w.setsampwidth(2);w.setframerate(RATE)
        w.writeframes(struct.pack('<'+'h'*len(samples),*[max(-32767,min(32767,int(s*9000))) for s in samples]))

def voice(start):
    records=[];p=start
    while p<len(mem):
        note,duration=mem[p:p+2];p+=2
        if note==255:break
        period=int.from_bytes(mem[0x24b2+note*2:0x24b4+note*2],'little') if note<128 else 0
        records.append({'note':note,'ticks':duration if duration else 256,'period':period})
    return records

voices=[voice(p) for p in [0x2572,0x25f4,0x2736]]
# The FF command restarts all three sequencers at once.
length=min(sum(r['ticks'] for r in v) for v in voices)
# The C-channel volume in this disk image selects AY envelope mode. The
# original title initialises envelope registers to zero, so it remains quiet.
volumes=[15,6,0]
samples=[0.0]*(int(RATE*length/50))
for v,volume in zip(voices,volumes):
    phase=0.;cursor=0
    for r in v:
        end=min(len(samples),cursor+int(RATE*r['ticks']/50))
        frequency=1_000_000/(16*max(1,r['period']))
        for i in range(cursor,end):
            phase=(phase+frequency/RATE)%1
            samples[i]+=((1 if phase<.5 else -1)*LEVELS[volume]/2) if r['period'] else 0
        cursor=end
        if cursor>=len(samples):break
save('title-music',samples)
metadata={'sampleRate':RATE,'musicSeconds':len(samples)/RATE,'voices':voices,'effects':{}}
# Channel A effects use noise period/volume triplets. Channel B uses
# tone low/high/volume quadruplets. Durations count down inclusively.
for name,address,noise in [('death',0x2315,True),('magic',0x2346,True),('rescue',0x2371,True),
                           ('doorOpen',0x238d,False),('doorClose',0x23ba,False),
                           ('pickup',0x23e7,False),('damage',0x2408,False)]:
    p=address;phase=0.;lfsr=0x1ffff;noisephase=0.;out=[];records=[]
    while mem[p]!=255:
        duration=mem[p]+1
        if noise:period=mem[p+1]&31;volume=mem[p+2]&15;p+=3
        else:period=int.from_bytes(mem[p+1:p+3],'little')&4095;volume=mem[p+3]&15;p+=4
        records.append({'ticks':duration,'period':period,'volume':volume})
        for _ in range(int(RATE*duration/50)):
            if noise:
                noisephase+=1_000_000/(16*max(1,period))/RATE
                while noisephase>=1:
                    noisephase-=1;lfsr=(lfsr>>1)|(((lfsr^(lfsr>>3))&1)<<16)
                value=1 if lfsr&1 else -1
            else:
                phase=(phase+1_000_000/(16*max(1,period))/RATE)%1;value=1 if phase<.5 else -1
            out.append(value*LEVELS[volume]*.6)
    # A short fade avoids digital clicks when macOS stops playback.
    for i in range(min(200,len(out))):out[-i-1]*=i/200
    save(name,out);metadata['effects'][name]={'address':address,'records':records,'seconds':len(out)/RATE}
(OUT/'audio-manifest.json').write_text(json.dumps(metadata,indent=2)+'\n')
print(f'Music: {length/50:.2f}s, {len(metadata["effects"])} original effect sequences')
