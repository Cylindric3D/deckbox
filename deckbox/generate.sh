#!/bin/sh

openscad -D part=1 -D circleRes=120 -D j=0.1 -o output/deck_box-1.stl deck_box.scad
openscad -D part=2 -D circleRes=120 -D j=0.1 -o output/deck_box-2.stl deck_box.scad
openscad -D part=3 -D circleRes=120 -D j=0.1 -o output/deck_box-3.stl deck_box.scad
openscad -D part=4 -D circleRes=120 -D j=0.1 -o output/deck_box-4.stl deck_box.scad
openscad -D part=5 -D circleRes=120 -D j=0.1 -o output/deck_box-5.stl deck_box.scad
openscad -D part=6 -D circleRes=120 -D j=0.1 -o output/deck_box-6.stl deck_box.scad
openscad -D part=7 -D circleRes=120 -D j=0.1 -o output/deck_box-7.stl deck_box.scad
openscad -D part=8 -D circleRes=120 -D j=0.1 -o output/deck_box-8.stl deck_box.scad

