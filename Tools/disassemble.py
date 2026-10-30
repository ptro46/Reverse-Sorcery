#!/usr/bin/env python3
"""Linear reference listing, NOT a claim that data bytes are instructions."""
from pathlib import Path
import z80
root=Path(__file__).resolve().parents[1]
mem=(root/'Extracted/relocated.bin').read_bytes()
lines=['; Linear listing: includes inline strings and data, not just code.']
p=0x5cf
while p<0x27c6:
    s,n=z80.Z80Machine._disasm(mem[p:p+4])
    lines.append(f'{p:04x} {mem[p:p+n].hex():12} {s}')
    p+=max(n,1)
(root/'Notes/code-linear.asm').write_text('\n'.join(lines)+'\n')
