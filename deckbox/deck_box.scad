// mechanical deck box
// Andrew Hoadley
// Liceonse: erm... the one that means that you can do anything you like with it except sell it. :)

// When rendering the AssembledLayout, explode parts by this amount. set to zero for normal assembly
explode = 20;

// Cylinder resolution. set it to 10 if you're mucking about, about 120 if you're exporting STL's
circle_resolution = 120;

// Printing Tolerance. There's probably some places where I've missed adding the tolerance.
// and your printer is probably better tuned than mine, so maybe it doesn't have to be this high for you.
printing_tolerance = 0.2;

part=0; // [0:Everything,1:Front/back panels,2:Side,3:Connectors,4:Gear rack,5:Hinged lids,6:Hinge mount,7:Top hinge,8:Side hinge,9:Platform,10:Base]

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Parameters.
//
// The idea was to make this completely parametric and I think it's mostly still ok, although I did get a 
// little more lazy near the end.
//
// If you change the card sizes (or anything really) make sure that you check the print layouts and 
// the assembled layout before you start printing. Particularly the later print layouts as some of them
// use numeric constants rather than values calculated from the part sizes.
//

// Knock yourself out changing these-------------------------------

// magic (or other) card size the below includes sleeves. ... 
//    eg. change card_y value to be able to hold more cards
card_x = 70;
card_y = 75; // 60 sleeved = 40mm
card_z = 100;

// There needs to be a little clearance above the cards otherwise the mechanism gets caught when it rotates
cardclearance = 6;

// wall thickness
wall = 3;

hingeRad = 3;
hingeHole = 1;
etchDepth = 0.4;
printingGap = 3;

keyThickness = 2.4;

//Be a little more cautious with these
mechanism = 4;
slidewidth = 7;
rad = 25;
notchHeight = 13;
chx = 13; // this is the distance below the centre of the axes that the base is truncated
pivotrad = 5;
pivotheight = 3;

// Better not to touch these
ox = card_x /2 + wall;
oy = card_y /2 + mechanism + 2 * wall;
oz = card_z + cardclearance + wall*2;
ch = oz-rad; // height of the centre point of the axes that the lid rotates off
gearHeight = wall+ mechanism-printing_tolerance;

// Jitter is used to prevent coincident-surface problems with CSG. Should be set to something small.
j=0.1;


use <parametric_involute_gear_v5.0.scad>
use <gear_rack.scad>

///////////////////////////////////////////////////////////////////
// Everything is built in quarters


module notches()
{
	// Cut notch for side
	translate ([ox-wall, notchHeight/2-printing_tolerance, -j]) 	
		cube(size = [50, notchHeight+printing_tolerance*2, wall+j*2]);
	translate ([ox-wall, notchHeight*2-printing_tolerance, -j]) 	
		cube(size = [50, notchHeight+printing_tolerance*2, wall+j*2]);
	// Cut notch for bottom
	translate ([ox-notchHeight*3/2-printing_tolerance, -j, -j]) 	
		cube(size = [notchHeight+printing_tolerance*2, wall+printing_tolerance+j, wall+j*2]);
}

module base_quarter()
{

	difference()
	{
		cube([ox-wall-printing_tolerance*2, oy, wall]);

		// edge notches
		translate ([-j, -printing_tolerance, -j])
			cube([ox-notchHeight*3/2+printing_tolerance+j, wall+printing_tolerance, wall+j*2]);
		translate ([ox-notchHeight/2+printing_tolerance*2, -printing_tolerance, -j])
			cube([notchHeight, wall+printing_tolerance*2, 100]);

		// notches for the inner supports
		translate([0, wall+mechanism, 0])
		{
			translate ([slidewidth+printing_tolerance, -printing_tolerance, -j])
				cube([ox-notchHeight*3/2-slidewidth, wall+printing_tolerance, wall+j*2]);
			translate ([ox-notchHeight/2+printing_tolerance*2, -printing_tolerance, -j])
				cube([notchHeight, wall+printing_tolerance*2, 100]);
		}



	}
}

