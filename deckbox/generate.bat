@ECHO OFF

SET SOURCE_FILE=E:\3D\things\mine\MtG\deckbox\deck_box.scad
SET DESTINATION_PATH=E:\3D\things\mine\MtG\deckbox\stl

openscad -D part=1 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-frontback-2x.stl %SOURCE_FILE%
openscad -D part=2 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-side-2x.stl %SOURCE_FILE%
openscad -D part=3 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-topkey-2x.stl %SOURCE_FILE%
openscad -D part=4 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-racklift-2x.stl %SOURCE_FILE%
openscad -D part=5 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-toplayout-2x.stl %SOURCE_FILE%
openscad -D part=6 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-mechanism-2x.stl %SOURCE_FILE%
openscad -D part=7 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-lid-2x.stl %SOURCE_FILE%
openscad -D part=8 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-topside-2x.stl %SOURCE_FILE%
openscad -D part=9 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-rackliftplatform-1x.stl %SOURCE_FILE%
openscad -D part=10 -D circleRes=120 -D j=0.1 -o %DESTINATION_PATH%\deck_box-base-1x.stl %SOURCE_FILE%
