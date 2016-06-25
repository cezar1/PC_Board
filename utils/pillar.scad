$exploded=0;
include <../configuration/general.scad>;
include <hex_trap.scad>;
use <../battery.scad>;

module small_wall(across_width,extra_top,extra_top_margin,local_angle,config)
{
    
                
    difference()
    {
        //Build body small wall
        union()
        {
            //Battery part, creating a hull which supports the battery
            if (config==PILLARS_SMALL_WALL_CONFIG_BATTERY || config==PILLARS_SMALL_WALL_CONFIG_BATTERY_BOTTOM){
                if (config==PILLARS_SMALL_WALL_CONFIG_BATTERY){
                    hull(){
                    translate([(across_width)/2+local_thickness/2,0,-local_height/2+local_thickness/2-extra_top/2]) cube ([across_width,local_thickness,local_thickness+extra_top],center=true);
                    
                        translate([(across_width)/2+local_thickness/2,BATT_EXTRA_USB_LENGTH,-local_height/2-extra_top/2]) cube ([across_width,local_thickness,extra_top],center=true);
                    }
                }
                else{
                    translate([(across_width)/2+local_thickness/2,0,-local_height/2+local_thickness/2-extra_top/2]) cube ([across_width,local_thickness,local_thickness+extra_top],center=true);
                }
                }
            //Main cube    
            intersection()
            {         
                union()
                {
                    cube([local_thickness,local_thickness,local_height],center=true);
                    translate([(across_width)/2+local_thickness/2,0,0]) cube([across_width,thickness2,local_height],center=true);
                    translate([(across_width)+local_thickness,0,0]) cube([local_thickness,local_thickness,local_height],center=true);
                }
                union()
                {
                    cube([local_thickness,local_thickness,local_height],center=true);
                    translate([(across_width)+local_thickness,0,0]) cube([local_thickness,local_thickness,local_height],center=true);
                    translate([(across_width)/2+local_thickness/2,0,local_height/2-thickness2/2]) cube ([across_width,thickness2,thickness2],center=true);
                    if (config==PILLARS_SMALL_WALL_CONFIG_DEFAULT) {
                        translate([(across_width)/2+local_thickness/2,0,-local_height/2+thickness2/2]) cube ([across_width,thickness2,thickness2],center=true);
                    }
                    if (config==PILLARS_SMALL_WALL_CONFIG_DEFAULT){
                        translate([(across_width)/2+local_thickness/2,0,-local_height/2+local_thickness/2]) cube ([across_width,local_thickness,local_thickness],center=true);
                        }
                    
                    //CROSS FOR SUPPORT
                        if (config==PILLARS_SMALL_WALL_CONFIG_DEFAULT) {
                    translate([across_width/2+local_thickness/2,0,0]) rotate([0,local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
                    translate([across_width/2+local_thickness/2,0,0]) rotate([0,-local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);}
                    else 
                    {
                        translate([across_width/2+local_thickness/2-1,0,0]) rotate([0,local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
                        translate([across_width/2+local_thickness/2,0,0]) rotate([0,-local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
                    }
                }
            }
        }
        //Remove components from small wall
        union()
        {
            translate([0,0,local_height*2])hex_hole(h_trap=0,h_hole=local_height*4,r_trap=SCREW_STANDARD_M3,rot=180);
            translate([(across_width)+local_thickness,0,local_height*2])hex_hole(h_trap=0,h_hole=local_height*4,r_trap=SCREW_STANDARD_M3,rot=180);
            translate([0,0,-local_height/2])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=thickness*2,rot_exit=-180);
            translate([0,0,local_height/2])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180);
            translate([across_width+local_thickness,0,local_height/2])rotate([0,0,180])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180);
            translate([across_width+local_thickness,0,-local_height/2])rotate([0,0,180])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=thickness*2,rot_exit=-180);
            //center hole+trap
            for(i=[-1,1]){
       color([1,0,0])translate([across_width+local_thickness+local_thickness/2+1,0,i*local_height/6])rotate([90,0,0])rotate([0,90,0])hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);}
            //ZIP TIES
            translate([across_width/2+local_thickness/2,0,local_height/2-PILLARS_THICKNESS2/2]) rotate([0,90,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH2,ZIPTIE_WIDTH],center=true);
            translate([across_width/2+local_thickness/2,0,-local_height/2+PILLARS_THICKNESS2/2]) rotate([0,90,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH2,ZIPTIE_WIDTH],center=true);
            //if (config==PILLARS_SMALL_WALL_CONFIG_DEFAULT) {
                translate([across_width/2+local_thickness/2,0,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH2,ZIPTIE_WIDTH],center=true);
                //}
            if (config==PILLARS_SMALL_WALL_CONFIG_BATTERY || config==PILLARS_SMALL_WALL_CONFIG_BATTERY_BOTTOM) {
                //translate([across_width/2+local_thickness/2,0,0]) rotate([0,0,90]) rotate([0,90,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH1,ZIPTIE2_WIDTH],center=true);
                temp=-0;
                translate([across_width/2+local_thickness/2+across_width/2-extra_top_margin-ZIPTIE_HEIGHT*2,temp,-local_height/2+PILLARS_THICKNESS2/2-ZIPTIE_LENGTH1/2-5]) rotate([90,0,0])cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH1,ZIPTIE2_WIDTH],center=true);
                translate([across_width/2+local_thickness/2-across_width/2+extra_top_margin+ZIPTIE_HEIGHT*1.5,temp,-local_height/2+PILLARS_THICKNESS2/2-ZIPTIE_LENGTH1/2-5]) rotate([90,0,0])cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH1,ZIPTIE2_WIDTH],center=true);
                translate([across_width/2+local_thickness/2+across_width/2-extra_top_margin-ZIPTIE_HEIGHT*2-7.0,temp,-local_height/2+PILLARS_THICKNESS2/2+1.5]) rotate([90,-45,0])cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH4,ZIPTIE2_WIDTH],center=true);
                translate([across_width/2+local_thickness/2-17.8,temp,-local_height/2+PILLARS_THICKNESS2/2+1.6]) rotate([90,45,0])cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH4,ZIPTIE2_WIDTH],center=true);
                }
            translate([across_width+local_thickness,0,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH1,ZIPTIE_WIDTH],center=true);
            
            translate([across_width+PILLARS_THICKNESS2/2,0,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH1,ZIPTIE_WIDTH],center=true);
            
            translate([0,0,local_height/6]) rotate([0,0,90]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH3,ZIPTIE_WIDTH],center=true);
            translate([0,0,-local_height/6]) rotate([0,0,90]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH3,ZIPTIE_WIDTH],center=true);
        }
    }
    
   if (exploded==1){ 
       translate([0,0,-local_height/2-30])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2+30,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=thickness*2,rot_exit=-180);
        translate([0,0,30+local_height/2])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=30+NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180);        
       translate([across_width+local_thickness,0,30+local_height/2])rotate([0,0,180])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=30+NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180);
       translate([across_width+local_thickness,0,-30-local_height/2])rotate([0,0,180])hex_hole_exit(h_trap=NUT_HEIGHT_M3,h_hole=30+NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=thickness*2,rot_exit=-180);
       for(i=[-1,1]){
       color([1,0,0])translate([across_width+local_thickness+local_thickness/2+1,0,i*local_height/6])rotate([90,0,0])rotate([0,90,0])hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*2,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=thickness*2,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);}
   }
}
module pillar(thickness,thickness2,thickness2_side,height,offset_bottom_x,offset_bottom_y,offset_top_x,offset_top_y,across_width,across_width_side,extra_top,extra_top_side,config,config_side)
{
    local_thickness=thickness;
    local_height=height;
    local_angle=atan2(across_width,local_height);
    local_angle_side=atan2(across_width_side,local_height);
    local_diagonal=sqrt(local_height*local_height+across_width*across_width);
    local_diagonal_side=sqrt(local_height*local_height+across_width_side*across_width_side);
    difference()
    {
        union()
        {
            translate([GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,0,0]){
            small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width_side,thickness2=thickness2_side,local_angle=local_angle_side,local_diagonal=local_diagonal_side,thickness=thickness,extra_top=extra_top_side,extra_top_margin=0,config=config_side);
            }
            translate([0,GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,0]) rotate([0,0,90]) {
                small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width,thickness2=thickness2,local_angle=local_angle,local_diagonal=local_diagonal,thickness=thickness,extra_top=extra_top,extra_top_margin=0,config=config);   
            
            }
            translate([GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,0])  {
                difference(){
                cube([local_thickness,local_thickness,local_height],center=true);
                translate([local_thickness/4,local_thickness/4,0])rotate([0,0,45])cube([local_thickness,local_thickness*2,local_height],center=true);
                }
                
            }
        }
        union()
        {
            ;//
            translate([0,0,local_height/12]) rotate([0,0,45]) cube([ZIPTIE_LENGTH1,ZIPTIE_WIDTH,ZIPTIE_HEIGHT],center=true);
            translate([0,0,-local_height/12]) rotate([0,0,45]) cube([ZIPTIE_LENGTH1,ZIPTIE_WIDTH,ZIPTIE_HEIGHT],center=true);
        }
        
    }
    
      
}
module single_pillar()
{
    local_length=HDMI_HOLES_LENGTH+GAP_MAINSCREWS_HDMI*2+SCREW_STANDARD_M3*4;
local_width=HDMI_HOLES_WIDTH;
    pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,thickness2_side=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=PILLARS_BOTTOM_OFFSET_X,offset_bottom_y=PILLARS_BOTTOM_OFFSET_Y,offset_top_x=PILLARS_TOP_OFFSET_X,offset_top_y=PILLARS_TOP_OFFSET_Y,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH,extra_top=SIDE_PANEL_BATT_EXTRA_TOP,extra_top_side=SIDE_PANEL_BATT_EXTRA_TOP,config=PILLARS_SMALL_WALL_CONFIG_BATTERY,config_side=PILLARS_SMALL_WALL_CONFIG_BATTERY);
}
module battery_pillar_bottom()
{
    translate([-HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,0]) rotate([0,0,90])
            pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,thickness2_side=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=SIDE_PANEL_EXTENSION_WIDTH_BATTERY,across_width_side=SIDE_PANEL_EXTENSION_WIDTH,extra_top=SIDE_PANEL_BATT_EXTRA_TOP,extra_top_side=0,config=PILLARS_SMALL_WALL_CONFIG_BATTERY_BOTTOM,config_side=PILLARS_SMALL_WALL_CONFIG_DEFAULT);
}
module battery_pillar_usb()
{
    translate([-HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,0]) rotate([0,0,-180])
            pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,thickness2_side=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH_BATTERY,extra_top=0,extra_top_side=SIDE_PANEL_BATT_EXTRA_TOP,config=PILLARS_SMALL_WALL_CONFIG_DEFAULT,config_side=PILLARS_SMALL_WALL_CONFIG_BATTERY);
}
module battery_pillar_usb_assembly()
{
    difference()
            {
                battery_pillar_usb();
                translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
            }
}
module battery_pillar_bottom_assembly()
{
    difference()
            {
                battery_pillar_bottom();
                translate([0,0,-PILLARS_HEIGHT/2]) battery_assembly(clearance=10);
            }
}
module battery_pillars()
{
    battery_pillar_usb();
    battery_pillar_bottom();                
                    
                
}
module pillar_right_top()
{
    translate([HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,0]) rotate([0,0,-90])
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,thickness2_side=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=SIDE_PANEL_EXTENSION_WIDTH,across_width_side=TOP_PANEL_EXTENSION_WITDH,extra_top=0,extra_top_side=0,config=PILLARS_SMALL_WALL_CONFIG_DEFAULT,config_side=PILLARS_SMALL_WALL_CONFIG_DEFAULT);
}
module pillar_right_bottom()
{
    translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,0]) /*rotate([0,0,90])*/
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,thickness2_side=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=PILLARS_BOTTOM_OFFSET_X,offset_bottom_y=PILLARS_BOTTOM_OFFSET_Y,offset_top_x=PILLARS_TOP_OFFSET_X,offset_top_y=PILLARS_TOP_OFFSET_Y,across_width=BOTTOM_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH,extra_top=0,extra_top_side=0,config=PILLARS_SMALL_WALL_CONFIG_DEFAULT,config_side=PILLARS_SMALL_WALL_CONFIG_DEFAULT);
}
module base_pillars()
{
    
    translate([0,0,HDMI_COVER_HEIGHT]){
        //Battery
    battery_assembly(clearance=0);
    //Pillars
        local_length=HDMI_HOLES_LENGTH+GAP_MAINSCREWS_HDMI*2+SCREW_STANDARD_M3*4;
        local_width=HDMI_HOLES_WIDTH;
            
        translate([0,0,PILLARS_HEIGHT/2]){
            pillar_right_bottom();
            //Battery pillars
            battery_pillar_usb_assembly();
            battery_pillar_bottom_assembly();
            pillar_right_top();
            
        
        }
    }
}
//pillar_right_top();
//single_pillar();
//base_pillars();
//battery_pillar_bottom_assembly();
battery_pillar_usb_assembly();