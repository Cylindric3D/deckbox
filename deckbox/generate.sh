#!/bin/sh

openscad -D part=1 -o deck_box-1.stl deck_box.scad
openscad -D part=2 -o deck_box-2.stl deck_box.scad
openscad -D part=3 -o deck_box-3.stl deck_box.scad
openscad -D part=4 -o deck_box-4.stl deck_box.scad
openscad -D part=5 -o deck_box-5.stl deck_box.scad
openscad -D part=6 -o deck_box-6.stl deck_box.scad
openscad -D part=7 -o deck_box-7.stl deck_box.scad
openscad -D part=8 -o deck_box-8.stl deck_box.scad

