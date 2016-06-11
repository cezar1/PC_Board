include <configuration/general.scad>;
module back_plate()
{
    translate ([0,0,BACK_PLATE_THICKNESS/2]){
cube(size = [HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3),HDMI_HOLES_WIDTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI),BACK_PLATE_THICKNESS], center = true);
    translate ([0,0,BACK_PLATE_THICKNESS/2])
    cube([10,10,BACK_PLATE_THICKNESS],center=true);
    }
}
back_plate();