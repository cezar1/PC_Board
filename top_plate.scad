$exploded=0;
include <configuration/general.scad>;
module top_plate_main_fixing_blocks()
{
	for (i=[-1,1]){
		translate([i*HDMI_HOLES_LENGTH/2,local_width/2-PILLARS_THICKNESS/2,0]) color([0,0,1]) cube([SCREW_STANDARD_M3*3,SCREW_STANDARD_M3*3,local_height],center=true);
	}
	hole_away_y=local_width/2-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-BASE_OUTERPAD_HDMI-SCREW_STANDARD_M3*3-GAP_MAINSCREWS_HDMI;
	local_extra_y=13;
	color([0,0,1]){
		translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI-SIDE_PANEL_EXTENSION_WIDTH_BATTERY-PILLARS_THICKNESS,hole_away_y+local_extra_y/2,-local_height/4]) cube([PILLARS_THICKNESS,SCREW_STANDARD_M3*3+local_extra_y,local_height/2],center=true);
		translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI+SIDE_PANEL_EXTENSION_WIDTH+PILLARS_THICKNESS,hole_away_y+local_extra_y/2,-local_height/4])  cube([PILLARS_THICKNESS,PILLARS_THICKNESS+local_extra_y,local_height/2],center=true);
	}
}
module top_plate_main_fixing_holes(is_explode)
{
	for (i=[-1,1]){
		translate([i*HDMI_HOLES_LENGTH/2,local_width/2-PILLARS_THICKNESS/2,local_height/2+0.1+is_explode*15]) hex_hole(h_trap=NUT_HEIGHT_M3,h_hole=0,r_trap=SCREW_STANDARD_M3,rot=180);
		translate([i*HDMI_HOLES_LENGTH/2,local_width/2-PILLARS_THICKNESS/2,local_height/2+0.1+is_explode*15]) hex_hole(h_trap=0,h_hole=local_height+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
		translate([i*TOP_PANEL_DIST,-local_width/2-0.1-is_explode*15,0]) rotate([90,0,0])hex_hole(h_trap=0,h_hole=TOP_PANEL_THICKNESS+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
		translate([i*(TOP_PANEL_DIST-TOP_PANEL_GAP),-local_width/2-0.1-is_explode*15,0]) rotate([90,0,0])hex_hole(h_trap=0,h_hole=TOP_PANEL_THICKNESS+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
	}
	translate([-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI-SIDE_PANEL_EXTENSION_WIDTH_BATTERY-PILLARS_THICKNESS,local_width/2-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-BASE_OUTERPAD_HDMI-SCREW_STANDARD_M3*3-GAP_MAINSCREWS_HDMI,local_height/2+0.1+is_explode*15]) hex_hole(h_trap=0,h_hole=local_height+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
	translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI+SIDE_PANEL_EXTENSION_WIDTH+PILLARS_THICKNESS,local_width/2-PILLARS_THICKNESS-TOP_PANEL_EXTENSION_WITDH-BASE_OUTERPAD_HDMI-SCREW_STANDARD_M3*3-GAP_MAINSCREWS_HDMI,local_height/2+0.1+is_explode*15]) hex_hole(h_trap=0,h_hole=local_height+0.2+is_explode*30,r_trap=SCREW_STANDARD_M3,rot=180);
}
module top_plate_pcb_do_holes()
{
	if (mode==PCB_MODE_SYMMETRIC_HOLES)
	{
		for (j=[-1,1]){
			for (i=[-1,1]){
				translate([i*holes_length_dist/2,j*holes_width_dist/2,thickness/2+0.1+EXPLODE_LENGTH1/2*is_explode]) hex_hole(h_trap=0,h_hole=thickness+0.2+is_explode*EXPLODE_LENGTH1,r_trap=SCREW_STANDARD_M2,rot=180);
			}
		}
	}
    if (mode==PCB_MODE_SHIFTED_FROM_TOP_HOLES)
	{
		for (j=[-1,1]){
			for (i=[-1,1]){
				translate([i*holes_length_dist/2,j*holes_width_dist/2+PCB_CAMERA_WIDTH/2-holes_width_dist/2-SCREW_STANDARD_M2/2-PCB_CAMERA_HOLES_FROM_TOP,thickness/2+0.1+EXPLODE_LENGTH1/2*is_explode]) hex_hole(h_trap=0,h_hole=thickness+0.2+is_explode*EXPLODE_LENGTH1,r_trap=SCREW_STANDARD_M2,rot=180);
			}
		}
	}
}
module top_plate_pcb_do_traps()
{
	if (mode==PCB_MODE_SYMMETRIC_HOLES)
	{
		for (j=[-1,1]){
			for (i=[-1,1]){
				translate([i*holes_length_dist/2,j*holes_width_dist/2,thickness/2+0.1+EXPLODE_LENGTH1/2*is_explode]) hex_hole(h_trap=thickness/2+0.2+is_explode*EXPLODE_LENGTH1,h_hole=thickness/2+0.2,r_trap=SCREW_STANDARD_M2,rot=180);
			}
		}
	}
    if (mode==PCB_MODE_SHIFTED_FROM_TOP_HOLES)
	{
		for (j=[-1,1]){
			for (i=[-1,1]){
				translate([i*holes_length_dist/2,j*holes_width_dist/2+PCB_CAMERA_WIDTH/2-holes_width_dist/2-SCREW_STANDARD_M2/2-PCB_CAMERA_HOLES_FROM_TOP,-HDMI_COVER_HEIGHT/2-0.1+EXPLODE_LENGTH1/2*is_explode]) rotate([180,0,0]) hex_hole(h_trap=thickness/2+0.1+is_explode*EXPLODE_LENGTH1,h_hole=thickness/2+0.1,r_trap=SCREW_STANDARD_M2,rot=180);
			}
		}
	}
}
module top_plate_pcb_with_holes(mode,length,width,thickness,holes_length_dist,holes_width_dist,holes_standard)
{
	is_explode=0;
	if (is_explode==1){
		top_plate_pcb_do_holes(is_explode=is_explode,mode=mode,holes_length_dist=holes_length_dist,holes_width_dist=holes_width_dist,holes_standard=holes_standard,thickness=thickness);
	}
	
	difference(){
		union()
		{
			translate ([0,0,-0.2]) cube([length,width,thickness],center=true);
		}
		top_plate_pcb_do_holes(is_explode=is_explode,mode=mode,holes_length_dist=holes_length_dist,holes_width_dist=holes_width_dist,holes_standard=holes_standard,thickness=thickness);
	}
}
module top_plate_pcb_leg(offset_X)
{
	translate ([offset_X,0,-HDMI_COVER_HEIGHT/2+TOP_PLATE_PCB_PUSH_LIFT/2]) cube([SCREW_STANDARD_M2*4,local_width,TOP_PLATE_PCB_PUSH_LIFT],center=true);
}
module top_plate_pcb__leg_trap(offset_X)
{
	for (i=[-1,1]){
		translate([offset_X,i*local_width/3,-HDMI_COVER_HEIGHT/2+TOP_PLATE_PCB_PUSH_LIFT+0.1+EXPLODE_LENGTH1/2*is_explode]) hex_hole(h_trap=TOP_PLATE_PCB_PUSH_LIFT/2+0.2+is_explode*EXPLODE_LENGTH1,h_hole=TOP_PLATE_PCB_PUSH_LIFT/2,r_trap=SCREW_STANDARD_M2,rot=180);
	}
}

module top_plate_pcb_camera_assembly()
{
    translate([-TOP_PANEL_DIST,0,-HDMI_COVER_HEIGHT/2-PCB_CAMERA_THICKNESS/2]) color([0,1,0])
	top_plate_pcb_with_holes(mode=PCB_MODE_SHIFTED_FROM_TOP_HOLES,length=PCB_CAMERA_LENGTH,width=PCB_CAMERA_WIDTH,thickness=PCB_CAMERA_THICKNESS,holes_length_dist=PCB_CAMERA_HOLES_LENGTH,holes_width_dist=PCB_CAMERA_HOLES_WIDTH,holes_standard=SCREW_STANDARD_M2);
    
	difference(){
		union(){
			for(i=[-1,1]){
				top_plate_pcb_leg(offset_X=-TOP_PANEL_DIST+i*PCB_CAMERA_HOLES_LENGTH/2);}
		}
		union(){
			translate([-TOP_PANEL_DIST,0,0])  top_plate_pcb_do_traps(is_explode=0,mode=PCB_MODE_SHIFTED_FROM_TOP_HOLES,holes_length_dist=PCB_CAMERA_HOLES_LENGTH,holes_width_dist=PCB_CAMERA_HOLES_WIDTH,holes_standard=SCREW_STANDARD_M2,thickness=TOP_PLATE_PCB_PUSH_LIFT);
		}
	}
}
module top_plate_pcbs(){
	//PCB full
	PCB_FULL_RIGHT_OFFSET1=15;
	PCB_FULL_RIGHT_OFFSET2=42;
    
    PCB_FULL_LEFT_OFFSET1=-18;
	PCB_FULL_LEFT_OFFSET2=-70;
    PCB_FULL_LEFT_OFFSET3=-90;
	PCB_FULL_LEFT_OFFSET4=-140;
	difference(){
		union(){
            top_plate_pcb_leg(offset_X=PCB_FULL_LEFT_OFFSET1);
			top_plate_pcb_leg(offset_X=PCB_FULL_LEFT_OFFSET2);
            top_plate_pcb_leg(offset_X=PCB_FULL_LEFT_OFFSET3);
			top_plate_pcb_leg(offset_X=PCB_FULL_LEFT_OFFSET4);
			top_plate_pcb_leg(offset_X=PCB_FULL_RIGHT_OFFSET1);
			top_plate_pcb_leg(offset_X=PCB_FULL_RIGHT_OFFSET2);
		}
		union(){
            top_plate_pcb__leg_trap(offset_X=PCB_FULL_LEFT_OFFSET1,is_explode=0);
			top_plate_pcb__leg_trap(offset_X=PCB_FULL_LEFT_OFFSET2,is_explode=0);
            top_plate_pcb__leg_trap(offset_X=PCB_FULL_LEFT_OFFSET3,is_explode=0);
			top_plate_pcb__leg_trap(offset_X=PCB_FULL_LEFT_OFFSET4,is_explode=0);
			top_plate_pcb__leg_trap(offset_X=PCB_FULL_RIGHT_OFFSET1,is_explode=0);
			top_plate_pcb__leg_trap(offset_X=PCB_FULL_RIGHT_OFFSET2,is_explode=0);
		}
	}
	//PCB pushbutton
	translate([local_length_right-PCB_PUSHBUTTON_LENGTH/2-TOP_PANEL_THICKNESS,PCB_PUSHBUTTON_WIDTH/2-local_width/2+TOP_PANEL_THICKNESS,PCB_PUSHBUTTON_THICKNESS/2-HDMI_COVER_HEIGHT/2+TOP_PLATE_PCB_PUSH_LIFT]) color([0,1,0]) 
	top_plate_pcb_with_holes(mode=PCB_MODE_SYMMETRIC_HOLES,length=PCB_PUSHBUTTON_LENGTH,width=PCB_PUSHBUTTON_WIDTH,thickness=PCB_PUSHBUTTON_THICKNESS,holes_length_dist=PCB_PUSHBUTTON_HOLES_LENGTH,holes_width_dist=PCB_PUSHBUTTON_HOLES_WIDTH,holes_standard=SCREW_STANDARD_M2);
	//PCB supports
	translate([local_length_right-PCB_PUSHBUTTON_LENGTH/2-TOP_PANEL_THICKNESS,0,0]){
		difference(){
			union(){
				top_plate_pcb_leg(offset_X=-PCB_PUSHBUTTON_HOLES_LENGTH/2);
				top_plate_pcb_leg(offset_X=PCB_PUSHBUTTON_HOLES_LENGTH/2);
			}
			translate([0,PCB_PUSHBUTTON_WIDTH/2-local_width/2+TOP_PANEL_THICKNESS,-HDMI_COVER_HEIGHT/2+TOP_PLATE_PCB_PUSH_LIFT/2]) top_plate_pcb_do_traps(is_explode=0,mode=PCB_MODE_SYMMETRIC_HOLES,holes_length_dist=PCB_PUSHBUTTON_HOLES_LENGTH,holes_width_dist=PCB_PUSHBUTTON_HOLES_WIDTH,holes_standard=SCREW_STANDARD_M2,thickness=TOP_PLATE_PCB_PUSH_LIFT);
		}
	}
	//PCB camera
    top_plate_pcb_camera_assembly();
    
		
    
}
module top_plate_center_join()
{
	for(i=[-1,1]){
		color([0,1,0]) translate([TOP_PANEL_THICKNESS+0.05,i*local_width/3.5,0]) rotate([0,90,0]) rotate([0,0,90]) hex_hole(h_trap=TOP_PANEL_THICKNESS+0.1,h_hole=TOP_PANEL_THICKNESS+0.1,r_trap=SCREW_STANDARD_M3,rot=180);
	}
}
module top_plate()
{
	translate([0,0,local_height/2])
	{
		//SANDBOX
		if (exploded==1){
			color([0,1,0]) top_plate_main_fixing_holes(is_explode=1);        top_plate_center_join();    
		}
		//translate([local_length_right/2,0,0]) cube([TOP_PANEL_THICKNESS*2,local_width,local_height],center=true);
		difference(){
			union(){
				translate([-local_length_left/2,0,0]) cube([local_length_left,local_width,local_height],center=true);
				translate([local_length_right/2,0,0]) cube([local_length_right,local_width,local_height],center=true);
			}
			union(){
				//Main difference
				translate([-local_length_left/2,0,0]) cube([local_length_left-TOP_PANEL_THICKNESS*2,local_width-TOP_PANEL_THICKNESS*2,local_height+0.1],center=true);
				translate([local_length_right/2,0,0]) cube([local_length_right-TOP_PANEL_THICKNESS*2,local_width-TOP_PANEL_THICKNESS*2,local_height+0.1],center=true);
				top_plate_main_fixing_holes(is_explode=0);
				top_plate_center_join();
			}
		}
		difference(){
			top_plate_main_fixing_blocks();
			top_plate_main_fixing_holes(is_explode=0);
		}
		top_plate_pcbs();
	}
}
module top_plate_left()
{
	temp=0;
	intersection(){
		translate([-local_length_left/2,temp,local_height/2]) #cube([local_length_left,local_width*3,local_height],center=true);
		top_plate();
	}
}
module top_plate_right()
{
	temp=0;
	intersection(){
		translate([local_length_right/2,temp,local_height/2]) #cube([local_length_right,local_width*3,local_height],center=true);
		top_plate();
	}
}
module top_plate_test_pcb_assembly()
{
	temp=0;
	intersection(){
        shrink=5;
		translate([-50,3,local_height/2-shrink/2]) #cube([29,30,local_height-shrink],center=true);
        union(){
            translate([0,0,local_height/2]) top_plate_pcb_camera_assembly();
            translate([-50,17,TOP_PLATE_PCB_PUSH_LIFT/2]) cube([30,10,TOP_PLATE_PCB_PUSH_LIFT],center=true);
            translate([-50,-13,TOP_PLATE_PCB_PUSH_LIFT/2]) cube([30,10,TOP_PLATE_PCB_PUSH_LIFT],center=true);
        }
	}
    
}
module top_plate_assembly()
{
	translate([0,-local_width/2-HDMI_HOLES_WIDTH/2-SCREW_STANDARD_M3*3-GAP_MAINSCREWS_HDMI-BASE_OUTERPAD_HDMI,local_height]) rotate([180,0,0]) top_plate();
}
local_length_left=HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH_BATTERY;
local_length_right=HDMI_HOLES_LENGTH/2+(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI)+PILLARS_THICKNESS+SIDE_PANEL_EXTENSION_WIDTH;
local_width=TOP_PANEL_EXTENSION_WITDH+PILLARS_THICKNESS;
local_height=HDMI_COVER_HEIGHT;

//top_plate();
top_plate_left();
//top_plate_right();
//top_plate_test_pcb_assembly();