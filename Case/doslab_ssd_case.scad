// Created By: LogoiLab
// https://doslabelectronics.com/
// https://github.com/LogoiLab
// LICENSE: GPL-3.0
// UNITS: mm
$fn = $preview ? 32 : 100;

$board_thickness = 1;
$board_width = 50;
$board_height = 68;
$case_width = 54;
$case_height = 71;
$case_thickness = 5;
$top_components_thickness = 1.32;
$bottom_components_thickness = 0.5;
total_board_thickness = $board_thickness + $top_components_thickness + $bottom_components_thickness + 0.8;
//total_board_thickness = 2.7;

echo(total_board_thickness);

body(true);
translate([55,0,0]) rotate([180,0,0]) body(false);

module body(main) {
    difference() {
        translate([0,0,0]) cube([$case_width, $case_height, $case_thickness], center = true);
        if(main) {
            translate([0,0,($case_thickness/2)]) cube([$case_width, $case_height, $case_thickness], center = true);
            //chamfer();
        } else {
            //rotate([0,180,0]) chamfer();
            translate([0,0,-($case_thickness/2)+1]) cube([$case_width, $case_height, $case_thickness], center = true);
            translate([1,32,0]) cube([23.5,8,10], center=true);
            translate([17,31.5,3]) #cylinder(4,1,1, center=true);
        }
        pcb();
        //scale([1.01,1.01,1]) translate([0,1.3,0]) linear_extrude(height = total_board_thickness, convexity = 10, center = true) import ("./IDE-SSD-ZIF-brd.svg", center = true);
        if (main) {
            holes(total_board_thickness);
        } else {
            holes(total_board_thickness * 3);
        }
    }
}

module holes(depth) {
    translate([24.5,28,0]) #cylinder(depth,0.75,0.75,center=true);
    rotate([0,180,0]) {
        translate([24.5,28,0]) #cylinder(depth,0.75,0.75,center=true);
    }
    translate([0,2,0]) rotate([180,0,0]) {
        translate([24.5,27.5,0]) #cylinder(depth,0.7,0.75,center=true);
        rotate([0,180,0]) {
            translate([24.5,27.5,0]) #cylinder(depth,0.75,0.75,center=true);
        }
    }
}

module chamfer() {
    translate([-($case_width/2) + 1,0,0]) difference() {
        cube([2, $case_height, $case_thickness], center = true);
        translate([0,0,1]) cube([$case_width, $case_height, $case_thickness], center = true);
    }
    translate([$case_width/2 - 1,0,0]) difference() {
        cube([2, $case_height, $case_thickness], center = true);
        translate([0,0,1]) cube([$case_width, $case_height, $case_thickness], center = true);
    }
}

module pcb() {
    difference() {
        union() {
        cube([$board_width,$board_height,total_board_thickness], center=true);
        translate([1,3,0]) cube([23.5,$board_height+3,total_board_thickness], center=true);
        }
        translate([24.5,28,0]) cube([3,3,total_board_thickness],center=true);
        rotate([0,180,0]) {
            translate([24.5,28,0]) cube([3,3,total_board_thickness],center=true);
        }
        translate([0,2,0]) rotate([180,0,0]) {
            translate([24.5,27.5,0]) cube([3,3,total_board_thickness],center=true);
            rotate([0,180,0]) {
                translate([24.5,27.5,0]) cube([3,3,total_board_thickness],center=true);
            }
        }
    }
}

