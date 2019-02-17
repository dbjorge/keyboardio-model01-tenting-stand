// "lengths" are x, "widths" are y, "heights" are z

total_length=120;

// How high to tent the middle, in millimeters
tent_height=60;
tent_angle=atan2(tent_height, total_length);
// Alternately, the angle to tent at, in degrees
//tent_angle=45;

// How wide to make the baseplate
base_center_bar_width=25; // [10:40] 
base_center_bar_height=7; // must be >5 for the screw to properly tighten

thumbscrew_offset_length=50;

// How far apart to spread the 'wings'
tower_offset_from_center_bar=40; // [0:100]

tower_width=15; // [10:30]
tower_length=25;
tower_height=200;

difference() {
    union() {
        // base center bar (where screw hole lives)
        cube([
            total_length,
            base_center_bar_width,
            base_center_bar_height]);
        
        // upper tower base plate
        translate([
            total_length - base_center_bar_width,
            -tower_offset_from_center_bar,
            0])
        cube([
            base_center_bar_width,
            2*tower_offset_from_center_bar + base_center_bar_width,
            3]);
        
        // lower tower base plate
        translate([
            25 - base_center_bar_width,
            -tower_offset_from_center_bar,
            0])
        cube([
            base_center_bar_width,
            2*tower_offset_from_center_bar + base_center_bar_width,
            3]);

        // upper towers
        translate([
            total_length - base_center_bar_width,
            -tower_offset_from_center_bar,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
            
        translate([
            120 - base_center_bar_width,
            tower_offset_from_center_bar + base_center_bar_width - tower_width,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
        
        //lower towers
        translate([
            25 - base_center_bar_width,
            -tower_offset_from_center_bar,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
            
        translate([
            25 - base_center_bar_width,
            tower_offset_from_center_bar + base_center_bar_width - tower_width,
            0])
        cube([
            tower_length,
            tower_width,
            tower_height]);
    }
    
    // thumbscrew gap
    translate([
        thumbscrew_offset_length,
        base_center_bar_width/2,
        3])
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
        -tower_offset_from_center_bar - 1,
        3])
    rotate([0,-tent_angle,0])
    cube([
        total_length * 2,
        base_center_bar_width + 2*tower_offset_from_center_bar + 2,
        500]);
}