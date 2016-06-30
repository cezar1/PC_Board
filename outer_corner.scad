$exploded=0;
include <configuration/general.scad>;
module outer_corner_panel_wall_holes(is_explode,interface_side)
{
    local_h_hole=l_z+0.2+is_explode*30;
    for (i=[-1,1]){
        translate([l_x/2-PILLARS_THICKNESS/2,-local_h_hole/2,i*PILLARS_HEIGHT/PILLARS_TRAPS_HEIGHT_RATIO]){ 
            color([0,1,0]) rotate([90,0,0]) hex_hole(h_trap=0,h_hole=local_h_hole,r_trap=SCREW_STANDARD_M3,rot=180);
            
        }
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
module corners_assembly()
{
    
    translate([0,0,PILLARS_HEIGHT/2+HDMI_COVER_HEIGHT]){
    corner_bottom_left_x=-HDMI_HOLES_LENGTH/2-(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)-PILLARS_THICKNESS-SIDE_PANEL_EXTENSION_WIDTH_BATTERY-OUTER_SHELL_THICKNESS;
    corner_bottom_left_y=0+HDMI_HOLES_WIDTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+BOTTOM_PANEL_EXTENSION_WITDH+OUTER_SHELL_THICKNESS;
        difference(){
    translate([corner_bottom_left_x,corner_bottom_left_y,0]) rotate ([0,180,180]) corner_batt_bottom();
    translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
        }
    corner_bottom_right_x=HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH+OUTER_SHELL_THICKNESS;
    corner_bottom_right_y=0+HDMI_HOLES_WIDTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+BOTTOM_PANEL_EXTENSION_WITDH+OUTER_SHELL_THICKNESS;
        translate([corner_bottom_right_x,corner_bottom_right_y,0]) rotate ([180,180,0]) corner_right_bottom();
        //translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
    }
    
}

//corner_batt_bottom();
corner_right_bottom();
//corners_assembly();