$openscad = 'C:\Program Files\OpenSCAD\openscad.exe';
$outdir = "$PSScriptRoot/out";
$modelfile = "$PSScriptRoot/model.scad";

mkdir $outdir -ErrorAction SilentlyContinue
& $openscad -o "$outdir/left.stl" -D 'build_for_left_keyboard_half=1' $modelfile
& $openscad -o "$outdir/right.stl" -D 'build_for_left_keyboard_half=0' $modelfile