// "lengths" are x, "widths" are y, "heights" are z
// orientations assume looking along Z axis from pos to neg, with y axis at bottom, ie
// "left" is positive-y, "right" is negative-y, "upper" is positive-x, "lower" is negative-x

build_for_left_keyboard_half = 0; // 0 or 1, mirrors model

// for flashforge creator x, keep this <=130-140
total_length=130;

// How high to tent the middle, in millimeters
tent_height=64;
tent_angle=atan2(tent_height, total_length);
// Alternately, the angle to tent at, in degrees
//tent_angle=45;

// How wide to make the baseplates
base_center_bar_width=25; // [10:40] 
base_center_bar_height=7; // must be >5 for the screw to properly tighten

thumbscrew_offset_length=79;

// How far apart to spread the 'wings'
// right is negative direction, left is positive
tower_offset_left=30; // [0:100]
tower_offset_right=55;

tower_width=15; // [10:30]
tower_length=25;
tower_height=200;

// for flashforge creator x, keep this <= 110 or so
total_width=tower_offset_left + base_center_bar_width + tower_offset_right;

mirror([0,build_for_left_keyboard_half,0])
difference() {
    union() {
        // base center bar (where thumbscrew goes)
        cube([
            total_length,
            base_center_bar_width,
            base_center_bar_height]);
        
        // upper tower base plate
        translate([
            total_length - tower_length,
            -tower_offset_right,
            0])
        cube([
            tower_length,
            total_width,
            7]);

        // upper tower support bar
        translate([
            total_length - tower_length/2 - 2.5,
            -tower_offset_right,
            0])
        cube([
            5,
            total_width,
            tent_height * .3]);
        
        // upper-left tower
        translate([
            total_length - tower_length,
            tower_offset_left + base_center_bar_width - tower_width,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
            
        // upper-right tower
        translate([
            total_length - tower_length,
            -tower_offset_right,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);

        // lower tower base plate
        translate([
            25 - tower_length,
            0, // -tower_offset_right to include lower-right tower
            0])
        cube([
            tower_length,
            tower_offset_left + base_center_bar_width,
            3]);

        // lower-left tower
        translate([
            25 - tower_length,
            tower_offset_left + base_center_bar_width - tower_width,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
            
        // lower-right tower
        // We omit this because the keyboard has a foot in the same spot that serves this purpose instead
        /*
        translate([
            25 - tower_length,
            -tower_offset_right,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
        */

    }
    
    // thumbscrew gap
    translate([
        thumbscrew_offset_length,
        base_center_bar_width/2,
        5])
    cylinder(r1=20,r2=20,h=25);

    // mounting screwhole
    translate([
        thumbscrew_offset_length,
        base_center_bar_width/2,
        -1])
    cylinder(r=3.2,h=20,$fn=20);
    
    // top wedge
    translate([
        0,
        -tower_offset_right - 1,
        3])
    rotate([0,-tent_angle,0])
    cube([
        total_length * 2,
        total_width + 2,
        500]);
}