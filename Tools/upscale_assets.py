#!/usr/bin/env python3
"""Build animation-consistent HD assets from the extracted CPC graphics.

Two edge-aware Scale3x passes, then premultiplied-alpha Lanczos resampling.
The CPC's 2:1 pixel aspect is restored before display. Each sprite is processed
in isolation, with transparent padding: adjacent atlas cells never leak.
Algorithm specification: https://www.scale2x.it/algorithm
This is an independent Python implementation, not linked emulator code.
"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
import hashlib, json, time
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'Sources/SorceryMac/Resources'
OUT=SRC/'HD'
FACTOR=8

def scale3x(image):
    im=image.convert('RGBA');w,h=im.size
    src=list(im.get_flattened_data() if hasattr(im,"get_flattened_data") else im.getdata());dst=[None]*(w*h*9);dw=w*3
    for y in range(h):
        ym=max(0,y-1)*w;yc=y*w;yp=min(h-1,y+1)*w
        for x in range(w):
            xm=max(0,x-1);xp=min(w-1,x+1)
            a,b,c=src[ym+xm],src[ym+x],src[ym+xp]
            d,e,f=src[yc+xm],src[yc+x],src[yc+xp]
            g,hh,i=src[yp+xm],src[yp+x],src[yp+xp]
            block=[e]*9
            if b!=hh and d!=f:
                db=d==b;bf=b==f;dh=d==hh;hf=hh==f
                block[0]=d if db else e
                block[1]=b if (db and e!=c) or (bf and e!=a) else e
                block[2]=f if bf else e
                block[3]=d if (db and e!=g) or (dh and e!=a) else e
                block[5]=f if (bf and e!=i) or (hf and e!=c) else e
                block[6]=d if dh else e
                block[7]=hh if (dh and e!=i) or (hf and e!=g) else e
                block[8]=f if hf else e
            p=y*3*dw+x*3
            for row in range(3):dst[p+row*dw:p+row*dw+3]=block[row*3:row*3+3]
    result=Image.new('RGBA',(w*3,h*3));result.putdata(dst);return result

def upscale(image, sprite=False):
    # Black and transparent pixels must not share an unpremultiplied filter.
    # Pillow's RGBa mode keeps colour energy proportional to opacity.
    w,h=image.size
    if sprite:
        padded=Image.new('RGBA',(w+4,h+4));padded.paste(image,(2,2));image=padded
    high=scale3x(scale3x(image))
    target=(image.width*FACTOR*2,image.height*FACTOR)
    high=high.convert('RGBa').resize(target,Image.Resampling.LANCZOS).convert('RGBA')
    if sprite: high=high.crop((4*FACTOR,2*FACTOR,(4+w*2)*FACTOR,(2+h)*FACTOR))
    return high

def main():
    OUT.mkdir(exist_ok=True)
    manifest={'algorithm':'Scale3x twice + premultiplied-alpha Lanczos',
              'pixelAspect':[2,1],'displayScale':FACTOR,'rooms':41,'spriteFrames':96,'sources':{}}
    start=time.monotonic()
    for path in sorted(SRC.glob('room-*.png')):
        image=Image.open(path).convert('RGBA')
        upscale(image).save(OUT/path.name)
        manifest['sources'][path.name]=hashlib.sha256(path.read_bytes()).hexdigest()
    atlas=Image.open(SRC/'sprites.png').convert('RGBA')
    sheet=Image.new('RGBA',(16*24*FACTOR,6*24*FACTOR))
    for i in range(96):
        sprite=atlas.crop((i%16*12,i//16*24,i%16*12+12,i//16*24+24))
        sheet.paste(upscale(sprite,True),(i%16*24*FACTOR,i//16*24*FACTOR))
    sheet.save(OUT/'sprites.png')
    manifest['sources']['sprites.png']=hashlib.sha256((SRC/'sprites.png').read_bytes()).hexdigest()
    (OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(f'Generated HD textures: 41 rooms at 2560×1152, 96 sprite frames at 192×192 ({time.monotonic()-start:.1f}s)')

if __name__=='__main__':main()
