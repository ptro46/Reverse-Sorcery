#!/usr/bin/env python3
import hashlib,json,unittest
from pathlib import Path
from PIL import Image
from upscale_assets import scale3x,upscale
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'Sources/SorceryMac/Resources'

class HDTests(unittest.TestCase):
    def test_all_resources_and_original_hashes(self):
        manifest=json.loads((SRC/'HD/manifest.json').read_text())
        self.assertEqual(len(manifest['sources']),42)
        for name,digest in manifest['sources'].items():
            self.assertEqual(hashlib.sha256((SRC/name).read_bytes()).hexdigest(),digest)
        for i in range(41):
            im=Image.open(SRC/f'HD/room-{i:02d}.png')
            self.assertEqual(im.size,(2560,1152));self.assertEqual(im.getchannel('A').getextrema(),(255,255))
        with Image.open(SRC/'HD/sprites.png') as atlas:self.assertEqual(atlas.size,(3072,1152))
    def test_flat_colours_and_reflection_symmetry(self):
        im=Image.new('RGBA',(4,4),(36,140,73,255))
        self.assertEqual(scale3x(im).getextrema(),((36,36),(140,140),(73,73),(255,255)))
        im.putpixel((1,1),(255,100,0,255));im.putpixel((2,1),(255,100,0,255));im.putpixel((1,2),(255,100,0,255))
        a=scale3x(im.transpose(Image.Transpose.FLIP_LEFT_RIGHT))
        b=scale3x(im).transpose(Image.Transpose.FLIP_LEFT_RIGHT)
        self.assertEqual(a.tobytes(),b.tobytes())
    def test_transparent_edges_without_black_halo(self):
        im=Image.new('RGBA',(6,6))
        for y in range(2,4):
            for x in range(2,4):im.putpixel((x,y),(255,0,0,255))
        hd=upscale(im,True)
        self.assertEqual(hd.size,(96,48))
        self.assertEqual(hd.getpixel((0,0))[3],0)
        edges=[p for p in (hd.get_flattened_data() if hasattr(hd,"get_flattened_data") else hd.getdata()) if 0<p[3]<255]
        self.assertTrue(edges)
        self.assertTrue(all(p[0]>=250 and p[1]==0 and p[2]==0 for p in edges))

if __name__=='__main__':unittest.main()
