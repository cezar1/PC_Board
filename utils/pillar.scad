$exploded=0;
include <../configuration/general.scad>;
include <hex_trap.scad>;

module small_wall(across_width)
{
    
                
    difference()
    {
        //Build body small wall
        union()
        {
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
                    translate([(across_width)/2+local_thickness/2,0,-local_height/2+thickness2/2]) cube ([across_width,thickness2,thickness2],center=true);
                    translate([across_width+local_thickness/2-thickness2/2,0,0]) cube([thickness2,thickness2,local_height],center=true);
                    translate([across_width/2+local_thickness/2,0,0]) rotate([0,local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
                    translate([across_width/2+local_thickness/2,0,0]) rotate([0,-local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
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
            translate([across_width/2+local_thickness/2,0,0]) cube([ZIPTIE_HEIGHT,ZIPTIE_LENGTH2,ZIPTIE_WIDTH],center=true);
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
module pillar(thickness,thickness2,height,offset_bottom_x,offset_bottom_y,offset_top_x,offset_top_y,across_width,across_width_side)
{
    local_thickness=thickness;
    local_height=height;
    local_angle=atan2(across_width,local_height);
    local_diagonal=sqrt(local_height*local_height+across_width*across_width);
    difference()
    {
        union()
        {
            translate([GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,0,0]){
            small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width_side,thickness2=thickness2,local_angle=local_angle,local_diagonal=local_diagonal,thickness=thickness);
            }
            translate([0,GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2,0]) rotate([0,0,90]) {
                small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width,thickness2=thickness2,local_angle=local_angle,local_diagonal=local_diagonal,thickness=thickness);   
            
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
    pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=PILLARS_BOTTOM_OFFSET_X,offset_bottom_y=PILLARS_BOTTOM_OFFSET_Y,offset_top_x=PILLARS_TOP_OFFSET_X,offset_top_y=PILLARS_TOP_OFFSET_Y,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
}
module base_pillars()
{
    translate([0,0,HDMI_COVER_HEIGHT]){
        local_length=HDMI_HOLES_LENGTH+GAP_MAINSCREWS_HDMI*2+SCREW_STANDARD_M3*4;
        local_width=HDMI_HOLES_WIDTH;
            
        translate([0,0,PILLARS_HEIGHT/2]){
        translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,0]) /*rotate([0,0,90])*/
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=PILLARS_BOTTOM_OFFSET_X,offset_bottom_y=PILLARS_BOTTOM_OFFSET_Y,offset_top_x=PILLARS_TOP_OFFSET_X,offset_top_y=PILLARS_TOP_OFFSET_Y,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
        translate([-HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,0]) rotate([0,0,90])
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
        translate([HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,0]) rotate([0,0,-90])
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
        translate([-HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,0]) rotate([0,0,-180])
        pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
        }
    }
}
single_pillar();