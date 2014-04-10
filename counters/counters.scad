use <Write.scad>;

slot = 0.7;
thickness = 0.8;

height = 10;
width = 25;
roundness = 0.5;
pointer = 3;

j=0.1;
$fn=20;

module Token(text1, text2)
{
	// Front
	Panel();
	
	// Back
	translate([0, thickness+slot, 0])
	Panel();

	// Pointers
	translate([0, -thickness+j, 0])
	difference()
	{
		union()
		{
			Panel();
			translate([0, 0, height]) Pointer();
		}
		
		translate([0, -thickness, 0]) scale([1, 3, 1]) Pointer();
	}

	// Join
	hull()
	{
		translate([roundness, 0, roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness*2+slot);
		translate([5-roundness, 0, roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness*2+slot);	
		translate([roundness, 0, height-roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness*2+slot);
		translate([5-roundness, 0, height-roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness*2+slot);
	}
	
	// Text
	translate([5, -thickness, height/1.7])
	rotate([90, 0, 0])
	write(text1, t=thickness, font="Knewave.dxf", h=height/1.5, center=true);

	translate([width-5, -thickness, height/1.7])
	rotate([90, 0, 0])
	write(text2, t=thickness, font="Knewave.dxf", h=height/1.5, center=true);

}

module Pointer()
{
	hull()
	{
		translate([width/2-roundness, 0, pointer-roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
		translate([width/2-pointer*2-roundness, 0, -roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
		translate([width/2+pointer*2-roundness, 0, -roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
	}
}

module Panel()
{
	hull()
	{
		translate([roundness, 0, roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
		translate([width-roundness, 0, roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);	
		translate([roundness, 0, height-roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
		translate([width-roundness, 0, height-roundness]) rotate([-90, 0, 0]) cylinder(r=roundness, h=thickness);
	}
}

Token("+1", "+1");