module sideTab()
{
	union()
	{
		translate([0, -j, -j]) cube([wall+j, notchHeight/2+j, wall+j*2]);
		translate([0, notchHeight*3/2, -j]) cube([wall+j, notchHeight/2, wall+j*2]);
		translate([0, notchHeight*3-j, -j]) cube([wall+j, 100, wall+j*2]);
	}
}


module face_half()
{
	difference()
	{
		cube(size = [ox, oz, wall]);
		
		translate ([rad, ch, -j]) 	
		cylinder(h=wall+j*2, r=rad+printing_tolerance, $fn=circle_resolution);
		
		translate ([-j, ch-chx, -j]) cube(size = [ox+j*2, oz-ch+chx+j, wall+j*2]);
	    
		notches();
	}

}


//CSG Checked
module rack_lift_half()
{
	union()
	{
		translate([slidewidth, 50, mechanism/2-printing_tolerance])
		rotate(a=[0, 90, 180])
		gear_rack(2, 12, mechanism-printing_tolerance*2, slidewidth+2);
		
		difference()
		{
			cube([slidewidth-printing_tolerance, 40, mechanism+wall-printing_tolerance]);
			
			translate([-j, wall, -j])
			cube([slidewidth-wall+printing_tolerance+j, wall+printing_tolerance, mechanism+wall-printing_tolerance+j*2]);
		}
	}
}


//CSG Checked
module rack_lift_platform_half()
{
	union()
	{
		cube([slidewidth-wall-printing_tolerance, card_y+(wall+mechanism-printing_tolerance)*2, wall-printing_tolerance*2]);

		translate([0, wall+mechanism+printing_tolerance*3, 0])
		{
			cube([card_x/2-printing_tolerance*4, card_y-printing_tolerance*6, wall-printing_tolerance*2]);
			cube([slidewidth-wall-printing_tolerance, card_y-printing_tolerance*6, 2*wall-printing_tolerance*2]);
		}
	}
}


//CSG Checked
module mechanism_half()
{
	difference()
	{
		union()
		{
			cube(size = [ox, ch, wall]);
			translate ([rad, ch, 0])
			{
				cylinder(h=wall, r=card_x/2-rad, $fn=circle_resolution);
				cylinder(h=wall+pivotheight-printing_tolerance, r=pivotrad, $fn=circle_resolution);
			}
		}
		notches();
		translate([-j, -j, -j]) cube(size=[slidewidth+printing_tolerance+j, ch-chx+j, wall+j*2]);
	}
}


//CSG Checked
module hinge(r, hole, length)
{
	difference()
	{
		hull()
		{
			cube([r, r, length]);
			translate([r, r, 0]) cylinder(h=length, r=r, $fn=circle_resolution);
		}
		translate([r, r, -j]) cylinder(h=length+j*2, r=hole, $fn=circle_resolution);
	}
}


//CSG Checked
module side_half()
{
	difference()
	{
		cube(size = [oy, ch-rad, wall]);
		translate([oy-wall, 0, 0]) sideTab();
		translate([card_y/2, 0, 0]) sideTab();
	}
}


module top_half()
{
 //The height is incorrect. It's calculated using oz which already includes cardclearance + wall.
 // Careful changes need to be made to fix it though.

	union()
	{
		translate ([0, rad, 0]) 	
		cube(size = [ox, rad+cardclearance+wall, wall]);
		intersection()
		{
			cube(size = [ox, rad*2, wall]);
			translate ([rad, rad, 0]) 	
			cylinder(h=100, r=rad-printing_tolerance, $fn=circle_resolution);
		}

