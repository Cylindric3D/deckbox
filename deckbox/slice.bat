@ECHO OFF

SET SLICER=E:\3D\Tools\Slicer\Slic3r-1.0.0rc3\slic3r-console.exe

start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_A.gcode stl\deck_box-plate_A-base.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_B.gcode stl\deck_box-plate_B-top.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_C.gcode stl\deck_box-plate_C-panelracks.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_D.gcode stl\deck_box-plate_D-lowerhinges.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_E.gcode stl\deck_box-plate_E-mechanism.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_F.gcode stl\deck_box-plate_F-upperhinges.stl
start %SLICER% -load slic3r.ini --output gcode\deck_box-plate_G.gcode stl\deck_box-plate_G-platform.stl



start %SLICER% -load slic3r.ini --output gcode\deck_box-frontback-2x.gcode stl\deck_box-frontback-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-side-2x.gcode stl\deck_box-side-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-topkey-2x.gcode stl\deck_box-topkey-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-racklift-2x.gcode stl\deck_box-racklift-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-toplayout-2x.gcode stl\deck_box-toplayout-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-mechanism-2x.gcode stl\deck_box-mechanism-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-lid-2x.gcode stl\deck_box-lid-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-topside-2x.gcode stl\deck_box-topside-2x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-rackliftplatform-1x.gcode stl\deck_box-rackliftplatform-1x.stl deck_box.scad
start %SLICER% -load slic3r.ini --output gcode\deck_box-base-1x.gcode stl\deck_box-base-1x.stl deck_box.scad
