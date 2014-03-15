@ECHO OFF

openscad -D part=1  -D circleRes=120 -D j=0.1 -o stl\deck_box-frontback-2x.stl deck_box.scad
openscad -D part=2  -D circleRes=120 -D j=0.1 -o stl\deck_box-side-2x.stl deck_box.scad
openscad -D part=3  -D circleRes=120 -D j=0.1 -o stl\deck_box-topkey-2x.stl deck_box.scad
openscad -D part=4  -D circleRes=120 -D j=0.1 -o stl\deck_box-racklift-2x.stl deck_box.scad
openscad -D part=5  -D circleRes=120 -D j=0.1 -o stl\deck_box-toplayout-2x.stl deck_box.scad
openscad -D part=6  -D circleRes=120 -D j=0.1 -o stl\deck_box-topjoin-2x.stl deck_box.scad
openscad -D part=7  -D circleRes=120 -D j=0.1 -o stl\deck_box-mechanism-2x.stl deck_box.scad
openscad -D part=8  -D circleRes=120 -D j=0.1 -o stl\deck_box-lid-2x.stl deck_box.scad
openscad -D part=9  -D circleRes=120 -D j=0.1 -o stl\deck_box-topside-2x.stl deck_box.scad
openscad -D part=10 -D circleRes=120 -D j=0.1 -o stl\deck_box-rackliftplatform-1x.stl deck_box.scad
openscad -D part=11 -D circleRes=120 -D j=0.1 -o stl\deck_box-base-1x.stl deck_box.scad

openscad -D part=12 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_A-base.stl deck_box.scad
openscad -D part=13 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_B-top.stl deck_box.scad
openscad -D part=14 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_C-panelracks.stl deck_box.scad
openscad -D part=15 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_D-lowerhinges.stl deck_box.scad
openscad -D part=16 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_E-mechanism.stl deck_box.scad
openscad -D part=17 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_F-upperhinges.stl deck_box.scad
openscad -D part=18 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_G-platform.stl deck_box.scad

openscad -D part=15 -D circleRes=120 -D j=0.1 -D front_logo=\"manawhite\" -D back_logo=\"manared\" -o stl\logo_sample-1.stl deck_box.scad
openscad -D part=16 -D circleRes=120 -D j=0.1 -D left_logo=\"manablue\" -D right_logo=\"manablack\" -o stl\logo_sample-2.stl deck_box.scad