		translate ([rad, rad, 0])
		{
			difference()
			{
				union()
				{
					gear (circular_pitch=360, gear_thickness = gearHeight, rim_thickness = gearHeight, hub_thickness = gearHeight, circles=4);
					cylinder(h=gearHeight, r=card_x/2-rad, $fn=circle_resolution);
					translate([pivotrad+printing_tolerance*2, -pivotrad, 0])
					cube([ox-rad-(pivotrad+printing_tolerance*2), pivotrad*2, gearHeight]);
				}
				
				cylinder(h=gearHeight+j, r=pivotrad+printing_tolerance, $fn=circle_resolution);
				translate([ox-rad, -100, -j]) cube([100, 300, 100]);
			}
		}

		difference()
		{
			translate ([0, rad*2+cardclearance+wall-wall*2, 0]) 
			cube(size = [notchHeight, wall*2, oy]);
			translate ([wall, rad*2+cardclearance+wall-wall-keyThickness/2, wall]) 
			cube(size = [notchHeight-wall*2, keyThickness, oy-wall+j]);
		}
		
		//  key system to hold the two parts of the top together
		translate ([notchHeight, rad*2+cardclearance+wall, 0]) 
		scale([1, -1, 1])
		hinge(hingeRad, hingeHole, oy-card_y/6-printing_tolerance);
	}
}


//CSG Checked
module lid_half()
{
	union()
	{
		translate([-j, hingeRad*2-j, 0])
		cube([oy - wall - printing_tolerance*2 + j, ox-notchHeight-wall-2*hingeRad+j*2, wall]);
		
		translate ([-j, hingeRad*2, 0]) 
		scale([1, -1, 1])
		rotate(a=[90, 0, 90])
		hinge(hingeRad, hingeHole, card_y/6-printing_tolerance+j);

		translate ([card_y/6, ox-notchHeight-wall, 0]) 
		scale([-1, -1, 1])
		rotate(a=[90, 0, -90])
		hinge(hingeRad, hingeHole, card_y/3-printing_tolerance);
	}
}


//CSG Checked
module top_side_half()
{
	union()
	{
		translate([0, hingeRad*2-j, 0])
		cube([card_y/2-printing_tolerance, rad*2-4*hingeRad+cardclearance+wall+j*2, wall]);

		translate ([0, hingeRad*2, 0]) 
		scale([1, -1, 1])
		rotate(a=[90, 0, 90])
		hinge(hingeRad, hingeHole, card_y/6-printing_tolerance);

		translate ([card_y/6, rad*2-2*hingeRad+cardclearance+wall, 0]) 
		scale([-1, -1, 1])
		rotate(a=[90, 0, -90])
		hinge(hingeRad, hingeHole, card_y/3-printing_tolerance);
	}
}


//CSG Checked
module top_key()
{
	width=notchHeight-wall*2-printing_tolerance;
	thickness=keyThickness-printing_tolerance;
	length=min(oy-wall, 20);
	
	translate([0, -length/2, 0])
	hull()
	{
		cube([width*0.9, j, thickness*0.9], center=true);
		translate([0, length*0.3, 0]) cube([width, j, thickness], center=true);
		translate([0, length*0.6, 0]) cube([width, j, thickness], center=true);
		translate([0, length, 0]) cube([width*0.9, j, thickness*0.9], center=true);
	}
}


/////////////////////////////////////////////////////////////////////////
// Quarters are doubled


module base_half()
{
	union()
	{
		base_quarter();
		translate([j, 0, 0]) scale([-1, 1, 1]) base_quarter();
	}
}

module base()
{
	union()
	{
		base_half();
		translate([0, oy*2-j, 0])	scale([1, -1, 1]) base_half();
	}
}

module frontAndBack()
{
	union()
	{
		face_half();
		
		scale ([-1, 1, 1])
		face_half();
		
	}
}

module mechanism()
{
	union()
	{
		mechanism_half();
		translate([j, 0, 0]) scale([-1, 1, 1]) mechanism_half();
	}
}

module side()
{
	color("red")
	union()
	{
		translate([-j, 0, 0]) side_half();
		
		translate([j, 0, 0]) scale([-1, 1, 1]) side_half();
		
