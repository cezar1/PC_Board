include <../configuration/general.scad>;
include <hex_trap.scad>;
module pillar(thickness,height,offset_bottom_x,offset_bottom_y,offset_top_x,offset_top_y)
{
    local_thickness=thickness;
    local_height=height;
    cube([local_thickness,local_thickness,local_height]);
}
module base_pillars()
{
local_length=HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3);
local_width=HDMI_HOLES_WIDTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
translate([local_length/2-PILLARS_THICKNESS,local_width/2-PILLARS_THICKNESS,0])
pillar(thickness=PILLARS_THICKNESS,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0);
translate([-local_length/2,local_width/2-PILLARS_THICKNESS,0])
pillar(thickness=PILLARS_THICKNESS,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0);
translate([local_length/2-PILLARS_THICKNESS,-local_width/2,0])
pillar(thickness=PILLARS_THICKNESS,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0);
translate([-local_length/2,-local_width/2,0])
pillar(thickness=PILLARS_THICKNESS,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0);
}
base_pillars();