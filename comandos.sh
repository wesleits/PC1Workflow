#!/bin/sh
./align_warp anatomy1.img reference.img warp1.warp -m 12 -q
./align_warp anatomy2.img reference.img warp2.warp -m 12 -q
./align_warp anatomy3.img reference.img warp3.warp -m 12 -q
./align_warp anatomy4.img reference.img warp4.warp -m 12 -q
./reslice warp1.warp resliced1
./reslice warp2.warp resliced2
./reslice warp3.warp resliced3
./reslice warp4.warp resliced4
./softmean atlas.hdr y null resliced1.img resliced2.img resliced3.img resliced4.img
slicer atlas.hdr -x .5 atlas-x.pgm
slicer atlas.hdr -y .5 atlas-y.pgm
slicer atlas.hdr -z .5 atlas-z.pgm
convert atlas-x.pgm atlas-x.gif
convert atlas-y.pgm atlas-y.gif
convert atlas-z.pgm atlas-z.gif
