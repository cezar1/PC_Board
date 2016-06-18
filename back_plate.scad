include <configuration/general.scad>;
include <utils/hex_trap.scad>;
use <utils/adapter0.scad>;

module back_plate()
{
    local_length=HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
    local_width=HDMI_HOLES_WIDTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
    translate ([0,0,BACK_PLATE_THICKNESS/2]){
        difference()
        {
            union()
            {
                
                difference(){
                    {
        cube(size = [local_length,local_width,BACK_PLATE_THICKNESS], center = true);
                    }
                    {
            cube([local_length-BACK_PLATE_WALL*2,local_width-BACK_PLATE_WALL*2,BACK_PLATE_THICKNESS],center=true);
                    }
                }
            //translate ([0,0,BACK_PLATE_THICKNESS])
                {
                    intersection()
                    {
                        {
                            cube(size = [local_length,local_width,BACK_PLATE_THICKNESS], center = true);
                        }
                        {
                            union(){
                            cylinder(r=BACK_PLATE_CENTER_BLOB,h=BACK_PLATE_THICKNESS,center=true);
                            rotate([0,0,atan2(local_length,local_width)])
                            cube(size = [BACK_PLATE_WALL,sqrt(local_length*local_length+local_width*local_width),BACK_PLATE_THICKNESS], center = true);
                            rotate([0,0,-atan2(local_length,local_width)])
                            cube(size = [BACK_PLATE_WALL,sqrt(local_length*local_length+local_width*local_width),BACK_PLATE_THICKNESS], center = true);
                            cube(size = [BACK_PLATE_WALL,sqrt(local_length*local_length+local_width*local_width),BACK_PLATE_THICKNESS], center = true);
                            cube(size = [sqrt(local_length*local_length+local_width*local_width),BACK_PLATE_WALL,BACK_PLATE_THICKNESS], center = true); 
                            //Screw blocks 
                            translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }    
                            translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             //2 : - +
                             translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,+HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([-HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             //3 : + -
                             translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             //4 : - -
                             translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             translate([-HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,0]){
                                 cube([SCREW_BLOCK_SIZE,SCREW_BLOCK_SIZE,BACK_PLATE_THICKNESS],center=true);
                             }
                             
                             
                             
                               
                            }
                        }
                    }
                    }
                }
                {
                    
                    //SCREW BLOCK HOLES
                    //1: + +
                    translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                    translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                    //2: - +
                    translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                    translate([-HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0); 
                   //3: + -
                    translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                    translate([HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0); 
                   //4: - -
                    translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-HDMI_HOLES_WIDTH/2,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                    translate([-HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-BACK_PLATE_THICKNESS/2])
                            hex_hole(h_trap=0,h_hole=BACK_PLATE_THICKNESS,r_trap=SCREW_STANDARD_M3,rot=0);  
                                      
                    
                    //SIDE PANELS HOLES
                    translate([local_length/2+0.5,SIDE_HOLES_DIST/2,0]) rotate([0,90,180]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([local_length/2+0.5,SIDE_HOLES_DIST/2-SIDE_HOLES_GAP,0]) rotate([0,90,180]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([local_length/2+0.5,-SIDE_HOLES_DIST/2,0]) rotate([0,90,180]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([local_length/2+0.5,-SIDE_HOLES_DIST/2+SIDE_HOLES_GAP,0]) rotate([0,90,180]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-local_length/2-0.5,SIDE_HOLES_DIST/2,0]) rotate([0,90,0]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-local_length/2-0.5,SIDE_HOLES_DIST/2-SIDE_HOLES_GAP,0]) rotate([0,90,0]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-local_length/2-0.5,-SIDE_HOLES_DIST/2,0]) rotate([0,90,0]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-local_length/2-0.5,-SIDE_HOLES_DIST/2+SIDE_HOLES_GAP,0]) rotate([0,90,0]) rotate([0,0,90]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    //TOP PANELS HOLES
                    translate([TOP_PANEL_DIST,local_width/2+0.5,0]) rotate([90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([TOP_PANEL_DIST-TOP_PANEL_GAP,local_width/2+0.5,0]) rotate([90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-TOP_PANEL_DIST,local_width/2+0.5,0]) rotate([90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-TOP_PANEL_DIST+TOP_PANEL_GAP,local_width/2+0.5,0]) rotate([90,0,0]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([TOP_PANEL_DIST,-local_width/2-0.5,0]) rotate([90,0,180]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([TOP_PANEL_DIST-TOP_PANEL_GAP,-local_width/2-0.5,0]) rotate([90,0,180]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-TOP_PANEL_DIST,-local_width/2-0.5,0]) rotate([90,0,180]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                    translate([-TOP_PANEL_DIST+TOP_PANEL_GAP,-local_width/2-0.5,0]) rotate([90,0,180]) hex_hole(h_trap=NUT_HEIGHT_M3+0.5,h_hole=BACK_PLATE_WALL-NUT_HEIGHT_M3+0.5,r_trap=SCREW_STANDARD_M3,rot=0);
                }
        }
        
    }
    translate([BACK_PLATE_RPI_BOARD_X,BACK_PLATE_RPI_BOARD_Y,0]) {adapter0(BACK_PLATE_ADAPTER0_THICKNESS);translate([0,-BACK_PLATE_RPI_BOARD_Y,BACK_PLATE_THICKNESS/2]) cube([BACK_PLATE_WALL_INNER,local_width*0.42,BACK_PLATE_THICKNESS],center=true);}
    translate([BACK_PLATE_SENSORBOARD_X,BACK_PLATE_SENSORBOARD_Y,0]) {adapter0(BACK_PLATE_ADAPTER0_THICKNESS);translate([0,-BACK_PLATE_SENSORBOARD_Y,BACK_PLATE_THICKNESS/2]) cube([BACK_PLATE_WALL_INNER,local_width*0.42,BACK_PLATE_THICKNESS],center=true);}
    translate([BACK_PLATE_RPI_BOARD_X,-BACK_PLATE_RPI_BOARD_Y,0]) {adapter0(BACK_PLATE_ADAPTER0_THICKNESS);}
    translate([BACK_PLATE_SENSORBOARD_X,-BACK_PLATE_SENSORBOARD_Y,0]) {adapter0(BACK_PLATE_ADAPTER0_THICKNESS);}
      
    
}
back_plate();



