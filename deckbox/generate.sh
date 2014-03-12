#!/bin/sh

openscad -D part=1 -D circleRes=120 -D j=0.1 -o stl/deck_box-frontback-2x.stl deck_box.scad
openscad -D part=2 -D circleRes=120 -D j=0.1 -o stl/deck_box-side-2x.stl deck_box.scad
openscad -D part=3 -D circleRes=120 -D j=0.1 -o stl/deck_box-topkey-2x.stl deck_box.scad
openscad -D part=4 -D circleRes=120 -D j=0.1 -o stl/deck_box-racklift-2x.stl deck_box.scad
openscad -D part=5 -D circleRes=120 -D j=0.1 -o stl/deck_box-toplayout-2x.stl deck_box.scad
openscad -D part=6 -D circleRes=120 -D j=0.1 -o stl/deck_box-mechanism-2x.stl deck_box.scad
openscad -D part=7 -D circleRes=120 -D j=0.1 -o stl/deck_box-lid-2x.stl deck_box.scad
openscad -D part=8 -D circleRes=120 -D j=0.1 -o stl/deck_box-topside-2x.stl deck_box.scad
openscad -D part=9 -D circleRes=120 -D j=0.1 -o stl/deck_box-rackliftplatform-1x.stl deck_box.scad
openscad -D part=10 -D circleRes=120 -D j=0.1 -o stl/deck_box-base-1x.stl deck_box.scad
