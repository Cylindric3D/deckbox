// mechanical deck box
// Andrew Hoadley
// Liceonse: erm... the one that means that you can do anything you like with it except sell it. :)

// When rendering the AssembledLayout, explode parts by this amount. set to zero for normal assembly
explode = 20;

// Cylinder resolution. set it to 10 if you're mucking about, about 120 if you're exporting STL's
circleRes = 10;

// Printing Tolerance. There's probably some places where I've missed adding the tolerance.
// and your printer is probably better tuned than mine, so maybe it doesn't have to be this high for you.
printingTolerance = 0.2;

// Complete render with parts moved into position (possibly with parts exploded as per "explode" value above
assembledLayout();

// comment the above and uncomment each of these in turn to export STL's
//printLayout();
//printLayout2();
//printLayout3();
//printLayout4();
//printLayout5();
//printLayout6();
//printLayout7();
//printLayout8();


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
//    eg. change cardy value to be able to hold more cards
cardx = 70;
cardy= 30;
cardz = 100;

// There needs to be a little clearance above the cards otherwise the mechanism gets caught when it rotates
cardclearance =6;

// wall thickness
wall = 3;

hingeRad=3;
hingeHole=1;
etchDepth=0.4;
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
ox = cardx /2 + wall;
oy = cardy /2 + mechanism + 2 * wall;
oz = cardz + cardclearance + wall*2;
ch = oz-rad; // height of the centre point of the axes that the lid rotates off
gearHeight = wall+ mechanism-printingTolerance;

include <parametric_involute_gear_v5.0.scad>
include <gear_rack.scad>

///////////////////////////////////////////////////////////////////
// Everything is built in quarters


module notches()
{
	// Cut notch for side
	translate ([ox-wall,notchHeight/2-printingTolerance,0]) 	
		cube(size = [50,notchHeight+printingTolerance*2,wall]);
	translate ([ox-wall,notchHeight*2-printingTolerance,0]) 	
		cube(size = [50,notchHeight+printingTolerance*2,wall]);
	// Cut notch for bottom
	translate ([ox-notchHeight*3/2-printingTolerance,0,0]) 	
		cube(size = [notchHeight+printingTolerance*2,wall+printingTolerance,wall]);
}

module base_quarter()
{

	difference()
	{
		cube([ox-wall-printingTolerance*2,oy,wall]);

		// edge notches
		translate ([0,-printingTolerance,0])
			cube([ox-notchHeight*3/2+printingTolerance,wall+printingTolerance,wall]);
		translate ([ox-notchHeight/2+printingTolerance*2,-printingTolerance,0])
			cube([notchHeight,wall+printingTolerance*2,100]);

		// notches for the inner supports
		translate([0,wall+mechanism,0])
		{
			translate ([slidewidth+printingTolerance,-printingTolerance,0])
				cube([ox-notchHeight*3/2-slidewidth,wall+printingTolerance,wall]);
			translate ([ox-notchHeight/2+printingTolerance*2,-printingTolerance,0])
				cube([notchHeight,wall+printingTolerance*2,100]);
		}



	}
}

module sideTab()
{
	cube([wall,notchHeight/2,wall]);
	translate ([0,notchHeight*3/2,0]) 	
		cube([wall,notchHeight/2,wall]);
	translate ([0,notchHeight*3,0]) 	
		cube([wall,100,wall]);
}


module face_half()
{
	difference()
	{
		cube(size = [ox,oz,wall]);
		translate ([rad,ch,0]) 	
			cylinder(h=100,r=rad+printingTolerance,$fn=circleRes);
		translate ([0,ch-chx,0]) 	
			cube(size = [500,500,500]);
	      	// Infinty symbol - decorations
		translate ([(ch-rad)/3,(ch-rad)/2,wall-etchDepth]) 	
		     {
	
			rotate(a=[0,0,135])
			difference()
			{
			union()
			{
				cylinder(h=etchDepth,r=(ch-rad)/4,$fn=circleRes);
				cube([(ch-rad)/4,(ch-rad)/4,etchDepth]);
			}
			union()
			{
				cylinder(h=etchDepth,r=(ch-rad)/6,$fn=circleRes);
				cube([(ch-rad)/6,(ch-rad)/6,etchDepth]);
			}
			}
		     }
	
		notches();
	}

}

module rack_lift_half()
{
	translate([slidewidth,50,mechanism/2-printingTolerance])
		rotate(a=[0,90,180])
			gear_rack(2,12,mechanism-printingTolerance*2,slidewidth+2);
	difference()
	{
	cube([slidewidth-printingTolerance,40,mechanism+wall-printingTolerance]);
	translate([0,wall,-10])
		cube([slidewidth-wall+printingTolerance,wall+printingTolerance,50]);
	}
}

module rack_lift_platform_half()
{
	cube([slidewidth-wall-printingTolerance,cardy+ (wall+mechanism-printingTolerance)*2, wall-printingTolerance*2]);

