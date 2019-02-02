module rod(dia=8, length=300) {
    cylinder(length, dia/2, dia/2);
}

module bearing(outer=15,inner=8, length=24) {
    difference() {
        cylinder(length, outer, outer);
        cylinder(length, inner, inner);
    }
}

module lm8uu(){
    bearing(15/2,8/2,24);
}


module profile(x=20, y=20, z=300){
    cube([x,y,z]);
}

module frame_lower(){
    color("Fuchsia") translate([0,0,20]) rotate([-90,0,0]) profile(z=390);
    color("Fuchsia") translate([370,0,20]) rotate([-90,0,0]) profile(z=390);
    translate([20,0,20]) rotate([0,90,0]) profile(z=350);
    translate([20,370,20]) rotate([0,90,0]) profile(z=350);
}


module nema17(){
    union(){
        cube([42, 42, 40]);
        translate([21,21,40]) cylinder(24,2.5,2.5);
    }
}

module heatbed(){
    cube([328,328, 5]);
}

frame_lower();

//-- Y AXIS
color([0,1,1]) translate([100+4,10,60]) rotate([-90,0,0]) rod(length=370);
translate([100+4,130,60]) rotate([90,0,0]) lm8uu();
translate([100+4,260,60]) rotate([90,0,0]) lm8uu();
color([0,1,1]) translate([270+4,10,60]) rotate([-90,0,0]) rod(length=370);
translate([270+4,195,60]) rotate([90,0,0]) lm8uu();

translate([390/2-21 , 390-20-42, 0]) nema17();

translate([390/2-328/2 , 390/2-328/2, 70]) heatbed();