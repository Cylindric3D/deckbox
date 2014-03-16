@ECHO OFF

:: If you don't have the openscad.com executable in your PATH, you need to set the full location to it here:
SET OPENSCAD=openscad

:: If you don't have the slic3r-console.exe executable in your PATH, you need to set the full location to it here:
SET SLICER=slic3r-console

:: Slicing will expect a config file to exist, called slic3r.ini. You can create 
:: this by setting everything up in Slic3r, then exporting the settings.



:: Screenshots for documentation
SET PLATECAM=--camera=0,0,0,55,0,330,1100 --imgsize=500,300
%OPENSCAD% -D part=12 -D circleRes=120 -D j=0.1 -o img\plate_A-base.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=13 -D circleRes=120 -D j=0.1 -o img\plate_B-top.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=14 -D circleRes=120 -D j=0.1 -o img\plate_C-panels-racks.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=15 -D circleRes=120 -D j=0.1 -o img\plate_D-lowerhinges.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=16 -D circleRes=120 -D j=0.1 -o img\plate_E-mechanism.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 -o img\plate_F-upperhinges.png %PLATECAM% deck_box.scad
%OPENSCAD% -D part=18 -D circleRes=120 -D j=0.1 -o img\plate_G-platform.png %PLATECAM% deck_box.scad

:: Screenshots for individual items
SET PARTCAM=--camera=0,0,0,55,0,330,1100 --imgsize=500,300
%OPENSCAD% -D part=1  -D circleRes=120 -D j=0.1 -o img\part-frontback-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=2  -D circleRes=120 -D j=0.1 -o img\part-side-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=3  -D circleRes=120 -D j=0.1 -o img\part-racklift-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=4  -D circleRes=120 -D j=0.1 -o img\part-corner_left-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=5  -D circleRes=120 -D j=0.1 -o img\part-corner_right-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=6  -D circleRes=120 -D j=0.1 -o img\part-topjoin-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=7  -D circleRes=120 -D j=0.1 -o img\part-mechanism-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=8  -D circleRes=120 -D j=0.1 -o img\part-lid-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=9  -D circleRes=120 -D j=0.1 -o img\part-topside-2x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=10 -D circleRes=120 -D j=0.1 -o img\part-rackliftplatform-1x.png %PARTCAM% deck_box.scad
%OPENSCAD% -D part=11 -D circleRes=120 -D j=0.1 -o img\part-base-1x.png %PARTCAM% deck_box.scad

:: STLs of individual parts
%OPENSCAD% -D part=1  -D circleRes=120 -D j=0.1 -o stl\part-frontback-2x.stl deck_box.scad
%OPENSCAD% -D part=2  -D circleRes=120 -D j=0.1 -o stl\part-side-2x.stl deck_box.scad
%OPENSCAD% -D part=3  -D circleRes=120 -D j=0.1 -o stl\part-racklift-2x.stl deck_box.scad
%OPENSCAD% -D part=4  -D circleRes=120 -D j=0.1 -o stl\part-corner_left-2x.stl deck_box.scad
%OPENSCAD% -D part=5  -D circleRes=120 -D j=0.1 -o stl\part-corner_right-2x.stl deck_box.scad
%OPENSCAD% -D part=6  -D circleRes=120 -D j=0.1 -o stl\part-topjoin-2x.stl deck_box.scad
%OPENSCAD% -D part=7  -D circleRes=120 -D j=0.1 -o stl\part-mechanism-2x.stl deck_box.scad
%OPENSCAD% -D part=8  -D circleRes=120 -D j=0.1 -o stl\part-lid-2x.stl deck_box.scad
%OPENSCAD% -D part=9  -D circleRes=120 -D j=0.1 -o stl\part-topside-2x.stl deck_box.scad
%OPENSCAD% -D part=10 -D circleRes=120 -D j=0.1 -o stl\part-rackliftplatform-1x.stl deck_box.scad
%OPENSCAD% -D part=11 -D circleRes=120 -D j=0.1 -o stl\part-base-1x.stl deck_box.scad

:: STLs of full plates
%OPENSCAD% -D part=12 -D circleRes=120 -D j=0.1 -o stl\plate-A-base.stl deck_box.scad
%OPENSCAD% -D part=13 -D circleRes=120 -D j=0.1 -o stl\plate-B-top.stl deck_box.scad
%OPENSCAD% -D part=14 -D circleRes=120 -D j=0.1 -o stl\plate-C-panels-racks.stl deck_box.scad
%OPENSCAD% -D part=15 -D circleRes=120 -D j=0.1 -o stl\plate-D-lowerhinges.stl deck_box.scad
%OPENSCAD% -D part=16 -D circleRes=120 -D j=0.1 -o stl\plate-E-mechanism.stl deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 -o stl\plate-F-upperhinges.stl deck_box.scad
%OPENSCAD% -D part=18 -D circleRes=120 -D j=0.1 -o stl\plate-G-platform.stl deck_box.scad

:: STLs of logo parts for demo
%OPENSCAD% -D part=15 -D circleRes=120 -D j=0.1 -D front_logo=\"manawhite\" -D back_logo=\"manared\" -o stl\logo_sample-1.stl deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 -D left_logo=\"manablue\" -D right_logo=\"manablack\" -o stl\logo_sample-2.stl deck_box.scad

:: Slice plated layouts
%SLICER% -load slic3r.ini --output gcode\plate_A-base.gcode stl\plate_A-base.stl
%SLICER% -load slic3r.ini --output gcode\plate_B-top.gcode stl\plate_B-top.stl
%SLICER% -load slic3r.ini --output gcode\plate_C-panels_racks.gcode stl\plate_C-panels_racks.stl
%SLICER% -load slic3r.ini --output gcode\plate_D-lowerhinges.gcode stl\plate_D-lowerhinges.stl
%SLICER% -load slic3r.ini --output gcode\plate_E-mechanism.gcode stl\plate_E-mechanism.stl
%SLICER% -load slic3r.ini --output gcode\plate_F-upperhinges.gcode stl\plate_F-upperhinges.stl
%SLICER% -load slic3r.ini --output gcode\plate_G-platform.gcode stl\plate_G-platform.stl

:: Slice individual parts
%SLICER% -load slic3r.ini --output gcode\part-frontback-2x.gcode stl\part-frontback-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-side-2x.gcode stl\part-side-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-racklift-2x.gcode stl\part-racklift-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-corner_right-2x.gcode stl\part-corner_right-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-corner_left-2x.gcode stl\part-corner_left-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-mechanism-2x.gcode stl\part-mechanism-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-lid-2x.gcode stl\part-lid-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-topside-2x.gcode stl\part-topside-2x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-rackliftplatform-1x.gcode stl\part-rackliftplatform-1x.stl deck_box.scad
%SLICER% -load slic3r.ini --output gcode\part-base-1x.gcode stl\part-base-1x.stl deck_box.scad