		translate([card_y/6+printing_tolerance, ch-rad, 0])
		rotate(a=[0, -90, 0])
		hinge(hingeRad, hingeHole, card_y/3-printing_tolerance*2);
	}
}

module rack_lift()
{
	union()
	{
		rack_lift_half();
		translate([j, 0, 0]) scale([-1, 1, 1]) rack_lift_half();
	}
}

module rack_lift_platform()
{
	union()
	{
		rack_lift_platform_half();
		translate([j, 0, 0]) scale([-1, 1, 1]) rack_lift_platform_half();
	}
}


module topLayout2()
{
	translate([printingGap/2, printingGap/2, 0]) top_half();
	translate([-printingGap/2, printingGap/2, 0]) scale([-1, 1, 1])	top_half();
}

module lid()
{
	union()
	{
		lid_half();
		scale([-1, 1, 1]) lid_half();
	}
}

module top_side()
{
	top_side_half();
	scale([-1, 1, 1])
		top_side_half();
}



/////////////////////////////////////////////////////////////////////////
// Layouts
if(part==0)
{
	// Complete render with parts moved into position (possibly with parts exploded as per "explode" value above
	assembledLayout();
}

if(part==1)
{
	frontAndBack();
}
if(part==2)
{
	side();
}
if(part==3)
{
	top_key();
}
if(part==4)
{
	rack_lift();
}
if(part==5)
{
	topLayout2();
}
if(part==6)
{
	mechanism();
}
if(part==7)
{
	lid();
}
if(part==8)
{
	top_side();
}
if(part==9)
{
	rack_lift_platform();
}
if(part==10)
{
	base();
}


module assembledLayout()
{
	// front and back
	translate([0, -oy+wall-explode, 0])
	rotate(a=[90, 0, 0])
	frontAndBack();

	translate([0, oy-wall+explode, 0])
	rotate(a=[90, 0, 180])
	frontAndBack();

	// mechanisms
	color("RosyBrown")
	translate([0, -card_y/2, 0])
	rotate(a=[90, 0, 0])
	mechanism();

	color("RosyBrown")
	translate([0, card_y/2, 0])
	rotate(a=[90, 0, 180])
	mechanism();

	// sides (exploded)
	color("blue")
	translate([ox - wall + explode, 0, 0])
	rotate(a=[90, 0, 90])
	side();

	color("blue")
	translate([-ox + wall -explode, 0, 0])
	rotate(a=[90, 0, -90])
	side();

	// rack  / pinion card lift (slides)
	// mechanisms
	color("SeaGreen")
	translate([0, -card_y/2-wall-mechanism-explode/2, 0])
	rotate(a=[90, 0, 180])
	rack_lift();

	color("SeaGreen")
	translate([0, card_y/2+wall+mechanism+explode/2, 0])
	rotate(a=[90, 0, 0])
	rack_lift();

	// top
	color("DarkMagenta")
	translate([0+explode, -oy-explode, ch-rad+explode])
	rotate(a=[90, 0, 180])
	scale([-1, 1, 1])
	top_half();

	color("DarkMagenta")
	translate([0-explode, -oy-explode, ch-rad+explode])
	rotate(a=[90, 0, 180])
	top_half();

	color("DarkMagenta")
	translate([0-explode, oy+explode, ch-rad+explode])
	rotate(a=[90, 0, 0])
	scale([-1, 1, 1])
	top_half();

	color("DarkMagenta")
	translate([0+explode, oy+explode, ch-rad+explode])
	rotate(a=[90, 0, 0])
	top_half();

	// top
	// bug - height isn't supposed to include two lots of cardclearance and wall
	translate([notchHeight+explode, 0, oz+cardclearance+wall+explode])
	rotate(a=[0, 180, -90])
	lid();
	
	// connectors
	translate([notchHeight+explode-6, 0, oz+wall+2+explode])
	translate([-(notchHeight-wall*2-printing_tolerance)/2, 0, 0])
	top_key();

	translate([-notchHeight-explode+6, 0, oz+wall+2+explode])
	translate([-(notchHeight-wall*2-printing_tolerance)/2, 0, 0])
	top_key();

