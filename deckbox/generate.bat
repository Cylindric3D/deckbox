@ECHO OFF

:: Screenshots for documentation
SET PLATECAM=--camera=0,0,0,55,0,330,1050 --imgsize=500,300
openscad -D part=12 -D circleRes=120 -D j=0.1 -o img\plate_A-base.png %PLATECAM% deck_box.scad
openscad -D part=13 -D circleRes=120 -D j=0.1 -o img\plate_B-top.png %PLATECAM% deck_box.scad
openscad -D part=14 -D circleRes=120 -D j=0.1 -o img\plate_C-panels-racks.png %PLATECAM% deck_box.scad
openscad -D part=15 -D circleRes=120 -D j=0.1 -o img\plate_D-lowerhinges.png %PLATECAM% deck_box.scad
openscad -D part=16 -D circleRes=120 -D j=0.1 -o img\plate_E-mechanism.png %PLATECAM% deck_box.scad
openscad -D part=17 -D circleRes=120 -D j=0.1 -o img\plate_F-upperhinges.png %PLATECAM% deck_box.scad
openscad -D part=18 -D circleRes=120 -D j=0.1 -o img\plate_G-platform.png %PLATECAM% deck_box.scad

:: Screenshots for individual items
SET PLATECAM=--camera=0,0,0,55,0,330,1050 --imgsize=500,300
openscad -D part=1  -D circleRes=120 -D j=0.1 -o img\part-frontback-2x.png %PARTCAM% deck_box.scad
openscad -D part=2  -D circleRes=120 -D j=0.1 -o img\part-side-2x.png %PARTCAM% deck_box.scad
openscad -D part=3  -D circleRes=120 -D j=0.1 -o img\part-topkey-2x.png %PARTCAM% deck_box.scad
openscad -D part=4  -D circleRes=120 -D j=0.1 -o img\part-racklift-2x.png %PARTCAM% deck_box.scad
openscad -D part=5  -D circleRes=120 -D j=0.1 -o img\part-toplayout-2x.png %PARTCAM% deck_box.scad
openscad -D part=6  -D circleRes=120 -D j=0.1 -o img\part-topjoin-2x.png %PARTCAM% deck_box.scad
openscad -D part=7  -D circleRes=120 -D j=0.1 -o img\part-mechanism-2x.png %PARTCAM% deck_box.scad
openscad -D part=8  -D circleRes=120 -D j=0.1 -o img\part-lid-2x.png %PARTCAM% deck_box.scad
openscad -D part=9  -D circleRes=120 -D j=0.1 -o img\part-topside-2x.png %PARTCAM% deck_box.scad
openscad -D part=10 -D circleRes=120 -D j=0.1 -o img\part-rackliftplatform-1x.png %PARTCAM% deck_box.scad
openscad -D part=11 -D circleRes=120 -D j=0.1 -o img\part-base-1x.png %PARTCAM% deck_box.scad

:: STLs of individual parts
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

:: STLs of full plates
openscad -D part=12 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_A-base.stl deck_box.scad
openscad -D part=13 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_B-top.stl deck_box.scad
openscad -D part=14 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_C-panels-racks.stl deck_box.scad
openscad -D part=15 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_D-lowerhinges.stl deck_box.scad
openscad -D part=16 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_E-mechanism.stl deck_box.scad
openscad -D part=17 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_F-upperhinges.stl deck_box.scad
openscad -D part=18 -D circleRes=120 -D j=0.1 -o stl\deck_box-plate_G-platform.stl deck_box.scad

:: STLs of logo parts for demo
openscad -D part=15 -D circleRes=120 -D j=0.1 -D front_logo=\"manawhite\" -D back_logo=\"manared\" -o stl\logo_sample-1.stl deck_box.scad
openscad -D part=16 -D circleRes=120 -D j=0.1 -D left_logo=\"manablue\" -D right_logo=\"manablack\" -o stl\logo_sample-2.stl deck_box.scad
