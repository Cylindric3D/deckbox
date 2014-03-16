@ECHO OFF

:: If you don't have the openscad.com executable in your PATH, you need to set the full location to it here:
SET OPENSCAD=openscad

:: If you don't have the slic3r-console.exe executable in your PATH, you need to set the full location to it here:
SET SLICER=slic3r-console

:: Slicing will expect a config file to exist, called slic3r.ini. You can create 
:: this by setting everything up in Slic3r, then exporting the settings.


:: Screenshots for documentation
%OPENSCAD% -D part=14 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-A-base.png deck_box.scad
%OPENSCAD% -D part=15 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-B-top.png deck_box.scad
%OPENSCAD% -D part=16 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-C-panels-racks.png deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-D-lowerhinges.png deck_box.scad
%OPENSCAD% -D part=18 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,900 --imgsize=500,300 --render -o img\plate-E-mechanism.png deck_box.scad
%OPENSCAD% -D part=19 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-F-upperhinges.png deck_box.scad
%OPENSCAD% -D part=20 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,800 --imgsize=500,300 --render -o img\plate-G-platform.png deck_box.scad

:: Screenshots for individual items
%OPENSCAD% -D part=1  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-front-1x.png deck_box.scad
%OPENSCAD% -D part=2  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-back-1x.png deck_box.scad
%OPENSCAD% -D part=3  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-left-1x.png deck_box.scad
%OPENSCAD% -D part=4  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-right-1x.png deck_box.scad
%OPENSCAD% -D part=5  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-racklift-2x.png deck_box.scad
%OPENSCAD% -D part=6  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-corner_left-2x.png deck_box.scad
%OPENSCAD% -D part=7  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-corner_right-2x.png deck_box.scad
%OPENSCAD% -D part=8  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-topjoin-2x.png deck_box.scad
%OPENSCAD% -D part=9  -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-mechanism-2x.png deck_box.scad
%OPENSCAD% -D part=10 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-lid-2x.png deck_box.scad
%OPENSCAD% -D part=11 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-topside-2x.png deck_box.scad
%OPENSCAD% -D part=12 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-rackliftplatform-1x.png deck_box.scad
%OPENSCAD% -D part=13 -D circleRes=120 -D j=0.1 --camera=0,0,0,55,0,330,500 --imgsize=500,300 --render -o img\part-base-1x.png deck_box.scad

:: STLs of individual parts
%OPENSCAD% -D part=1  -D circleRes=120 -D j=0.1 -o stl\part-front-1x.stl deck_box.scad
%OPENSCAD% -D part=2  -D circleRes=120 -D j=0.1 -o stl\part-back-1x.stl deck_box.scad
%OPENSCAD% -D part=3  -D circleRes=120 -D j=0.1 -o stl\part-left-1x.stl deck_box.scad
%OPENSCAD% -D part=4  -D circleRes=120 -D j=0.1 -o stl\part-right-1x.stl deck_box.scad
%OPENSCAD% -D part=5  -D circleRes=120 -D j=0.1 -o stl\part-racklift-2x.stl deck_box.scad
%OPENSCAD% -D part=6  -D circleRes=120 -D j=0.1 -o stl\part-corner_left-2x.stl deck_box.scad
%OPENSCAD% -D part=7  -D circleRes=120 -D j=0.1 -o stl\part-corner_right-2x.stl deck_box.scad
%OPENSCAD% -D part=8  -D circleRes=120 -D j=0.1 -o stl\part-topjoin-2x.stl deck_box.scad
%OPENSCAD% -D part=9  -D circleRes=120 -D j=0.1 -o stl\part-mechanism-2x.stl deck_box.scad
%OPENSCAD% -D part=10 -D circleRes=120 -D j=0.1 -o stl\part-lid-2x.stl deck_box.scad
%OPENSCAD% -D part=11 -D circleRes=120 -D j=0.1 -o stl\part-topside-2x.stl deck_box.scad
%OPENSCAD% -D part=12 -D circleRes=120 -D j=0.1 -o stl\part-rackliftplatform-1x.stl deck_box.scad
%OPENSCAD% -D part=13 -D circleRes=120 -D j=0.1 -o stl\part-base-1x.stl deck_box.scad

:: STLs of full plates
%OPENSCAD% -D part=14 -D circleRes=120 -D j=0.1 -o stl\plate-A-base.stl deck_box.scad
%OPENSCAD% -D part=15 -D circleRes=120 -D j=0.1 -o stl\plate-B-top.stl deck_box.scad
%OPENSCAD% -D part=16 -D circleRes=120 -D j=0.1 -o stl\plate-C-panels-racks.stl deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 -o stl\plate-D-lowerhinges.stl deck_box.scad
%OPENSCAD% -D part=18 -D circleRes=120 -D j=0.1 -o stl\plate-E-mechanism.stl deck_box.scad
%OPENSCAD% -D part=19 -D circleRes=120 -D j=0.1 -o stl\plate-F-upperhinges.stl deck_box.scad
%OPENSCAD% -D part=20 -D circleRes=120 -D j=0.1 -o stl\plate-G-platform.stl deck_box.scad

:: STLs of logo parts for demo
%OPENSCAD% -D part=16 -D circleRes=120 -D j=0.1 -D front_logo=\"manawhite\" -D back_logo=\"manared\" -o stl\logo_sample-1.stl deck_box.scad
%OPENSCAD% -D part=17 -D circleRes=120 -D j=0.1 -D left_logo=\"manablue\" -D right_logo=\"manablack\" -o stl\logo_sample-2.stl deck_box.scad

:: Slice plated layouts
%SLICER% -load slic3r.ini --output gcode\plate-A-base.gcode stl\plate-A-base.stl
%SLICER% -load slic3r.ini --output gcode\plate-B-top.gcode stl\plate-B-top.stl
%SLICER% -load slic3r.ini --output gcode\plate-C-panels_racks.gcode stl\plate-C-panels_racks.stl
%SLICER% -load slic3r.ini --output gcode\plate-D-lowerhinges.gcode stl\plate-D-lowerhinges.stl
%SLICER% -load slic3r.ini --output gcode\plate-E-mechanism.gcode stl\plate-E-mechanism.stl
%SLICER% -load slic3r.ini --output gcode\plate-F-upperhinges.gcode stl\plate-F-upperhinges.stl
%SLICER% -load slic3r.ini --output gcode\plate-G-platform.gcode stl\plate-G-platform.stl

:: Slice individual parts
%SLICER% -load slic3r.ini --output gcode\part-front-1x.gcode stl\part-front-1x.stl
%SLICER% -load slic3r.ini --output gcode\part-back-1x.gcode stl\part-back-1x.stl
%SLICER% -load slic3r.ini --output gcode\part-left-1x.gcode stl\part-left-1x.stl
%SLICER% -load slic3r.ini --output gcode\part-right-1x.gcode stl\part-right-1x.stl
%SLICER% -load slic3r.ini --output gcode\part-racklift-2x.gcode stl\part-racklift-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-corner_right-2x.gcode stl\part-corner_right-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-corner_left-2x.gcode stl\part-corner_left-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-mechanism-2x.gcode stl\part-mechanism-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-lid-2x.gcode stl\part-lid-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-topside-2x.gcode stl\part-topside-2x.stl
%SLICER% -load slic3r.ini --output gcode\part-rackliftplatform-1x.gcode stl\part-rackliftplatform-1x.stl
%SLICER% -load slic3r.ini --output gcode\part-base-1x.gcode stl\part-base-1x.stl
