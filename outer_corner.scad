$exploded=0;
include <configuration/general.scad>;
module outer_corner_bottom_angles()
{
    for (j=[-1,1]){
        translate([j*length/2-j*BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2+OUTER_SHELL_THICKNESS/2,0]){
    translate([0,0,-j*(PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2)/2])rotate([j*BOTTOM_PLATE_SUPPORT_LEGS_ANGLE,0,0])cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2],center=true);
                                translate([0,0,j*(PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2)/2])rotate([-j*BOTTOM_PLATE_SUPPORT_LEGS_ANGLE,0,0])cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2],center=true);}
    }
}
module outer_corner_bottom_blocks()
{
    for (i=[-1,1]){
        for(j=[-1,1]){
            color([1,0,0]) translate([i*(length/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2),OUTER_SHELL_THICKNESS,j*(width/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2)]) #cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH,OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,BOTTOM_PLATE_SUPPORT_LEGS_WIDTH],center=true);
        }
    }
}
module outer_corner_side_plate_blocks(dist1,dist2)
{
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([0,1,0]) translate([i*dist1/2,0,j*dist2/2]) cube([SCREW_STANDARD_M3*4,OUTER_SHELL_THICKNESS,SCREW_STANDARD_M3*4],center=true);
        }
    }

}
module outer_corner_side_plate_holes(dist1,dist2)
{
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([1,0,0]) translate([i*dist1/2,(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT-NUT_HEIGHT_M3+0.1),j*dist2/2]) rotate([-90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.1,h_hole=0.1+(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT)-NUT_HEIGHT_M3,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }

}
module outer_corner_top_plate_handle_blocks(length,width,dist1,dist2)
{
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([0,1,0]) translate([i*TOP_HANDLE_DIST1/2,j*TOP_HANDLE_DIST2/2,0]) cube([SCREW_STANDARD_M3*4,SCREW_STANDARD_M3*4,OUTER_SHELL_THICKNESS],center=true);
        }
    }
}
module outer_corner_top_plate_handle_blocks2only(length,width,dist1,dist2,i)
{
    for (j=[-1,1]){
            color([0,1,0]) translate([i*TOP_HANDLE_DIST1/2,j*TOP_HANDLE_DIST2/2,0]) cube([SCREW_STANDARD_M3*4,SCREW_STANDARD_M3*4,OUTER_SHELL_THICKNESS],center=true);
    }
}
module outer_corner_top_plate_handle_holes_squares(length,width,dist1,dist2)
{
    
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([0,0,1]) translate([i*TOP_HANDLE_DIST1/2,j*TOP_HANDLE_DIST2/2,0]) cube([SCREW_STANDARD_M3*2+0.5,SCREW_STANDARD_M3*2+0.5,OUTER_SHELL_THICKNESS+0.2+TOP_HANDLE_LIFT1],center=true);
        }
    }
}
module outer_corner_top_plate_handle_holes(length,width,dist1,dist2)
{
    
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([0,0,1]) translate([i*TOP_HANDLE_DIST1/2,j*TOP_HANDLE_DIST2/2,0]) hex_hole(h_trap=0,h_hole=OUTER_SHELL_THICKNESS+0.2+TOP_HANDLE_LIFT1,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }
}
module outer_corner_top_plate_blocks()
{
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([0,1,0]) translate([i*TOP_HANDLE_DIST1/2,0,j*TOP_HANDLE_DIST2/2]) cube([SCREW_STANDARD_M3*4,OUTER_SHELL_THICKNESS,SCREW_STANDARD_M3*4],center=true);
        }
    }

}
module outer_corner_top_plate_holes()
{
    for (j=[-1,1]){
        for(i=[-1,1]){
            color([1,0,0]) translate([i*TOP_HANDLE_DIST1/2,(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT-NUT_HEIGHT_M3+0.1),j*TOP_HANDLE_DIST2/2]) rotate([-90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.1,h_hole=0.1+(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT)-NUT_HEIGHT_M3,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }

}
module outer_corner_bottom_holes()
{
    for (i=[-1,1]){
        for(j=[-1,1]){
            color([1,0,0]) translate([i*(length/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2),(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT-NUT_HEIGHT_M3+0.1),j*(width/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2)]) rotate([-90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.1,h_hole=0.1+(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT)-NUT_HEIGHT_M3,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }
    outer_corner_bottom_holes2(length=length,width=width);
}
module outer_corner_bottom_holes2()
{
    for (i=[-1,1]){
        for(j=[-1,1]){
            color([1,1,0]) translate([i*(length/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2),(OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT-NUT_HEIGHT_M3+0.1),j*(width/2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2)]) rotate([-90,0,0]) hex_hole(h_trap=OUTER_SHELL_THICKNESS+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT-SCREW_STANDARD_M3_SCREW_HEIGHT1,h_hole=0,r_trap=SCREW_STANDARD_M3,rot=180);
        }
    }
}
module outer_corner_handle(length,width,dist1,dist2)
{
    local_length=TOP_HANDLE_DIST1+SCREW_STANDARD_M3*2;
    TOP_HANDLE_CUT_BASE=2;
    TOP_HANDLE_BASE_THICKNESS=2;
    //union(){
    //      translate([0,0,OUTER_SHELL_THICKNESS+0.1+TOP_HANDLE_LIFT1]) outer_corner_top_plate_handle_holes(length=length,width=width,dist1=dist1,dist2=dist2);
    //}  
    //TOP BASE
    translate([0,0,OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1+TOP_HANDLE_CYL_RADIUS-TOP_HANDLE_BASE_THICKNESS/2]) cube([local_length+SCREW_STANDARD_M3*2+0.2,12,TOP_HANDLE_BASE_THICKNESS],center=true);  
    difference(){
       union(){ 
            translate([0,0,OUTER_SHELL_THICKNESS/2])outer_corner_top_plate_handle_blocks(length=length,width=width,dist1=dist1,dist2=dist2);
            //translate([0,0,OUTER_SHELL_THICKNESS/2]) #cube([length,width,OUTER_SHELL_THICKNESS],center=true);
            //translate([0,0,OUTER_SHELL_THICKNESS/2+10]) #cube([10,10,OUTER_SHELL_THICKNESS+20],center=true);
           difference(){
            
            translate([0,0,OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1]) rotate([0,90,0]) cylinder(r=TOP_HANDLE_CYL_RADIUS,h=local_length,center=true);
            translate([0,0,OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1]) rotate([0,90,0]) cylinder(r=TOP_HANDLE_CYL_RADIUS-TOP_HANDLE_CYL_THICKNESS,h=local_length-2,center=true);
           }
           for (i=[-1,1]){
               difference(){
                   hull()
                   {
                   translate([i*((TOP_HANDLE_DIST1)/2),0,OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1]) rotate([0,90,0]) cylinder(r=10,h=SCREW_STANDARD_M3*4,center=true);
                   translate([0,0,OUTER_SHELL_THICKNESS/2]) outer_corner_top_plate_handle_blocks2only(length=length,width=width,dist1=dist1,dist2=dist2,i=i);
                   }
                   union(){
                   translate([i*(length/2-SCREW_STANDARD_M3*4),0,-OUTER_SHELL_THICKNESS/2+TOP_HANDLE_REACH/2]) #cube([SCREW_STANDARD_M3*4*2,18,TOP_HANDLE_REACH-5],center=true);
                   //UPPER REMOVE
                   translate([i*(length/2-SCREW_STANDARD_M3*2-TOP_HANDLE_CYL_THICKNESS),0,-OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1]) #cube([SCREW_STANDARD_M3*3-TOP_HANDLE_CYL_THICKNESS,TOP_HANDLE_CYL_RADIUS,TOP_HANDLE_REACH-10],center=true);
                   }
              }
              
           }
       }
      union(){
          translate([0,0,OUTER_SHELL_THICKNESS+0.1+TOP_HANDLE_LIFT1]) outer_corner_top_plate_handle_holes(length=length,width=width,dist1=dist1,dist2=dist2);
          translate([0,0,OUTER_SHELL_THICKNESS/2+OUTER_SHELL_THICKNESS*3+0.1+TOP_HANDLE_LIFT1/2]) outer_corner_top_plate_handle_holes_squares(length=length,width=width,dist1=dist1,dist2=dist2);
          //TOP CUT
          translate([0,0,OUTER_SHELL_THICKNESS/2+TOP_HANDLE_LIFT1+TOP_HANDLE_CYL_RADIUS+TOP_HANDLE_CYL_RADIUS/2-TOP_HANDLE_CUT_BASE]) #cube([local_length+SCREW_STANDARD_M3*2+0.2,TOP_HANDLE_CYL_RADIUS*2,TOP_HANDLE_CYL_RADIUS],center=true);
      }
      
   }
   //translate([0,0,OUTER_SHELL_THICKNESS+0.1+TOP_HANDLE_LIFT1-20]) outer_corner_top_plate_handle_holes(length=length,width=width,dist1=dist1,dist2=dist2); 
    
}
module outer_corner_handle_half(length,width,dist1,dist2)
{
    intersection(){
    outer_corner_handle(length=length,width=width,dist1=dist1,dist2=dist2);
translate([0,150,0])#cube([300,300,300],center=true);}
}
module outer_corner_plate(length,width,thickness,config)
{
    if (config==OUTER_CORNER_CONFIG_PLATE_LEFT){
        //translate([0,0.1,0])  outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2)
        difference(){
            outer_corner_side_plate_blocks(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2);
            
            translate([0,0.1,0]) rotate([0,0,180]) outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2); 
        }
    }
    if (config==OUTER_CORNER_CONFIG_PLATE_RIGHT){
        //translate([0,0.1,0])  outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2)
        difference(){
            outer_corner_side_plate_blocks(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2);
            
            translate([0,0.1,0]) rotate([0,0,180]) outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2); 
        }
    }
    if (config==OUTER_CORNER_CONFIG_PLATE_TOP){
        //HANDLE
        rotate([-90,0,0]) translate([0,thickness-OUTER_SHELL_THICKNESS/2-2.5,0]) outer_corner_handle(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,dist1=TOP_HANDLE_DIST1,dist2=TOP_HANDLE_DIST2);
        difference(){
            translate([0,-OUTER_SHELL_THICKNESS/2,0])outer_corner_top_plate_blocks(length=length,width=width);
            
            translate([0,-0.2-thickness+NUT_HEIGHT_M3,0]) rotate([0,0,0]) outer_corner_top_plate_holes(length=length,width=width); 
        }
    }
    if (config==OUTER_CORNER_CONFIG_PLATE_BOTTOM){
        difference(){
            outer_corner_bottom_blocks(length=length,width=width);
            
            outer_corner_bottom_holes(length=length,width=width); 
        }
    for (i=[-2,-1,0,1,2]){
        translate([i*(length)/6,0,0]) cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/4,thickness,width],center=true);
    }
    }
    
    difference(){
        union(){
            
            if (config==OUTER_CORNER_CONFIG_PLATE_LEFT){
                translate([0,0,0]) cube([length,thickness,width],center=true);
                
                
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_RIGHT){
                translate([0,0,0]) cube([length,thickness,width],center=true);
                
                
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_TOP){
                translate([0,-thickness/2,0]) cube([length,thickness,width],center=true);
                
                
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_BOTTOM){
                cube([length,thickness,width],center=true);
            }
            
            
            for (j=[-1,1]){
                for (i=[-1,1]){
                    translate([j*(length/2+PILLARS_THICKNESS/2),-OUTER_SHELL_THICKNESS/4,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) cube([PILLARS_THICKNESS,OUTER_SHELL_THICKNESS/2,OUTER_CORNER_INTERFACE_WIDTH],center=true);
            if (config==OUTER_CORNER_CONFIG_PLATE_TOP){
                //Main body additions
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_BOTTOM){
                
                //SUPPORT LEGS
                
                for (i=[-1,1]){
                    translate([i*length/2-i*BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2+OUTER_SHELL_THICKNESS/2,0]) {
                    for (j=[-1,1]){    
                        //j=-1;
                    translate([0,0,j*(PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2-BOTTOM_PLATE_SUPPORT_LEGS_WIDTH)/2]) cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,BOTTOM_PLATE_SUPPORT_LEGS_WIDTH],center=true);
                    }
                        difference(){
                            union(){
                                cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2],center=true);
                                
                            }
                            union(){
                                cube([BOTTOM_PLATE_SUPPORT_LEGS_WIDTH/2,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2,PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2+0.2],center=true);
                                
                            }
                        }
                    }
                }
            }
                }
            }
        }
        union(){
            if (config==OUTER_CORNER_CONFIG_PLATE_LEFT){
                //Main body difference
                for (j=[-1,1]){
                    
                    for (i=[-1,1]){
                        translate([j*(length/2+PILLARS_THICKNESS/2),0.1,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) rotate ([0,90,90]) hex_hole(h_trap=0,h_hole=OUTER_SHELL_THICKNESS+0.2,r_trap=SCREW_STANDARD_M3,rot=180);
                    }
                }
                translate([0,-thickness/4-0.1+thickness/2,0])#cube([length-OUTER_SHELL_THICKNESS*2,thickness/2+0.2,width-OUTER_SHELL_THICKNESS*2],center=true);
                translate([0,0.1,0]) rotate([0,0,180]) outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2);
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_RIGHT){
                //Main body difference
                for (j=[-1,1]){
                    
                    for (i=[-1,1]){
                        translate([j*(length/2+PILLARS_THICKNESS/2),0.1,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) rotate ([0,90,90]) hex_hole(h_trap=0,h_hole=OUTER_SHELL_THICKNESS+0.2,r_trap=SCREW_STANDARD_M3,rot=180);
                    }
                }
                translate([0,-thickness/4-0.1+thickness/2,0])#cube([length-OUTER_SHELL_THICKNESS*2,thickness/2+0.2,width-OUTER_SHELL_THICKNESS*2],center=true);
                translate([0,0.1,0]) rotate([0,0,180]) outer_corner_side_plate_holes(length=length,width=width,dist1=SIDE_HANDLE_DIST1,dist2=SIDE_HANDLE_DIST2);
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_TOP){
                //Main body difference
                for (j=[-1,1]){
                    
                    for (i=[-1,1]){
                        translate([j*(length/2+PILLARS_THICKNESS/2),0.1,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) rotate ([0,90,90]) hex_hole(h_trap=0,h_hole=OUTER_SHELL_THICKNESS+0.2,r_trap=SCREW_STANDARD_M3,rot=180);
                    }
                }
                translate([0,-thickness/4-0.1-thickness/2,0])#cube([length-OUTER_SHELL_THICKNESS*2,thickness/2+0.2,width-OUTER_SHELL_THICKNESS*2],center=true);
                outer_corner_top_plate_holes(length=length,width=width);
            }
            if (config==OUTER_CORNER_CONFIG_PLATE_BOTTOM)
            {
                outer_corner_bottom_holes(length=length,width=width);
                outer_corner_bottom_angles(length=length);
                translate([0,-thickness/4-0.1,0])cube([length-OUTER_SHELL_THICKNESS*2,thickness/2+0.2,width-OUTER_SHELL_THICKNESS*2],center=true);
                for (j=[-1,1]){
                    
                    for (i=[-1,1]){
                        translate([j*(length/2+PILLARS_THICKNESS/2),0.1,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) rotate ([0,90,90]) hex_hole(h_trap=0,h_hole=OUTER_SHELL_THICKNESS+0.2,r_trap=SCREW_STANDARD_M3,rot=180);
                    }
                }
            }
        }
    }
}
module outer_corner_panel_wall_holes(is_explode,interface_side)
{
	local_h_hole=l_z+0.2+is_explode*30;
	for (i=[-1,1]){
		translate([l_x/2-PILLARS_THICKNESS/2,-local_h_hole/2,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]){ 
			color([0,1,0]) rotate([90,0,0]) hex_hole(h_trap=0,h_hole=local_h_hole,r_trap=SCREW_STANDARD_M3,rot=180);
		}
		//Interface traps
		if (is_explode==0)
		{
			translate([l_x/2-PILLARS_THICKNESS/2,interface_side*OUTER_SHELL_THICKNESS/4,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]) cube([PILLARS_THICKNESS,OUTER_SHELL_THICKNESS/2,OUTER_CORNER_INTERFACE_WIDTH],center=true);
		}
	}
}
module outer_corner_panel_wall(l_x,l_y,l_z,config,top,interface_side)
{
	difference(){
		cube([l_x,l_y,l_z],center=true);
		union(){
			outer_corner_panel_wall_holes(is_explode=0,l_x=l_x,l_y=l_y,l_z=l_z,interface_side=interface_side);
			translate([0,interface_side*l_y/4,0]) cube([l_x/2,l_y/2,l_z/1.5],center=true);    
		}
	}
	if ($exploded){
		outer_corner_panel_wall_holes(is_explode=1,l_x=l_x,l_y=l_y,l_z=l_z,interface_side=interface_side);
	}
	if (config==OUTER_CORNER_CONFIG_BATT_BOTTOM)
	{
		hull(){
			translate([-(PILLARS_THICKNESS-OUTER_SHELL_THICKNESS)/2,PILLARS_THICKNESS/2+BATT_SHIFT_FRONT/2+OUTER_BATTERY_BUILD_INTO/2,l_z/2+top/2]) cube ([OUTER_BATTERY_SUPPORT_WIDTH,PILLARS_THICKNESS+BATT_SHIFT_FRONT+OUTER_SHELL_THICKNESS+OUTER_BATTERY_BUILD_INTO,top+5],center=true);
			translate([-(PILLARS_THICKNESS-OUTER_SHELL_THICKNESS)/2,0,l_z/2+top/2-5]) cube ([OUTER_BATTERY_SUPPORT_WIDTH,OUTER_SHELL_THICKNESS,top],center=true);
		}
	}
}
module corner(rotate1,rotate2,length1,length2,top1,top2,height,config1,config2)
{
	difference(){
		union(){
			//translate([-10/2,-10/2,0]) #cube([10,10,PILLARS_HEIGHT*3],center=true);    
			OUTER_INTERFACE_SIDE_1=1;
			OUTER_INTERFACE_SIDE_2=-1;
			translate([length1/2,OUTER_SHELL_THICKNESS/2,0]) outer_corner_panel_wall(l_x=length1,l_y=OUTER_SHELL_THICKNESS,l_z=height,config=config1,top=top1,interface_side=OUTER_INTERFACE_SIDE_1);
			translate([OUTER_SHELL_THICKNESS/2,length2/2,0]) rotate([0,0,90]) outer_corner_panel_wall(l_x=length2,l_y=OUTER_SHELL_THICKNESS,l_z=height,config=config2,top=top2,interface_side=OUTER_INTERFACE_SIDE_2);
			//Core pillar
			translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,0]) cube([PILLARS_THICKNESS,PILLARS_THICKNESS,height],center=true);
			//Strength pillar
			intersection()
			{
				translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,0]) rotate([0,0,45]) #cube([PILLARS_THICKNESS*1.4,PILLARS_THICKNESS*1.4,height],center=true);  
				translate([PILLARS_THICKNESS,PILLARS_THICKNESS,0]) rotate([0,0,0]) #cube([PILLARS_THICKNESS*2,PILLARS_THICKNESS*2,height],center=true); 
			} 
		}
		union(){
			translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,-height/2-0.1]) color([1,0,0]) hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=PILLARS_THICKNESS*2,rot_exit=-180);
			translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,height/2+0.1]) rotate([180,0,0]) color([1,0,0]) hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=PILLARS_THICKNESS*2,rot_exit=-180);
			translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,-height])      hex_hole(h_trap=0,h_hole=height*2,r_trap=SCREW_STANDARD_M3,rot=0);
		}
	}
	if ($exploded==1)
	color([1,0,0]) translate([PILLARS_THICKNESS/2,PILLARS_THICKNESS/2,-height])      hex_hole(h_trap=0,h_hole=height*2,r_trap=SCREW_STANDARD_M3,rot=0);
}
module corner_batt_bottom()
{
	corner(length1=-1+SIDE_PANEL_EXTENSION_WIDTH_BATTERY+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,length2=-1+BOTTOM_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,top1=BATT_HEIGHT/3,top2=0,height=PILLARS_HEIGHT,config1=OUTER_CORNER_CONFIG_BATT_BOTTOM,config2=OUTER_CORNER_CONFIG_NONE);    
}
module corner_right_bottom()
{
	corner(length1=-1+SIDE_PANEL_EXTENSION_WIDTH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,length2=-1+BOTTOM_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,top1=0,top2=0,height=PILLARS_HEIGHT,config1=OUTER_CORNER_CONFIG_NONE,config2=OUTER_CORNER_CONFIG_NONE);    
}
module corner_left_top()
{  
    corner(length1=-1+SIDE_PANEL_EXTENSION_WIDTH_BATTERY+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,length2=-1+TOP_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,top1=0,top2=0,height=PILLARS_HEIGHT,config1=OUTER_CORNER_CONFIG_NONE,config2=OUTER_CORNER_CONFIG_NONE);   
        
}
module corner_right_top()
{
    difference()
    {
        corner(length1=-1+TOP_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,length2=-1+SIDE_PANEL_EXTENSION_WIDTH+PILLARS_THICKNESS*3+OUTER_SHELL_THICKNESS,top1=0,top2=0,height=PILLARS_HEIGHT,config1=OUTER_CORNER_CONFIG_NONE,config2=OUTER_CORNER_CONFIG_NONE);   
        translate([ANTENNA_CASE_LENGTH/2,30,PILLARS_HEIGHT/2-ANTENNA_CASE_HEIGHT/2]) rotate([0,0,180])antenna_connector_case();
    }
        translate([ANTENNA_CASE_LENGTH/2,30,PILLARS_HEIGHT/2-ANTENNA_CASE_HEIGHT/2]) rotate([0,0,180])  antenna_part();
}
module outer_corner_top_plate()
{
    extra=0;
		plate_top_left_x=0;
		plate_top_left_y=-extra-HDMI_HOLES_WIDTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-OUTER_SHELL_THICKNESS/2;    
    