	translate([-notchHeight-explode, 0, oz+cardclearance+wall+explode])
	rotate(a=[0, 180, 90])
	lid();
	
	// top side
	translate([-ox-hingeRad*2+wall-explode, 0, oz+cardclearance+wall+explode/2])
	rotate(a=[90, 180, 90])
	top_side();

	translate([ox+hingeRad*2-wall+explode, 0, oz+cardclearance+wall+explode/2])
	rotate(a=[90, 180, -90])
	top_side();

	translate([0, -oy, -explode])
	base();
	
	translate([0, -oy, -explode*0.5])
	rack_lift_platform();
}


/* ==========================================================================
   Include source for gear_rack.scad here to allow for Thingiverse Customizer
   ========================================================================== */
pi=3.1415926535897932384626433832795;
module tooth(mod,width) {opposite_at_reference_pitch=mod / tan(70);tooth_width_at_reference_pitch=(pi / 2) * mod;cube_width = tooth_width_at_reference_pitch - (2 * opposite_at_reference_pitch);opposite_of_triangle = mod < 1.25 ? 2.4 * mod : 2.25 * mod;adjacent_of_triangle = opposite_of_triangle / tan(70);diagonal = sqrt((opposite_of_triangle + 0.05) * (opposite_of_triangle + 0.05) + (adjacent_of_triangle * adjacent_of_triangle));correct_angle = 90 - acos(adjacent_of_triangle / diagonal);adjacent_of_mini_triangle = 0.05 / tan(90 - correct_angle);adjacent_top_cube = (0.5 * mod) / tan(45);translate([0,adjacent_of_mini_triangle * -1, 0]) {difference() {union() {intersection() {cube([opposite_of_triangle + 0.05,adjacent_of_triangle, width]);rotate([0,0,correct_angle]) cube([diagonal,adjacent_of_triangle, width]);}translate([0,adjacent_of_triangle,0]) cube([opposite_of_triangle + 0.05,cube_width, width]);translate([0,(adjacent_of_triangle * 2) + cube_width,width]) {rotate([180,0,0]) {intersection() {cube([opposite_of_triangle + 0.05,adjacent_of_triangle, width]);rotate([0,0,correct_angle]) cube([diagonal,adjacent_of_triangle, width]);}}}}translate([-0.5 * mod,-1,-0.5 * mod])cube([1 * mod + 0.05, 1+ adjacent_of_mini_triangle, width + (1 * mod)]);translate([-0.5 * mod,(adjacent_of_triangle * 2) + cube_width - adjacent_of_mini_triangle,-0.5 * mod]) cube([1 * mod + 0.05, 1, width + (1 * mod)]);translate([opposite_of_triangle + 0.05 * mod,adjacent_of_triangle - adjacent_top_cube,-0.25 * mod]) {rotate([0,0,45]) cube([1 * mod, 0.5 * mod,cube_width + (2 * mod)]);}translate([opposite_of_triangle + 0.05 * mod,adjacent_of_triangle - adjacent_top_cube + cube_width + 0.3 * mod,-0.25 * mod]) {rotate([0,0,45]) cube([0.5 * mod, 1 * mod,cube_width + (2 * mod)]);}}}}
module teeth(mod,number_of_teeth,width) {union() {for (i= [0:number_of_teeth - 1]) {translate([-0.05,i * mod * pi,0]) {tooth(mod=mod,width=width);	}}}}
module gear_rack(mod,number_of_teeth,rack_width,rack_bottom_height) {total_rack_length = number_of_teeth * pi * mod;rotate([0,90,0]) {translate([0,total_rack_length / 2 * -1,rack_width / 2 * -1]) {union() {teeth(mod=mod,number_of_teeth=number_of_teeth,width=rack_width);translate([rack_bottom_height * -1,0,0])cube([rack_bottom_height, number_of_teeth * pi * mod, rack_width]);}}}}