	translate([0,wall+mechanism+printingTolerance*3,0])
	{
		cube([cardx/2-printingTolerance*4,cardy-printingTolerance*6,wall-printingTolerance*2]);
		cube([slidewidth-wall-printingTolerance,cardy-printingTolerance*6, 2*wall-printingTolerance*2]);

	}
}




module mechanism_half()
{
	difference()
	{
	union()
	{
		cube(size = [ox,ch,wall]);
		translate ([rad,ch,0])
		{
			cylinder(h=wall,r=cardx/2-rad,$fn=circleRes);
			cylinder(h=wall+pivotheight-printingTolerance,r=pivotrad,$fn=circleRes);
		}
	}
	notches();
	cube(size=[slidewidth+printingTolerance,ch-chx,wall]);
	}
}

module hinge(r,hole,length)
{
	difference()
	{
		union()
		{
			cube([r,r,length]);
			translate([r,r,0])
				cylinder(h=length,r=r,$fn=circleRes);
		}
		translate([r,r,0])
			cylinder(h=length,r=hole,$fn=circleRes);
	}
}

module side_half()
{
	difference()
	{
		cube(size = [oy,ch-rad,wall]);
		translate([oy-wall,0,0])
		sideTab();
		translate([cardy/2,0,0])
		sideTab();
	}
/*	translate([cardy/6-printingTolerance,ch-rad,0])
		rotate(a=[0,-90,0])
			hinge(hingeRad,hingeHole,cardy/6-printingTolerance);*/
}


module top_half()
{
 //The height is incorrect. It's calculated using oz which already includes cardclearance + wall.
 // Careful changes need to be made to fix it though.

	translate ([0,rad,0]) 	
		cube(size = [ox,rad+cardclearance+wall,wall]);
	intersection()
	{
		cube(size = [ox,rad*2,wall]);
		translate ([rad,rad,0]) 	
			cylinder(h=100,r=rad-printingTolerance,$fn=circleRes);
	}

	translate ([rad,rad,0])
	{
		difference()
		{
			union()
			{
			gear (circular_pitch=360, gear_thickness = gearHeight, rim_thickness = gearHeight, hub_thickness = gearHeight, circles=4);
			cylinder(h=gearHeight,r=cardx/2-rad,$fn=circleRes);
			translate([pivotrad+printingTolerance*2,-pivotrad,0])
				cube([ox-rad-(pivotrad+printingTolerance*2),pivotrad*2,gearHeight]);
			}
			cylinder(h=gearHeight,r=pivotrad+printingTolerance,$fn=circleRes);
			translate([ox-rad,-1000,0])
				cube([1000,3000,1000]);
		}
	}

          difference()
          {
		translate ([0,rad*2+cardclearance+wall-wall*2,0]) 
			cube(size = [notchHeight,wall*2,oy]);
		translate ([wall,rad*2+cardclearance+wall-wall-keyThickness/2,wall]) 
			cube(size = [notchHeight-wall*2,keyThickness,oy-wall]);

           }
          //  key system to hold the two parts of the top together
	translate ([notchHeight,rad*2+cardclearance+wall,0]) 
		scale([1,-1,1])
		hinge(hingeRad,hingeHole,oy-cardy/6-printingTolerance);

}

module lid_half()
{
union()
{
	translate([0,hingeRad*2,0])
	  cube([oy - wall - printingTolerance*2,ox-notchHeight-wall-2*hingeRad,wall]);
	translate ([0,hingeRad*2,0]) 
		scale([1,-1,1])
		rotate(a=[90,0,90])
		hinge(hingeRad,hingeHole,cardy/6-printingTolerance);

	translate ([cardy/6,ox-notchHeight-wall,0]) 
		scale([-1,-1,1])
		rotate(a=[90,0,-90])
		hinge(hingeRad,hingeHole,cardy/3-printingTolerance);
}
}

module top_side_half()
{
union()
{
	translate([0,hingeRad*2,0])
	  cube([cardy/2-printingTolerance,rad*2-4*hingeRad+cardclearance+wall,wall]);
	translate ([0,hingeRad*2,0]) 
		scale([1,-1,1])
		rotate(a=[90,0,90])
		hinge(hingeRad,hingeHole,cardy/6-printingTolerance);

	translate ([cardy/6,rad*2-2*hingeRad+cardclearance+wall,0]) 
		scale([-1,-1,1])
		rotate(a=[90,0,-90])
		hinge(hingeRad,hingeHole,cardy/3-printingTolerance);
}
}


module top_key()
{
	cube(size = [notchHeight-wall*2-printingTolerance,oy-wall,keyThickness-printingTolerance]);
}


/////////////////////////////////////////////////////////////////////////
// Quarters are doubled


module base_half()
{
	base_quarter();
	scale([-1,1,1])
		base_quarter();
}

module base()
{
	base_half();
	translate([0,oy*2,0])
		scale([1,-1,1])
			base_half();

}

module frontAndBack()
{
	face_half();
	scale ([-1,1,1])
		face_half();
}

module mechanism()
{
	mechanism_half();
	scale([-1,1,1])
		mechanism_half();
}

