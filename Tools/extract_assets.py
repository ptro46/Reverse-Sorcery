#!/usr/bin/env python3
"""Decode Sorcery's verified tile RLE and Mode 0 sprite layout.

Addresses refer to RAM after the loader's LDDR relocation (+0x7ff).
Pillow is needed only for extraction; the Mac game uses exported resources.
"""
import json
from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT/'Sources/SorceryMac/Resources'
HW_TO_FW = [13,13,19,25,1,7,10,16,7,25,24,26,6,8,15,17,1,19,18,20,0,2,9,11,4,22,21,23,3,5,12,14]

def palette(memory):
    levels = [0,128,255]
    result = []
    for h in memory[0x1cb2:0x1cc2]:
        c = HW_TO_FW[h & 31]
        result.append((levels[c//3%3], levels[c//9], levels[c%3], 255))
    return result

def pixels(b):
    return (((b>>7)&1)|((b>>2)&2)|((b>>3)&4)|((b<<2)&8),
            ((b>>6)&1)|((b>>1)&2)|((b>>2)&4)|((b<<3)&8))

def bitmap(data, width_bytes, height, colors, transparent=False):
    im = Image.new('RGBA', (width_bytes*2, height))
    for y in range(height):
        for x in range(width_bytes):
            for p, ink in enumerate(pixels(data[y*width_bytes+x])):
                im.putpixel((x*2+p,y), (0,0,0,0) if transparent and ink==0 else colors[ink])
    return im

def decode_rooms(memory):
    p, rooms = 0x3242, []
    while p < 0x5a40:
        start, tiles = p, []
        while memory[p] != 255:
            tile = memory[p]; p += 1
            if tile == 0:
                count = memory[p]; p += 1
                if count == 0: raise ValueError('Zero RLE count')
                tiles.extend([0]*count)
            else: tiles.append(tile)
        p += 1
        if len(tiles) == 719 and len(rooms) == 31:
            tiles.append(0)  # Original stream omits the final bottom-right cell.
        if len(tiles) != 720:
            raise ValueError(f'Room {len(rooms)} at {start:04x}: {len(tiles)} tiles')
        collision = []
        i = 0
        while i < 720:
            a = tiles[i]
            if a == 0 or a >= 223:
                collision.append(0); i+=1
            elif a in (30,31,70,71,110,111):
                flag = 129 if a in (30,31) else 1 if a in (70,71) else 2
                collision.extend([flag,flag]);i+=2
            else:
                collision.append(128);i+=1
        rooms.append({'id':len(rooms),'address':start,'tiles':tiles,'collision':collision})
        if len(rooms)==41: break
    return rooms

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    mem=bytearray((ROOT/'Extracted/memory.bin').read_bytes())
    mem[0x2fc5:0xaaff]=mem[0x27c6:0xa300]
    (ROOT/'Extracted/relocated.bin').write_bytes(mem)
    colors=palette(mem)
    tiles=[bitmap(mem[0x6500+i*16:0x6510+i*16],2,8,colors) for i in range(256)]
    sprites=[bitmap(mem[0x7500+i*144:0x7590+i*144],6,24,colors,True) for i in range(96)]
    sheet=Image.new('RGBA',(16*12,6*24))
    for i,im in enumerate(sprites):sheet.paste(im,(i%16*12,i//16*24))
    sheet.save(OUT/'sprites.png')
    tile_sheet=Image.new('RGBA',(16*4,16*8))
    for i,im in enumerate(tiles):tile_sheet.paste(im,(i%16*4,i//16*8))
    tile_sheet.save(OUT/'tiles.png')
    rooms=decode_rooms(mem)
    # Original text records end on a character with bit 7 set; their first
    # byte is a display attribute (the first record is an empty sentinel).
    def texts(start, count):
        p=start; records=[]
        for _ in range(count):
            p+=1; text=[]
            while True:
                b=mem[p]; p+=1; text.append(chr(b&127))
                if b&128:break
            records.append(''.join(text).rstrip('., '))
        return records
    # Skip the one-byte high-bit empty sentinel at each table's beginning.
    names=texts(0x1e3b,18)
    object_names=texts(0x1f1b,18)
    for room in rooms[:40]:
        e=list(mem[0x5b80+room['id']*48:0x5bb0+room['id']*48])
        room['name']=names[e[0]] if e[0]<len(names) else f"Room {room['id']}"
    object_ids=[0,0x28,0x29,0x2a,0x2b,0x2c,0x2d,0x37,0x38,0x39,0x3a,0x3b,0x40,0x41,0x44,0x45,0x46,0x47]
    object_labels={str(i): n for i,n in zip(object_ids,object_names)}
    atlas=Image.new('RGBA',(8*160,6*144),(0,0,0,255))
    for room in rooms:
        im=Image.new('RGBA',(160,144))
        for i,t in enumerate(room['tiles']):im.paste(tiles[t],(i%40*4,i//40*8))
        im.save(OUT/f'room-{room["id"]:02d}.png')
        atlas.paste(im,(room['id']%8*160,room['id']//8*144))
        if room['id']<40:
            i=room['id']
            room['entities']=list(mem[0x5b80+i*48:0x5bb0+i*48])
            room['objects']=list(mem[0x5a40+i*8:0x5a48+i*8])
    atlas.resize((2560,1728),Image.Resampling.NEAREST).convert('RGB').save(ROOT/'Extracted/rooms-contact.png')
    preview=Image.new('RGB',(16*56,6*80),(20,22,30));draw=ImageDraw.Draw(preview)
    for i,im in enumerate(sprites):
        x,y=i%16*56,i//16*80
        preview.paste(im.resize((48,48),Image.Resampling.NEAREST),(x,y),im.resize((48,48),Image.Resampling.NEAREST))
        draw.text((x,y+52),str(i),fill='white')
    preview.save(ROOT/'Extracted/sprites-contact.png')
    (OUT/'world.json').write_text(json.dumps({'palette':colors,'rooms':rooms,'objectNames':object_labels},separators=(',',':'))+'\n')
    print(f'{len(rooms)} rooms, {len(tiles)} tiles, {len(sprites)} sprite frames exported to {OUT}')

if __name__=='__main__':main()
