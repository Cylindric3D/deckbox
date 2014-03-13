color("green")translate([0,0,-1])cylinder(r=0.5, h=1, $fn=100);color("red")cylinder(r=0.1, h=1, $fn=100);
union()
{
	scale([0.029, 0.029, 0.1])
	translate([-166, -16, -11.25])
	import("blue.stl");
}

// clockwise around shape
if(0)
color("lightblue")
polygon(points=[
	[0.1, 0.49], // tip
	[0.1, 0.22],
	[0.25, 0.0],
	[0.3,-0.2], // right of bulge
	[0.2,-0.4],
	[0,-0.46], // bottom of bulge
	[-0.22, -0.35],
	[-0.28, -0.1], // left of bulge
	[-0.22, 0.1],
	[-0.12, 0.25],
]);