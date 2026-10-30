; Linear listing: includes inline strings and data, not just code.
05cf 013a7b       ld Pbc, W0x7b3a
05d2 11feaa       ld Pde, W0xaafe
05d5 21ffa2       ld Phl, W0xa2ff
05d8 edb8         Llddr
05da 00           nop
05db 00           nop
05dc f3           di
05dd 3100c0       ld Psp, W0xc000
05e0 018c7f       ld Pbc, W0x7f8c
05e3 ed49         out (c), Rc
05e5 cddd1b       call W0x1bdd
05e8 fd2128ab     ld Piy, W0xab28
05ec 010cbc       ld Pbc, W0xbc0c
05ef 110030       ld Pde, W0x3000
05f2 ed49         out (c), Rc
05f4 04           inc Rb
05f5 ed51         out (c), Rd
05f7 05           dec Rb
05f8 0c           inc Rc
05f9 ed49         out (c), Rc
05fb 04           inc Rb
05fc ed59         out (c), Re
05fe cd1124       call W0x2411
0601 3ec3         ld Ra, N0xc3
0603 323800       ld (W0x0038), a
0606 21931d       ld Phl, W0x1d93
0609 223900       ld (W0x0039), Phl
060c 3e05         ld Ra, N0x05
060e 32971c       ld (W0x1c97), a
0611 21a61c       ld Phl, W0x1ca6
0614 22981c       ld (W0x1c98), Phl
0617 cd0516       call W0x1605
061a fb           ei
061b cdcf1b       call W0x1bcf
061e 018c7f       ld Pbc, W0x7f8c
0621 ed49         out (c), Rc
0623 21d41c       ld Phl, W0x1cd4
0626 cdbf1b       call W0x1bbf
0629 fd360828     ld R(iy + 8), N0x28
062d cd4e0e       call W0x0e4e
0630 cd7b0e       call W0x0e7b
0633 cdb40e       call W0x0eb4
0636 cdcb0d       call W0x0dcb
0639 d26506       jp Cnc, W0x0665
063c 06bc         ld Rb, N0xbc
063e 112801       ld Pde, W0x0128
0641 fdcb0046     bit U0, R(iy + 0)
0645 28fa         jr Cz, D$ - 4
0647 fdcb0086     res U0, R(iy + 0)
064b ed51         out (c), Rd
064d 04           inc Rb
064e ed59         out (c), Re
0650 05           dec Rb
0651 1d           dec Re
0652 f24106       jp Cp, W0x0641
0655 cdcf1b       call W0x1bcf
0658 112801       ld Pde, W0x0128
065b 06bc         ld Rb, N0xbc
065d ed51         out (c), Rd
065f 04           inc Rb
0660 ed59         out (c), Re
0662 c3d206       jp W0x06d2
0665 cdcf1b       call W0x1bcf
0668 018d7f       ld Pbc, W0x7f8d
066b ed49         out (c), Rc
066d 21c31c       ld Phl, W0x1cc3
0670 cdbf1b       call W0x1bbf
0673 11ff00       ld Pde, W0x00ff
0676 cd321b       call W0x1b32
0679 54           ld Rd, Rh
067a 4f           ld Rc, Ra
067b 44           ld Rb, Rh
067c 41           ld Rb, Rc
067d 59           ld Re, Rc
067e 27           daa
067f 53           ld Rd, Re
0680 2047         jr Cnz, D$ + 73
0682 52           ld Rd, Rd
0683 45           ld Rb, Rl
0684 41           ld Rb, Rc
0685 54           ld Rd, Rh
0686 45           ld Rb, Rl
0687 53           ld Rd, Re
0688 54           ld Rd, Rh
0689 2053         jr Cnz, D$ + 85
068b 4f           ld Rc, Ra
068c 52           ld Rd, Rd
068d 43           ld Rb, Re
068e 45           ld Rb, Rl
068f 52           ld Rd, Rd
0690 45           ld Rb, Rl
0691 52           ld Rd, Rd
0692 d321         out (N0x21), a
0694 94           Asub Rh
0695 21118e       ld Phl, W0x8e11
0698 02           ld (Pbc), a
0699 0e05         ld Rc, N0x05
069b 0615         ld Rb, N0x15
069d 7e           ld Ra, R(hl)
069e cd4b1b       call W0x1b4b
06a1 23           inc Phl
06a2 10f9         djnz D$ - 5
06a4 cd9f1b       call W0x1b9f
06a7 cd9f1b       call W0x1b9f
06aa cd9f1b       call W0x1b9f
06ad e5           push Ghl
06ae 216a00       ld Phl, W0x006a
06b1 19           add Phl, Pde
06b2 eb           ex de, hl
06b3 e1           pop Ghl
06b4 0d           dec Rc
06b5 20e4         jr Cnz, D$ - 26
06b7 0606         ld Rb, N0x06
06b9 fdcb0966     bit U4, R(iy + 9)
06bd cad206       jp Cz, W0x06d2
06c0 3a3b1c       ld a, (W0x1c3b)
06c3 c629         Aadd a, N0x29
06c5 323b1c       ld (W0x1c3b), a
06c8 2b           dec Phl
06c9 7c           ld Ra, Rh
06ca b5           Aor Rl
06cb 20ec         jr Cnz, D$ - 18
06cd 10ea         djnz D$ - 20
06cf c31b06       jp W0x061b
06d2 f3           di
06d3 cddd1b       call W0x1bdd
06d6 3a3b1c       ld a, (W0x1c3b)
06d9 e607         Aand N0x07
06db fe05         Acp N0x05
06dd 3802         jr Cc, D$ + 4
06df d605         Asub N0x05
06e1 4f           ld Rc, Ra
06e2 323b1c       ld (W0x1c3b), a
06e5 81           Aadd a, Rc
06e6 81           Aadd a, Rc
06e7 4f           ld Rc, Ra
06e8 0600         ld Rb, N0x00
06ea 21801d       ld Phl, W0x1d80
06ed 09           add Phl, Pbc
06ee 7e           ld Ra, R(hl)
06ef fd7708       ld R(iy + 8), Ra
06f2 23           inc Phl
06f3 7e           ld Ra, R(hl)
06f4 fd7701       ld R(iy + 1), Ra
06f7 23           inc Phl
06f8 7e           ld Ra, R(hl)
06f9 fd7702       ld R(iy + 2), Ra
06fc 3e04         ld Ra, N0x04
06fe 32971c       ld (W0x1c97), a
0701 219a1c       ld Phl, W0x1c9a
0704 22981c       ld (W0x1c98), Phl
0707 2130c6       ld Phl, W0xc630
070a 22361c       ld (W0x1c36), Phl
070d 211028       ld Phl, W0x2810
0710 22381c       ld (W0x1c38), Phl
0713 3e47         ld Ra, N0x47
0715 323a1c       ld (W0x1c3a), a
0718 21405a       ld Phl, W0x5a40
071b 1168ab       ld Pde, W0xab68
071e 014001       ld Pbc, W0x0140
0721 edb0         Lldir
0723 21805b       ld Phl, W0x5b80
0726 1178af       ld Pde, W0xaf78
0729 018007       ld Pbc, W0x0780
072c edb0         Lldir
072e 2100ab       ld Phl, W0xab00
0731 1101ab       ld Pde, W0xab01
0734 012700       ld Pbc, W0x0027
0737 3600         ld R(hl), N0x00
0739 edb0         Lldir
073b dd213c1c     ld Pix, W0x1c3c
073f 3a3b1c       ld a, (W0x1c3b)
0742 87           Aadd a, Ra
0743 87           Aadd a, Ra
0744 5f           ld Re, Ra
0745 1600         ld Rd, N0x00
0747 dd19         add Pix, Pde
0749 0604         ld Rb, N0x04
074b c5           push Gbc
074c dd7e00       ld Ra, R(ix + 0)
074f feff         Acp N0xff
0751 2824         jr Cz, D$ + 38
0753 6f           ld Rl, Ra
0754 2600         ld Rh, N0x00
0756 29           add Phl, Phl
0757 29           add Phl, Phl
0758 29           add Phl, Phl
0759 29           add Phl, Phl
075a 54           ld Rd, Rh
075b 5d           ld Re, Rl
075c 29           add Phl, Phl
075d 19           add Phl, Pde
075e 119aaf       ld Pde, W0xaf9a
0761 19           add Phl, Pde
0762 eb           ex de, hl
0763 210300       ld Phl, W0x0003
0766 19           add Phl, Pde
0767 0602         ld Rb, N0x02
0769 1a           ld a, (Pde)
076a 4e           ld Rc, R(hl)
076b eb           ex de, hl
076c 12           ld (Pde), a
076d 71           ld R(hl), Rc
076e 13           inc Pde
076f 23           inc Phl
0770 10f7         djnz D$ - 7
0772 3602         ld R(hl), N0x02
0774 eb           ex de, hl
0775 3600         ld R(hl), N0x00
0777 c1           pop Gbc
0778 dd23         inc Pix
077a 10cf         djnz D$ - 47
077c af           Axor Ra
077d 325f1c       ld (W0x1c5f), a
0780 32601c       ld (W0x1c60), a
0783 32611c       ld (W0x1c61), a
0786 322d12       ld (W0x122d), a
0789 211223       ld Phl, W0x2312
078c 220e23       ld (W0x230e), Phl
078f 221023       ld (W0x2310), Phl
0792 3e07         ld Ra, N0x07
0794 1e35         ld Re, N0x35
0796 cdf122       call W0x22f1
0799 21b21c       ld Phl, W0x1cb2
079c cdbf1b       call W0x1bbf
079f cd0516       call W0x1605
07a2 fb           ei
07a3 cdcf1b       call W0x1bcf
07a6 118007       ld Pde, W0x0780
07a9 cd321b       call W0x1b32
07ac 45           ld Rb, Rl
07ad 4e           ld Rc, R(hl)
07ae 45           ld Rb, Rl
07af 52           ld Rd, Rd
07b0 47           ld Rb, Ra
07b1 59           ld Re, Rc
07b2 2e2e         ld Rl, N0x2e
07b4 2e2e         ld Rl, N0x2e
07b6 2e2e         ld Rl, N0x2e
07b8 a5           Aand Rl
07b9 21c02f       ld Phl, W0x2fc0
07bc 1130c6       ld Pde, W0xc630
07bf 0628         ld Rb, N0x28
07c1 c5           push Gbc
07c2 d5           push Gde
07c3 011000       ld Pbc, W0x0010
07c6 edb0         Lldir
07c8 d1           pop Gde
07c9 7a           ld Ra, Rd
07ca c608         Aadd a, N0x08
07cc 57           ld Rd, Ra
07cd e638         Aand N0x38
07cf 2007         jr Cnz, D$ + 9
07d1 e5           push Ghl
07d2 2150c0       ld Phl, W0xc050
07d5 19           add Phl, Pde
07d6 eb           ex de, hl
07d7 e1           pop Ghl
07d8 c1           pop Gbc
07d9 10e6         djnz D$ - 24
07db fd7e08       ld Ra, R(iy + 8)
07de cd530b       call W0x0b53
07e1 fd360000     ld R(iy + 0), N0x00
07e5 fd36034f     ld R(iy + 3), N0x4f
07e9 fd360400     ld R(iy + 4), N0x00
07ed fd360500     ld R(iy + 5), N0x00
07f1 fd360699     ld R(iy + 6), N0x99
07f5 fd3607c0     ld R(iy + 7), N0xc0
07f9 cdf41a       call W0x1af4
07fc 3a961c       ld a, (W0x1c96)
07ff 17           rla
0800 30fa         jr Cnc, D$ - 4
0802 fdcb006e     bit U5, R(iy + 0)
0806 281c         jr Cz, D$ + 30
0808 fdcb00f6     set U6, R(iy + 0)
080c fdcb097e     bit U7, R(iy + 9)
0810 28fa         jr Cz, D$ - 4
0812 fdcb0966     bit U4, R(iy + 9)
0816 20fa         jr Cnz, D$ - 4
0818 fdcb00ae     res U5, R(iy + 0)
081c fdcb00b6     res U6, R(iy + 0)
0820 af           Axor Ra
0821 32581c       ld (W0x1c58), a
0824 3e07         ld Ra, N0x07
0826 32961c       ld (W0x1c96), a
0829 fd7e05       ld Ra, R(iy + 5)
082c 325e1c       ld (W0x1c5e), a
082f cdee0e       call W0x0eee
0832 cd561a       call W0x1a56
0835 cd2c0b       call W0x0b2c
0838 cda114       call W0x14a1
083b cddd14       call W0x14dd
083e cdc517       call W0x17c5
0841 cd4215       call W0x1542
0844 cd8415       call W0x1584
0847 cd3319       call W0x1933
084a cd4c19       call W0x194c
084d cd6619       call W0x1966
0850 cd8019       call W0x1980
0853 cda91a       call W0x1aa9
0856 fd7e08       ld Ra, R(iy + 8)
0859 fe1c         Acp N0x1c
085b ccf011       call Cz, W0x11f0
085e 3a5e1c       ld a, (W0x1c5e)
0861 fdbe05       Acp R(iy + 5)
0864 c4f41a       call Cnz, W0x1af4
0867 cd7012       call W0x1270
086a fdcb0076     bit U6, R(iy + 0)
086e 288c         jr Cz, D$ - 114
0870 11f005       ld Pde, W0x05f0
0873 215120       ld Phl, W0x2051
0876 fdcb0066     bit U4, R(iy + 0)
087a c43f1b       call Cnz, W0x1b3f
087d 0605         ld Rb, N0x05
087f 210000       ld Phl, W0x0000
0882 2b           dec Phl
0883 7c           ld Ra, Rh
0884 b5           Aor Rl
0885 20fb         jr Cnz, D$ - 3
0887 10f9         djnz D$ - 5
0889 cdcf1b       call W0x1bcf
088c 21c31c       ld Phl, W0x1cc3
088f cdbf1b       call W0x1bbf
0892 f3           di
0893 3e05         ld Ra, N0x05
0895 32971c       ld (W0x1c97), a
0898 21a61c       ld Phl, W0x1ca6
089b 22981c       ld (W0x1c98), Phl
089e cd1124       call W0x2411
08a1 cd0516       call W0x1605
08a4 fb           ei
08a5 018d7f       ld Pbc, W0x7f8d
08a8 ed49         out (c), Rc
08aa 113603       ld Pde, W0x0336
08ad cd321b       call W0x1b32
08b0 59           ld Re, Rc
08b1 4f           ld Rc, Ra
08b2 55           ld Rd, Rl
08b3 2053         jr Cnz, D$ + 85
08b5 43           ld Rb, Re
08b6 4f           ld Rc, Ra
08b7 52           ld Rd, Rd
08b8 45           ld Rb, Rl
08b9 44           ld Rb, Rh
08ba a0           Aand Rb
08bb 215f1c       ld Phl, W0x1c5f
08be cd9f1b       call W0x1b9f
08c1 cd9f1b       call W0x1b9f
08c4 cd9f1b       call W0x1b9f
08c7 11d203       ld Pde, W0x03d2
08ca cd321b       call W0x1b32
08cd 41           ld Rb, Rc
08ce 4e           ld Rc, R(hl)
08cf 44           ld Rb, Rh
08d0 2053         jr Cnz, D$ + 85
08d2 41           ld Rb, Rc
08d3 56           ld Rd, R(hl)
08d4 45           ld Rb, Rl
08d5 44           ld Rb, Rh
08d6 a0           Aand Rb
08d7 3a2d12       ld a, (W0x122d)
08da e60f         Aand N0x0f
08dc f630         Aor N0x30
08de cd4b1b       call W0x1b4b
08e1 cd321b       call W0x1b32
08e4 2053         jr Cnz, D$ + 85
08e6 4f           ld Rc, Ra
08e7 52           ld Rd, Rd
08e8 43           ld Rb, Re
08e9 45           ld Rb, Rl
08ea 52           ld Rd, Rd
08eb 45           ld Rb, Rl
08ec d23a2d       jp Cnc, W0x2d3a
08ef 12           ld (Pde), a
08f0 fe01         Acp N0x01
08f2 3e53         ld Ra, N0x53
08f4 c44b1b       call Cnz, W0x1b4b
08f7 3e2e         ld Ra, N0x2e
08f9 cd4b1b       call W0x1b4b
08fc 3a2d12       ld a, (W0x122d)
08ff 060a         ld Rb, N0x0a
0901 fe08         Acp N0x08
0903 2014         jr Cnz, D$ + 22
0905 115005       ld Pde, W0x0550
0908 210c22       ld Phl, W0x220c
090b cd3f1b       call W0x1b3f
090e 11f005       ld Pde, W0x05f0
0911 213222       ld Phl, W0x2232
0914 cd3f1b       call W0x1b3f
0917 0614         ld Rb, N0x14
0919 2b           dec Phl
091a 7c           ld Ra, Rh
091b b5           Aor Rl
091c 20fb         jr Cnz, D$ - 3
091e 10f9         djnz D$ - 5
0920 cdcf1b       call W0x1bcf
0923 dd219421     ld Pix, W0x2194
0927 215f1c       ld Phl, W0x1c5f
092a 0e00         ld Rc, N0x00
092c dd7e15       ld Ra, R(ix + 21)
092f be           Acp R(hl)
0930 3822         jr Cc, D$ + 36
0932 2012         jr Cnz, D$ + 20
0934 23           inc Phl
0935 dd7e16       ld Ra, R(ix + 22)
0938 be           Acp R(hl)
0939 3819         jr Cc, D$ + 27
093b 2008         jr Cnz, D$ + 10
093d 23           inc Phl
093e dd7e17       ld Ra, R(ix + 23)
0941 be           Acp R(hl)
0942 3810         jr Cc, D$ + 18
0944 2b           dec Phl
0945 2b           dec Phl
0946 111800       ld Pde, W0x0018
0949 dd19         add Pix, Pde
094b 0c           inc Rc
094c 79           ld Ra, Rc
094d fe05         Acp N0x05
094f 20db         jr Cnz, D$ - 35
0951 c31b06       jp W0x061b
0954 3e04         ld Ra, N0x04
0956 91           Asub Rc
0957 2811         jr Cz, D$ + 19
0959 87           Aadd a, Ra
095a 87           Aadd a, Ra
095b 87           Aadd a, Ra
095c 4f           ld Rc, Ra
095d 81           Aadd a, Rc
095e 81           Aadd a, Rc
095f 4f           ld Rc, Ra
0960 0600         ld Rb, N0x00
0962 21f321       ld Phl, W0x21f3
0965 110b22       ld Pde, W0x220b
0968 edb8         Llddr
096a 11be00       ld Pde, W0x00be
096d cd321b       call W0x1b32
0970 57           ld Rd, Ra
0971 45           ld Rb, Rl
0972 4c           ld Rc, Rh
0973 4c           ld Rc, Rh
0974 2044         jr Cnz, D$ + 70
0976 4f           ld Rc, Ra
0977 4e           ld Rc, R(hl)
0978 45           ld Rb, Rl
0979 a1           Aand Rc
097a 115001       ld Pde, W0x0150
097d cd321b       call W0x1b32
0980 59           ld Re, Rc
0981 4f           ld Rc, Ra
0982 55           ld Rd, Rl
0983 27           daa
0984 56           ld Rd, R(hl)
0985 45           ld Rb, Rl
0986 2047         jr Cnz, D$ + 73
0988 4f           ld Rc, Ra
0989 54           ld Rd, Rh
098a 2041         jr Cnz, D$ + 67
098c 2048         jr Cnz, D$ + 74
098e 49           ld Rc, Rc
098f 47           ld Rb, Ra
0990 48           ld Rc, Rb
0991 2053         jr Cnz, D$ + 85
0993 43           ld Rb, Re
0994 4f           ld Rc, Ra
0995 52           ld Rd, Rd
0996 45           ld Rb, Rl
0997 a1           Aand Rc
0998 11f101       ld Pde, W0x01f1
099b cd321b       call W0x1b32
099e 50           ld Rd, Rb
099f 4c           ld Rc, Rh
09a0 45           ld Rb, Rl
09a1 41           ld Rb, Rc
09a2 53           ld Rd, Re
09a3 45           ld Rb, Rl
09a4 2045         jr Cnz, D$ + 71
09a6 4e           ld Rc, R(hl)
09a7 54           ld Rd, Rh
09a8 45           ld Rb, Rl
09a9 52           ld Rd, Rd
09aa 2059         jr Cnz, D$ + 91
09ac 4f           ld Rc, Ra
09ad 55           ld Rd, Rl
09ae 52           ld Rd, Rd
09af 204e         jr Cnz, D$ + 80
09b1 41           ld Rb, Rc
09b2 4d           ld Rc, Rl
09b3 45           ld Rb, Rl
09b4 ae           Axor R(hl)
09b5 af           Axor Ra
09b6 32621c       ld (W0x1c62), a
09b9 32631c       ld (W0x1c63), a
09bc 21641c       ld Phl, W0x1c64
09bf 11651c       ld Pde, W0x1c65
09c2 010f00       ld Pbc, W0x000f
09c5 362e         ld R(hl), N0x2e
09c7 edb0         Lldir
09c9 112b03       ld Pde, W0x032b
09cc 21791c       ld Phl, W0x1c79
09cf 3a621c       ld a, (W0x1c62)
09d2 4f           ld Rc, Ra
09d3 0600         ld Rb, N0x00
09d5 09           add Phl, Pbc
09d6 061d         ld Rb, N0x1d
09d8 7e           ld Ra, R(hl)
09d9 cd4b1b       call W0x1b4b
09dc fe2e         Acp N0x2e
09de 2003         jr Cnz, D$ + 5
09e0 21781c       ld Phl, W0x1c78
09e3 23           inc Phl
09e4 10f2         djnz D$ - 12
09e6 2147c3       ld Phl, W0xc347
09e9 cd140b       call W0x0b14
09ec 112804       ld Pde, W0x0428
09ef 0610         ld Rb, N0x10
09f1 21641c       ld Phl, W0x1c64
09f4 7e           ld Ra, R(hl)
09f5 cd4b1b       call W0x1b4b
09f8 23           inc Phl
09f9 10f9         djnz D$ - 5
09fb 3a631c       ld a, (W0x1c63)
09fe 5f           ld Re, Ra
09ff 1600         ld Rd, N0x00
0a01 2128c4       ld Phl, W0xc428
0a04 19           add Phl, Pde
0a05 19           add Phl, Pde
0a06 cd140b       call W0x0b14
0a09 0605         ld Rb, N0x05
0a0b fdcb0046     bit U0, R(iy + 0)
0a0f 28fa         jr Cz, D$ - 4
0a11 fdcb0086     res U0, R(iy + 0)
0a15 10f4         djnz D$ - 10
0a17 fdcb0956     bit U2, R(iy + 9)
0a1b 2011         jr Cnz, D$ + 19
0a1d 3a621c       ld a, (W0x1c62)
0a20 3d           dec Ra
0a21 32621c       ld (W0x1c62), a
0a24 f2c909       jp Cp, W0x09c9
0a27 3e1c         ld Ra, N0x1c
0a29 32621c       ld (W0x1c62), a
0a2c 189b         jr D$ - 99
0a2e fdcb095e     bit U3, R(iy + 9)
0a32 2013         jr Cnz, D$ + 21
0a34 3a621c       ld a, (W0x1c62)
0a37 3c           inc Ra
0a38 32621c       ld (W0x1c62), a
0a3b fe1d         Acp N0x1d
0a3d dac909       jp Cc, W0x09c9
0a40 af           Axor Ra
0a41 32621c       ld (W0x1c62), a
0a44 c3c909       jp W0x09c9
0a47 fdcb0966     bit U4, R(iy + 9)
0a4b c2c909       jp Cnz, W0x09c9
0a4e af           Axor Ra
0a4f 32581c       ld (W0x1c58), a
0a52 3a621c       ld a, (W0x1c62)
0a55 c60e         Aadd a, N0x0e
0a57 fe1d         Acp N0x1d
0a59 3802         jr Cc, D$ + 4
0a5b d61d         Asub N0x1d
0a5d 4f           ld Rc, Ra
0a5e 0600         ld Rb, N0x00
0a60 21791c       ld Phl, W0x1c79
0a63 09           add Phl, Pbc
0a64 7e           ld Ra, R(hl)
0a65 fe23         Acp N0x23
0a67 cafd0a       jp Cz, W0x0afd
0a6a fe21         Acp N0x21
0a6c 281a         jr Cz, D$ + 28
0a6e f5           push Gaf
0a6f 3a631c       ld a, (W0x1c63)
0a72 4f           ld Rc, Ra
0a73 0600         ld Rb, N0x00
0a75 21641c       ld Phl, W0x1c64
0a78 09           add Phl, Pbc
0a79 f1           pop Gaf
0a7a 77           ld R(hl), Ra
0a7b 23           inc Phl
0a7c 3a631c       ld a, (W0x1c63)
0a7f 3c           inc Ra
0a80 32631c       ld (W0x1c63), a
0a83 fe10         Acp N0x10
0a85 dac909       jp Cc, W0x09c9
0a88 dde5         push Gix
0a8a d1           pop Gde
0a8b 21641c       ld Phl, W0x1c64
0a8e 011500       ld Pbc, W0x0015
0a91 edb0         Lldir
0a93 215f1c       ld Phl, W0x1c5f
0a96 010300       ld Pbc, W0x0003
0a99 edb0         Lldir
0a9b 215a22       ld Phl, W0x225a
0a9e 11641c       ld Pde, W0x1c64
0aa1 0e00         ld Rc, N0x00
0aa3 1a           ld a, (Pde)
0aa4 fe2e         Acp N0x2e
0aa6 2006         jr Cnz, D$ + 8
0aa8 0c           inc Rc
0aa9 13           inc Pde
0aaa cb61         bit U4, Rc
0aac 28f5         jr Cz, D$ - 9
0aae 46           ld Rb, R(hl)
0aaf 78           ld Ra, Rb
0ab0 a7           Aand Ra
0ab1 ca6506       jp Cz, W0x0665
0ab4 23           inc Phl
0ab5 81           Aadd a, Rc
0ab6 e6f0         Aand N0xf0
0ab8 203e         jr Cnz, D$ + 64
0aba 1a           ld a, (Pde)
0abb 96           Asub R(hl)
0abc 203a         jr Cnz, D$ + 60
0abe 13           inc Pde
0abf 23           inc Phl
0ac0 10f8         djnz D$ - 6
0ac2 11e406       ld Pde, W0x06e4
0ac5 cd321b       call W0x1b32
0ac8 48           ld Rc, Rb
0ac9 45           ld Rb, Rl
0aca 4c           ld Rc, Rh
0acb 4c           ld Rc, Rh
0acc 4f           ld Rc, Ra
0acd 2048         jr Cnz, D$ + 74
0acf 55           ld Rd, Rl
0ad0 47           ld Rb, Ra
0ad1 48           ld Rc, Rb
0ad2 212053       ld Phl, W0x5320
0ad5 54           ld Rd, Rh
0ad6 49           ld Rc, Rc
0ad7 43           ld Rb, Re
0ad8 4b           ld Rc, Re
0ad9 2054         jr Cnz, D$ + 86
0adb 4f           ld Rc, Ra
0adc 2054         jr Cnz, D$ + 86
0ade 41           ld Rb, Rc
0adf 42           ld Rb, Rd
0ae0 4c           ld Rc, Rh
0ae1 45           ld Rb, Rl
0ae2 2046         jr Cnz, D$ + 72
0ae4 4f           ld Rc, Ra
0ae5 4f           ld Rc, Ra
0ae6 54           ld Rd, Rh
0ae7 42           ld Rb, Rd
0ae8 41           ld Rb, Rc
0ae9 4c           ld Rc, Rh
0aea 4c           ld Rc, Rh
0aeb a1           Aand Rc
0aec 060f         ld Rb, N0x0f
0aee 2b           dec Phl
0aef 7c           ld Ra, Rh
0af0 b5           Aor Rl
0af1 20fb         jr Cnz, D$ - 3
0af3 10f9         djnz D$ - 5
0af5 c36506       jp W0x0665
0af8 23           inc Phl
0af9 10fd         djnz D$ - 1
0afb 18a1         jr D$ - 93
0afd 3a631c       ld a, (W0x1c63)
0b00 a7           Aand Ra
0b01 cac909       jp Cz, W0x09c9
0b04 3d           dec Ra
0b05 32631c       ld (W0x1c63), a
0b08 4f           ld Rc, Ra
0b09 0600         ld Rb, N0x00
0b0b 21641c       ld Phl, W0x1c64
0b0e 09           add Phl, Pbc
0b0f 362e         ld R(hl), N0x2e
0b11 c3c909       jp W0x09c9
0b14 0602         ld Rb, N0x02
0b16 7e           ld Ra, R(hl)
0b17 1f           rra
0b18 1f           rra
0b19 1f           rra
0b1a 1f           rra
0b1b e60f         Aand N0x0f
0b1d 77           ld R(hl), Ra
0b1e 23           inc Phl
0b1f 10f5         djnz D$ - 9
0b21 2b           dec Phl
0b22 2b           dec Phl
0b23 7c           ld Ra, Rh
0b24 c608         Aadd a, N0x08
0b26 67           ld Rh, Ra
0b27 e638         Aand N0x38
0b29 20e9         jr Cnz, D$ - 21
0b2b c9           ret
0b2c dd2134ab     ld Pix, W0xab34
0b30 cd3e0b       call W0x0b3e
0b33 dd213cab     ld Pix, W0xab3c
0b37 cd3e0b       call W0x0b3e
0b3a dd21e51c     ld Pix, W0x1ce5
0b3e cd700c       call W0x0c70
0b41 dd7e00       ld Ra, R(ix + 0)
0b44 e60f         Aand N0x0f
0b46 5f           ld Re, Ra
0b47 1600         ld Rd, N0x00
0b49 21621d       ld Phl, W0x1d62
0b4c 19           add Phl, Pde
0b4d 19           add Phl, Pde
0b4e 5e           ld Re, R(hl)
0b4f 23           inc Phl
0b50 56           ld Rd, R(hl)
0b51 eb           ex de, hl
0b52 e9           jp (Phl)
0b53 fd7708       ld R(iy + 8), Ra
0b56 6f           ld Rl, Ra
0b57 2600         ld Rh, N0x00
0b59 29           add Phl, Phl
0b5a 29           add Phl, Phl
0b5b 29           add Phl, Phl
0b5c 29           add Phl, Phl
0b5d 54           ld Rd, Rh
0b5e 5d           ld Re, Rl
0b5f 29           add Phl, Phl
0b60 19           add Phl, Pde
0b61 1178af       ld Pde, W0xaf78
0b64 19           add Phl, Pde
0b65 1132ab       ld Pde, W0xab32
0b68 013000       ld Pbc, W0x0030
0b6b edb0         Lldir
0b6d fd5e08       ld Re, R(iy + 8)
0b70 1600         ld Rd, N0x00
0b72 2100ab       ld Phl, W0xab00
0b75 19           add Phl, Pde
0b76 7e           ld Ra, R(hl)
0b77 36ff         ld R(hl), N0xff
0b79 010005       ld Pbc, W0x0500
0b7c a7           Aand Ra
0b7d cc8c1b       call Cz, W0x1b8c
0b80 cd4e0e       call W0x0e4e
0b83 cd7b0e       call W0x0e7b
0b86 cd9517       call W0x1795
0b89 cdb40e       call W0x0eb4
0b8c 0e31         ld Rc, N0x31
0b8e 11271d       ld Pde, W0x1d27
0b91 2144ab       ld Phl, W0xab44
0b94 cd140c       call W0x0c14
0b97 23           inc Phl
0b98 cd140c       call W0x0c14
0b9b 23           inc Phl
0b9c 0e35         ld Rc, N0x35
0b9e cd140c       call W0x0c14
0ba1 23           inc Phl
0ba2 cd140c       call W0x0c14
0ba5 23           inc Phl
0ba6 0e36         ld Rc, N0x36
0ba8 11331d       ld Pde, W0x1d33
0bab cd140c       call W0x0c14
0bae cd140c       call W0x0c14
0bb1 0e43         ld Rc, N0x43
0bb3 113c1d       ld Pde, W0x1d3c
0bb6 cd140c       call W0x0c14
0bb9 0e42         ld Rc, N0x42
0bbb 11451d       ld Pde, W0x1d45
0bbe cd140c       call W0x0c14
0bc1 cde21a       call W0x1ae2
0bc4 3e04         ld Ra, N0x04
0bc6 32961c       ld (W0x1c96), a
0bc9 21071d       ld Phl, W0x1d07
0bcc 01ff08       ld Pbc, W0x08ff
0bcf 110400       ld Pde, W0x0004
0bd2 71           ld R(hl), Rc
0bd3 19           add Phl, Pde
0bd4 10fc         djnz D$ - 2
0bd6 213012       ld Phl, W0x1230
0bd9 113112       ld Pde, W0x1231
0bdc 011f00       ld Pbc, W0x001f
0bdf 36ff         ld R(hl), N0xff
0be1 edb0         Lldir
0be3 fd7e08       ld Ra, R(iy + 8)
0be6 fe1c         Acp N0x1c
0be8 2012         jr Cnz, D$ + 20
0bea 3a2d12       ld a, (W0x122d)
0bed 87           Aadd a, Ra
0bee 87           Aadd a, Ra
0bef 280b         jr Cz, D$ + 13
0bf1 4f           ld Rc, Ra
0bf2 0600         ld Rb, N0x00
0bf4 215012       ld Phl, W0x1250
0bf7 113012       ld Pde, W0x1230
0bfa edb0         Lldir
0bfc 21e51c       ld Phl, W0x1ce5
0bff 3600         ld R(hl), N0x00
0c01 3a60ab       ld a, (W0xab60)
0c04 feff         Acp N0xff
0c06 c8           ret Cz
0c07 3605         ld R(hl), N0x05
0c09 23           inc Phl
0c0a 77           ld R(hl), Ra
0c0b 23           inc Phl
0c0c 3a61ab       ld a, (W0xab61)
0c0f 77           ld R(hl), Ra
0c10 23           inc Phl
0c11 3654         ld R(hl), N0x54
0c13 c9           ret
0c14 c5           push Gbc
0c15 e5           push Ghl
0c16 d5           push Gde
0c17 46           ld Rb, R(hl)
0c18 04           inc Rb
0c19 281b         jr Cz, D$ + 29
0c1b 05           dec Rb
0c1c 23           inc Phl
0c1d 4e           ld Rc, R(hl)
0c1e cd5a0c       call W0x0c5a
0c21 d1           pop Gde
0c22 d5           push Gde
0c23 0e03         ld Rc, N0x03
0c25 0603         ld Rb, N0x03
0c27 1a           ld a, (Pde)
0c28 77           ld R(hl), Ra
0c29 13           inc Pde
0c2a 23           inc Phl
0c2b 10fa         djnz D$ - 4
0c2d c5           push Gbc
0c2e 012500       ld Pbc, W0x0025
0c31 09           add Phl, Pbc
0c32 c1           pop Gbc
0c33 0d           dec Rc
0c34 20ef         jr Cnz, D$ - 15
0c36 d1           pop Gde
0c37 e1           pop Ghl
0c38 c1           pop Gbc
0c39 dd21ed1c     ld Pix, W0x1ced
0c3d 7e           ld Ra, R(hl)
0c3e dd7701       ld R(ix + 1), Ra
0c41 23           inc Phl
0c42 7e           ld Ra, R(hl)
0c43 dd7702       ld R(ix + 2), Ra
0c46 23           inc Phl
0c47 23           inc Phl
0c48 dd7103       ld R(ix + 3), Rc
0c4b dd7e01       ld Ra, R(ix + 1)
0c4e 3c           inc Ra
0c4f c8           ret Cz
0c50 c5           push Gbc
0c51 d5           push Gde
0c52 e5           push Ghl
0c53 cd7c0c       call W0x0c7c
0c56 e1           pop Ghl
0c57 d1           pop Gde
0c58 c1           pop Gbc
0c59 c9           ret
0c5a 78           ld Ra, Rb
0c5b e6f8         Aand N0xf8
0c5d 6f           ld Rl, Ra
0c5e 5f           ld Re, Ra
0c5f 2600         ld Rh, N0x00
0c61 54           ld Rd, Rh
0c62 29           add Phl, Phl
0c63 29           add Phl, Phl
0c64 19           add Phl, Pde
0c65 59           ld Re, Rc
0c66 cb3b         Osrl Re
0c68 cb3b         Osrl Re
0c6a 19           add Phl, Pde
0c6b 11a8ac       ld Pde, W0xaca8
0c6e 19           add Phl, Pde
0c6f c9           ret
0c70 dde5         push Gix
0c72 e1           pop Ghl
0c73 11501c       ld Pde, W0x1c50
0c76 010400       ld Pbc, W0x0004
0c79 edb0         Lldir
0c7b c9           ret
0c7c af           Axor Ra
0c7d 32541c       ld (W0x1c54), a
0c80 cdf70c       call W0x0cf7
0c83 c33f0d       jp W0x0d3f
0c86 af           Axor Ra
0c87 32551c       ld (W0x1c55), a
0c8a cdc10c       call W0x0cc1
0c8d c33f0d       jp W0x0d3f
0c90 cdc10c       call W0x0cc1
0c93 cdf70c       call W0x0cf7
0c96 3a511c       ld a, (W0x1c51)
0c99 dd9601       Asub R(ix + 1)
0c9c ca3f0d       jp Cz, W0x0d3f
0c9f 3010         jr Cnc, D$ + 18
0ca1 ed44         neg
0ca3 4f           ld Rc, Ra
0ca4 3a541c       ld a, (W0x1c54)
0ca7 91           Asub Rc
0ca8 da3f0d       jp Cc, W0x0d3f
0cab 32541c       ld (W0x1c54), a
0cae c3270d       jp W0x0d27
0cb1 d9           exx
0cb2 4f           ld Rc, Ra
0cb3 3a551c       ld a, (W0x1c55)
0cb6 91           Asub Rc
0cb7 d9           exx
0cb8 da3f0d       jp Cc, W0x0d3f
0cbb 32551c       ld (W0x1c55), a
0cbe c3270d       jp W0x0d27
0cc1 af           Axor Ra
0cc2 32541c       ld (W0x1c54), a
0cc5 3a501c       ld a, (W0x1c50)
0cc8 17           rla
0cc9 3029         jr Cnc, D$ + 43
0ccb ddcb00be     res U7, R(ix + 0)
0ccf 3a521c       ld a, (W0x1c52)
0cd2 1f           rra
0cd3 21540d       ld Phl, W0x0d54
0cd6 3003         jr Cnc, D$ + 5
0cd8 216d0d       ld Phl, W0x0d6d
0cdb 222d0d       ld (W0x0d2d), Phl
0cde 3a531c       ld a, (W0x1c53)
0ce1 cd960d       call W0x0d96
0ce4 3a511c       ld a, (W0x1c51)
0ce7 47           ld Rb, Ra
0ce8 3a521c       ld a, (W0x1c52)
0ceb 4f           ld Rc, Ra
0cec cdac0d       call W0x0dac
0cef 3e18         ld Ra, N0x18
0cf1 32541c       ld (W0x1c54), a
0cf4 0e00         ld Rc, N0x00
0cf6 c9           ret
0cf7 af           Axor Ra
0cf8 32551c       ld (W0x1c55), a
0cfb d9           exx
0cfc ddcb00fe     set U7, R(ix + 0)
0d00 ddcb0246     bit U0, R(ix + 2)
0d04 21540d       ld Phl, W0x0d54
0d07 2803         jr Cz, D$ + 5
0d09 216d0d       ld Phl, W0x0d6d
0d0c 22360d       ld (W0x0d36), Phl
0d0f dd7e03       ld Ra, R(ix + 3)
0d12 cd960d       call W0x0d96
0d15 dd4601       ld Rb, R(ix + 1)
0d18 dd4e02       ld Rc, R(ix + 2)
0d1b cdac0d       call W0x0dac
0d1e 3e18         ld Ra, N0x18
0d20 32551c       ld (W0x1c55), a
0d23 0e00         ld Rc, N0x00
0d25 d9           exx
0d26 c9           ret
0d27 79           ld Ra, Rc
0d28 a7           Aand Ra
0d29 2804         jr Cz, D$ + 6
0d2b 0d           dec Rc
0d2c cd0000       call W0x0000
0d2f d9           exx
0d30 79           ld Ra, Rc
0d31 a7           Aand Ra
0d32 2807         jr Cz, D$ + 9
0d34 0d           dec Rc
0d35 cd0000       call W0x0000
0d38 d9           exx
0d39 18ec         jr D$ - 18
0d3b d9           exx
0d3c b1           Aor Rc
0d3d 20e8         jr Cnz, D$ - 22
0d3f 3a541c       ld a, (W0x1c54)
0d42 4f           ld Rc, Ra
0d43 d9           exx
0d44 3a551c       ld a, (W0x1c55)
0d47 4f           ld Rc, Ra
0d48 d9           exx
0d49 b1           Aor Rc
0d4a c8           ret Cz
0d4b af           Axor Ra
0d4c 32551c       ld (W0x1c55), a
0d4f 32541c       ld (W0x1c54), a
0d52 18d3         jr D$ - 43
0d54 0606         ld Rb, N0x06
0d56 e5           push Ghl
0d57 1a           ld a, (Pde)
0d58 ae           Axor R(hl)
0d59 77           ld R(hl), Ra
0d5a 13           inc Pde
0d5b 23           inc Phl
0d5c 10f9         djnz D$ - 5
0d5e e1           pop Ghl
0d5f 7c           ld Ra, Rh
0d60 c608         Aadd a, N0x08
0d62 67           ld Rh, Ra
0d63 e638         Aand N0x38
0d65 c0           ret Cnz
0d66 d5           push Gde
0d67 1150c0       ld Pde, W0xc050
0d6a 19           add Phl, Pde
0d6b d1           pop Gde
0d6c c9           ret
0d6d c5           push Gbc
0d6e e5           push Ghl
0d6f 010006       ld Pbc, W0x0600
0d72 1a           ld a, (Pde)
0d73 0f           rrca
0d74 a9           Axor Rc
0d75 e655         Aand N0x55
0d77 a9           Axor Rc
0d78 ae           Axor R(hl)
0d79 77           ld R(hl), Ra
0d7a 1a           ld a, (Pde)
0d7b 17           rla
0d7c 4f           ld Rc, Ra
0d7d 13           inc Pde
0d7e 23           inc Phl
0d7f 10f1         djnz D$ - 13
0d81 79           ld Ra, Rc
0d82 e6aa         Aand N0xaa
0d84 ae           Axor R(hl)
0d85 77           ld R(hl), Ra
0d86 e1           pop Ghl
0d87 c1           pop Gbc
0d88 7c           ld Ra, Rh
0d89 c608         Aadd a, N0x08
0d8b 67           ld Rh, Ra
0d8c e638         Aand N0x38
0d8e c0           ret Cnz
0d8f d5           push Gde
0d90 1150c0       ld Pde, W0xc050
0d93 19           add Phl, Pde
0d94 d1           pop Gde
0d95 c9           ret
0d96 e5           push Ghl
0d97 57           ld Rd, Ra
0d98 1e00         ld Re, N0x00
0d9a 6f           ld Rl, Ra
0d9b 63           ld Rh, Re
0d9c 29           add Phl, Phl
0d9d 29           add Phl, Phl
0d9e 29           add Phl, Phl
0d9f 29           add Phl, Phl
0da0 cb3a         Osrl Rd
0da2 cb1b         Orr Re
0da4 19           add Phl, Pde
0da5 110075       ld Pde, W0x7500
0da8 19           add Phl, Pde
0da9 eb           ex de, hl
0daa e1           pop Ghl
0dab c9           ret
0dac d5           push Gde
0dad 78           ld Ra, Rb
0dae e6f8         Aand N0xf8
0db0 6f           ld Rl, Ra
0db1 2600         ld Rh, N0x00
0db3 29           add Phl, Phl
0db4 54           ld Rd, Rh
0db5 5d           ld Re, Rl
0db6 29           add Phl, Phl
0db7 29           add Phl, Phl
0db8 19           add Phl, Pde
0db9 78           ld Ra, Rb
0dba 17           rla
0dbb 17           rla
0dbc 17           rla
0dbd e638         Aand N0x38
0dbf f6c0         Aor N0xc0
0dc1 b4           Aor Rh
0dc2 67           ld Rh, Ra
0dc3 59           ld Re, Rc
0dc4 1600         ld Rd, N0x00
0dc6 cb3b         Osrl Re
0dc8 19           add Phl, Pde
0dc9 d1           pop Gde
0dca c9           ret
0dcb 216f20       ld Phl, W0x206f
0dce 22420e       ld (W0x0e42), Phl
0dd1 2a420e       ld Phl, (W0x0e42)
0dd4 3a3b1c       ld a, (W0x1c3b)
0dd7 c64b         Aadd a, N0x4b
0dd9 323b1c       ld (W0x1c3b), a
0ddc 7e           ld Ra, R(hl)
0ddd 23           inc Phl
0dde 22420e       ld (W0x0e42), Phl
0de1 a7           Aand Ra
0de2 c8           ret Cz
0de3 fdcb0966     bit U4, R(iy + 9)
0de7 37           scf
0de8 c8           ret Cz
0de9 6f           ld Rl, Ra
0dea 2600         ld Rh, N0x00
0dec 29           add Phl, Phl
0ded 29           add Phl, Phl
0dee 29           add Phl, Phl
0def 7c           ld Ra, Rh
0df0 c662         Aadd a, N0x62
0df2 67           ld Rh, Ra
0df3 11460e       ld Pde, W0x0e46
0df6 010800       ld Pbc, W0x0008
0df9 edb0         Lldir
0dfb 0604         ld Rb, N0x04
0dfd fdcb0046     bit U0, R(iy + 0)
0e01 28fa         jr Cz, D$ - 4
0e03 fdcb0086     res U0, R(iy + 0)
0e07 0e00         ld Rc, N0x00
0e09 21460e       ld Phl, W0x0e46
0e0c 22440e       ld (W0x0e44), Phl
0e0f 2190c6       ld Phl, W0xc690
0e12 79           ld Ra, Rc
0e13 b4           Aor Rh
0e14 67           ld Rh, Ra
0e15 54           ld Rd, Rh
0e16 5d           ld Re, Rl
0e17 23           inc Phl
0e18 c5           push Gbc
0e19 014f00       ld Pbc, W0x004f
0e1c edb0         Lldir
0e1e c1           pop Gbc
0e1f 2a440e       ld Phl, (W0x0e44)
0e22 7e           ld Ra, R(hl)
0e23 e6c0         Aand N0xc0
0e25 12           ld (Pde), a
0e26 cb16         Orl R(hl)
0e28 cb16         Orl R(hl)
0e2a 23           inc Phl
0e2b 22440e       ld (W0x0e44), Phl
0e2e 79           ld Ra, Rc
0e2f c608         Aadd a, N0x08
0e31 4f           ld Rc, Ra
0e32 e6c0         Aand N0xc0
0e34 28d9         jr Cz, D$ - 37
0e36 c5           push Gbc
0e37 cd3319       call W0x1933
0e3a cd8019       call W0x1980
0e3d c1           pop Gbc
0e3e 10bd         djnz D$ - 65
0e40 188f         jr D$ - 111
0e42 00           nop
0e43 00           nop
0e44 00           nop
0e45 00           nop
0e46 00           nop
0e47 00           nop
0e48 00           nop
0e49 00           nop
0e4a 00           nop
0e4b 00           nop
0e4c 00           nop
0e4d 00           nop
0e4e fd4608       ld Rb, R(iy + 8)
0e51 04           inc Rb
0e52 114032       ld Pde, W0x3240
0e55 1a           ld a, (Pde)
0e56 13           inc Pde
0e57 3c           inc Ra
0e58 2806         jr Cz, D$ + 8
0e5a 3d           dec Ra
0e5b 20f8         jr Cnz, D$ - 6
0e5d 13           inc Pde
0e5e 18f5         jr D$ - 9
0e60 10f3         djnz D$ - 11
0e62 21a8ac       ld Phl, W0xaca8
0e65 1a           ld a, (Pde)
0e66 3c           inc Ra
0e67 c8           ret Cz
0e68 3d           dec Ra
0e69 2803         jr Cz, D$ + 5
0e6b 77           ld R(hl), Ra
0e6c 1809         jr D$ + 11
0e6e 13           inc Pde
0e6f 1a           ld a, (Pde)
0e70 47           ld Rb, Ra
0e71 af           Axor Ra
0e72 77           ld R(hl), Ra
0e73 23           inc Phl
0e74 10fc         djnz D$ - 2
0e76 2b           dec Phl
0e77 13           inc Pde
0e78 23           inc Phl
0e79 18ea         jr D$ - 20
0e7b 2100c0       ld Phl, W0xc000
0e7e 11a8ac       ld Pde, W0xaca8
0e81 cd0516       call W0x1605
0e84 01d002       ld Pbc, W0x02d0
0e87 c5           push Gbc
0e88 d5           push Gde
0e89 e5           push Ghl
0e8a 1a           ld a, (Pde)
0e8b 6f           ld Rl, Ra
0e8c 2600         ld Rh, N0x00
0e8e 29           add Phl, Phl
0e8f 29           add Phl, Phl
0e90 29           add Phl, Phl
0e91 29           add Phl, Phl
0e92 110065       ld Pde, W0x6500
0e95 19           add Phl, Pde
0e96 d1           pop Gde
0e97 d5           push Gde
0e98 0608         ld Rb, N0x08
0e9a 48           ld Rc, Rb
0e9b 7e           ld Ra, R(hl)
0e9c 12           ld (Pde), a
0e9d 23           inc Phl
0e9e 13           inc Pde
0e9f 7e           ld Ra, R(hl)
0ea0 12           ld (Pde), a
0ea1 23           inc Phl
0ea2 1b           dec Pde
0ea3 7a           ld Ra, Rd
0ea4 81           Aadd a, Rc
0ea5 57           ld Rd, Ra
0ea6 10f3         djnz D$ - 11
0ea8 e1           pop Ghl
0ea9 d1           pop Gde
0eaa c1           pop Gbc
0eab 23           inc Phl
0eac 23           inc Phl
0ead 13           inc Pde
0eae 0b           dec Pbc
0eaf 78           ld Ra, Rb
0eb0 b1           Aor Rc
0eb1 20d4         jr Cnz, D$ - 42
0eb3 c9           ret
0eb4 21a8ac       ld Phl, W0xaca8
0eb7 01d002       ld Pbc, W0x02d0
0eba 7e           ld Ra, R(hl)
0ebb 3600         ld R(hl), N0x00
0ebd 3d           dec Ra
0ebe fede         Acp N0xde
0ec0 3025         jr Cnc, D$ + 39
0ec2 3c           inc Ra
0ec3 d61e         Asub N0x1e
0ec5 d602         Asub N0x02
0ec7 3810         jr Cc, D$ + 18
0ec9 d626         Asub N0x26
0ecb d602         Asub N0x02
0ecd 380e         jr Cc, D$ + 16
0ecf d626         Asub N0x26
0ed1 d602         Asub N0x02
0ed3 380c         jr Cc, D$ + 14
0ed5 3680         ld R(hl), N0x80
0ed7 180e         jr D$ + 16
0ed9 1681         ld Rd, N0x81
0edb 1806         jr D$ + 8
0edd 1601         ld Rd, N0x01
0edf 1802         jr D$ + 4
0ee1 1602         ld Rd, N0x02
0ee3 72           ld R(hl), Rd
0ee4 23           inc Phl
0ee5 0b           dec Pbc
0ee6 72           ld R(hl), Rd
0ee7 23           inc Phl
0ee8 0b           dec Pbc
0ee9 78           ld Ra, Rb
0eea b1           Aor Rc
0eeb 20cd         jr Cnz, D$ - 49
0eed c9           ret
0eee dd2128ab     ld Pix, W0xab28
0ef2 cd700c       call W0x0c70
0ef5 fd7e00       ld Ra, R(iy + 0)
0ef8 e607         Aand N0x07
0efa 5f           ld Re, Ra
0efb 1600         ld Rd, N0x00
0efd 21701d       ld Phl, W0x1d70
0f00 19           add Phl, Pde
0f01 19           add Phl, Pde
0f02 5e           ld Re, R(hl)
0f03 23           inc Phl
0f04 56           ld Rd, R(hl)
0f05 eb           ex de, hl
0f06 e9           jp (Phl)
0f07 fd3407       inc R(iy + 7)
0f0a c0           ret Cnz
0f0b fd3400       inc R(iy + 0)
0f0e c9           ret
0f0f fd3404       inc R(iy + 4)
0f12 fd7e04       ld Ra, R(iy + 4)
0f15 e603         Aand N0x03
0f17 c2900c       jp Cnz, W0x0c90
0f1a fd3503       dec R(iy + 3)
0f1d fd7e03       ld Ra, R(iy + 3)
0f20 fe4b         Acp N0x4b
0f22 c2900c       jp Cnz, W0x0c90
0f25 fd360320     ld R(iy + 3), N0x20
0f29 fd3400       inc R(iy + 0)
0f2c c3900c       jp W0x0c90
0f2f fdcb0946     bit U0, R(iy + 9)
0f33 200b         jr Cnz, D$ + 13
0f35 cdb411       call W0x11b4
0f38 3806         jr Cc, D$ + 8
0f3a fd3501       dec R(iy + 1)
0f3d fd3501       dec R(iy + 1)
0f40 fdcb0956     bit U2, R(iy + 9)
0f44 2039         jr Cnz, D$ + 59
0f46 cd7711       call W0x1177
0f49 3808         jr Cc, D$ + 10
0f4b fd3502       dec R(iy + 2)
0f4e fd3502       dec R(iy + 2)
0f51 182c         jr D$ + 46
0f53 061c         ld Rb, N0x1c
0f55 0e31         ld Rc, N0x31
0f57 fd7e01       ld Ra, R(iy + 1)
0f5a 2144ab       ld Phl, W0xab44
0f5d be           Acp R(hl)
0f5e 200b         jr Cnz, D$ + 13
0f60 fd7e02       ld Ra, R(iy + 2)
0f63 d60c         Asub N0x0c
0f65 23           inc Phl
0f66 be           Acp R(hl)
0f67 2b           dec Phl
0f68 cc3213       call Cz, W0x1332
0f6b fd7e01       ld Ra, R(iy + 1)
0f6e 2148ab       ld Phl, W0xab48
0f71 be           Acp R(hl)
0f72 200b         jr Cnz, D$ + 13
0f74 fd7e02       ld Ra, R(iy + 2)
0f77 d60c         Asub N0x0c
0f79 23           inc Phl
0f7a be           Acp R(hl)
0f7b 2b           dec Phl
0f7c cc3213       call Cz, W0x1332
0f7f fdcb095e     bit U3, R(iy + 9)
0f83 2039         jr Cnz, D$ + 59
0f85 cd8e11       call W0x118e
0f88 3808         jr Cc, D$ + 10
0f8a fd3402       inc R(iy + 2)
0f8d fd3402       inc R(iy + 2)
0f90 182c         jr D$ + 46
0f92 0624         ld Rb, N0x24
0f94 0e35         ld Rc, N0x35
0f96 fd7e01       ld Ra, R(iy + 1)
0f99 214cab       ld Phl, W0xab4c
0f9c be           Acp R(hl)
0f9d 200b         jr Cnz, D$ + 13
0f9f fd7e02       ld Ra, R(iy + 2)
0fa2 c60c         Aadd a, N0x0c
0fa4 23           inc Phl
0fa5 be           Acp R(hl)
0fa6 2b           dec Phl
0fa7 cc3213       call Cz, W0x1332
0faa fd7e01       ld Ra, R(iy + 1)
0fad 2150ab       ld Phl, W0xab50
0fb0 be           Acp R(hl)
0fb1 200b         jr Cnz, D$ + 13
0fb3 fd7e02       ld Ra, R(iy + 2)
0fb6 c60c         Aadd a, N0x0c
0fb8 23           inc Phl
0fb9 be           Acp R(hl)
0fba 2b           dec Phl
0fbb cc3213       call Cz, W0x1332
0fbe fdcb0946     bit U0, R(iy + 9)
0fc2 2842         jr Cz, D$ + 68
0fc4 cdcb11       call W0x11cb
0fc7 3808         jr Cc, D$ + 10
0fc9 fd3401       inc R(iy + 1)
0fcc fd3401       inc R(iy + 1)
0fcf 1835         jr D$ + 55
0fd1 0603         ld Rb, N0x03
0fd3 79           ld Ra, Rc
0fd4 e603         Aand N0x03
0fd6 2802         jr Cz, D$ + 4
0fd8 04           inc Rb
0fd9 23           inc Phl
0fda 7e           ld Ra, R(hl)
0fdb fe81         Acp N0x81
0fdd 2027         jr Cnz, D$ + 41
0fdf 2b           dec Phl
0fe0 10f8         djnz D$ - 6
0fe2 fd360348     ld R(iy + 3), N0x48
0fe6 fd360400     ld R(iy + 4), N0x00
0fea fd7e00       ld Ra, R(iy + 0)
0fed e6f8         Aand N0xf8
0fef f605         Aor N0x05
0ff1 fd7700       ld R(iy + 0), Ra
0ff4 211523       ld Phl, W0x2315
0ff7 220e23       ld (W0x230e), Phl
0ffa 11f005       ld Pde, W0x05f0
0ffd 211520       ld Phl, W0x2015
1000 cd3f1b       call W0x1b3f
1003 c3900c       jp W0x0c90
1006 fd7e06       ld Ra, R(iy + 6)
1009 a7           Aand Ra
100a 2017         jr Cnz, D$ + 25
100c fd360320     ld R(iy + 3), N0x20
1010 fd3400       inc R(iy + 0)
1013 fd360400     ld R(iy + 4), N0x00
1017 11f005       ld Pde, W0x05f0
101a 213320       ld Phl, W0x2033
101d cd3f1b       call W0x1b3f
1020 c3900c       jp W0x0c90
1023 fd3404       inc R(iy + 4)
1026 fd7e09       ld Ra, R(iy + 9)
1029 2f           cpl
102a e604         Aand N0x04
102c 4f           ld Rc, Ra
102d fd7e09       ld Ra, R(iy + 9)
1030 2f           cpl
1031 1f           rra
1032 e604         Aand N0x04
1034 47           ld Rb, Ra
1035 3e20         ld Ra, N0x20
1037 91           Asub Rc
1038 80           Aadd a, Rb
1039 47           ld Rb, Ra
103a fd7e04       ld Ra, R(iy + 4)
103d 1f           rra
103e 1f           rra
103f e603         Aand N0x03
1041 b0           Aor Rb
1042 fd7703       ld R(iy + 3), Ra
1045 cd900c       call W0x0c90
1048 fd4601       ld Rb, R(iy + 1)
104b fd4e02       ld Rc, R(iy + 2)
104e cd5a0c       call W0x0c5a
1051 115000       ld Pde, W0x0050
1054 78           ld Ra, Rb
1055 e607         Aand N0x07
1057 2803         jr Cz, D$ + 5
1059 117800       ld Pde, W0x0078
105c 19           add Phl, Pde
105d 79           ld Ra, Rc
105e e603         Aand N0x03
1060 0603         ld Rb, N0x03
1062 2801         jr Cz, D$ + 3
1064 04           inc Rb
1065 7e           ld Ra, R(hl)
1066 fe02         Acp N0x02
1068 2804         jr Cz, D$ + 6
106a 23           inc Phl
106b 10f8         djnz D$ - 6
106d c9           ret
106e 3a561c       ld a, (W0x1c56)
1071 d632         Asub N0x32
1073 32561c       ld (W0x1c56), a
1076 d0           ret Cnc
1077 fd7e06       ld Ra, R(iy + 6)
107a d601         Asub N0x01
107c d8           ret Cc
107d 27           daa
107e fd7706       ld R(iy + 6), Ra
1081 cda91a       call W0x1aa9
1084 c9           ret
1085 cdcb11       call W0x11cb
1088 3809         jr Cc, D$ + 11
108a fd3401       inc R(iy + 1)
108d fd3401       inc R(iy + 1)
1090 c3900c       jp W0x0c90
1093 fd36034c     ld R(iy + 3), N0x4c
1097 fd360400     ld R(iy + 4), N0x00
109b fd3400       inc R(iy + 0)
109e 217123       ld Phl, W0x2371
10a1 220e23       ld (W0x230e), Phl
10a4 c3900c       jp W0x0c90
10a7 fd3404       inc R(iy + 4)
10aa fd7e04       ld Ra, R(iy + 4)
10ad e603         Aand N0x03
10af c2900c       jp Cnz, W0x0c90
10b2 fd3403       inc R(iy + 3)
10b5 fd7e03       ld Ra, R(iy + 3)
10b8 fe50         Acp N0x50
10ba c2900c       jp Cnz, W0x0c90
10bd fd7e00       ld Ra, R(iy + 0)
10c0 e6f8         Aand N0xf8
10c2 fd7700       ld R(iy + 0), Ra
10c5 fdcb00f6     set U6, R(iy + 0)
10c9 c3860c       jp W0x0c86
10cc fd3404       inc R(iy + 4)
10cf fd7e04       ld Ra, R(iy + 4)
10d2 e603         Aand N0x03
10d4 c2900c       jp Cnz, W0x0c90
10d7 fdcb005e     bit U3, R(iy + 0)
10db 200f         jr Cnz, D$ + 17
10dd fd3403       inc R(iy + 3)
10e0 fd7e03       ld Ra, R(iy + 3)
10e3 fe4c         Acp N0x4c
10e5 c2900c       jp Cnz, W0x0c90
10e8 fdcb00de     set U3, R(iy + 0)
10ec fd3503       dec R(iy + 3)
10ef fd7e03       ld Ra, R(iy + 3)
10f2 fe47         Acp N0x47
10f4 c2900c       jp Cnz, W0x0c90
10f7 fd36035e     ld R(iy + 3), N0x5e
10fb fd3400       inc R(iy + 0)
10fe fd3607e0     ld R(iy + 7), N0xe0
1102 c3900c       jp W0x0c90
1105 fd3404       inc R(iy + 4)
1108 fd7e04       ld Ra, R(iy + 4)
110b e603         Aand N0x03
110d c2900c       jp Cnz, W0x0c90
1110 fd7e03       ld Ra, R(iy + 3)
1113 ee01         Axor N0x01
1115 fd7703       ld R(iy + 3), Ra
1118 fd3407       inc R(iy + 7)
111b c2900c       jp Cnz, W0x0c90
111e fd7e00       ld Ra, R(iy + 0)
1121 e6f8         Aand N0xf8
1123 fd7700       ld R(iy + 0), Ra
1126 ddcb00f6     set U6, R(ix + 0)
112a c3860c       jp W0x0c86
112d 010ef4       ld Pbc, W0xf40e
1130 ed49         out (c), Rc
1132 0100f6       ld Pbc, W0xf600
1135 3ec0         ld Ra, N0xc0
1137 ed79         out (c), Ra
1139 ed49         out (c), Rc
113b 04           inc Rb
113c 3e92         ld Ra, N0x92
113e ed79         out (c), Ra
1140 c5           push Gbc
1141 05           dec Rb
1142 3e49         ld Ra, N0x49
1144 ed79         out (c), Ra
1146 06f4         ld Rb, N0xf4
1148 ed78         in Ra, (c)
114a fd7709       ld R(iy + 9), Ra
114d c1           pop Gbc
114e 3e82         ld Ra, N0x82
1150 ed79         out (c), Ra
1152 05           dec Rb
1153 ed49         out (c), Rc
1155 fdcb0966     bit U4, R(iy + 9)
1159 200d         jr Cnz, D$ + 15
115b 3a581c       ld a, (W0x1c58)
115e fdae09       Axor R(iy + 9)
1161 ee10         Axor N0x10
1163 fd7709       ld R(iy + 9), Ra
1166 1805         jr D$ + 7
1168 3e10         ld Ra, N0x10
116a 32581c       ld (W0x1c58), a
116d fdcb097e     bit U7, R(iy + 9)
1171 c0           ret Cnz
1172 fdcb00ee     set U5, R(iy + 0)
1176 c9           ret
1177 dd4601       ld Rb, R(ix + 1)
117a dd4e02       ld Rc, R(ix + 2)
117d 79           ld Ra, Rc
117e d602         Asub N0x02
1180 d8           ret Cc
1181 79           ld Ra, Rc
1182 e603         Aand N0x03
1184 c0           ret Cnz
1185 cd5a0c       call W0x0c5a
1188 112800       ld Pde, W0x0028
118b 2b           dec Phl
118c 1817         jr D$ + 25
118e dd4601       ld Rb, R(ix + 1)
1191 dd4e02       ld Rc, R(ix + 2)
1194 79           ld Ra, Rc
1195 fe94         Acp N0x94
1197 37           scf
1198 c8           ret Cz
1199 e603         Aand N0x03
119b c0           ret Cnz
119c cd5a0c       call W0x0c5a
119f 112800       ld Pde, W0x0028
11a2 23           inc Phl
11a3 23           inc Phl
11a4 23           inc Phl
11a5 7e           ld Ra, R(hl)
11a6 19           add Phl, Pde
11a7 b6           Aor R(hl)
11a8 19           add Phl, Pde
11a9 b6           Aor R(hl)
11aa 17           rla
11ab d8           ret Cc
11ac 78           ld Ra, Rb
11ad e607         Aand N0x07
11af c8           ret Cz
11b0 19           add Phl, Pde
11b1 7e           ld Ra, R(hl)
11b2 17           rla
11b3 c9           ret
11b4 dd4601       ld Rb, R(ix + 1)
11b7 dd4e02       ld Rc, R(ix + 2)
11ba 78           ld Ra, Rb
11bb d602         Asub N0x02
11bd d8           ret Cc
11be 78           ld Ra, Rb
11bf e607         Aand N0x07
11c1 c0           ret Cnz
11c2 cd5a0c       call W0x0c5a
11c5 11d8ff       ld Pde, W0xffd8
11c8 19           add Phl, Pde
11c9 1815         jr D$ + 23
11cb dd4601       ld Rb, R(ix + 1)
11ce dd4e02       ld Rc, R(ix + 2)
11d1 78           ld Ra, Rb
11d2 fe78         Acp N0x78
11d4 37           scf
11d5 c8           ret Cz
11d6 e607         Aand N0x07
11d8 c0           ret Cnz
11d9 cd5a0c       call W0x0c5a
11dc 117800       ld Pde, W0x0078
11df 19           add Phl, Pde
11e0 7e           ld Ra, R(hl)
11e1 23           inc Phl
11e2 b6           Aor R(hl)
11e3 23           inc Phl
11e4 b6           Aor R(hl)
11e5 17           rla
11e6 d8           ret Cc
11e7 79           ld Ra, Rc
11e8 e603         Aand N0x03
11ea c8           ret Cz
11eb 23           inc Phl
11ec 7e           ld Ra, R(hl)
11ed 2b           dec Phl
11ee 17           rla
11ef c9           ret
11f0 3a2f12       ld a, (W0x122f)
11f3 3c           inc Ra
11f4 e603         Aand N0x03
11f6 322f12       ld (W0x122f), a
11f9 87           Aadd a, Ra
11fa 87           Aadd a, Ra
11fb 87           Aadd a, Ra
11fc 5f           ld Re, Ra
11fd 1600         ld Rd, N0x00
11ff dd213012     ld Pix, W0x1230
1203 dd19         add Pix, Pde
1205 0602         ld Rb, N0x02
1207 c5           push Gbc
1208 dd7e00       ld Ra, R(ix + 0)
120b feff         Acp N0xff
120d 2815         jr Cz, D$ + 23
120f cd700c       call W0x0c70
1212 dd7e03       ld Ra, R(ix + 3)
1215 3c           inc Ra
1216 ddae03       Axor R(ix + 3)
1219 e603         Aand N0x03
121b ddae03       Axor R(ix + 3)
121e dd7703       ld R(ix + 3), Ra
1221 cd900c       call W0x0c90
1224 c1           pop Gbc
1225 110400       ld Pde, W0x0004
1228 dd19         add Pix, Pde
122a 10db         djnz D$ - 35
122c c9           ret
122d 00           nop
122e 00           nop
122f 00           nop
1230 00           nop
1231 00           nop
1232 00           nop
1233 00           nop
1234 00           nop
1235 00           nop
1236 00           nop
1237 00           nop
1238 00           nop
1239 00           nop
123a 00           nop
123b 00           nop
123c 00           nop
123d 00           nop
123e 00           nop
123f 00           nop
1240 00           nop
1241 00           nop
1242 00           nop
1243 00           nop
1244 00           nop
1245 00           nop
1246 00           nop
1247 00           nop
1248 00           nop
1249 00           nop
124a 00           nop
124b 00           nop
124c 00           nop
124d 00           nop
124e 00           nop
124f 00           nop
1250 00           nop
1251 68           ld Rl, Rb
1252 04           inc Rb
1253 54           ld Rd, Rh
1254 00           nop
1255 68           ld Rl, Rb
1256 8c           Aadc a, Rh
1257 57           ld Rd, Ra
1258 00           nop
1259 58           ld Re, Rb
125a 14           inc Rd
125b 55           ld Rd, Rl
125c 00           nop
125d 58           ld Re, Rb
125e 7c           ld Ra, Rh
125f 56           ld Rd, R(hl)
1260 00           nop
1261 48           ld Rc, Rb
1262 24           inc Rh
1263 54           ld Rd, Rh
1264 00           nop
1265 48           ld Rc, Rb
1266 6c           ld Rl, Rh
1267 57           ld Rd, Ra
1268 00           nop
1269 3834         jr Cc, D$ + 54
126b 55           ld Rd, Rl
126c 00           nop
126d 385c         jr Cc, D$ + 94
126f 56           ld Rd, R(hl)
1270 3a2d12       ld a, (W0x122d)
1273 fe08         Acp N0x08
1275 c0           ret Cnz
1276 fd7e08       ld Ra, R(iy + 8)
1279 fe1c         Acp N0x1c
127b c0           ret Cnz
127c fd7e01       ld Ra, R(iy + 1)
127f fe18         Acp N0x18
1281 c0           ret Cnz
1282 fd7e02       ld Ra, R(iy + 2)
1285 fe48         Acp N0x48
1287 c0           ret Cnz
1288 fdcb00f6     set U6, R(iy + 0)
128c 1680         ld Rd, N0x80
128e 21b31c       ld Phl, W0x1cb3
1291 01017f       ld Pbc, W0x7f01
1294 3a961c       ld a, (W0x1c96)
1297 17           rla
1298 30fa         jr Cnc, D$ - 4
129a 3e06         ld Ra, N0x06
129c 32961c       ld (W0x1c96), a
129f 7e           ld Ra, R(hl)
12a0 82           Aadd a, Rd
12a1 e61f         Aand N0x1f
12a3 f640         Aor N0x40
12a5 ed49         out (c), Rc
12a7 ed79         out (c), Ra
12a9 23           inc Phl
12aa 0c           inc Rc
12ab cb61         bit U4, Rc
12ad 28f0         jr Cz, D$ - 14
12af 15           dec Rd
12b0 7a           ld Ra, Rd
12b1 feff         Acp N0xff
12b3 20d9         jr Cnz, D$ - 37
12b5 af           Axor Ra
12b6 322d12       ld (W0x122d), a
12b9 3e46         ld Ra, N0x46
12bb 322e12       ld (W0x122e), a
12be 3a961c       ld a, (W0x1c96)
12c1 17           rla
12c2 30fa         jr Cnc, D$ - 4
12c4 3e07         ld Ra, N0x07
12c6 32961c       ld (W0x1c96), a
12c9 3a2e12       ld a, (W0x122e)
12cc 3d           dec Ra
12cd 322e12       ld (W0x122e), a
12d0 202e         jr Cnz, D$ + 48
12d2 3e32         ld Ra, N0x32
12d4 322e12       ld (W0x122e), a
12d7 3a2d12       ld a, (W0x122d)
12da 3c           inc Ra
12db 322d12       ld (W0x122d), a
12de 3d           dec Ra
12df 87           Aadd a, Ra
12e0 87           Aadd a, Ra
12e1 5f           ld Re, Ra
12e2 1600         ld Rd, N0x00
12e4 dd213012     ld Pix, W0x1230
12e8 dd19         add Pix, Pde
12ea cd700c       call W0x0c70
12ed dd7e03       ld Ra, R(ix + 3)
12f0 e603         Aand N0x03
12f2 f620         Aor N0x20
12f4 dd7703       ld R(ix + 3), Ra
12f7 cd900c       call W0x0c90
12fa 217123       ld Phl, W0x2371
12fd 220e23       ld (W0x230e), Phl
1300 dd2128ab     ld Pix, W0xab28
1304 cd700c       call W0x0c70
1307 cd2310       call W0x1023
130a cdf011       call W0x11f0
130d 3a2d12       ld a, (W0x122d)
1310 fe08         Acp N0x08
1312 20aa         jr Cnz, D$ - 84
1314 2100c0       ld Phl, W0xc000
1317 112d02       ld Pde, W0x022d
131a 01c000       ld Pbc, W0x00c0
131d 3600         ld R(hl), N0x00
131f 0680         ld Rb, N0x80
1321 10fe         djnz D$ + 0
1323 19           add Phl, Pde
1324 cbf4         set U6, Rh
1326 cbfc         set U7, Rh
1328 7c           ld Ra, Rh
1329 a9           Axor Rc
132a b5           Aor Rl
132b 20f0         jr Cnz, D$ - 14
132d fdcb00f6     set U6, R(iy + 0)
1331 c9           ret
1332 cd8814       call W0x1488
1335 d0           ret Cnc
1336 dd21ed1c     ld Pix, W0x1ced
133a d1           pop Gde
133b dd360080     ld R(ix + 0), N0x80
133f 7e           ld Ra, R(hl)
1340 dd7701       ld R(ix + 1), Ra
1343 23           inc Phl
1344 7e           ld Ra, R(hl)
1345 dd7702       ld R(ix + 2), Ra
1348 23           inc Phl
1349 23           inc Phl
134a 3600         ld R(hl), N0x00
134c 2b           dec Phl
134d dd7103       ld R(ix + 3), Rc
1350 e5           push Ghl
1351 78           ld Ra, Rb
1352 32571c       ld (W0x1c57), a
1355 fd7703       ld R(iy + 3), Ra
1358 dd2128ab     ld Pix, W0xab28
135c cd900c       call W0x0c90
135f 218d23       ld Phl, W0x238d
1362 221023       ld (W0x2310), Phl
1365 cdde15       call W0x15de
1368 dd21ed1c     ld Pix, W0x1ced
136c cd700c       call W0x0c70
136f dd3503       dec R(ix + 3)
1372 cd0516       call W0x1605
1375 cd900c       call W0x0c90
1378 dd7e03       ld Ra, R(ix + 3)
137b d62e         Asub N0x2e
137d e603         Aand N0x03
137f 20e4         jr Cnz, D$ - 26
1381 cdde15       call W0x15de
1384 cd700c       call W0x0c70
1387 3a571c       ld a, (W0x1c57)
138a fe20         Acp N0x20
138c 9f           Asbc a, Ra
138d f601         Aor N0x01
138f 87           Aadd a, Ra
1390 fd8602       Aadd a, R(iy + 2)
1393 fd7702       ld R(iy + 2), Ra
1396 cd900c       call W0x0c90
1399 3a571c       ld a, (W0x1c57)
139c fe20         Acp N0x20
139e 9f           Asbc a, Ra
139f e6fc         Aand N0xfc
13a1 f604         Aor N0x04
13a3 fd8602       Aadd a, R(iy + 2)
13a6 47           ld Rb, Ra
13a7 3aef1c       ld a, (W0x1cef)
13aa b8           Acp Rb
13ab 20d4         jr Cnz, D$ - 42
13ad fd6e08       ld Rl, R(iy + 8)
13b0 2600         ld Rh, N0x00
13b2 29           add Phl, Phl
13b3 29           add Phl, Phl
13b4 29           add Phl, Phl
13b5 29           add Phl, Phl
13b6 54           ld Rd, Rh
13b7 5d           ld Re, Rl
13b8 29           add Phl, Phl
13b9 19           add Phl, Pde
13ba 1178af       ld Pde, W0xaf78
13bd 19           add Phl, Pde
13be eb           ex de, hl
13bf 2132ab       ld Phl, W0xab32
13c2 013000       ld Pbc, W0x0030
13c5 fdcb0cbe     res U7, R(iy + 12)
13c9 fdcb14be     res U7, R(iy + 20)
13cd edb0         Lldir
13cf e1           pop Ghl
13d0 7e           ld Ra, R(hl)
13d1 f5           push Gaf
13d2 e63f         Aand N0x3f
13d4 cd530b       call W0x0b53
13d7 f1           pop Gaf
13d8 cb7f         bit U7, Ra
13da 2021         jr Cnz, D$ + 35
13dc 2144ab       ld Phl, W0xab44
13df cb77         bit U6, Ra
13e1 2803         jr Cz, D$ + 5
13e3 2148ab       ld Phl, W0xab48
13e6 7e           ld Ra, R(hl)
13e7 fd7701       ld R(iy + 1), Ra
13ea 23           inc Phl
13eb 7e           ld Ra, R(hl)
13ec c604         Aadd a, N0x04
13ee fd7702       ld R(iy + 2), Ra
13f1 c608         Aadd a, N0x08
13f3 47           ld Rb, Ra
13f4 3e24         ld Ra, N0x24
13f6 32571c       ld (W0x1c57), a
13f9 0e31         ld Rc, N0x31
13fb 181f         jr D$ + 33
13fd 214cab       ld Phl, W0xab4c
1400 cb77         bit U6, Ra
1402 2803         jr Cz, D$ + 5
1404 2150ab       ld Phl, W0xab50
1407 7e           ld Ra, R(hl)
1408 fd7701       ld R(iy + 1), Ra
140b 23           inc Phl
140c 7e           ld Ra, R(hl)
140d d604         Asub N0x04
140f fd7702       ld R(iy + 2), Ra
1412 d608         Asub N0x08
1414 47           ld Rb, Ra
1415 3e1c         ld Ra, N0x1c
1417 32571c       ld (W0x1c57), a
141a 0e35         ld Rc, N0x35
141c dd21ed1c     ld Pix, W0x1ced
1420 fdcb00be     res U7, R(iy + 0)
1424 fd7007       ld R(iy + 7), Rb
1427 dd360080     ld R(ix + 0), N0x80
142b 7e           ld Ra, R(hl)
142c dd7702       ld R(ix + 2), Ra
142f 2b           dec Phl
1430 7e           ld Ra, R(hl)
1431 dd7701       ld R(ix + 1), Ra
1434 dd7103       ld R(ix + 3), Rc
1437 cd700c       call W0x0c70
143a dd7e03       ld Ra, R(ix + 3)
143d d603         Asub N0x03
143f dd7703       ld R(ix + 3), Ra
1442 cd900c       call W0x0c90
1445 cdde15       call W0x15de
1448 cd700c       call W0x0c70
144b 3a571c       ld a, (W0x1c57)
144e fe20         Acp N0x20
1450 9f           Asbc a, Ra
1451 f601         Aor N0x01
1453 87           Aadd a, Ra
1454 fd8602       Aadd a, R(iy + 2)
1457 fd7702       ld R(iy + 2), Ra
145a cd900c       call W0x0c90
145d fd7e02       ld Ra, R(iy + 2)
1460 fdbe07       Acp R(iy + 7)
1463 20e0         jr Cnz, D$ - 30
1465 21ba23       ld Phl, W0x23ba
1468 221023       ld (W0x2310), Phl
146b cdde15       call W0x15de
146e dd21ed1c     ld Pix, W0x1ced
1472 cd700c       call W0x0c70
1475 dd3403       inc R(ix + 3)
1478 cd0516       call W0x1605
147b cd900c       call W0x0c90
147e dd7e03       ld Ra, R(ix + 3)
1481 d631         Asub N0x31
1483 e603         Aand N0x03
1485 20e4         jr Cnz, D$ - 26
1487 c9           ret
1488 23           inc Phl
1489 23           inc Phl
148a 23           inc Phl
148b 7e           ld Ra, R(hl)
148c 2b           dec Phl
148d 2b           dec Phl
148e 2b           dec Phl
148f d601         Asub N0x01
1491 d8           ret Cc
1492 e5           push Ghl
1493 5f           ld Re, Ra
1494 1600         ld Rd, N0x00
1496 218f1d       ld Phl, W0x1d8f
1499 19           add Phl, Pde
149a 19           add Phl, Pde
149b 5e           ld Re, R(hl)
149c 23           inc Phl
149d 56           ld Rd, R(hl)
149e eb           ex de, hl
149f e3           ex (sp), Phl
14a0 c9           ret
14a1 fd7e2c       ld Ra, R(iy + 44)
14a4 feff         Acp N0xff
14a6 c8           ret Cz
14a7 fdcb0076     bit U6, R(iy + 0)
14ab c0           ret Cnz
14ac d610         Asub N0x10
14ae fdbe01       Acp R(iy + 1)
14b1 2022         jr Cnz, D$ + 36
14b3 fd7e2d       ld Ra, R(iy + 45)
14b6 fd9602       Asub R(iy + 2)
14b9 c604         Aadd a, N0x04
14bb fe09         Acp N0x09
14bd 3016         jr Cnc, D$ + 24
14bf fd7e06       ld Ra, R(iy + 6)
14c2 fe99         Acp N0x99
14c4 280f         jr Cz, D$ + 17
14c6 c601         Aadd a, N0x01
14c8 27           daa
14c9 fd7706       ld R(iy + 6), Ra
14cc cda91a       call W0x1aa9
14cf 210824       ld Phl, W0x2408
14d2 221023       ld (W0x2310), Phl
14d5 fd462c       ld Rb, R(iy + 44)
14d8 fd4e2d       ld Rc, R(iy + 45)
14db 1841         jr D$ + 67
14dd fd7e2f       ld Ra, R(iy + 47)
14e0 feff         Acp N0xff
14e2 c8           ret Cz
14e3 fdcb0076     bit U6, R(iy + 0)
14e7 c0           ret Cnz
14e8 d610         Asub N0x10
14ea fdbe01       Acp R(iy + 1)
14ed 2029         jr Cnz, D$ + 43
14ef fd7e30       ld Ra, R(iy + 48)
14f2 fd9602       Asub R(iy + 2)
14f5 c604         Aadd a, N0x04
14f7 fe09         Acp N0x09
14f9 301d         jr Cnc, D$ + 31
14fb fd4631       ld Rb, R(iy + 49)
14fe fd7e06       ld Ra, R(iy + 6)
1501 a7           Aand Ra
1502 2814         jr Cz, D$ + 22
1504 d601         Asub N0x01
1506 27           daa
1507 fd7706       ld R(iy + 6), Ra
150a cda91a       call W0x1aa9
150d 210824       ld Phl, W0x2408
1510 221023       ld (W0x2310), Phl
1513 cd0516       call W0x1605
1516 10e6         djnz D$ - 24
1518 fd462f       ld Rb, R(iy + 47)
151b fd4e30       ld Rc, R(iy + 48)
151e 3a5a1c       ld a, (W0x1c5a)
1521 fe04         Acp N0x04
1523 c0           ret Cnz
1524 cdac0d       call W0x0dac
1527 114e1d       ld Pde, W0x1d4e
152a 0e04         ld Rc, N0x04
152c 0605         ld Rb, N0x05
152e 1a           ld a, (Pde)
152f ae           Axor R(hl)
1530 77           ld R(hl), Ra
1531 23           inc Phl
1532 13           inc Pde
1533 10f9         djnz D$ - 5
1535 2b           dec Phl
1536 2b           dec Phl
1537 2b           dec Phl
1538 2b           dec Phl
1539 2b           dec Phl
153a 7c           ld Ra, Rh
153b c608         Aadd a, N0x08
153d 67           ld Rh, Ra
153e 0d           dec Rc
153f 20eb         jr Cnz, D$ - 19
1541 c9           ret
1542 fd7e35       ld Ra, R(iy + 53)
1545 feff         Acp N0xff
1547 c8           ret Cz
1548 d608         Asub N0x08
154a fdbe01       Acp R(iy + 1)
154d c0           ret Cnz
154e fd7e36       ld Ra, R(iy + 54)
1551 fdbe02       Acp R(iy + 2)
1554 c0           ret Cnz
1555 fd7e37       ld Ra, R(iy + 55)
1558 fdbe05       Acp R(iy + 5)
155b c0           ret Cnz
155c fd360500     ld R(iy + 5), N0x00
1560 dd21ed1c     ld Pix, W0x1ced
1564 dd360080     ld R(ix + 0), N0x80
1568 fd7e35       ld Ra, R(iy + 53)
156b dd7701       ld R(ix + 1), Ra
156e fd7e36       ld Ra, R(iy + 54)
1571 dd7702       ld R(ix + 2), Ra
1574 dd360342     ld R(ix + 3), N0x42
1578 cd700c       call W0x0c70
157b cd860c       call W0x0c86
157e fd3635ff     ld R(iy + 53), N0xff
1582 1842         jr D$ + 68
1584 fd7e32       ld Ra, R(iy + 50)
1587 feff         Acp N0xff
1589 c8           ret Cz
158a fdbe01       Acp R(iy + 1)
158d c0           ret Cnz
158e fd7e33       ld Ra, R(iy + 51)
1591 fd9602       Asub R(iy + 2)
1594 c608         Aadd a, N0x08
1596 e6ef         Aand N0xef
1598 c0           ret Cnz
1599 fd7e34       ld Ra, R(iy + 52)
159c fdbe05       Acp R(iy + 5)
159f c0           ret Cnz
15a0 fd360500     ld R(iy + 5), N0x00
15a4 dd21ed1c     ld Pix, W0x1ced
15a8 dd360080     ld R(ix + 0), N0x80
15ac fd7e32       ld Ra, R(iy + 50)
15af dd7701       ld R(ix + 1), Ra
15b2 fd7e33       ld Ra, R(iy + 51)
15b5 dd7702       ld R(ix + 2), Ra
15b8 dd360343     ld R(ix + 3), N0x43
15bc cd700c       call W0x0c70
15bf cd860c       call W0x0c86
15c2 fd3632ff     ld R(iy + 50), N0xff
15c6 dd4601       ld Rb, R(ix + 1)
15c9 dd4e02       ld Rc, R(ix + 2)
15cc cd5a0c       call W0x0c5a
15cf 112600       ld Pde, W0x0026
15d2 010003       ld Pbc, W0x0300
15d5 71           ld R(hl), Rc
15d6 23           inc Phl
15d7 71           ld R(hl), Rc
15d8 23           inc Phl
15d9 71           ld R(hl), Rc
15da 19           add Phl, Pde
15db 10f8         djnz D$ - 6
15dd c9           ret
15de dd2128ab     ld Pix, W0xab28
15e2 cd700c       call W0x0c70
15e5 3a571c       ld a, (W0x1c57)
15e8 47           ld Rb, Ra
15e9 fd7e04       ld Ra, R(iy + 4)
15ec 1f           rra
15ed 1f           rra
15ee e603         Aand N0x03
15f0 b0           Aor Rb
15f1 fd7703       ld R(iy + 3), Ra
15f4 fd3404       inc R(iy + 4)
15f7 cd0516       call W0x1605
15fa cd900c       call W0x0c90
15fd fd7e04       ld Ra, R(iy + 4)
1600 e603         Aand N0x03
1602 20da         jr Cnz, D$ - 36
1604 c9           ret
1605 c5           push Gbc
1606 06f5         ld Rb, N0xf5
1608 ed78         in Ra, (c)
160a 1f           rra
160b 30fb         jr Cnc, D$ - 3
160d c1           pop Gbc
160e c9           ret
160f fd7e00       ld Ra, R(iy + 0)
1612 e607         Aand N0x07
1614 fe02         Acp N0x02
1616 c2900c       jp Cnz, W0x0c90
1619 0e2d         ld Rc, N0x2d
161b cdb918       call W0x18b9
161e 0e4b         ld Rc, N0x4b
1620 cdb31a       call W0x1ab3
1623 fd7e02       ld Ra, R(iy + 2)
1626 ddbe02       Acp R(ix + 2)
1629 3008         jr Cnc, D$ + 10
162b cd7711       call W0x1177
162e 3803         jr Cc, D$ + 5
1630 dd3502       dec R(ix + 2)
1633 dd7e02       ld Ra, R(ix + 2)
1636 fdbe02       Acp R(iy + 2)
1639 3008         jr Cnc, D$ + 10
163b cd8e11       call W0x118e
163e 3803         jr Cc, D$ + 5
1640 dd3402       inc R(ix + 2)
1643 fd7e01       ld Ra, R(iy + 1)
1646 ddbe01       Acp R(ix + 1)
1649 3008         jr Cnc, D$ + 10
164b cdb411       call W0x11b4
164e 3803         jr Cc, D$ + 5
1650 dd3501       dec R(ix + 1)
1653 dd7e01       ld Ra, R(ix + 1)
1656 fdbe01       Acp R(iy + 1)
1659 3008         jr Cnc, D$ + 10
165b cdcb11       call W0x11cb
165e 3803         jr Cc, D$ + 5
1660 dd3401       inc R(ix + 1)
1663 dd3404       inc R(ix + 4)
1666 dd7e04       ld Ra, R(ix + 4)
1669 1f           rra
166a 1f           rra
166b ddae03       Axor R(ix + 3)
166e e603         Aand N0x03
1670 ddae03       Axor R(ix + 3)
1673 dd7703       ld R(ix + 3), Ra
1676 cd900c       call W0x0c90
1679 c9           ret
167a fd7e00       ld Ra, R(iy + 0)
167d e607         Aand N0x07
167f fe02         Acp N0x02
1681 c2900c       jp Cnz, W0x0c90
1684 0e41         ld Rc, N0x41
1686 cdb918       call W0x18b9
1689 0e3c         ld Rc, N0x3c
168b cdb31a       call W0x1ab3
168e dd3404       inc R(ix + 4)
1691 fd7e02       ld Ra, R(iy + 2)
1694 ddbe02       Acp R(ix + 2)
1697 3026         jr Cnc, D$ + 40
1699 dd7e04       ld Ra, R(ix + 4)
169c e603         Aand N0x03
169e 200e         jr Cnz, D$ + 16
16a0 dd3503       dec R(ix + 3)
16a3 dd7e03       ld Ra, R(ix + 3)
16a6 fe10         Acp N0x10
16a8 3004         jr Cnc, D$ + 6
16aa dd360313     ld R(ix + 3), N0x13
16ae dd7e03       ld Ra, R(ix + 3)
16b1 fe15         Acp N0x15
16b3 302e         jr Cnc, D$ + 48
16b5 cd7711       call W0x1177
16b8 3829         jr Cc, D$ + 43
16ba dd3502       dec R(ix + 2)
16bd 1824         jr D$ + 38
16bf dd7e04       ld Ra, R(ix + 4)
16c2 e603         Aand N0x03
16c4 200e         jr Cnz, D$ + 16
16c6 dd3403       inc R(ix + 3)
16c9 dd7e03       ld Ra, R(ix + 3)
16cc fe1c         Acp N0x1c
16ce 3804         jr Cc, D$ + 6
16d0 dd360318     ld R(ix + 3), N0x18
16d4 dd7e03       ld Ra, R(ix + 3)
16d7 fe17         Acp N0x17
16d9 3808         jr Cc, D$ + 10
16db cd8e11       call W0x118e
16de 3803         jr Cc, D$ + 5
16e0 dd3402       inc R(ix + 2)
16e3 cd900c       call W0x0c90
16e6 c9           ret
16e7 fd7e00       ld Ra, R(iy + 0)
16ea e607         Aand N0x07
16ec fe02         Acp N0x02
16ee c2900c       jp Cnz, W0x0c90
16f1 0e2c         ld Rc, N0x2c
16f3 cdb918       call W0x18b9
16f6 0e32         ld Rc, N0x32
16f8 cdb31a       call W0x1ab3
16fb dd4606       ld Rb, R(ix + 6)
16fe dd4e01       ld Rc, R(ix + 1)
1701 dd5602       ld Rd, R(ix + 2)
1704 dd5e03       ld Re, R(ix + 3)
1707 dd6604       ld Rh, R(ix + 4)
170a 24           inc Rh
170b cb48         bit U1, Rb
170d 2817         jr Cz, D$ + 25
170f cb44         bit U0, Rh
1711 c27517       jp Cnz, W0x1775
1714 78           ld Ra, Rb
1715 1f           rra
1716 9f           Asbc a, Ra
1717 f601         Aor N0x01
1719 83           Aadd a, Re
171a 5f           ld Re, Ra
171b d608         Asub N0x08
171d fe04         Acp N0x04
171f da7517       jp Cc, W0x1775
1722 cb88         res U1, Rb
1724 184f         jr D$ + 81
1726 7a           ld Ra, Rd
1727 fdbe02       Acp R(iy + 2)
172a 2834         jr Cz, D$ + 54
172c 3819         jr Cc, D$ + 27
172e 7b           ld Ra, Re
172f fe08         Acp N0x08
1731 3808         jr Cc, D$ + 10
1733 1e0b         ld Re, N0x0b
1735 cbc8         set U1, Rb
1737 cbc0         set U0, Rb
1739 183a         jr D$ + 60
173b 15           dec Rd
173c 15           dec Rd
173d 7c           ld Ra, Rh
173e 1f           rra
173f 1f           rra
1740 e603         Aand N0x03
1742 f604         Aor N0x04
1744 5f           ld Re, Ra
1745 182e         jr D$ + 48
1747 7b           ld Ra, Re
1748 fe0c         Acp N0x0c
174a 3008         jr Cnc, D$ + 10
174c 1e08         ld Re, N0x08
174e cbc8         set U1, Rb
1750 cb80         res U0, Rb
1752 1821         jr D$ + 35
1754 14           inc Rd
1755 14           inc Rd
1756 7c           ld Ra, Rh
1757 1f           rra
1758 1f           rra
1759 e603         Aand N0x03
175b f60c         Aor N0x0c
175d 5f           ld Re, Ra
175e 1815         jr D$ + 23
1760 7b           ld Ra, Re
1761 fe0a         Acp N0x0a
1763 9f           Asbc a, Ra
1764 2f           cpl
1765 e601         Aand N0x01
1767 f602         Aor N0x02
1769 a8           Axor Rb
176a e603         Aand N0x03
176c a8           Axor Rb
176d 47           ld Rb, Ra
176e 1f           rra
176f 9f           Asbc a, Ra
1770 e603         Aand N0x03
1772 c608         Aadd a, N0x08
1774 5f           ld Re, Ra
1775 fd7e01       ld Ra, R(iy + 1)
1778 91           Asub Rc
1779 2805         jr Cz, D$ + 7
177b 9f           Asbc a, Ra
177c f601         Aor N0x01
177e 81           Aadd a, Rc
177f 4f           ld Rc, Ra
1780 dd7006       ld R(ix + 6), Rb
1783 dd7101       ld R(ix + 1), Rc
1786 dd7202       ld R(ix + 2), Rd
1789 dd7303       ld R(ix + 3), Re
178c dd7404       ld R(ix + 4), Rh
178f cd900c       call W0x0c90
1792 c9           ret
1793 af           Axor Ra
1794 c9           ret
1795 fd6e08       ld Rl, R(iy + 8)
1798 2600         ld Rh, N0x00
179a 29           add Phl, Phl
179b 29           add Phl, Phl
179c 29           add Phl, Phl
179d 1168ab       ld Pde, W0xab68
17a0 19           add Phl, Pde
17a1 0602         ld Rb, N0x02
17a3 e5           push Ghl
17a4 c5           push Gbc
17a5 11ee1c       ld Pde, W0x1cee
17a8 010300       ld Pbc, W0x0003
17ab edb0         Lldir
17ad dd21ed1c     ld Pix, W0x1ced
17b1 dd360000     ld R(ix + 0), N0x00
17b5 dd7e03       ld Ra, R(ix + 3)
17b8 a7           Aand Ra
17b9 c47c0c       call Cnz, W0x0c7c
17bc c1           pop Gbc
17bd e1           pop Ghl
17be 23           inc Phl
17bf 23           inc Phl
17c0 23           inc Phl
17c1 23           inc Phl
17c2 10df         djnz D$ - 31
17c4 c9           ret
17c5 fdcb0966     bit U4, R(iy + 9)
17c9 c0           ret Cnz
17ca fdcb0076     bit U6, R(iy + 0)
17ce c0           ret Cnz
17cf fd6e08       ld Rl, R(iy + 8)
17d2 2600         ld Rh, N0x00
17d4 29           add Phl, Phl
17d5 29           add Phl, Phl
17d6 29           add Phl, Phl
17d7 1168ab       ld Pde, W0xab68
17da 19           add Phl, Pde
17db 0602         ld Rb, N0x02
17dd 23           inc Phl
17de 23           inc Phl
17df 7e           ld Ra, R(hl)
17e0 a7           Aand Ra
17e1 2b           dec Phl
17e2 2b           dec Phl
17e3 2857         jr Cz, D$ + 89
17e5 fd7e01       ld Ra, R(iy + 1)
17e8 96           Asub R(hl)
17e9 c612         Aadd a, N0x12
17eb fe25         Acp N0x25
17ed 304d         jr Cnc, D$ + 79
17ef 23           inc Phl
17f0 fd7e02       ld Ra, R(iy + 2)
17f3 96           Asub R(hl)
17f4 2b           dec Phl
17f5 c609         Aadd a, N0x09
17f7 fe13         Acp N0x13
17f9 3041         jr Cnc, D$ + 67
17fb 11ee1c       ld Pde, W0x1cee
17fe 010300       ld Pbc, W0x0003
1801 edb0         Lldir
1803 e5           push Ghl
1804 7e           ld Ra, R(hl)
1805 36ff         ld R(hl), N0xff
1807 015002       ld Pbc, W0x0250
180a a7           Aand Ra
180b cc8c1b       call Cz, W0x1b8c
180e e1           pop Ghl
180f 2b           dec Phl
1810 fd7e05       ld Ra, R(iy + 5)
1813 77           ld R(hl), Ra
1814 dd21ed1c     ld Pix, W0x1ced
1818 dd360080     ld R(ix + 0), N0x80
181c cd700c       call W0x0c70
181f af           Axor Ra
1820 32581c       ld (W0x1c58), a
1823 21e723       ld Phl, W0x23e7
1826 221023       ld (W0x2310), Phl
1829 dd4e03       ld Rc, R(ix + 3)
182c fd7e05       ld Ra, R(iy + 5)
182f fd7105       ld R(iy + 5), Rc
1832 dd7703       ld R(ix + 3), Ra
1835 a7           Aand Ra
1836 ca860c       jp Cz, W0x0c86
1839 c3900c       jp W0x0c90
183c 23           inc Phl
183d 23           inc Phl
183e 23           inc Phl
183f 23           inc Phl
1840 109b         djnz D$ - 99
1842 fd7e05       ld Ra, R(iy + 5)
1845 fe37         Acp N0x37
1847 2024         jr Cnz, D$ + 38
1849 fd360500     ld R(iy + 5), N0x00
184d 21071d       ld Phl, W0x1d07
1850 fd7e01       ld Ra, R(iy + 1)
1853 c609         Aadd a, N0x09
1855 57           ld Rd, Ra
1856 fd7e02       ld Ra, R(iy + 2)
1859 c604         Aadd a, N0x04
185b 5f           ld Re, Ra
185c 0608         ld Rb, N0x08
185e 72           ld R(hl), Rd
185f 23           inc Phl
1860 73           ld R(hl), Re
1861 23           inc Phl
1862 23           inc Phl
1863 23           inc Phl
1864 10f8         djnz D$ - 6
1866 214623       ld Phl, W0x2346
1869 220e23       ld (W0x230e), Phl
186c c9           ret
186d fe46         Acp N0x46
186f c0           ret Cnz
1870 fd360500     ld R(iy + 5), N0x00
1874 fd7e01       ld Ra, R(iy + 1)
1877 c609         Aadd a, N0x09
1879 32071d       ld (W0x1d07), a
187c 320f1d       ld (W0x1d0f), a
187f 32171d       ld (W0x1d17), a
1882 321f1d       ld (W0x1d1f), a
1885 fd7e02       ld Ra, R(iy + 2)
1888 c604         Aadd a, N0x04
188a 32081d       ld (W0x1d08), a
188d 32101d       ld (W0x1d10), a
1890 32181d       ld (W0x1d18), a
1893 32201d       ld (W0x1d20), a
1896 214623       ld Phl, W0x2346
1899 220e23       ld (W0x230e), Phl
189c c9           ret
189d dd3404       inc R(ix + 4)
18a0 dd7e04       ld Ra, R(ix + 4)
18a3 e603         Aand N0x03
18a5 c0           ret Cnz
18a6 dd3403       inc R(ix + 3)
18a9 dd7e03       ld Ra, R(ix + 3)
18ac fe50         Acp N0x50
18ae c2900c       jp Cnz, W0x0c90
18b1 cd860c       call W0x0c86
18b4 dd360000     ld R(ix + 0), N0x00
18b8 c9           ret
18b9 fdcb0966     bit U4, R(iy + 9)
18bd 204a         jr Cnz, D$ + 76
18bf fd7e01       ld Ra, R(iy + 1)
18c2 dd9601       Asub R(ix + 1)
18c5 c612         Aadd a, N0x12
18c7 fe25         Acp N0x25
18c9 303e         jr Cnc, D$ + 64
18cb fd7e02       ld Ra, R(iy + 2)
18ce dd9602       Asub R(ix + 2)
18d1 c609         Aadd a, N0x09
18d3 fe13         Acp N0x13
18d5 3032         jr Cnc, D$ + 52
18d7 79           ld Ra, Rc
18d8 fdbe05       Acp R(iy + 5)
18db 202c         jr Cnz, D$ + 46
18dd 0e10         ld Rc, N0x10
18df fd360500     ld R(iy + 5), N0x00
18e3 e1           pop Ghl
18e4 dd7e00       ld Ra, R(ix + 0)
18e7 e6f0         Aand N0xf0
18e9 f604         Aor N0x04
18eb dd7700       ld R(ix + 0), Ra
18ee af           Axor Ra
18ef fd7709       ld R(iy + 9), Ra
18f2 dd36034c     ld R(ix + 3), N0x4c
18f6 dd360400     ld R(ix + 4), N0x00
18fa 41           ld Rb, Rc
18fb 0e00         ld Rc, N0x00
18fd cd8c1b       call W0x1b8c
1900 217123       ld Phl, W0x2371
1903 220e23       ld (W0x230e), Phl
1906 c3900c       jp W0x0c90
1909 21071d       ld Phl, W0x1d07
190c 0608         ld Rb, N0x08
190e 0e05         ld Rc, N0x05
1910 dd5601       ld Rd, R(ix + 1)
1913 dd5e02       ld Re, R(ix + 2)
1916 7e           ld Ra, R(hl)
1917 feff         Acp N0xff
1919 2811         jr Cz, D$ + 19
191b 92           Asub Rd
191c c612         Aadd a, N0x12
191e fe25         Acp N0x25
1920 300a         jr Cnc, D$ + 12
1922 23           inc Phl
1923 7e           ld Ra, R(hl)
1924 2b           dec Phl
1925 93           Asub Re
1926 c609         Aadd a, N0x09
1928 fe13         Acp N0x13
192a 38b7         jr Cc, D$ - 71
192c 23           inc Phl
192d 23           inc Phl
192e 23           inc Phl
192f 23           inc Phl
1930 10e4         djnz D$ - 26
1932 c9           ret
1933 3a5a1c       ld a, (W0x1c5a)
1936 d601         Asub N0x01
1938 325a1c       ld (W0x1c5a), a
193b d0           ret Cnc
193c 3e04         ld Ra, N0x04
193e 325a1c       ld (W0x1c5a), a
1941 3a591c       ld a, (W0x1c59)
1944 c620         Aadd a, N0x20
1946 e660         Aand N0x60
1948 32591c       ld (W0x1c59), a
194b c9           ret
194c 3a5a1c       ld a, (W0x1c5a)
194f fe04         Acp N0x04
1951 c0           ret Cnz
1952 3a591c       ld a, (W0x1c59)
1955 5f           ld Re, Ra
1956 1600         ld Rd, N0x00
1958 21e066       ld Phl, W0x66e0
195b 19           add Phl, Pde
195c 225b1c       ld (W0x1c5b), Phl
195f 3e81         ld Ra, N0x81
1961 325d1c       ld (W0x1c5d), a
1964 1836         jr D$ + 56
1966 3a5a1c       ld a, (W0x1c5a)
1969 fe02         Acp N0x02
196b c0           ret Cnz
196c 3a591c       ld a, (W0x1c59)
196f 5f           ld Re, Ra
1970 1600         ld Rd, N0x00
1972 216069       ld Phl, W0x6960
1975 19           add Phl, Pde
1976 225b1c       ld (W0x1c5b), Phl
1979 3e01         ld Ra, N0x01
197b 325d1c       ld (W0x1c5d), a
197e 181c         jr D$ + 30
1980 3a5a1c       ld a, (W0x1c5a)
1983 fe03         Acp N0x03
1985 c0           ret Cnz
1986 3a591c       ld a, (W0x1c59)
1989 e620         Aand N0x20
198b 5f           ld Re, Ra
198c 1600         ld Rd, N0x00
198e 21e06b       ld Phl, W0x6be0
1991 19           add Phl, Pde
1992 225b1c       ld (W0x1c5b), Phl
1995 3e02         ld Ra, N0x02
1997 325d1c       ld (W0x1c5d), a
199a 1800         jr D$ + 2
199c 21a8ac       ld Phl, W0xaca8
199f 01d002       ld Pbc, W0x02d0
19a2 3a5d1c       ld a, (W0x1c5d)
19a5 edb1         Mcpir
19a7 e0           ret Cpo
19a8 e5           push Ghl
19a9 c5           push Gbc
19aa 01a8ac       ld Pbc, W0xaca8
19ad 37           scf
19ae ed42         sbc hl, Pbc
19b0 29           add Phl, Phl
19b1 cbf4         set U6, Rh
19b3 cbfc         set U7, Rh
19b5 ed5b5b1c     ld Pde, (W0x1c5b)
19b9 010808       ld Pbc, W0x0808
19bc 1a           ld a, (Pde)
19bd 77           ld R(hl), Ra
19be 13           inc Pde
19bf 23           inc Phl
19c0 1a           ld a, (Pde)
19c1 77           ld R(hl), Ra
19c2 1b           dec Pde
19c3 23           inc Phl
19c4 cbe3         set U4, Re
19c6 1a           ld a, (Pde)
19c7 77           ld R(hl), Ra
19c8 13           inc Pde
19c9 23           inc Phl
19ca 1a           ld a, (Pde)
19cb 77           ld R(hl), Ra
19cc 13           inc Pde
19cd cba3         res U4, Re
19cf 2b           dec Phl
19d0 2b           dec Phl
19d1 2b           dec Phl
19d2 7c           ld Ra, Rh
19d3 81           Aadd a, Rc
19d4 67           ld Rh, Ra
19d5 10e5         djnz D$ - 25
19d7 c1           pop Gbc
19d8 e1           pop Ghl
19d9 23           inc Phl
19da 0b           dec Pbc
19db 78           ld Ra, Rb
19dc b1           Aor Rc
19dd c8           ret Cz
19de 18c2         jr D$ - 60
19e0 fd7e01       ld Ra, R(iy + 1)
19e3 dd9601       Asub R(ix + 1)
19e6 c617         Aadd a, N0x17
19e8 fe2e         Acp N0x2e
19ea 3031         jr Cnc, D$ + 51
19ec fd7e02       ld Ra, R(iy + 2)
19ef dd9602       Asub R(ix + 2)
19f2 c60b         Aadd a, N0x0b
19f4 fe17         Acp N0x17
19f6 3025         jr Cnc, D$ + 39
19f8 dd7e00       ld Ra, R(ix + 0)
19fb e6f0         Aand N0xf0
19fd f606         Aor N0x06
19ff dd7700       ld R(ix + 0), Ra
1a02 212d12       ld Phl, W0x122d
1a05 34           inc R(hl)
1a06 dd360350     ld R(ix + 3), N0x50
1a0a fd3638ff     ld R(iy + 56), N0xff
1a0e 010020       ld Pbc, W0x2000
1a11 cd8c1b       call W0x1b8c
1a14 214623       ld Phl, W0x2346
1a17 220e23       ld (W0x230e), Phl
1a1a c3900c       jp W0x0c90
1a1d dd3404       inc R(ix + 4)
1a20 dd7e04       ld Ra, R(ix + 4)
1a23 e603         Aand N0x03
1a25 c0           ret Cnz
1a26 dd7e03       ld Ra, R(ix + 3)
1a29 3c           inc Ra
1a2a e603         Aand N0x03
1a2c f654         Aor N0x54
1a2e dd7703       ld R(ix + 3), Ra
1a31 c3900c       jp W0x0c90
1a34 dd3501       dec R(ix + 1)
1a37 dd3501       dec R(ix + 1)
1a3a dd7e01       ld Ra, R(ix + 1)
1a3d 1f           rra
1a3e ee03         Axor N0x03
1a40 e603         Aand N0x03
1a42 c650         Aadd a, N0x50
1a44 dd7703       ld R(ix + 3), Ra
1a47 dd7e01       ld Ra, R(ix + 1)
1a4a fec8         Acp N0xc8
1a4c da900c       jp Cc, W0x0c90
1a4f dd360000     ld R(ix + 0), N0x00
1a53 c3860c       jp W0x0c86
1a56 dd21071d     ld Pix, W0x1d07
1a5a 0608         ld Rb, N0x08
1a5c c5           push Gbc
1a5d dd7e00       ld Ra, R(ix + 0)
1a60 feff         Acp N0xff
1a62 2820         jr Cz, D$ + 34
1a64 cd931a       call W0x1a93
1a67 dd7e00       ld Ra, R(ix + 0)
1a6a dd8602       Aadd a, R(ix + 2)
1a6d fe90         Acp N0x90
1a6f 301c         jr Cnc, D$ + 30
1a71 dd7700       ld R(ix + 0), Ra
1a74 dd7e01       ld Ra, R(ix + 1)
1a77 dd8603       Aadd a, R(ix + 3)
1a7a fea0         Acp N0xa0
1a7c 300f         jr Cnc, D$ + 17
1a7e dd7701       ld R(ix + 1), Ra
1a81 cd931a       call W0x1a93
1a84 010400       ld Pbc, W0x0004
1a87 dd09         add Pix, Pbc
1a89 c1           pop Gbc
1a8a 10d0         djnz D$ - 46
1a8c c9           ret
1a8d dd3600ff     ld R(ix + 0), N0xff
1a91 18f1         jr D$ - 13
1a93 dd4600       ld Rb, R(ix + 0)
1a96 dd4e01       ld Rc, R(ix + 1)
1a99 cdac0d       call W0x0dac
1a9c 3ecc         ld Ra, N0xcc
1a9e ae           Axor R(hl)
1a9f 77           ld R(hl), Ra
1aa0 cb9c         res U3, Rh
1aa2 cbe4         set U4, Rh
1aa4 3ecc         ld Ra, N0xcc
1aa6 ae           Axor R(hl)
1aa7 77           ld R(hl), Ra
1aa8 c9           ret
1aa9 119407       ld Pde, W0x0794
1aac 212eab       ld Phl, W0xab2e
1aaf cd9f1b       call W0x1b9f
1ab2 c9           ret
1ab3 fd7e01       ld Ra, R(iy + 1)
1ab6 dd9601       Asub R(ix + 1)
1ab9 c612         Aadd a, N0x12
1abb fe25         Acp N0x25
1abd d0           ret Cnc
1abe fd7e02       ld Ra, R(iy + 2)
1ac1 dd9602       Asub R(ix + 2)
1ac4 c609         Aadd a, N0x09
1ac6 fe13         Acp N0x13
1ac8 d0           ret Cnc
1ac9 210824       ld Phl, W0x2408
1acc 221023       ld (W0x2310), Phl
1acf 3a561c       ld a, (W0x1c56)
1ad2 91           Asub Rc
1ad3 32561c       ld (W0x1c56), a
1ad6 d0           ret Cnc
1ad7 fd7e06       ld Ra, R(iy + 6)
1ada d601         Asub N0x01
1adc d8           ret Cc
1add 27           daa
1ade fd7706       ld R(iy + 6), Ra
1ae1 c9           ret
1ae2 fd460a       ld Rb, R(iy + 10)
1ae5 04           inc Rb
1ae6 213a1e       ld Phl, W0x1e3a
1ae9 11f005       ld Pde, W0x05f0
1aec cd381b       call W0x1b38
1aef 212a06       ld Phl, W0x062a
1af2 181e         jr D$ + 32
1af4 21f51c       ld Phl, W0x1cf5
1af7 011300       ld Pbc, W0x0013
1afa fd7e05       ld Ra, R(iy + 5)
1afd edb1         Mcpir
1aff e0           ret Cpo
1b00 3e13         ld Ra, N0x13
1b02 91           Asub Rc
1b03 47           ld Rb, Ra
1b04 211b1f       ld Phl, W0x1f1b
1b07 119006       ld Pde, W0x0690
1b0a cd381b       call W0x1b38
1b0d 21ca06       ld Phl, W0x06ca
1b10 1800         jr D$ + 2
1b12 a7           Aand Ra
1b13 ed52         sbc hl, Pde
1b15 d8           ret Cc
1b16 c8           ret Cz
1b17 44           ld Rb, Rh
1b18 4d           ld Rc, Rl
1b19 eb           ex de, hl
1b1a cbf4         set U6, Rh
1b1c cbfc         set U7, Rh
1b1e 54           ld Rd, Rh
1b1f 5d           ld Re, Rl
1b20 13           inc Pde
1b21 3600         ld R(hl), N0x00
1b23 e5           push Ghl
1b24 c5           push Gbc
1b25 edb0         Lldir
1b27 c1           pop Gbc
1b28 e1           pop Ghl
1b29 3e08         ld Ra, N0x08
1b2b 84           Aadd a, Rh
1b2c 67           ld Rh, Ra
1b2d e638         Aand N0x38
1b2f 20ed         jr Cnz, D$ - 17
1b31 c9           ret
1b32 e3           ex (sp), Phl
1b33 cd3f1b       call W0x1b3f
1b36 e3           ex (sp), Phl
1b37 c9           ret
1b38 cb7e         bit U7, R(hl)
1b3a 23           inc Phl
1b3b 28fb         jr Cz, D$ - 3
1b3d 10f9         djnz D$ - 5
1b3f 7e           ld Ra, R(hl)
1b40 e67f         Aand N0x7f
1b42 cd4b1b       call W0x1b4b
1b45 cb7e         bit U7, R(hl)
1b47 23           inc Phl
1b48 28f5         jr Cz, D$ - 9
1b4a c9           ret
1b4b fe20         Acp N0x20
1b4d 300b         jr Cnc, D$ + 13
1b4f e5           push Ghl
1b50 3c           inc Ra
1b51 47           ld Rb, Ra
1b52 210d1e       ld Phl, W0x1e0d
1b55 cd381b       call W0x1b38
1b58 e1           pop Ghl
1b59 c9           ret
1b5a f5           push Gaf
1b5b c5           push Gbc
1b5c d5           push Gde
1b5d e5           push Ghl
1b5e cbf2         set U6, Rd
1b60 cbfa         set U7, Rd
1b62 6f           ld Rl, Ra
1b63 2600         ld Rh, N0x00
1b65 29           add Phl, Phl
1b66 29           add Phl, Phl
1b67 29           add Phl, Phl
1b68 7c           ld Ra, Rh
1b69 c662         Aadd a, N0x62
1b6b 67           ld Rh, Ra
1b6c 010808       ld Pbc, W0x0808
1b6f 7e           ld Ra, R(hl)
1b70 e6f0         Aand N0xf0
1b72 12           ld (Pde), a
1b73 13           inc Pde
1b74 7e           ld Ra, R(hl)
1b75 87           Aadd a, Ra
1b76 87           Aadd a, Ra
1b77 87           Aadd a, Ra
1b78 87           Aadd a, Ra
1b79 12           ld (Pde), a
1b7a 1b           dec Pde
1b7b 23           inc Phl
1b7c 7a           ld Ra, Rd
1b7d 81           Aadd a, Rc
1b7e 57           ld Rd, Ra
1b7f 10ee         djnz D$ - 16
1b81 e1           pop Ghl
1b82 d1           pop Gde
1b83 13           inc Pde
1b84 13           inc Pde
1b85 cbb2         res U6, Rd
1b87 cbba         res U7, Rd
1b89 c1           pop Gbc
1b8a f1           pop Gaf
1b8b c9           ret
1b8c 21611c       ld Phl, W0x1c61
1b8f 7e           ld Ra, R(hl)
1b90 81           Aadd a, Rc
1b91 27           daa
1b92 77           ld R(hl), Ra
1b93 2b           dec Phl
1b94 7e           ld Ra, R(hl)
1b95 88           Aadc a, Rb
1b96 27           daa
1b97 77           ld R(hl), Ra
1b98 2b           dec Phl
1b99 7e           ld Ra, R(hl)
1b9a ce00         Aadc a, N0x00
1b9c 27           daa
1b9d 77           ld R(hl), Ra
1b9e c9           ret
1b9f 3e30         ld Ra, N0x30
1ba1 ed6f         rld
1ba3 cd4b1b       call W0x1b4b
1ba6 ed6f         rld
1ba8 cd4b1b       call W0x1b4b
1bab ed6f         rld
1bad 23           inc Phl
1bae c9           ret
1baf fd7e05       ld Ra, R(iy + 5)
1bb2 d63b         Asub N0x3b
1bb4 d601         Asub N0x01
1bb6 c9           ret
1bb7 fd7e05       ld Ra, R(iy + 5)
1bba d62b         Asub N0x2b
1bbc d601         Asub N0x01
1bbe c9           ret
1bbf 01007f       ld Pbc, W0x7f00
1bc2 3e11         ld Ra, N0x11
1bc4 56           ld Rd, R(hl)
1bc5 ed49         out (c), Rc
1bc7 ed51         out (c), Rd
1bc9 23           inc Phl
1bca 0c           inc Rc
1bcb b9           Acp Rc
1bcc 20f6         jr Cnz, D$ - 8
1bce c9           ret
1bcf 2100c0       ld Phl, W0xc000
1bd2 1101c0       ld Pde, W0xc001
1bd5 01ff3f       ld Pbc, W0x3fff
1bd8 3600         ld R(hl), N0x00
1bda edb0         Lldir
1bdc c9           ret
1bdd 110000       ld Pde, W0x0000
1be0 7a           ld Ra, Rd
1be1 cdf122       call W0x22f1
1be4 14           inc Rd
1be5 7a           ld Ra, Rd
1be6 fe0e         Acp N0x0e
1be8 20f6         jr Cnz, D$ - 8
1bea 3e07         ld Ra, N0x07
1bec 1e3f         ld Re, N0x3f
1bee cdf122       call W0x22f1
1bf1 c9           ret
1bf2 fdcb0076     bit U6, R(iy + 0)
1bf6 c0           ret Cnz
1bf7 3a3a1c       ld a, (W0x1c3a)
1bfa 3d           dec Ra
1bfb 323a1c       ld (W0x1c3a), a
1bfe f0           ret Cp
1bff 3e47         ld Ra, N0x47
1c01 323a1c       ld (W0x1c3a), a
1c04 2a361c       ld Phl, (W0x1c36)
1c07 cbf4         set U6, Rh
1c09 cbfc         set U7, Rh
1c0b 3600         ld R(hl), N0x00
1c0d 23           inc Phl
1c0e ed4b381c     ld Pbc, (W0x1c38)
1c12 0d           dec Rc
1c13 2019         jr Cnz, D$ + 27
1c15 0e10         ld Rc, N0x10
1c17 11f007       ld Pde, W0x07f0
1c1a 19           add Phl, Pde
1c1b 7c           ld Ra, Rh
1c1c e638         Aand N0x38
1c1e 2004         jr Cnz, D$ + 6
1c20 1150c0       ld Pde, W0xc050
1c23 19           add Phl, Pde
1c24 1008         djnz D$ + 10
1c26 fdcb00f6     set U6, R(iy + 0)
1c2a fdcb00e6     set U4, R(iy + 0)
1c2e 22361c       ld (W0x1c36), Phl
1c31 ed43381c     ld (W0x1c38), Pbc
1c35 c9           ret
1c36 27           daa
1c37 c610         Aadd a, N0x10
1c39 2800         jr Cz, D$ + 2
1c3b 00           nop
1c3c 1604         ld Rd, N0x04
1c3e ff           rst W0x0038
1c3f ff           rst W0x0038
1c40 0d           dec Rc
1c41 21ffff       ld Phl, W0xffff
1c44 13           inc Pde
1c45 17           rla
1c46 ff           rst W0x0038
1c47 ff           rst W0x0038
1c48 17           rla
1c49 1b           dec Pde
1c4a ff           rst W0x0038
1c4b ff           rst W0x0038
1c4c 13           inc Pde
1c4d 1f           rra
1c4e ff           rst W0x0038
1c4f ff           rst W0x0038
1c50 00           nop
1c51 00           nop
1c52 00           nop
1c53 00           nop
1c54 00           nop
1c55 00           nop
1c56 00           nop
1c57 00           nop
1c58 1000         djnz D$ + 2
1c5a 00           nop
1c5b 00           nop
1c5c 00           nop
1c5d 00           nop
1c5e 00           nop
1c5f 00           nop
1c60 00           nop
1c61 00           nop
1c62 00           nop
1c63 00           nop
1c64 00           nop
1c65 00           nop
1c66 00           nop
1c67 00           nop
1c68 00           nop
1c69 00           nop
1c6a 00           nop
1c6b 00           nop
1c6c 00           nop
1c6d 00           nop
1c6e 00           nop
1c6f 00           nop
1c70 00           nop
1c71 00           nop
1c72 00           nop
1c73 00           nop
1c74 2e2e         ld Rl, N0x2e
1c76 2e2e         ld Rl, N0x2e
1c78 2e23         ld Rl, N0x23
1c7a 214142       ld Phl, W0x4241
1c7d 43           ld Rb, Re
1c7e 44           ld Rb, Rh
1c7f 45           ld Rb, Rl
1c80 46           ld Rb, R(hl)
1c81 47           ld Rb, Ra
1c82 48           ld Rc, Rb
1c83 49           ld Rc, Rc
1c84 4a           ld Rc, Rd
1c85 4b           ld Rc, Re
1c86 4c           ld Rc, Rh
1c87 4d           ld Rc, Rl
1c88 4e           ld Rc, R(hl)
1c89 4f           ld Rc, Ra
1c8a 50           ld Rd, Rb
1c8b 51           ld Rd, Rc
1c8c 52           ld Rd, Rd
1c8d 53           ld Rd, Re
1c8e 54           ld Rd, Rh
1c8f 55           ld Rd, Rl
1c90 56           ld Rd, R(hl)
1c91 57           ld Rd, Ra
1c92 58           ld Re, Rb
1c93 59           ld Re, Rc
1c94 5a           ld Re, Rd
1c95 2e00         ld Rl, N0x00
1c97 00           nop
1c98 00           nop
1c99 00           nop
1c9a d0           ret Cnc
1c9b 1d           dec Re
1c9c d31d         out (N0x1d), a
1c9e e61d         Aand N0x1d
1ca0 e9           jp (Phl)
1ca1 1d           dec Re
1ca2 ea1df8       jp Cpe, W0xf81d
1ca5 1d           dec Re
1ca6 fb           ei
1ca7 1d           dec Re
1ca8 fe1d         Acp N0x1d
1caa 011e04       ld Pbc, W0x041e
1cad 1e09         ld Re, N0x09
1caf 1e0c         ld Re, N0x0c
1cb1 1e54         ld Re, N0x54
1cb3 4a           ld Rc, Rd
1cb4 4e           ld Rc, R(hl)
1cb5 4c           ld Rc, Rh
1cb6 53           ld Rd, Re
1cb7 4b           ld Rc, Re
1cb8 5f           ld Re, Ra
1cb9 4f           ld Rc, Ra
1cba 52           ld Rd, Rd
1cbb 46           ld Rb, R(hl)
1cbc 5c           ld Re, Rh
1cbd 56           ld Rd, R(hl)
1cbe 43           ld Rb, Re
1cbf 42           ld Rb, Rd
1cc0 40           ld Rb, Rb
1cc1 5e           ld Re, R(hl)
1cc2 44           ld Rb, Rh
1cc3 54           ld Rd, Rh
1cc4 4b           ld Rc, Re
1cc5 57           ld Rd, Ra
1cc6 40           ld Rb, Rb
1cc7 40           ld Rb, Rb
1cc8 40           ld Rb, Rb
1cc9 40           ld Rb, Rb
1cca 40           ld Rb, Rb
1ccb 40           ld Rb, Rb
1ccc 40           ld Rb, Rb
1ccd 40           ld Rb, Rb
1cce 40           ld Rb, Rb
1ccf 40           ld Rb, Rb
1cd0 40           ld Rb, Rb
1cd1 40           ld Rb, Rb
1cd2 40           ld Rb, Rb
1cd3 54           ld Rd, Rh
1cd4 54           ld Rd, Rh
1cd5 4a           ld Rc, Rd
1cd6 4e           ld Rc, R(hl)
1cd7 4c           ld Rc, Rh
1cd8 53           ld Rd, Re
1cd9 4b           ld Rc, Re
1cda 5f           ld Re, Ra
1cdb 4f           ld Rc, Ra
1cdc 52           ld Rd, Rd
1cdd 46           ld Rb, R(hl)
1cde 5c           ld Re, Rh
1cdf 56           ld Rd, R(hl)
1ce0 43           ld Rb, Re
1ce1 42           ld Rb, Rd
1ce2 40           ld Rb, Rb
1ce3 5e           ld Re, R(hl)
1ce4 54           ld Rd, Rh
1ce5 00           nop
1ce6 00           nop
1ce7 00           nop
1ce8 00           nop
1ce9 00           nop
1cea 00           nop
1ceb 00           nop
1cec 00           nop
1ced 00           nop
1cee 00           nop
1cef 00           nop
1cf0 00           nop
1cf1 00           nop
1cf2 00           nop
1cf3 00           nop
1cf4 00           nop
1cf5 00           nop
1cf6 2829         jr Cz, D$ + 43
1cf8 2a2b2c       ld Phl, (W0x2c2b)
1cfb 2d           dec Rl
1cfc 37           scf
1cfd 3839         jr Cc, D$ + 59
1cff 3a3b40       ld a, (W0x403b)
1d02 41           ld Rb, Rc
1d03 44           ld Rb, Rh
1d04 45           ld Rb, Rl
1d05 46           ld Rb, R(hl)
1d06 47           ld Rb, Ra
1d07 ff           rst W0x0038
1d08 00           nop
1d09 fc00ff       call Cm, W0xff00
1d0c 00           nop
1d0d fc02ff       call Cm, W0xff02
1d10 00           nop
1d11 00           nop
1d12 02           ld (Pbc), a
1d13 ff           rst W0x0038
1d14 00           nop
1d15 04           inc Rb
1d16 02           ld (Pbc), a
1d17 ff           rst W0x0038
1d18 00           nop
1d19 04           inc Rb
1d1a 00           nop
1d1b ff           rst W0x0038
1d1c 00           nop
1d1d 04           inc Rb
1d1e feff         Acp N0xff
1d20 00           nop
1d21 00           nop
1d22 feff         Acp N0xff
1d24 00           nop
1d25 fcfeff       call Cm, W0xfffe
1d28 ff           rst W0x0038
1d29 ff           rst W0x0038
1d2a ff           rst W0x0038
1d2b ff           rst W0x0038
1d2c ff           rst W0x0038
1d2d ff           rst W0x0038
1d2e ff           rst W0x0038
1d2f ff           rst W0x0038
1d30 ff           rst W0x0038
1d31 ff           rst W0x0038
1d32 ff           rst W0x0038
1d33 00           nop
1d34 00           nop
1d35 00           nop
1d36 ff           rst W0x0038
1d37 ff           rst W0x0038
1d38 ff           rst W0x0038
1d39 ff           rst W0x0038
1d3a ff           rst W0x0038
1d3b ff           rst W0x0038
1d3c 00           nop
1d3d ff           rst W0x0038
1d3e 00           nop
1d3f 00           nop
1d40 ff           rst W0x0038
1d41 00           nop
1d42 00           nop
1d43 ff           rst W0x0038
1d44 00           nop
1d45 00           nop
1d46 00           nop
1d47 00           nop
1d48 00           nop
1d49 00           nop
1d4a 00           nop
1d4b ff           rst W0x0038
1d4c ff           rst W0x0038
1d4d ff           rst W0x0038
1d4e 00           nop
1d4f 00           nop
1d50 1054         djnz D$ + 86
1d52 00           nop
1d53 2040         jr Cnz, D$ + 66
1d55 00           nop
1d56 00           nop
1d57 a0           Aand Rb
1d58 00           nop
1d59 00           nop
1d5a 00           nop
1d5b a8           Axor Rb
1d5c 00           nop
1d5d 40           ld Rb, Rb
1d5e 00           nop
1d5f a0           Aand Rb
1d60 00           nop
1d61 00           nop
1d62 93           Asub Re
1d63 17           rla
1d64 0f           rrca
1d65 167a         ld Rd, N0x7a
1d67 16e7         ld Rd, N0xe7
1d69 169d         ld Rd, N0x9d
1d6b 18e0         jr D$ - 30
1d6d 19           add Phl, Pde
1d6e 34           inc R(hl)
1d6f 1a           ld a, (Pde)
1d70 07           rlca
1d71 0f           rrca
1d72 0f           rrca
1d73 0f           rrca
1d74 2f           cpl
1d75 0f           rrca
1d76 85           Aadd a, Rl
1d77 10a7         djnz D$ - 87
1d79 10cc         djnz D$ - 50
1d7b 1005         djnz D$ + 7
1d7d 11070f       ld Pde, W0x0f07
1d80 00           nop
1d81 00           nop
1d82 40           ld Rb, Rb
1d83 1800         jr D$ + 2
1d85 4c           ld Rc, Rh
1d86 1d           dec Re
1d87 207c         jr Cnz, D$ + 126
1d89 0f           rrca
1d8a 3874         jr Cc, D$ + 118
1d8c 1610         ld Rd, N0x10
1d8e 40           ld Rb, Rb
1d8f af           Axor Ra
1d90 1b           dec Pde
1d91 b7           Aor Ra
1d92 1b           dec Pde
1d93 f5           push Gaf
1d94 c5           push Gbc
1d95 d5           push Gde
1d96 e5           push Ghl
1d97 06f5         ld Rb, N0xf5
1d99 ed78         in Ra, (c)
1d9b 1f           rra
1d9c 3005         jr Cnc, D$ + 7
1d9e 3e03         ld Ra, N0x03
1da0 32971c       ld (W0x1c97), a
1da3 2a981c       ld Phl, (W0x1c98)
1da6 3a971c       ld a, (W0x1c97)
1da9 4f           ld Rc, Ra
1daa 0600         ld Rb, N0x00
1dac 09           add Phl, Pbc
1dad 09           add Phl, Pbc
1dae 4e           ld Rc, R(hl)
1daf 23           inc Phl
1db0 46           ld Rb, R(hl)
1db1 21b71d       ld Phl, W0x1db7
1db4 e5           push Ghl
1db5 c5           push Gbc
1db6 c9           ret
1db7 3a971c       ld a, (W0x1c97)
1dba 3c           inc Ra
1dbb fe06         Acp N0x06
1dbd 3801         jr Cc, D$ + 3
1dbf af           Axor Ra
1dc0 32971c       ld (W0x1c97), a
1dc3 3a961c       ld a, (W0x1c96)
1dc6 3d           dec Ra
1dc7 32961c       ld (W0x1c96), a
1dca e1           pop Ghl
1dcb d1           pop Gde
1dcc c1           pop Gbc
1dcd f1           pop Gaf
1dce fb           ei
1dcf c9           ret
1dd0 c39922       jp W0x2299
1dd3 3e4a         ld Ra, N0x4a
1dd5 3d           dec Ra
1dd6 20fd         jr Cnz, D$ - 1
1dd8 01007f       ld Pbc, W0x7f00
1ddb ed49         out (c), Rc
1ddd 0e44         ld Rc, N0x44
1ddf ed49         out (c), Rc
1de1 0e8d         ld Rc, N0x8d
1de3 ed49         out (c), Rc
1de5 c9           ret
1de6 c3f21b       jp W0x1bf2
1de9 c9           ret
1dea 01007f       ld Pbc, W0x7f00
1ded ed49         out (c), Rc
1def 0e54         ld Rc, N0x54
1df1 ed49         out (c), Rc
1df3 0e8c         ld Rc, N0x8c
1df5 ed49         out (c), Rc
1df7 c9           ret
1df8 c32d11       jp W0x112d
1dfb c33624       jp W0x2436
1dfe c34424       jp W0x2444
1e01 c35224       jp W0x2452
1e04 fdcb00c6     set U0, R(iy + 0)
1e08 c9           ret
1e09 c32d11       jp W0x112d
1e0c c9           ret
1e0d 80           Aadd a, Rb
1e0e 59           ld Re, Rc
1e0f 4f           ld Rc, Ra
1e10 55           ld Rd, Rl
1e11 2041         jr Cnz, D$ + 67
1e13 52           ld Rd, Rd
1e14 45           ld Rb, Rl
1e15 a0           Aand Rb
1e16 43           ld Rb, Re
1e17 41           ld Rb, Rc
1e18 52           ld Rd, Rd
1e19 52           ld Rd, Rd
1e1a 59           ld Re, Rc
1e1b 49           ld Rc, Rc
1e1c 4e           ld Rc, R(hl)
1e1d 47           ld Rb, Ra
1e1e 2041         jr Cnz, D$ + 67
1e20 a0           Aand Rb
1e21 00           nop
1e22 49           ld Rc, Rc
1e23 4e           ld Rc, R(hl)
1e24 2054         jr Cnz, D$ + 86
1e26 48           ld Rc, Rb
1e27 45           ld Rb, Rl
1e28 a0           Aand Rb
1e29 00           nop
1e2a 4e           ld Rc, R(hl)
1e2b 45           ld Rb, Rl
1e2c 41           ld Rb, Rc
1e2d 52           ld Rd, Rd
1e2e 2054         jr Cnz, D$ + 86
1e30 48           ld Rc, Rb
1e31 45           ld Rb, Rl
1e32 a0           Aand Rb
1e33 57           ld Rd, Ra
1e34 49           ld Rc, Rc
1e35 54           ld Rd, Rh
1e36 48           ld Rc, Rb
1e37 2041         jr Cnz, D$ + 67
1e39 a0           Aand Rb
1e3a 80           Aadd a, Rb
1e3b 02           ld (Pbc), a
1e3c 57           ld Rd, Ra
1e3d 4f           ld Rc, Ra
1e3e 4f           ld Rc, Ra
1e3f 44           ld Rb, Rh
1e40 53           ld Rd, Re
1e41 ac           Axor Rh
1e42 00           nop
1e43 4f           ld Rc, Ra
1e44 55           ld Rd, Rl
1e45 54           ld Rd, Rh
1e46 53           ld Rd, Re
1e47 49           ld Rc, Rc
1e48 44           ld Rb, Rh
1e49 45           ld Rb, Rl
1e4a 2054         jr Cnz, D$ + 86
1e4c 48           ld Rc, Rb
1e4d 45           ld Rb, Rl
1e4e 2043         jr Cnz, D$ + 69
1e50 41           ld Rb, Rc
1e51 53           ld Rd, Re
1e52 54           ld Rd, Rh
1e53 4c           ld Rc, Rh
1e54 45           ld Rb, Rl
1e55 ac           Axor Rh
1e56 02           ld (Pbc), a
1e57 43           ld Rb, Re
1e58 41           ld Rb, Rc
1e59 53           ld Rd, Re
1e5a 54           ld Rd, Rh
1e5b 4c           ld Rc, Rh
1e5c 45           ld Rb, Rl
1e5d ac           Axor Rh
1e5e 03           inc Pbc
1e5f 43           ld Rb, Re
1e60 48           ld Rc, Rb
1e61 41           ld Rb, Rc
1e62 54           ld Rd, Rh
1e63 45           ld Rb, Rl
1e64 41           ld Rb, Rc
1e65 55           ld Rd, Rl
1e66 ac           Axor Rh
1e67 02           ld (Pbc), a
1e68 43           ld Rb, Re
1e69 48           ld Rc, Rb
1e6a 41           ld Rb, Rc
1e6b 54           ld Rd, Rh
1e6c 45           ld Rb, Rl
1e6d 41           ld Rb, Rc
1e6e 55           ld Rd, Rl
1e6f ac           Axor Rh
1e70 00           nop
1e71 41           ld Rb, Rc
1e72 42           ld Rb, Rd
1e73 4f           ld Rc, Ra
1e74 56           ld Rd, R(hl)
1e75 45           ld Rb, Rl
1e76 2054         jr Cnz, D$ + 86
1e78 48           ld Rc, Rb
1e79 45           ld Rb, Rl
1e7a 2043         jr Cnz, D$ + 69
1e7c 48           ld Rc, Rb
1e7d 41           ld Rb, Rc
1e7e 54           ld Rd, Rh
1e7f 45           ld Rb, Rl
1e80 41           ld Rb, Rc
1e81 55           ld Rd, Rl
1e82 ac           Axor Rh
1e83 02           ld (Pbc), a
1e84 57           ld Rd, Ra
1e85 41           ld Rb, Rc
1e86 53           ld Rd, Re
1e87 54           ld Rd, Rh
1e88 45           ld Rb, Rl
1e89 4c           ld Rc, Rh
1e8a 41           ld Rb, Rc
1e8b 4e           ld Rc, R(hl)
1e8c 44           ld Rb, Rh
1e8d 53           ld Rd, Re
1e8e ac           Axor Rh
1e8f 03           inc Pbc
1e90 56           ld Rd, R(hl)
1e91 49           ld Rc, Rc
1e92 4c           ld Rc, Rh
1e93 4c           ld Rc, Rh
1e94 41           ld Rb, Rc
1e95 47           ld Rb, Ra
1e96 45           ld Rb, Rl
1e97 ac           Axor Rh
1e98 00           nop
1e99 41           ld Rb, Rc
1e9a 54           ld Rd, Rh
1e9b 2054         jr Cnz, D$ + 86
1e9d 48           ld Rc, Rb
1e9e 45           ld Rb, Rl
1e9f 2057         jr Cnz, D$ + 89
1ea1 41           ld Rb, Rc
1ea2 54           ld Rd, Rh
1ea3 45           ld Rb, Rl
1ea4 52           ld Rd, Rd
1ea5 46           ld Rb, R(hl)
1ea6 41           ld Rb, Rc
1ea7 4c           ld Rc, Rh
1ea8 4c           ld Rc, Rh
1ea9 ac           Axor Rh
1eaa 02           ld (Pbc), a
1eab 50           ld Rd, Rb
1eac 41           ld Rb, Rc
1ead 4c           ld Rc, Rh
1eae 41           ld Rb, Rc
1eaf 43           ld Rb, Re
1eb0 45           ld Rb, Rl
1eb1 ac           Axor Rh
1eb2 03           inc Pbc
1eb3 50           ld Rd, Rb
1eb4 41           ld Rb, Rc
1eb5 4c           ld Rc, Rh
1eb6 41           ld Rb, Rc
1eb7 43           ld Rb, Re
1eb8 45           ld Rb, Rl
1eb9 ac           Axor Rh
1eba 02           ld (Pbc), a
1ebb 54           ld Rd, Rh
1ebc 55           ld Rd, Rl
1ebd 4e           ld Rc, R(hl)
1ebe 4e           ld Rc, R(hl)
1ebf 45           ld Rb, Rl
1ec0 4c           ld Rc, Rh
1ec1 ac           Axor Rh
1ec2 02           ld (Pbc), a
1ec3 44           ld Rb, Rh
1ec4 55           ld Rd, Rl
1ec5 4e           ld Rc, R(hl)
1ec6 47           ld Rb, Ra
1ec7 45           ld Rb, Rl
1ec8 4f           ld Rc, Ra
1ec9 4e           ld Rc, R(hl)
1eca 53           ld Rd, Re
1ecb ac           Axor Rh
1ecc 02           ld (Pbc), a
1ecd 53           ld Rd, Re
1ece 54           ld Rd, Rh
1ecf 52           ld Rd, Rd
1ed0 4f           ld Rc, Ra
1ed1 4e           ld Rc, R(hl)
1ed2 47           ld Rb, Ra
1ed3 52           ld Rd, Rd
1ed4 4f           ld Rc, Ra
1ed5 4f           ld Rc, Ra
1ed6 4d           ld Rc, Rl
1ed7 ac           Axor Rh
1ed8 00           nop
1ed9 41           ld Rb, Rc
1eda 54           ld Rd, Rh
1edb 2053         jr Cnz, D$ + 85
1edd 41           ld Rb, Rc
1ede 4e           ld Rc, R(hl)
1edf 43           ld Rb, Re
1ee0 54           ld Rd, Rh
1ee1 55           ld Rd, Rl
1ee2 41           ld Rb, Rc
1ee3 52           ld Rd, Rd
1ee4 59           ld Re, Rc
1ee5 ac           Axor Rh
1ee6 00           nop
1ee7 41           ld Rb, Rc
1ee8 54           ld Rd, Rh
1ee9 2054         jr Cnz, D$ + 86
1eeb 48           ld Rc, Rb
1eec 45           ld Rb, Rl
1eed 2054         jr Cnz, D$ + 86
1eef 55           ld Rd, Rl
1ef0 4e           ld Rc, R(hl)
1ef1 4e           ld Rc, R(hl)
1ef2 45           ld Rb, Rl
1ef3 4c           ld Rc, Rh
1ef4 204d         jr Cnz, D$ + 79
1ef6 4f           ld Rc, Ra
1ef7 55           ld Rd, Rl
1ef8 54           ld Rd, Rh
1ef9 48           ld Rc, Rb
1efa ac           Axor Rh
1efb 00           nop
1efc 4e           ld Rc, R(hl)
1efd 45           ld Rb, Rl
1efe 41           ld Rb, Rc
1eff 52           ld Rd, Rd
1f00 2053         jr Cnz, D$ + 85
1f02 54           ld Rd, Rh
1f03 4f           ld Rc, Ra
1f04 4e           ld Rc, R(hl)
1f05 45           ld Rb, Rl
1f06 48           ld Rc, Rb
1f07 45           ld Rb, Rl
1f08 4e           ld Rc, R(hl)
1f09 47           ld Rb, Ra
1f0a 45           ld Rb, Rl
1f0b ac           Axor Rh
1f0c 00           nop
1f0d 41           ld Rb, Rc
1f0e 54           ld Rd, Rh
1f0f 2053         jr Cnz, D$ + 85
1f11 54           ld Rd, Rh
1f12 4f           ld Rc, Ra
1f13 4e           ld Rc, R(hl)
1f14 45           ld Rb, Rl
1f15 48           ld Rc, Rb
1f16 45           ld Rb, Rl
1f17 4e           ld Rc, R(hl)
1f18 47           ld Rb, Ra
1f19 45           ld Rb, Rl
1f1a ac           Axor Rh
1f1b 80           Aadd a, Rb
1f1c 43           ld Rb, Re
1f1d 41           ld Rb, Rc
1f1e 52           ld Rd, Rd
1f1f 52           ld Rd, Rd
1f20 59           ld Re, Rc
1f21 49           ld Rc, Rc
1f22 4e           ld Rc, R(hl)
1f23 47           ld Rb, Ra
1f24 204e         jr Cnz, D$ + 80
1f26 4f           ld Rc, Ra
1f27 54           ld Rd, Rh
1f28 48           ld Rc, Rb
1f29 49           ld Rc, Rc
1f2a 4e           ld Rc, R(hl)
1f2b 47           ld Rb, Ra
1f2c ae           Axor R(hl)
1f2d 014a45       ld Pbc, W0x454a
1f30 57           ld Rd, Ra
1f31 45           ld Rb, Rl
1f32 4c           ld Rc, Rh
1f33 4c           ld Rc, Rh
1f34 45           ld Rb, Rl
1f35 44           ld Rb, Rh
1f36 2043         jr Cnz, D$ + 69
1f38 52           ld Rd, Rd
1f39 4f           ld Rc, Ra
1f3a 57           ld Rd, Ra
1f3b 4e           ld Rc, R(hl)
1f3c ae           Axor R(hl)
1f3d 04           inc Rb
1f3e 4c           ld Rc, Rh
1f3f 41           ld Rb, Rc
1f40 52           ld Rd, Rd
1f41 47           ld Rb, Ra
1f42 45           ld Rb, Rl
1f43 2042         jr Cnz, D$ + 68
1f45 4f           ld Rc, Ra
1f46 54           ld Rd, Rh
1f47 54           ld Rd, Rh
1f48 4c           ld Rc, Rh
1f49 45           ld Rb, Rl
1f4a ae           Axor R(hl)
1f4b 01444f       ld Pbc, W0x4f44
1f4e 4f           ld Rc, Ra
1f4f 52           ld Rd, Rd
1f50 204b         jr Cnz, D$ + 77
1f52 45           ld Rb, Rl
1f53 59           ld Re, Rc
1f54 ae           Axor R(hl)
1f55 04           inc Rb
1f56 46           ld Rb, R(hl)
1f57 4c           ld Rc, Rh
1f58 45           ld Rb, Rl
1f59 55           ld Rd, Rl
1f5a 52           ld Rd, Rd
1f5b 2044         jr Cnz, D$ + 70
1f5d 45           ld Rb, Rl
1f5e 204c         jr Cnz, D$ + 78
1f60 59           ld Re, Rc
1f61 53           ld Rd, Re
1f62 ae           Axor R(hl)
1f63 015348       ld Pbc, W0x4853
1f66 41           ld Rb, Rc
1f67 52           ld Rd, Rd
1f68 50           ld Rd, Rb
1f69 2041         jr Cnz, D$ + 67
1f6b 58           ld Re, Rb
1f6c 45           ld Rb, Rl
1f6d ae           Axor R(hl)
1f6e 04           inc Rb
1f6f 42           ld Rb, Rd
1f70 41           ld Rb, Rc
1f71 4c           ld Rc, Rh
1f72 4c           ld Rc, Rh
1f73 2026         jr Cnz, D$ + 40
1f75 2043         jr Cnz, D$ + 69
1f77 48           ld Rc, Rb
1f78 41           ld Rb, Rc
1f79 49           ld Rc, Rc
1f7a 4e           ld Rc, R(hl)
1f7b ae           Axor R(hl)
1f7c 015348       ld Pbc, W0x4853
1f7f 4f           ld Rc, Ra
1f80 4f           ld Rc, Ra
1f81 54           ld Rd, Rh
1f82 49           ld Rc, Rc
1f83 4e           ld Rc, R(hl)
1f84 47           ld Rb, Ra
1f85 2053         jr Cnz, D$ + 85
1f87 54           ld Rd, Rh
1f88 41           ld Rb, Rc
1f89 52           ld Rd, Rd
1f8a ae           Axor R(hl)
1f8b 04           inc Rb
1f8c 53           ld Rd, Re
1f8d 43           ld Rb, Re
1f8e 52           ld Rd, Rd
1f8f 4f           ld Rc, Ra
1f90 4c           ld Rc, Rh
1f91 4c           ld Rc, Rh
1f92 ae           Axor R(hl)
1f93 01474f       ld Pbc, W0x4f47
1f96 4c           ld Rc, Rh
1f97 44           ld Rb, Rh
1f98 45           ld Rb, Rl
1f99 4e           ld Rc, R(hl)
1f9a 2043         jr Cnz, D$ + 69
1f9c 48           ld Rc, Rb
1f9d 41           ld Rb, Rc
1f9e 4c           ld Rc, Rh
1f9f 49           ld Rc, Rc
1fa0 43           ld Rb, Re
1fa1 45           ld Rb, Rl
1fa2 ae           Axor R(hl)
1fa3 04           inc Rb
1fa4 4c           ld Rc, Rh
1fa5 49           ld Rc, Rc
1fa6 54           ld Rd, Rh
1fa7 54           ld Rd, Rh
1fa8 4c           ld Rc, Rh
1fa9 45           ld Rb, Rl
1faa 204c         jr Cnz, D$ + 78
1fac 59           ld Re, Rc
1fad 52           ld Rd, Rd
1fae 45           ld Rb, Rl
1faf ae           Axor R(hl)
1fb0 01434f       ld Pbc, W0x4f43
1fb3 41           ld Rb, Rc
1fb4 54           ld Rd, Rh
1fb5 204f         jr Cnz, D$ + 81
1fb7 46           ld Rb, R(hl)
1fb8 2041         jr Cnz, D$ + 67
1fba 52           ld Rd, Rd
1fbb 4d           ld Rc, Rl
1fbc 53           ld Rd, Re
1fbd ae           Axor R(hl)
1fbe 04           inc Rb
1fbf 47           ld Rb, Ra
1fc0 4f           ld Rc, Ra
1fc1 42           ld Rb, Rd
1fc2 4c           ld Rc, Rh
1fc3 45           ld Rb, Rl
1fc4 54           ld Rd, Rh
1fc5 204f         jr Cnz, D$ + 81
1fc7 46           ld Rb, R(hl)
1fc8 2057         jr Cnz, D$ + 89
1fca 49           ld Rc, Rc
1fcb 4e           ld Rc, R(hl)
1fcc 45           ld Rb, Rl
1fcd ae           Axor R(hl)
1fce 015354       ld Pbc, W0x5453
1fd1 52           ld Rd, Rd
1fd2 4f           ld Rc, Ra
1fd3 4e           ld Rc, R(hl)
1fd4 47           ld Rb, Ra
1fd5 2053         jr Cnz, D$ + 85
1fd7 57           ld Rd, Ra
1fd8 4f           ld Rc, Ra
1fd9 52           ld Rd, Rd
1fda 44           ld Rb, Rh
1fdb ae           Axor R(hl)
1fdc 04           inc Rb
1fdd 53           ld Rd, Re
1fde 50           ld Rd, Rb
1fdf 45           ld Rb, Rl
1fe0 4c           ld Rc, Rh
1fe1 4c           ld Rc, Rh
1fe2 2042         jr Cnz, D$ + 68
1fe4 4f           ld Rc, Ra
1fe5 4f           ld Rc, Ra
1fe6 4b           ld Rc, Re
1fe7 ae           Axor R(hl)
1fe8 014d41       ld Pbc, W0x414d
1feb 47           ld Rb, Ra
1fec 49           ld Rc, Rc
1fed 43           ld Rb, Re
1fee 2057         jr Cnz, D$ + 89
1ff0 41           ld Rb, Rc
1ff1 4e           ld Rc, R(hl)
1ff2 44           ld Rb, Rh
1ff3 ae           Axor R(hl)
1ff4 04           inc Rb
1ff5 53           ld Rd, Re
1ff6 41           ld Rb, Rc
1ff7 43           ld Rb, Re
1ff8 4b           ld Rc, Re
1ff9 204f         jr Cnz, D$ + 81
1ffb 46           ld Rb, R(hl)
1ffc 2053         jr Cnz, D$ + 85
1ffe 50           ld Rd, Rb
1fff 45           ld Rb, Rl
2000 4c           ld Rc, Rh
2001 4c           ld Rc, Rh
2002 53           ld Rd, Re
2003 ae           Axor R(hl)
2004 01534f       ld Pbc, W0x4f53
2007 52           ld Rd, Rd
2008 43           ld Rb, Re
2009 45           ld Rb, Rl
200a 52           ld Rd, Rd
200b 45           ld Rb, Rl
200c 52           ld Rd, Rd
200d 27           daa
200e 53           ld Rd, Re
200f 204d         jr Cnz, D$ + 79
2011 4f           ld Rc, Ra
2012 4f           ld Rc, Ra
2013 4e           ld Rc, R(hl)
2014 ae           Axor R(hl)
2015 59           ld Re, Rc
2016 4f           ld Rc, Ra
2017 55           ld Rd, Rl
2018 2048         jr Cnz, D$ + 74
201a 41           ld Rb, Rc
201b 56           ld Rd, R(hl)
201c 45           ld Rb, Rl
201d 2044         jr Cnz, D$ + 70
201f 52           ld Rd, Rd
2020 4f           ld Rc, Ra
2021 57           ld Rd, Ra
2022 4e           ld Rc, R(hl)
2023 45           ld Rb, Rl
2024 44           ld Rb, Rh
2025 2049         jr Cnz, D$ + 75
2027 4e           ld Rc, R(hl)
2028 2054         jr Cnz, D$ + 86
202a 48           ld Rc, Rb
202b 45           ld Rb, Rl
202c 2052         jr Cnz, D$ + 84
202e 49           ld Rc, Rc
202f 56           ld Rd, R(hl)
2030 45           ld Rb, Rl
2031 52           ld Rd, Rd
2032 ac           Axor Rh
2033 59           ld Re, Rc
2034 4f           ld Rc, Ra
2035 55           ld Rd, Rl
2036 2048         jr Cnz, D$ + 74
2038 41           ld Rb, Rc
2039 56           ld Rd, R(hl)
203a 45           ld Rb, Rl
203b 2052         jr Cnz, D$ + 84
203d 55           ld Rd, Rl
203e 4e           ld Rc, R(hl)
203f 204f         jr Cnz, D$ + 81
2041 55           ld Rd, Rl
2042 54           ld Rd, Rh
2043 204f         jr Cnz, D$ + 81
2045 46           ld Rb, R(hl)
2046 2045         jr Cnz, D$ + 71
2048 4e           ld Rc, R(hl)
2049 45           ld Rb, Rl
204a 52           ld Rd, Rd
204b 47           ld Rb, Ra
204c 59           ld Re, Rc
204d 2c           inc Rl
204e 2020         jr Cnz, D$ + 34
2050 a0           Aand Rb
2051 59           ld Re, Rc
2052 4f           ld Rc, Ra
2053 55           ld Rd, Rl
2054 52           ld Rd, Rd
2055 204c         jr Cnz, D$ + 78
2057 55           ld Rd, Rl
2058 43           ld Rb, Re
2059 4b           ld Rc, Re
205a 2041         jr Cnz, D$ + 67
205c 4e           ld Rc, R(hl)
205d 44           ld Rb, Rh
205e 2054         jr Cnz, D$ + 86
2060 49           ld Rc, Rc
2061 4d           ld Rc, Rl
2062 45           ld Rb, Rl
2063 2052         jr Cnz, D$ + 84
2065 41           ld Rb, Rc
2066 4e           ld Rc, R(hl)
2067 204f         jr Cnz, D$ + 81
2069 55           ld Rd, Rl
206a 54           ld Rd, Rh
206b 2c           inc Rl
206c 2020         jr Cnz, D$ + 34
206e a0           Aand Rb
206f 2020         jr Cnz, D$ + 34
2071 2020         jr Cnz, D$ + 34
2073 2020         jr Cnz, D$ + 34
2075 2020         jr Cnz, D$ + 34
2077 2020         jr Cnz, D$ + 34
2079 2020         jr Cnz, D$ + 34
207b 2020         jr Cnz, D$ + 34
207d 2020         jr Cnz, D$ + 34
207f 53           ld Rd, Re
2080 4f           ld Rc, Ra
2081 52           ld Rd, Rd
2082 43           ld Rb, Re
2083 45           ld Rb, Rl
2084 52           ld Rd, Rd
2085 59           ld Re, Rc
2086 2020         jr Cnz, D$ + 34
2088 2020         jr Cnz, D$ + 34
208a 2043         jr Cnz, D$ + 69
208c 4f           ld Rc, Ra
208d 50           ld Rd, Rb
208e 59           ld Re, Rc
208f 52           ld Rd, Rd
2090 49           ld Rc, Rc
2091 47           ld Rb, Ra
2092 48           ld Rc, Rb
2093 54           ld Rd, Rh
2094 2031         jr Cnz, D$ + 51
2096 39           add Phl, Psp
2097 3835         jr Cc, D$ + 55
2099 2056         jr Cnz, D$ + 88
209b 49           ld Rc, Rc
209c 52           ld Rd, Rd
209d 47           ld Rb, Ra
209e 49           ld Rc, Rc
209f 4e           ld Rc, R(hl)
20a0 2047         jr Cnz, D$ + 73
20a2 41           ld Rb, Rc
20a3 4d           ld Rc, Rl
20a4 45           ld Rb, Rl
20a5 53           ld Rd, Re
20a6 204c         jr Cnz, D$ + 78
20a8 54           ld Rd, Rh
20a9 44           ld Rb, Rh
20aa 2e20         ld Rl, N0x20
20ac 44           ld Rb, Rh
20ad 49           ld Rc, Rc
20ae 53           ld Rd, Re
20af 43           ld Rb, Re
20b0 2043         jr Cnz, D$ + 69
20b2 4f           ld Rc, Ra
20b3 4e           ld Rc, R(hl)
20b4 56           ld Rd, R(hl)
20b5 45           ld Rb, Rl
20b6 52           ld Rd, Rd
20b7 53           ld Rd, Re
20b8 49           ld Rc, Rc
20b9 4f           ld Rc, Ra
20ba 4e           ld Rc, R(hl)
20bb 2042         jr Cnz, D$ + 68
20bd 59           ld Re, Rc
20be 2054         jr Cnz, D$ + 86
20c0 52           ld Rd, Rd
20c1 45           ld Rb, Rl
20c2 56           ld Rd, R(hl)
20c3 4f           ld Rc, Ra
20c4 52           ld Rd, Rd
20c5 2e20         ld Rl, N0x20
20c7 50           ld Rd, Rb
20c8 52           ld Rd, Rd
20c9 4f           ld Rc, Ra
20ca 47           ld Rb, Ra
20cb 52           ld Rd, Rd
20cc 41           ld Rb, Rc
20cd 4d           ld Rc, Rl
20ce 4d           ld Rc, Rl
20cf 45           ld Rb, Rl
20d0 44           ld Rb, Rh
20d1 2042         jr Cnz, D$ + 68
20d3 59           ld Re, Rc
20d4 2054         jr Cnz, D$ + 86
20d6 48           ld Rc, Rb
20d7 45           ld Rb, Rl
20d8 2047         jr Cnz, D$ + 73
20da 41           ld Rb, Rc
20db 4e           ld Rc, R(hl)
20dc 47           ld Rb, Ra
20dd 204f         jr Cnz, D$ + 81
20df 46           ld Rb, R(hl)
20e0 2053         jr Cnz, D$ + 85
20e2 49           ld Rc, Rc
20e3 58           ld Re, Rb
20e4 2e20         ld Rl, N0x20
20e6 2020         jr Cnz, D$ + 34
20e8 2020         jr Cnz, D$ + 34
20ea 2020         jr Cnz, D$ + 34
20ec 2020         jr Cnz, D$ + 34
20ee 2043         jr Cnz, D$ + 69
20f0 41           ld Rb, Rc
20f1 4e           ld Rc, R(hl)
20f2 2059         jr Cnz, D$ + 91
20f4 4f           ld Rc, Ra
20f5 55           ld Rd, Rl
20f6 2052         jr Cnz, D$ + 84
20f8 45           ld Rb, Rl
20f9 53           ld Rd, Re
20fa 43           ld Rb, Re
20fb 55           ld Rd, Rl
20fc 45           ld Rb, Rl
20fd 2041         jr Cnz, D$ + 67
20ff 4c           ld Rc, Rh
2100 4c           ld Rc, Rh
2101 204f         jr Cnz, D$ + 81
2103 46           ld Rb, R(hl)
2104 2059         jr Cnz, D$ + 91
2106 4f           ld Rc, Ra
2107 55           ld Rd, Rl
2108 52           ld Rd, Rd
2109 2046         jr Cnz, D$ + 72
210b 45           ld Rb, Rl
210c 4c           ld Rc, Rh
210d 4c           ld Rc, Rh
210e 4f           ld Rc, Ra
210f 57           ld Rd, Ra
2110 2053         jr Cnz, D$ + 85
2112 4f           ld Rc, Ra
2113 52           ld Rd, Rd
2114 43           ld Rb, Re
2115 45           ld Rb, Rl
2116 52           ld Rd, Rd
2117 45           ld Rb, Rl
2118 52           ld Rd, Rd
2119 53           ld Rd, Re
211a 2046         jr Cnz, D$ + 72
211c 52           ld Rd, Rd
211d 4f           ld Rc, Ra
211e 4d           ld Rc, Rl
211f 2043         jr Cnz, D$ + 69
2121 45           ld Rb, Rl
2122 52           ld Rd, Rd
2123 54           ld Rd, Rh
2124 41           ld Rb, Rc
2125 49           ld Rc, Rc
2126 4e           ld Rc, R(hl)
2127 2044         jr Cnz, D$ + 70
2129 4f           ld Rc, Ra
212a 4f           ld Rc, Ra
212b 4d           ld Rc, Rl
212c 2041         jr Cnz, D$ + 67
212e 54           ld Rd, Rh
212f 2054         jr Cnz, D$ + 86
2131 48           ld Rc, Rb
2132 45           ld Rb, Rl
2133 2048         jr Cnz, D$ + 74
2135 41           ld Rb, Rc
2136 4e           ld Rc, R(hl)
2137 44           ld Rb, Rh
2138 53           ld Rd, Re
2139 204f         jr Cnz, D$ + 81
213b 46           ld Rb, R(hl)
213c 2054         jr Cnz, D$ + 86
213e 48           ld Rc, Rb
213f 45           ld Rb, Rl
2140 2045         jr Cnz, D$ + 71
2142 56           ld Rd, R(hl)
2143 49           ld Rc, Rc
2144 4c           ld Rc, Rh
2145 2046         jr Cnz, D$ + 72
2147 4f           ld Rc, Ra
2148 52           ld Rd, Rd
2149 43           ld Rb, Re
214a 45           ld Rb, Rl
214b 53           ld Rd, Re
214c 203f         jr Cnz, D$ + 65
214e 2020         jr Cnz, D$ + 34
2150 2020         jr Cnz, D$ + 34
2152 2020         jr Cnz, D$ + 34
2154 2020         jr Cnz, D$ + 34
2156 2020         jr Cnz, D$ + 34
2158 2020         jr Cnz, D$ + 34
215a 2020         jr Cnz, D$ + 34
215c 2020         jr Cnz, D$ + 34
215e 2050         jr Cnz, D$ + 82
2160 52           ld Rd, Rd
2161 45           ld Rb, Rl
2162 53           ld Rd, Re
2163 53           ld Rd, Re
2164 2054         jr Cnz, D$ + 86
2166 48           ld Rc, Rb
2167 45           ld Rb, Rl
2168 2046         jr Cnz, D$ + 72
216a 49           ld Rc, Rc
216b 52           ld Rd, Rd
216c 45           ld Rb, Rl
216d 2042         jr Cnz, D$ + 68
216f 55           ld Rd, Rl
2170 54           ld Rd, Rh
2171 54           ld Rd, Rh
2172 4f           ld Rc, Ra
2173 4e           ld Rc, R(hl)
2174 2054         jr Cnz, D$ + 86
2176 4f           ld Rc, Ra
2177 2050         jr Cnz, D$ + 82
2179 4c           ld Rc, Rh
217a 41           ld Rb, Rc
217b 59           ld Re, Rc
217c 2e20         ld Rl, N0x20
217e 2020         jr Cnz, D$ + 34
2180 2020         jr Cnz, D$ + 34
2182 2020         jr Cnz, D$ + 34
2184 2020         jr Cnz, D$ + 34
2186 2020         jr Cnz, D$ + 34
2188 2020         jr Cnz, D$ + 34
218a 2020         jr Cnz, D$ + 34
218c 2020         jr Cnz, D$ + 34
218e 2020         jr Cnz, D$ + 34
2190 2020         jr Cnz, D$ + 34
2192 2000         jr Cnz, D$ + 2
2194 44           ld Rb, Rh
2195 41           ld Rb, Rc
2196 56           ld Rd, R(hl)
2197 45           ld Rb, Rl
2198 2e2e         ld Rl, N0x2e
219a 2e2e         ld Rl, N0x2e
219c 2e2e         ld Rl, N0x2e
219e 2e2e         ld Rl, N0x2e
21a0 2e2e         ld Rl, N0x2e
21a2 2e2e         ld Rl, N0x2e
21a4 2e2e         ld Rl, N0x2e
21a6 2e2e         ld Rl, N0x2e
21a8 2e00         ld Rl, N0x00
21aa 1000         djnz D$ + 2
21ac 41           ld Rb, Rc
21ad 4e           ld Rc, R(hl)
21ae 44           ld Rb, Rh
21af 59           ld Re, Rc
21b0 2e2e         ld Rl, N0x2e
21b2 2e2e         ld Rl, N0x2e
21b4 2e2e         ld Rl, N0x2e
21b6 2e2e         ld Rl, N0x2e
21b8 2e2e         ld Rl, N0x2e
21ba 2e2e         ld Rl, N0x2e
21bc 2e2e         ld Rl, N0x2e
21be 2e2e         ld Rl, N0x2e
21c0 2e00         ld Rl, N0x00
21c2 09           add Phl, Pbc
21c3 00           nop
21c4 49           ld Rc, Rc
21c5 41           ld Rb, Rc
21c6 4e           ld Rc, R(hl)
21c7 2e2e         ld Rl, N0x2e
21c9 2e2e         ld Rl, N0x2e
21cb 2e2e         ld Rl, N0x2e
21cd 2e2e         ld Rl, N0x2e
21cf 2e2e         ld Rl, N0x2e
21d1 2e2e         ld Rl, N0x2e
21d3 2e2e         ld Rl, N0x2e
21d5 2e2e         ld Rl, N0x2e
21d7 2e2e         ld Rl, N0x2e
21d9 00           nop
21da 08           ex af, af'
21db 00           nop
21dc 53           ld Rd, Re
21dd 54           ld Rd, Rh
21de 45           ld Rb, Rl
21df 56           ld Rd, R(hl)
21e0 45           ld Rb, Rl
21e1 2e2e         ld Rl, N0x2e
21e3 2e2e         ld Rl, N0x2e
21e5 2e2e         ld Rl, N0x2e
21e7 2e2e         ld Rl, N0x2e
21e9 2e2e         ld Rl, N0x2e
21eb 2e2e         ld Rl, N0x2e
21ed 2e2e         ld Rl, N0x2e
21ef 2e2e         ld Rl, N0x2e
21f1 00           nop
21f2 07           rlca
21f3 00           nop
21f4 54           ld Rd, Rh
21f5 52           ld Rd, Rd
21f6 49           ld Rc, Rc
21f7 43           ld Rb, Re
21f8 49           ld Rc, Rc
21f9 41           ld Rb, Rc
21fa 2e2e         ld Rl, N0x2e
21fc 2e2e         ld Rl, N0x2e
21fe 2e2e         ld Rl, N0x2e
2200 2e2e         ld Rl, N0x2e
2202 2e2e         ld Rl, N0x2e
2204 2e2e         ld Rl, N0x2e
2206 2e2e         ld Rl, N0x2e
2208 2e00         ld Rl, N0x00
220a 0600         ld Rb, N0x00
220c 43           ld Rb, Re
220d 4f           ld Rc, Ra
220e 4e           ld Rc, R(hl)
220f 47           ld Rb, Ra
2210 52           ld Rd, Rd
2211 41           ld Rb, Rc
2212 54           ld Rd, Rh
2213 55           ld Rd, Rl
2214 4c           ld Rc, Rh
2215 41           ld Rb, Rc
2216 54           ld Rd, Rh
2217 49           ld Rc, Rc
2218 4f           ld Rc, Ra
2219 4e           ld Rc, R(hl)
221a 53           ld Rd, Re
221b 212059       ld Phl, W0x5920
221e 4f           ld Rc, Ra
221f 55           ld Rd, Rl
2220 2048         jr Cnz, D$ + 74
2222 41           ld Rb, Rc
2223 56           ld Rd, R(hl)
2224 45           ld Rb, Rl
2225 2053         jr Cnz, D$ + 85
2227 41           ld Rb, Rc
2228 56           ld Rd, R(hl)
2229 45           ld Rb, Rl
222a 44           ld Rb, Rh
222b 2046         jr Cnz, D$ + 72
222d 52           ld Rd, Rd
222e 41           ld Rb, Rc
222f 4e           ld Rc, R(hl)
2230 4b           ld Rc, Re
2231 ac           Axor Rh
2232 42           ld Rb, Rd
2233 49           ld Rc, Rc
2234 4c           ld Rc, Rh
2235 4c           ld Rc, Rh
2236 2c           inc Rl
2237 2046         jr Cnz, D$ + 72
2239 52           ld Rd, Rd
223a 45           ld Rb, Rl
223b 44           ld Rb, Rh
223c 2c           inc Rl
223d 2053         jr Cnz, D$ + 85
223f 41           ld Rb, Rc
2240 4d           ld Rc, Rl
2241 2c           inc Rl
2242 2042         jr Cnz, D$ + 68
2244 4f           ld Rc, Ra
2245 42           ld Rb, Rd
2246 2c           inc Rl
2247 204a         jr Cnz, D$ + 76
2249 49           ld Rc, Rc
224a 4d           ld Rc, Rl
224b 2c           inc Rl
224c 204d         jr Cnz, D$ + 79
224e 49           ld Rc, Rc
224f 43           ld Rb, Re
2250 4b           ld Rc, Re
2251 2041         jr Cnz, D$ + 67
2253 4e           ld Rc, R(hl)
2254 44           ld Rb, Rh
2255 204a         jr Cnz, D$ + 76
2257 4f           ld Rc, Ra
2258 45           ld Rb, Rl
2259 ae           Axor R(hl)
225a 02           ld (Pbc), a
225b 48           ld Rc, Rb
225c 42           ld Rb, Rd
225d 03           inc Pbc
225e 48           ld Rc, Rb
225f 53           ld Rd, Re
2260 42           ld Rb, Rd
2261 04           inc Rb
2262 48           ld Rc, Rb
2263 2e42         ld Rl, N0x42
2265 2e06         ld Rl, N0x06
2267 48           ld Rc, Rb
2268 2e53         ld Rl, N0x53
226a 2e42         ld Rl, N0x42
226c 2e04         ld Rl, N0x04
226e 48           ld Rc, Rb
226f 55           ld Rd, Rl
2270 47           ld Rb, Ra
2271 48           ld Rc, Rb
2272 09           add Phl, Pbc
2273 48           ld Rc, Rb
2274 55           ld Rd, Rl
2275 47           ld Rb, Ra
2276 48           ld Rc, Rb
2277 2e42         ld Rl, N0x42
2279 41           ld Rb, Rc
227a 4e           ld Rc, R(hl)
227b 44           ld Rb, Rh
227c 0b           dec Pbc
227d 48           ld Rc, Rb
227e 55           ld Rd, Rl
227f 47           ld Rb, Ra
2280 48           ld Rc, Rb
2281 2e53         ld Rl, N0x53
2283 2e42         ld Rl, N0x42
2285 41           ld Rb, Rc
2286 4e           ld Rc, R(hl)
2287 44           ld Rb, Rh
2288 0648         ld Rb, N0x48
228a 2e42         ld Rl, N0x42
228c 41           ld Rb, Rc
228d 4e           ld Rc, R(hl)
228e 44           ld Rb, Rh
228f 08           ex af, af'
2290 48           ld Rc, Rb
2291 2e53         ld Rl, N0x53
2293 2e42         ld Rl, N0x42
2295 41           ld Rb, Rc
2296 4e           ld Rc, R(hl)
2297 44           ld Rb, Rh
2298 00           nop
2299 3a1323       ld a, (W0x2313)
229c d601         Asub N0x01
229e 3805         jr Cc, D$ + 7
22a0 321323       ld (W0x2313), a
22a3 181d         jr D$ + 31
22a5 2a0e23       ld Phl, (W0x230e)
22a8 7e           ld Ra, R(hl)
22a9 feff         Acp N0xff
22ab 2815         jr Cz, D$ + 23
22ad 321323       ld (W0x2313), a
22b0 23           inc Phl
22b1 5e           ld Re, R(hl)
22b2 3e06         ld Ra, N0x06
22b4 cdf122       call W0x22f1
22b7 23           inc Phl
22b8 5e           ld Re, R(hl)
22b9 3e08         ld Ra, N0x08
22bb cdf122       call W0x22f1
22be 23           inc Phl
22bf 220e23       ld (W0x230e), Phl
22c2 3a1423       ld a, (W0x2314)
22c5 d601         Asub N0x01
22c7 3804         jr Cc, D$ + 6
22c9 321423       ld (W0x2314), a
22cc c9           ret
22cd 2a1023       ld Phl, (W0x2310)
22d0 7e           ld Ra, R(hl)
22d1 feff         Acp N0xff
22d3 c8           ret Cz
22d4 321423       ld (W0x2314), a
22d7 23           inc Phl
22d8 3e02         ld Ra, N0x02
22da 5e           ld Re, R(hl)
22db cdf122       call W0x22f1
22de 23           inc Phl
22df 3e03         ld Ra, N0x03
22e1 5e           ld Re, R(hl)
22e2 cdf122       call W0x22f1
22e5 23           inc Phl
22e6 3e09         ld Ra, N0x09
22e8 5e           ld Re, R(hl)
22e9 cdf122       call W0x22f1
22ec 23           inc Phl
22ed 221023       ld (W0x2310), Phl
22f0 c9           ret
22f1 c5           push Gbc
22f2 06f4         ld Rb, N0xf4
22f4 ed79         out (c), Ra
22f6 06f6         ld Rb, N0xf6
22f8 3ec0         ld Ra, N0xc0
22fa ed79         out (c), Ra
22fc af           Axor Ra
22fd ed79         out (c), Ra
22ff 06f4         ld Rb, N0xf4
2301 ed59         out (c), Re
2303 06f6         ld Rb, N0xf6
2305 4f           ld Rc, Ra
2306 f680         Aor N0x80
2308 ed79         out (c), Ra
230a ed49         out (c), Rc
230c c1           pop Gbc
230d c9           ret
230e 12           ld (Pde), a
230f 23           inc Phl
2310 12           ld (Pde), a
2311 23           inc Phl
2312 ff           rst W0x0038
2313 00           nop
2314 00           nop
2315 00           nop
2316 05           dec Rb
2317 02           ld (Pbc), a
2318 00           nop
2319 05           dec Rb
231a 04           inc Rb
231b 00           nop
231c 05           dec Rb
231d 0601         ld Rb, N0x01
231f 05           dec Rb
2320 08           ex af, af'
2321 01040a       ld Pbc, W0x0a04
2324 00           nop
2325 04           inc Rb
2326 0c           inc Rc
2327 00           nop
2328 04           inc Rb
2329 0e02         ld Rc, N0x02
232b 03           inc Pbc
232c 0f           rrca
232d 05           dec Rb
232e 03           inc Pbc
232f 0e06         ld Rc, N0x06
2331 02           ld (Pbc), a
2332 0c           inc Rc
2333 08           ex af, af'
2334 02           ld (Pbc), a
2335 0a           ld a, (Pbc)
2336 08           ex af, af'
2337 010809       ld Pbc, W0x0908
233a 010609       ld Pbc, W0x0906
233d 00           nop
233e 04           inc Rb
233f 09           add Phl, Pbc
2340 00           nop
2341 02           ld (Pbc), a
2342 00           nop
2343 00           nop
2344 00           nop
2345 ff           rst W0x0038
2346 05           dec Rb
2347 00           nop
2348 0f           rrca
2349 05           dec Rb
234a 03           inc Pbc
234b 0e05         ld Rc, N0x05
234d 05           dec Rb
234e 0d           dec Rc
234f 05           dec Rb
2350 08           ex af, af'
2351 0b           dec Pbc
2352 04           inc Rb
2353 0c           inc Rc
2354 0a           ld a, (Pbc)
2355 04           inc Rb
2356 110904       ld Pde, W0x0409
2359 1807         jr D$ + 9
235b 03           inc Pbc
235c 1d           dec Re
235d 0603         ld Rb, N0x03
235f 1b           dec Pde
2360 05           dec Rb
2361 02           ld (Pbc), a
2362 1c           inc Re
2363 04           inc Rb
2364 02           ld (Pbc), a
2365 1d           dec Re
2366 03           inc Pbc
2367 02           ld (Pbc), a
2368 1e02         ld Re, N0x02
236a 011f01       ld Pbc, W0x011f
236d 00           nop
236e 00           nop
236f 00           nop
2370 ff           rst W0x0038
2371 01140a       ld Pbc, W0x0a14
2374 01120b       ld Pbc, W0x0b12
2377 010f0c       ld Pbc, W0x0c0f
237a 02           ld (Pbc), a
237b 0c           inc Rc
237c 0d           dec Rc
237d 02           ld (Pbc), a
237e 09           add Phl, Pbc
237f 0e02         ld Rc, N0x02
2381 060c         ld Rb, N0x0c
2383 02           ld (Pbc), a
2384 04           inc Rb
2385 09           add Phl, Pbc
2386 03           inc Pbc
2387 02           ld (Pbc), a
2388 05           dec Rb
2389 00           nop
238a 00           nop
238b 00           nop
238c ff           rst W0x0038
238d 01000d       ld Pbc, W0x0d00
2390 0f           rrca
2391 01000c       ld Pbc, W0x0c00
2394 0f           rrca
2395 01000b       ld Pbc, W0x0b00
2398 0f           rrca
2399 01000a       ld Pbc, W0x0a00
239c 0f           rrca
239d 010009       ld Pbc, W0x0900
23a0 0f           rrca
23a1 010008       ld Pbc, W0x0800
23a4 0f           rrca
23a5 010007       ld Pbc, W0x0700
23a8 0f           rrca
23a9 010006       ld Pbc, W0x0600
23ac 0f           rrca
23ad 010005       ld Pbc, W0x0500
23b0 0f           rrca
23b1 010004       ld Pbc, W0x0400
23b4 0f           rrca
23b5 00           nop
23b6 00           nop
23b7 00           nop
23b8 00           nop
23b9 ff           rst W0x0038
23ba 010003       ld Pbc, W0x0300
23bd 0f           rrca
23be 010004       ld Pbc, W0x0400
23c1 0f           rrca
23c2 010005       ld Pbc, W0x0500
23c5 0f           rrca
23c6 010006       ld Pbc, W0x0600
23c9 0f           rrca
23ca 010007       ld Pbc, W0x0700
23cd 0f           rrca
23ce 010008       ld Pbc, W0x0800
23d1 0f           rrca
23d2 010009       ld Pbc, W0x0900
23d5 0f           rrca
23d6 01000b       ld Pbc, W0x0b00
23d9 0f           rrca
23da 01000d       ld Pbc, W0x0d00
23dd 0f           rrca
23de 01000f       ld Pbc, W0x0f00
23e1 0f           rrca
23e2 00           nop
23e3 00           nop
23e4 00           nop
23e5 00           nop
23e6 ff           rst W0x0038
23e7 010004       ld Pbc, W0x0400
23ea 0f           rrca
23eb 019603       ld Pbc, W0x0396
23ee 0f           rrca
23ef 013203       ld Pbc, W0x0332
23f2 0f           rrca
23f3 00           nop
23f4 c8           ret Cz
23f5 02           ld (Pbc), a
23f6 0f           rrca
23f7 00           nop
23f8 64           ld Rh, Rh
23f9 02           ld (Pbc), a
23fa 0f           rrca
23fb 00           nop
23fc c8           ret Cz
23fd 010f00       ld Pbc, W0x000f
2400 32010f       ld (W0x0f01), a
2403 00           nop
2404 00           nop
2405 00           nop
2406 00           nop
2407 ff           rst W0x0038
2408 00           nop
2409 00           nop
240a 0c           inc Rc
240b 0f           rrca
240c 00           nop
240d 00           nop
240e 00           nop
240f 00           nop
2410 ff           rst W0x0038
2411 217225       ld Phl, W0x2572
2414 22bb27       ld (W0x27bb), Phl
2417 21f425       ld Phl, W0x25f4
241a 22be27       ld (W0x27be), Phl
241d 213627       ld Phl, W0x2736
2420 22c127       ld (W0x27c1), Phl
2423 3e01         ld Ra, N0x01
2425 32ba27       ld (W0x27ba), a
2428 32bd27       ld (W0x27bd), a
242b 32c027       ld (W0x27c0), a
242e 3e07         ld Ra, N0x07
2430 1e38         ld Re, N0x38
2432 cdf122       call W0x22f1
2435 c9           ret
2436 dde5         push Gix
2438 0e00         ld Rc, N0x00
243a dd21ba27     ld Pix, W0x27ba
243e cd6024       call W0x2460
2441 dde1         pop Gix
2443 c9           ret
2444 dde5         push Gix
2446 0e01         ld Rc, N0x01
2448 dd21bd27     ld Pix, W0x27bd
244c cd6024       call W0x2460
244f dde1         pop Gix
2451 c9           ret
2452 dde5         push Gix
2454 0e02         ld Rc, N0x02
2456 dd21c027     ld Pix, W0x27c0
245a cd6024       call W0x2460
245d dde1         pop Gix
245f c9           ret
2460 dd3500       dec R(ix + 0)
2463 c0           ret Cnz
2464 dd6e01       ld Rl, R(ix + 1)
2467 dd6602       ld Rh, R(ix + 2)
246a 5e           ld Re, R(hl)
246b 23           inc Phl
246c 56           ld Rd, R(hl)
246d 23           inc Phl
246e dd7501       ld R(ix + 1), Rl
2471 dd7402       ld R(ix + 2), Rh
2474 dd7200       ld R(ix + 0), Rd
2477 cb7b         bit U7, Re
2479 2812         jr Cz, D$ + 20
247b 7b           ld Ra, Re
247c fe80         Acp N0x80
247e 2009         jr Cnz, D$ + 11
2480 79           ld Ra, Rc
2481 c608         Aadd a, N0x08
2483 1e00         ld Re, N0x00
2485 cdf122       call W0x22f1
2488 c9           ret
2489 cd1124       call W0x2411
248c c9           ret
248d 41           ld Rb, Rc
248e cb21         Osla Rc
2490 21b224       ld Phl, W0x24b2
2493 1600         ld Rd, N0x00
2495 19           add Phl, Pde
2496 19           add Phl, Pde
2497 79           ld Ra, Rc
2498 5e           ld Re, R(hl)
2499 cdf122       call W0x22f1
249c 79           ld Ra, Rc
249d 3c           inc Ra
249e 23           inc Phl
249f 5e           ld Re, R(hl)
24a0 cdf122       call W0x22f1
24a3 78           ld Ra, Rb
24a4 c608         Aadd a, N0x08
24a6 21c327       ld Phl, W0x27c3
24a9 48           ld Rc, Rb
24aa 0600         ld Rb, N0x00
24ac 09           add Phl, Pbc
24ad 5e           ld Re, R(hl)
24ae cdf122       call W0x22f1
24b1 c9           ret
24b2 ee0e         Axor N0x0e
24b4 180e         jr D$ + 16
24b6 4d           ld Rc, Rl
24b7 0d           dec Rc
24b8 8e           Aadc a, R(hl)
24b9 0c           inc Rc
24ba da0b2f       jp Cc, W0x2f0b
24bd 0b           dec Pbc
24be 8f           Aadc a, Ra
24bf 0a           ld a, (Pbc)
24c0 f7           rst W0x0030
24c1 09           add Phl, Pbc
24c2 68           ld Rl, Rb
24c3 09           add Phl, Pbc
24c4 e1           pop Ghl
24c5 08           ex af, af'
24c6 61           ld Rh, Rc
24c7 08           ex af, af'
24c8 e9           jp (Phl)
24c9 07           rlca
24ca 77           ld R(hl), Ra
24cb 07           rlca
24cc 0c           inc Rc
24cd 07           rlca
24ce a7           Aand Ra
24cf 0647         ld Rb, N0x47
24d1 06ed         ld Rb, N0xed
24d3 05           dec Rb
24d4 98           Asbc a, Rb
24d5 05           dec Rb
24d6 47           ld Rb, Ra
24d7 05           dec Rb
24d8 fc04b4       call Cm, W0xb404
24db 04           inc Rb
24dc 70           ld R(hl), Rb
24dd 04           inc Rb
24de 3104f4       ld Psp, W0xf404
24e1 03           inc Pbc
24e2 bc           Acp Rh
24e3 03           inc Pbc
24e4 86           Aadd a, R(hl)
24e5 03           inc Pbc
24e6 53           ld Rd, Re
24e7 03           inc Pbc
24e8 24           inc Rh
24e9 03           inc Pbc
24ea f602         Aor N0x02
24ec cc02a4       call Cz, W0xa402
24ef 02           ld (Pbc), a
24f0 7e           ld Ra, R(hl)
24f1 02           ld (Pbc), a
24f2 5a           ld Re, Rd
24f3 02           ld (Pbc), a
24f4 3802         jr Cc, D$ + 4
24f6 1802         jr D$ + 4
24f8 fa01de       jp Cm, W0xde01
24fb 01c301       ld Pbc, W0x01c3
24fe aa           Axor Rd
24ff 019201       ld Pbc, W0x0192
2502 7b           ld Ra, Re
2503 016601       ld Pbc, W0x0166
2506 52           ld Rd, Rd
2507 013f01       ld Pbc, W0x013f
250a 2d           dec Rl
250b 011c01       ld Pbc, W0x011c
250e 0c           inc Rc
250f 01fd00       ld Pbc, W0x00fd
2512 ef           rst W0x0028
2513 00           nop
2514 e1           pop Ghl
2515 00           nop
2516 d5           push Gde
2517 00           nop
2518 c9           ret
2519 00           nop
251a be           Acp R(hl)
251b 00           nop
251c b3           Aor Re
251d 00           nop
251e a9           Axor Rc
251f 00           nop
2520 9f           Asbc a, Ra
2521 00           nop
2522 96           Asub R(hl)
2523 00           nop
2524 8e           Aadc a, R(hl)
2525 00           nop
2526 86           Aadd a, R(hl)
2527 00           nop
2528 7f           ld Ra, Ra
2529 00           nop
252a 77           ld R(hl), Ra
252b 00           nop
252c 71           ld R(hl), Rc
252d 00           nop
252e 6a           ld Rl, Rd
252f 00           nop
2530 64           ld Rh, Rh
2531 00           nop
2532 5f           ld Re, Ra
2533 00           nop
2534 59           ld Re, Rc
2535 00           nop
2536 54           ld Rd, Rh
2537 00           nop
2538 50           ld Rd, Rb
2539 00           nop
253a 4b           ld Rc, Re
253b 00           nop
253c 47           ld Rb, Ra
253d 00           nop
253e 43           ld Rb, Re
253f 00           nop
2540 3f           ccf
2541 00           nop
2542 3c           inc Ra
2543 00           nop
2544 3800         jr Cc, D$ + 2
2546 35           dec R(hl)
2547 00           nop
2548 32002f       ld (W0x2f00), a
254b 00           nop
254c 2d           dec Rl
254d 00           nop
254e 2a0028       ld Phl, (W0x2800)
2551 00           nop
2552 2600         ld Rh, N0x00
2554 24           inc Rh
2555 00           nop
2556 220020       ld (W0x2000), Phl
2559 00           nop
255a 1e00         ld Re, N0x00
255c 1c           inc Re
255d 00           nop
255e 1b           dec Pde
255f 00           nop
2560 19           add Phl, Pde
2561 00           nop
2562 1800         jr D$ + 2
2564 1600         ld Rd, N0x00
2566 15           dec Rd
2567 00           nop
2568 14           inc Rd
2569 00           nop
256a 13           inc Pde
256b 00           nop
256c 12           ld (Pde), a
256d 00           nop
256e 110010       ld Pde, W0x1000
2571 00           nop
2572 2b           dec Phl
2573 08           ex af, af'
2574 2d           dec Rl
2575 08           ex af, af'
2576 2f           cpl
2577 08           ex af, af'
2578 3010         jr Cnc, D$ + 18
257a 33           inc Psp
257b 08           ex af, af'
257c 3010         jr Cnc, D$ + 18
257e 33           inc Psp
257f 08           ex af, af'
2580 320830       ld (W0x3008), a
2583 08           ex af, af'
2584 2f           cpl
2585 08           ex af, af'
2586 3010         jr Cnc, D$ + 18
2588 33           inc Psp
2589 08           ex af, af'
258a 3010         jr Cnc, D$ + 18
258c 33           inc Psp
258d 08           ex af, af'
258e 320830       ld (W0x3008), a
2591 08           ex af, af'
2592 2f           cpl
2593 08           ex af, af'
2594 3010         jr Cnc, D$ + 18
2596 33           inc Psp
2597 08           ex af, af'
2598 3008         jr Cnc, D$ + 10
259a 33           inc Psp
259b 08           ex af, af'
259c 320830       ld (W0x3008), a
259f 08           ex af, af'
25a0 320833       ld (W0x3308), a
25a3 08           ex af, af'
25a4 320835       ld (W0x3508), a
25a7 08           ex af, af'
25a8 33           inc Psp
25a9 08           ex af, af'
25aa 321038       ld (W0x3810), a
25ad 08           ex af, af'
25ae 3010         jr Cnc, D$ + 18
25b0 33           inc Psp
25b1 08           ex af, af'
25b2 320835       ld (W0x3508), a
25b5 08           ex af, af'
25b6 33           inc Psp
25b7 08           ex af, af'
25b8 321038       ld (W0x3810), a
25bb 08           ex af, af'
25bc 3010         jr Cnc, D$ + 18
25be 33           inc Psp
25bf 08           ex af, af'
25c0 34           inc R(hl)
25c1 08           ex af, af'
25c2 37           scf
25c3 08           ex af, af'
25c4 3608         ld R(hl), N0x08
25c6 34           inc R(hl)
25c7 1834         jr D$ + 54
25c9 08           ex af, af'
25ca 3608         ld R(hl), N0x08
25cc 37           scf
25cd 08           ex af, af'
25ce 3808         jr Cc, D$ + 10
25d0 3b           dec Psp
25d1 08           ex af, af'
25d2 39           add Phl, Psp
25d3 08           ex af, af'
25d4 37           scf
25d5 1838         jr D$ + 58
25d7 08           ex af, af'
25d8 39           add Phl, Psp
25d9 08           ex af, af'
25da 3a083b       ld a, (W0x3b08)
25dd 08           ex af, af'
25de 3e08         ld Ra, N0x08
25e0 3c           inc Ra
25e1 08           ex af, af'
25e2 3b           dec Psp
25e3 183b         jr D$ + 61
25e5 08           ex af, af'
25e6 3c           inc Ra
25e7 08           ex af, af'
25e8 3d           dec Ra
25e9 08           ex af, af'
25ea 3e08         ld Ra, N0x08
25ec 42           ld Rb, Rd
25ed 08           ex af, af'
25ee 40           ld Rb, Rb
25ef 08           ex af, af'
25f0 3e10         ld Ra, N0x10
25f2 ff           rst W0x0038
25f3 ff           rst W0x0038
25f4 47           ld Rb, Ra
25f5 04           inc Rb
25f6 3b           dec Psp
25f7 04           inc Rb
25f8 46           ld Rb, R(hl)
25f9 04           inc Rb
25fa 3a0445       ld a, (W0x4504)
25fd 04           inc Rb
25fe 39           add Phl, Psp
25ff 04           inc Rb
2600 50           ld Rd, Rb
2601 04           inc Rb
2602 44           ld Rb, Rh
2603 04           inc Rb
2604 4f           ld Rc, Ra
2605 04           inc Rb
2606 43           ld Rb, Re
2607 04           inc Rb
2608 4e           ld Rc, R(hl)
2609 04           inc Rb
260a 42           ld Rb, Rd
260b 04           inc Rb
260c 4d           ld Rc, Rl
260d 04           inc Rb
260e 41           ld Rb, Rc
260f 04           inc Rb
2610 4c           ld Rc, Rh
2611 04           inc Rb
2612 40           ld Rb, Rb
2613 04           inc Rb
2614 4b           ld Rc, Re
2615 04           inc Rb
2616 3f           ccf
2617 04           inc Rb
2618 4d           ld Rc, Rl
2619 04           inc Rb
261a 41           ld Rb, Rc
261b 04           inc Rb
261c 4e           ld Rc, R(hl)
261d 04           inc Rb
261e 42           ld Rb, Rd
261f 04           inc Rb
2620 4f           ld Rc, Ra
2621 04           inc Rb
2622 43           ld Rb, Re
2623 04           inc Rb
2624 50           ld Rd, Rb
2625 04           inc Rb
2626 44           ld Rb, Rh
2627 04           inc Rb
2628 4f           ld Rc, Ra
2629 04           inc Rb
262a 43           ld Rb, Re
262b 04           inc Rb
262c 4e           ld Rc, R(hl)
262d 04           inc Rb
262e 42           ld Rb, Rd
262f 04           inc Rb
2630 4d           ld Rc, Rl
2631 04           inc Rb
2632 41           ld Rb, Rc
2633 04           inc Rb
2634 4c           ld Rc, Rh
2635 04           inc Rb
2636 40           ld Rb, Rb
2637 04           inc Rb
2638 4b           ld Rc, Re
2639 04           inc Rb
263a 3f           ccf
263b 04           inc Rb
263c 4d           ld Rc, Rl
263d 04           inc Rb
263e 41           ld Rb, Rc
263f 04           inc Rb
2640 4e           ld Rc, R(hl)
2641 04           inc Rb
2642 42           ld Rb, Rd
2643 04           inc Rb
2644 4f           ld Rc, Ra
2645 04           inc Rb
2646 43           ld Rb, Re
2647 04           inc Rb
2648 50           ld Rd, Rb
2649 04           inc Rb
264a 44           ld Rb, Rh
264b 04           inc Rb
264c 4f           ld Rc, Ra
264d 04           inc Rb
264e 43           ld Rb, Re
264f 04           inc Rb
2650 50           ld Rd, Rb
2651 04           inc Rb
2652 44           ld Rb, Rh
2653 04           inc Rb
2654 51           ld Rd, Rc
2655 04           inc Rb
2656 45           ld Rb, Rl
2657 04           inc Rb
2658 52           ld Rd, Rd
2659 04           inc Rb
265a 46           ld Rb, R(hl)
265b 04           inc Rb
265c 53           ld Rd, Re
265d 04           inc Rb
265e 47           ld Rb, Ra
265f 04           inc Rb
2660 54           ld Rd, Rh
2661 04           inc Rb
2662 48           ld Rc, Rb
2663 04           inc Rb
2664 52           ld Rd, Rd
2665 04           inc Rb
2666 46           ld Rb, R(hl)
2667 04           inc Rb
2668 51           ld Rd, Rc
2669 04           inc Rb
266a 45           ld Rb, Rl
266b 04           inc Rb
266c 50           ld Rd, Rb
266d 04           inc Rb
266e 44           ld Rb, Rh
266f 04           inc Rb
2670 4f           ld Rc, Ra
2671 04           inc Rb
2672 43           ld Rb, Re
2673 04           inc Rb
2674 4e           ld Rc, R(hl)
2675 04           inc Rb
2676 42           ld Rb, Rd
2677 04           inc Rb
2678 4d           ld Rc, Rl
2679 04           inc Rb
267a 41           ld Rb, Rc
267b 04           inc Rb
267c 4c           ld Rc, Rh
267d 04           inc Rb
267e 40           ld Rb, Rb
267f 04           inc Rb
2680 4b           ld Rc, Re
2681 04           inc Rb
2682 3f           ccf
2683 04           inc Rb
2684 4a           ld Rc, Rd
2685 04           inc Rb
2686 3e04         ld Ra, N0x04
2688 49           ld Rc, Rc
2689 04           inc Rb
268a 3d           dec Ra
268b 04           inc Rb
268c 48           ld Rc, Rb
268d 04           inc Rb
268e 3c           inc Ra
268f 04           inc Rb
2690 50           ld Rd, Rb
2691 04           inc Rb
2692 44           ld Rb, Rh
2693 04           inc Rb
2694 4f           ld Rc, Ra
2695 04           inc Rb
2696 43           ld Rb, Re
2697 04           inc Rb
2698 4e           ld Rc, R(hl)
2699 04           inc Rb
269a 3804         jr Cc, D$ + 6
269c 4d           ld Rc, Rl
269d 04           inc Rb
269e 41           ld Rb, Rc
269f 04           inc Rb
26a0 4c           ld Rc, Rh
26a1 04           inc Rb
26a2 40           ld Rb, Rb
26a3 04           inc Rb
26a4 4b           ld Rc, Re
26a5 04           inc Rb
26a6 3f           ccf
26a7 04           inc Rb
26a8 4a           ld Rc, Rd
26a9 04           inc Rb
26aa 3e04         ld Ra, N0x04
26ac 49           ld Rc, Rc
26ad 04           inc Rb
26ae 3d           dec Ra
26af 04           inc Rb
26b0 48           ld Rc, Rb
26b1 04           inc Rb
26b2 3c           inc Ra
26b3 04           inc Rb
26b4 46           ld Rb, R(hl)
26b5 04           inc Rb
26b6 3a0447       ld a, (W0x4704)
26b9 04           inc Rb
26ba 3b           dec Psp
26bb 04           inc Rb
26bc 48           ld Rc, Rb
26bd 04           inc Rb
26be 3c           inc Ra
26bf 04           inc Rb
26c0 49           ld Rc, Rc
26c1 04           inc Rb
26c2 3d           dec Ra
26c3 04           inc Rb
26c4 4a           ld Rc, Rd
26c5 04           inc Rb
26c6 3e04         ld Ra, N0x04
26c8 4b           ld Rc, Re
26c9 04           inc Rb
26ca 3f           ccf
26cb 04           inc Rb
26cc 4d           ld Rc, Rl
26cd 04           inc Rb
26ce 41           ld Rb, Rc
26cf 04           inc Rb
26d0 4c           ld Rc, Rh
26d1 04           inc Rb
26d2 40           ld Rb, Rb
26d3 04           inc Rb
26d4 4b           ld Rc, Re
26d5 04           inc Rb
26d6 3f           ccf
26d7 04           inc Rb
26d8 4a           ld Rc, Rd
26d9 04           inc Rb
26da 3e04         ld Ra, N0x04
26dc 4b           ld Rc, Re
26dd 04           inc Rb
26de 3f           ccf
26df 04           inc Rb
26e0 4c           ld Rc, Rh
26e1 04           inc Rb
26e2 40           ld Rb, Rb
26e3 04           inc Rb
26e4 4d           ld Rc, Rl
26e5 04           inc Rb
26e6 41           ld Rb, Rc
26e7 04           inc Rb
26e8 4e           ld Rc, R(hl)
26e9 04           inc Rb
26ea 42           ld Rb, Rd
26eb 04           inc Rb
26ec 4f           ld Rc, Ra
26ed 04           inc Rb
26ee 43           ld Rb, Re
26ef 04           inc Rb
26f0 51           ld Rd, Rc
26f1 04           inc Rb
26f2 45           ld Rb, Rl
26f3 04           inc Rb
26f4 50           ld Rd, Rb
26f5 04           inc Rb
26f6 44           ld Rb, Rh
26f7 04           inc Rb
26f8 4f           ld Rc, Ra
26f9 04           inc Rb
26fa 43           ld Rb, Re
26fb 04           inc Rb
26fc 4d           ld Rc, Rl
26fd 04           inc Rb
26fe 41           ld Rb, Rc
26ff 04           inc Rb
2700 4e           ld Rc, R(hl)
2701 04           inc Rb
2702 42           ld Rb, Rd
2703 04           inc Rb
2704 4f           ld Rc, Ra
2705 04           inc Rb
2706 43           ld Rb, Re
2707 04           inc Rb
2708 50           ld Rd, Rb
2709 04           inc Rb
270a 44           ld Rb, Rh
270b 04           inc Rb
270c 52           ld Rd, Rd
270d 04           inc Rb
270e 46           ld Rb, R(hl)
270f 04           inc Rb
2710 53           ld Rd, Re
2711 04           inc Rb
2712 47           ld Rb, Ra
2713 04           inc Rb
2714 54           ld Rd, Rh
2715 04           inc Rb
2716 48           ld Rc, Rb
2717 04           inc Rb
2718 53           ld Rd, Re
2719 04           inc Rb
271a 47           ld Rb, Ra
271b 04           inc Rb
271c 52           ld Rd, Rd
271d 04           inc Rb
271e 46           ld Rb, R(hl)
271f 04           inc Rb
2720 45           ld Rb, Rl
2721 04           inc Rb
2722 39           add Phl, Psp
2723 04           inc Rb
2724 46           ld Rb, R(hl)
2725 04           inc Rb
2726 3a0448       ld a, (W0x4804)
2729 04           inc Rb
272a 3c           inc Ra
272b 04           inc Rb
272c 49           ld Rc, Rc
272d 04           inc Rb
272e 3d           dec Ra
272f 04           inc Rb
2730 4a           ld Rc, Rd
2731 04           inc Rb
2732 3e04         ld Ra, N0x04
2734 ff           rst W0x0038
2735 ff           rst W0x0038
2736 2b           dec Phl
2737 04           inc Rb
2738 2d           dec Rl
2739 08           ex af, af'
273a 2f           cpl
273b 08           ex af, af'
273c 3010         jr Cnc, D$ + 18
273e 33           inc Psp
273f 08           ex af, af'
2740 3010         jr Cnc, D$ + 18
2742 33           inc Psp
2743 08           ex af, af'
2744 320830       ld (W0x3008), a
2747 08           ex af, af'
2748 2f           cpl
2749 08           ex af, af'
274a 3010         jr Cnc, D$ + 18
274c 33           inc Psp
274d 08           ex af, af'
274e 3010         jr Cnc, D$ + 18
2750 33           inc Psp
2751 08           ex af, af'
2752 320830       ld (W0x3008), a
2755 08           ex af, af'
2756 2f           cpl
2757 08           ex af, af'
2758 3010         jr Cnc, D$ + 18
275a 33           inc Psp
275b 08           ex af, af'
275c 3008         jr Cnc, D$ + 10
275e 33           inc Psp
275f 08           ex af, af'
2760 320830       ld (W0x3008), a
2763 08           ex af, af'
2764 320833       ld (W0x3308), a
2767 08           ex af, af'
2768 320835       ld (W0x3508), a
276b 08           ex af, af'
276c 33           inc Psp
276d 08           ex af, af'
276e 321038       ld (W0x3810), a
2771 08           ex af, af'
2772 3010         jr Cnc, D$ + 18
2774 33           inc Psp
2775 08           ex af, af'
2776 320835       ld (W0x3508), a
2779 08           ex af, af'
277a 33           inc Psp
277b 08           ex af, af'
277c 321038       ld (W0x3810), a
277f 08           ex af, af'
2780 3010         jr Cnc, D$ + 18
2782 33           inc Psp
2783 08           ex af, af'
2784 34           inc R(hl)
2785 08           ex af, af'
2786 37           scf
2787 08           ex af, af'
2788 3608         ld R(hl), N0x08
278a 34           inc R(hl)
278b 1834         jr D$ + 54
278d 08           ex af, af'
278e 3608         ld R(hl), N0x08
2790 37           scf
2791 08           ex af, af'
2792 3808         jr Cc, D$ + 10
2794 3b           dec Psp
2795 08           ex af, af'
2796 39           add Phl, Psp
2797 08           ex af, af'
2798 37           scf
2799 1838         jr D$ + 58
279b 08           ex af, af'
279c 39           add Phl, Psp
279d 08           ex af, af'
279e 3a083b       ld a, (W0x3b08)
27a1 08           ex af, af'
27a2 3e08         ld Ra, N0x08
27a4 3c           inc Ra
27a5 08           ex af, af'
27a6 3b           dec Psp
27a7 183b         jr D$ + 61
27a9 08           ex af, af'
27aa 3c           inc Ra
27ab 08           ex af, af'
27ac 3d           dec Ra
27ad 08           ex af, af'
27ae 3e08         ld Ra, N0x08
27b0 42           ld Rb, Rd
27b1 08           ex af, af'
27b2 40           ld Rb, Rb
27b3 08           ex af, af'
27b4 3e10         ld Ra, N0x10
27b6 80           Aadd a, Rb
27b7 04           inc Rb
27b8 ff           rst W0x0038
27b9 ff           rst W0x0038
27ba 00           nop
27bb 00           nop
27bc 00           nop
27bd 00           nop
27be 00           nop
27bf 00           nop
27c0 00           nop
27c1 00           nop
27c2 00           nop
27c3 0f           rrca
27c4 06ff         ld Rb, N0xff
