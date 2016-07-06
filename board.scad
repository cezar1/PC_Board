include <myRPI2.scad>
include <common.scad>
$fs = 50;
use_cube_holes=1;
main_wall_depth=0;
main_wall_thickness=15;
holes_columns=5;//always odd
holes_rows=9;//always odd
holes_thickness=3;
holes_radius=(cG_base_width-main_wall_thickness)/(holes_columns+holes_thickness);
holes_radius=15;
holes_spacing_columns=(cG_base_width-main_wall_thickness)/holes_columns;
holes_spacing_rows=(cG_base_length-main_wall_thickness)/holes_rows;
do_holes=1;
//main body
difference()
{
	cube([cG_base_length,cG_base_width,cG_base_height], center=true);
	union(){
		//inner slots
		translate([0,0,cG_base_height/2])
		{
			cube([cG_base_length-main_wall_thickness,cG_base_width-main_wall_thickness,main_wall_depth*2], center=true); 
		};
		translate([0,0,-cG_base_height/2])
		{
			cube([cG_base_length-main_wall_thickness,cG_base_width-main_wall_thickness,main_wall_depth*2], center=true); 
		};
		//holes
		if (do_holes)
		{
			{
				translate( [-(holes_rows+1)/2*holes_spacing_rows, 0, 0] )
				{
					for (j= [1:holes_rows])
					{   translate( [j*holes_spacing_rows, 0 , 0] )
						{
							translate( [0, -(holes_columns+1)/2*holes_spacing_columns, 0] )
							{
								for ( i = [1:holes_columns] ) 
								{
									translate( [0, i*holes_spacing_columns, 0] ) 
									if (use_cube_holes) cube([holes_radius,holes_radius,cG_base_height], center=true);
									else cylinder(d=holes_radius, h=cG_base_height, center=true);
								}
							}
						}
					}
				}
			}
		}
		myRPI2_EdgeBoard_Holes();
	}
}
myRPI2_EdgeBoard_Board();