module side()
{
  union()
{
	side_half();
	scale([-1,1,1])
		side_half();
}
	translate([cardy/6+printingTolerance,ch-rad,0])
		rotate(a=[0,-90,0])
			hinge(hingeRad,hingeHole,cardy/3-printingTolerance*2);
}

module rack_lift()
{
	rack_lift_half();
	scale([-1,1,1])
		rack_lift_half();
}

module rack_lift_platform()
{
	rack_lift_platform_half();
	scale([-1,1,1])
		rack_lift_platform_half();
}


module topLayout2()
{

	translate([printingGap/2,printingGap/2,0])
			top_half();

	translate([-printingGap/2,printingGap/2,0])
			scale([-1,1,1])
				top_half();
}

module lid()
{
	lid_half();
	scale([-1,1,1])
		lid_half();
}

module top_side()
{
	top_side_half();
	scale([-1,1,1])
		top_side_half();
}



/////////////////////////////////////////////////////////////////////////
// Layouts

module printLayout()
{
	translate([ox+printingGap/2,-rad,0])
		frontAndBack();
	translate([-ox-printingGap/2,-rad,0])
		frontAndBack();

}

module printLayout2()
{
	rotate([0,0,90])
{

	translate([oy+printingGap/2,printingGap/2,0])
		side();
	translate([-oy-printingGap/2,printingGap/2,0])
		side();

      // top key
	translate([35+printingGap,-20-printingGap/2,0])
	top_key();
	translate([-35+printingGap,-20-printingGap/2,0])
	top_key();

}
}

module printLayout3()
{
	rotate([0,0,90])
{

      // lift
	translate([35,-10-printingGap/2,0])
		rotate(a=[0,0,90])
			rack_lift();

      // lift
	translate([35,-40-printingGap/2,0])
		rotate(a=[0,0,90])
			rack_lift();

}
}


module printLayout4()
{
	rotate([0,0,90])
{
	topLayout2();

	scale([1,-1,1])
		topLayout2();
}
}

module printLayout5()
{
	translate([ox+printingGap/2,-50,0])
			mechanism();
	translate([-ox-printingGap/2,-50,0])
			mechanism();

}

module printLayout6()
{

	translate([ox/2+10+printingGap/2,-33,0])
				lid();
	translate([-ox/2-10-printingGap/2,-33,0])
				lid();
	translate([-ox/2-printingGap/2,0,0])
				top_side();
	translate([ox/2+printingGap/2,0,0])
				top_side();
}

module printLayout7()
{
	rack_lift_platform();
}

module printLayout8()
{
	base();
}

module assembledLayout()
{
      // front and back
	translate([0,-oy+wall-explode,0])
	rotate(a=[90,0,0])
		frontAndBack();

	translate([0,oy-wall+explode,0])
	rotate(a=[90,0,180])
		frontAndBack();

      // mechanisms
	translate([0,-cardy/2,0])
	rotate(a=[90,0,0])
		mechanism();

	translate([0,cardy/2,0])
	rotate(a=[90,0,180])
		mechanism();

      // sides (exploded)
	translate([ox - wall + explode,0,0])
	rotate(a=[90,0,90])
		side();

	translate([-ox + wall -explode,0,0])
	rotate(a=[90,0,-90])
		side();

      // rack  / pinion card lift (slides)
      // mechanisms
	translate([0,-cardy/2-wall-mechanism-explode/2,0])
	rotate(a=[90,0,180])
		rack_lift();

	translate([0,cardy/2+wall+mechanism+explode/2,0])
	rotate(a=[90,0,0])
		rack_lift();

     // top
	translate([0+explode,-oy-explode,ch-rad+explode])
	rotate(a=[90,0,180])
		scale([-1,1,1])
			top_half();

	translate([0-explode,-oy-explode,ch-rad+explode])
	rotate(a=[90,0,180])
			top_half();

	translate([0-explode,oy+explode,ch-rad+explode])
	rotate(a=[90,0,0])
		scale([-1,1,1])
			top_half();

	translate([0+explode,oy+explode,ch-rad+explode])
	rotate(a=[90,0,0])
			top_half();

     // top
    // bug - height isn't supposed to include two lots of cardclearance and wall
	translate([notchHeight+explode,0,oz+cardclearance+wall+explode])
			rotate(a=[0,180,-90])
				lid();

	translate([-notchHeight-explode,0,oz+cardclearance+wall+explode])
			rotate(a=[0,180,90])
				lid();
     // top side
	translate([-ox-hingeRad*2+wall-explode,0,oz+cardclearance+wall+explode/2])
			rotate(a=[90,180,90])
				top_side();

	translate([ox+hingeRad*2-wall+explode, 0,oz+cardclearance+wall+explode/2])
			rotate(a=[90,180,-90])
				top_side();

	translate([0,-oy,-explode])
		base();

}

module showBuildArea()
{
	// show build area to double check print layouts
	translate([-90,-80,-1])
		cube([180,160,1]);
}

// debug. Show other items, including a quad the size of the build area on my reprap to make sure everything fits
// hinge(3,1,50);
//showBuildArea();
//rack_lift_platform();
//lid();
//top_side();