		translate([plate_top_left_x,plate_top_left_y,0]) rotate([180,0,0])outer_corner_plate(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_TOP);
}
module outer_corner_left_cover()
{
    extra=0;
		plate_top_left_x=-extra-HDMI_HOLES_LENGTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-SIDE_PANEL_EXTENSION_WIDTH_BATTERY;
		plate_top_left_y=0;    
    
		translate([plate_top_left_x,plate_top_left_y,0]) rotate([0,0,-90])outer_corner_plate(length=HDMI_HOLES_WIDTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_LEFT);
}
module outer_corner_right_cover()
{
    extra=0;
		plate_top_left_x=+extra+HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH;
		plate_top_left_y=0;    
    
		translate([plate_top_left_x,plate_top_left_y,0]) rotate([0,0,90])outer_corner_plate(length=HDMI_HOLES_WIDTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_RIGHT);
}
module outer_corner_bottom_plate()
{
    extra=0;
		plate_bottom_left_x=0;
		plate_bottom_left_y=extra+HDMI_HOLES_WIDTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+BOTTOM_PANEL_EXTENSION_WITDH+OUTER_SHELL_THICKNESS/2;    
    
		translate([plate_bottom_left_x,plate_bottom_left_y,0]) outer_corner_plate(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_BOTTOM);
        
    
    
	
}
module corners_assembly()
{
	translate([0,0,PILLARS_HEIGHT/2+HDMI_COVER_HEIGHT]){
        //BOTTOM LEFT
		corner_bottom_left_x=-HDMI_HOLES_LENGTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-SIDE_PANEL_EXTENSION_WIDTH_BATTERY-OUTER_SHELL_THICKNESS;
		corner_bottom_left_y=0+HDMI_HOLES_WIDTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+BOTTOM_PANEL_EXTENSION_WITDH+OUTER_SHELL_THICKNESS;
		difference(){
			translate([corner_bottom_left_x,corner_bottom_left_y,0]) rotate ([0,180,180]) corner_batt_bottom();
			translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
		}
		corner_bottom_right_x=HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH+OUTER_SHELL_THICKNESS;
		corner_bottom_right_y=0+HDMI_HOLES_WIDTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+BOTTOM_PANEL_EXTENSION_WITDH+OUTER_SHELL_THICKNESS;
		translate([corner_bottom_right_x,corner_bottom_right_y,0]) rotate ([180,180,0]) corner_right_bottom();
        //Corner right top
        corner_top_right_x=HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH+OUTER_SHELL_THICKNESS;
		corner_top_right_y=0-HDMI_HOLES_WIDTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-OUTER_SHELL_THICKNESS;
		translate([corner_top_right_x,corner_top_right_y,0]) rotate ([180,180,0]) rotate([0,0,-90]) corner_right_top();
        
	
    //Corner left top
    corner_top_left_x=-HDMI_HOLES_LENGTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-SIDE_PANEL_EXTENSION_WIDTH_BATTERY-OUTER_SHELL_THICKNESS;
		corner_top_left_y=0-HDMI_HOLES_WIDTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-OUTER_SHELL_THICKNESS;
		translate([corner_top_left_x,corner_top_left_y,0]) rotate ([180,180,0]) rotate([0,0,180]) corner_left_top();
        
		//translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
    
    //LEFT PLATE
    outer_corner_left_cover();
    //RIGHT PLATE
    outer_corner_right_cover();
    //TOP PLATE
    outer_corner_top_plate();    
    //BOTTOM PLATE
	outer_corner_bottom_plate();	
    }
}
module outer_corner_bottom_plate_only_plate()
{
    intersection(){
    outer_corner_plate(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_BOTTOM);
        #cube([HDMI_HOLES_LENGTH-PILLARS_THICKNESS+OUTER_BATTERY_BUILD_INTO*2,OUTER_SHELL_THICKNESS,PILLARS_HEIGHT],center=true);
    }
    
}
module outer_corner_bottom_plate_only_legs()
{
    intersection(){
    outer_corner_plate(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_BOTTOM);
        translate([(HDMI_HOLES_LENGTH-PILLARS_THICKNESS)/2,0.001+OUTER_SHELL_THICKNESS/2+BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT/2,0])#cube([HDMI_HOLES_LENGTH-PILLARS_THICKNESS,BOTTOM_PLATE_SUPPORT_LEGS_HEIGHT,PILLARS_HEIGHT+BOTTOM_PLATE_SUPPORT_LEGS_EXTRA_LENGTH*2],center=true);
    }
    
}
//corner_batt_bottom();
//corner_right_bottom();
//rotate ([0,180,0]) corner_right_top();
//corner_left_top();
//corners_assembly();
//outer_corner_bottom_plate_only_plate();
//outer_corner_bottom_plate_only_legs();
//rotate([-90,0,0]) outer_corner_plate(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_TOP);
//rotate ([-90,0,0]) outer_corner_plate(length=HDMI_HOLES_WIDTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_LEFT);
//rotate ([-90,0,0]) outer_corner_plate(length=HDMI_HOLES_WIDTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,config=OUTER_CORNER_CONFIG_PLATE_RIGHT);
//outer_corner_top_plate();
//TOP HANDLE
rotate([180,0,0])outer_corner_handle(length=HDMI_HOLES_LENGTH-PILLARS_THICKNESS,width=PILLARS_HEIGHT,thickness=OUTER_SHELL_THICKNESS,dist1=TOP_HANDLE_DIST1,dist2=TOP_HANDLE_DIST2);