$exploded=1;
include <configuration/general.scad>;
module top_plate_main_fixing_holes(is_explode)
{
    for (i=[-1,1]){
                    translate([i*HDMI_HOLES_LENGTH/2,local_width/2-PILLARS_THICKNESS/2,local_height/2+0.1+is_explode*15]) hex_hole(h_trap=0,h_hole=local_height+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
                    translate([i*TOP_PANEL_DIST,-local_width/2-0.1-is_explode*15,0]) rotate([90,0,0])hex_hole(h_trap=0,h_hole=TOP_PANEL_THICKNESS+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
                    translate([i*(TOP_PANEL_DIST-TOP_PANEL_GAP),-local_width/2-0.1-is_explode*15,0]) rotate([90,0,0])hex_hole(h_trap=0,h_hole=TOP_PANEL_THICKNESS+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
                }
}
module top_plate()
{
    translate([0,0,local_height/2])
    {
        
        //SANDBOX
        if (exploded==1){
            color([0,1,0]) top_plate_main_fixing_holes(is_explode=1);            
        }
        translate([0,0,0]) cube([TOP_PANEL_THICKNESS*2,local_width,local_height],center=true);
        difference(){
            union(){
                cube([local_length,local_width,local_height],center=true);
            }
            union(){
                //Main difference
                cube([local_length-TOP_PANEL_THICKNESS*2,local_width-TOP_PANEL_THICKNESS*2,local_height],center=true);
                top_plate_main_fixing_holes(is_explode=0);
            }
        }
    }
}
module top_plate_assembly()
{
    translate([0,-local_width/2-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*3-GAP_MAINSCREWS_HDMI-BASE_OUTERPAD_HDMI,local_height]) rotate([180,0,0]) top_plate();
}
local_length=HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI+SIDE_PANEL_EXTENSION_WIDTH+PILLARS_THICKNESS);
local_width=TOP_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS;
local_height=HDMI_COVER_HEIGHT;
top_plate();
