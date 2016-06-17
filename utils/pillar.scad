include <../configuration/general.scad>;
include <hex_trap.scad>;
module small_wall()
{
    intersection()
    {
        cube([local_thickness*2+across_width,local_thickness,local_height]);
        union()
        {
            cube([local_thickness,local_thickness,local_height]);
            cube ([across_width,thickness2,thickness2]); 
            translate([0,0,local_height-thickness2]) cube ([across_width,thickness2,thickness2]);
            translate([across_width/2+local_thickness/2,thickness2/2,local_height/2]) rotate([0,local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
            translate([across_width/2+local_thickness/2,thickness2/2,local_height/2]) rotate([0,-local_angle,0]) cube([thickness2,thickness2,local_diagonal],center=true);
            translate([across_width,0,0]) cube([thickness2,thickness2,local_height]);
        }
    }
}
module pillar(thickness,thickness2,height,offset_bottom_x,offset_bottom_y,offset_top_x,offset_top_y,across_width,across_width_side)
{
    local_thickness=thickness;
    local_height=height;
    local_angle=atan2(across_width,local_height);
    local_diagonal=sqrt(local_height*local_height+across_width*across_width);
    small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width_side,thickness2=thickness2,local_angle=local_angle,local_diagonal=local_diagonal);
    translate([thickness,0,0]) rotate([0,0,90]) small_wall(local_thickness=local_thickness,local_height=local_height,across_width=across_width,thickness2=thickness2,local_angle=local_angle,local_diagonal=local_diagonal);
}
module base_pillars()
{
local_length=HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3);
local_width=HDMI_HOLES_WIDTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
translate([local_length/2-PILLARS_THICKNESS,local_width/2-PILLARS_THICKNESS,0]) /*rotate([0,0,90])*/
pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
translate([-local_length/2,local_width/2-PILLARS_THICKNESS,0]) rotate([0,0,90])
pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
translate([local_length/2-PILLARS_THICKNESS,-local_width/2,0]) rotate([0,0,-90])
pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
translate([-local_length/2,-local_width/2,0]) rotate([0,0,-90])
pillar(thickness=PILLARS_THICKNESS,thickness2=PILLARS_THICKNESS2,height=PILLARS_HEIGHT,offset_bottom_x=0,offset_bottom_y=0,offset_top_x=0,offset_top_y=0,across_width=TOP_PANEL_EXTENSION_WITDH,across_width_side=SIDE_PANEL_EXTENSION_WIDTH);
}
base_pillars();