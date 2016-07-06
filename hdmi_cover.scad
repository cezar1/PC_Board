include <configuration/general.scad>;
use <back_plate.scad>;
include <utils/hex_trap.scad>;
use <utils/pillar.scad>;
layer1_length=163;
layer1_width=98;
layer1_height=1.5;
layer2_length=167;
layer2_width=102;
screw_standard=SCREW_STANDARD_M3;
nut_height=NUT_HEIGHT_M3;
gap_mainscrews=GAP_MAINSCREWS_HDMI;
base_height=HDMI_COVER_HEIGHT;
base_outerpad=BASE_OUTERPAD_HDMI;
trim1_length=5;
trim1_width=5;
base_back_content_height=PILLARS_HEIGHT;
left_size_top=55;
left_size_bottom=100;
join_length=15;
explode=0;
base_length=HDMI_HOLES_LENGTH+2*(screw_standard*3+gap_mainscrews+base_outerpad);
base_width=HDMI_HOLES_WIDTH+2*(screw_standard*3+gap_mainscrews+base_outerpad);
module base_cube()
{
	translate([0,0,base_height/2]) cube(size = [base_length,base_width,base_height], center = true); 
}
module base_screen()
{
	translate([0,0,-HDMI_SHALLOW_BOTTOM_LAYER/2])
	{
		cube(size = [layer1_length,layer1_width,HDMI_SHALLOW_BOTTOM_LAYER], center = true);
	}
	//screen layer 1 cube
	translate([0,0,layer1_height/2])
	{
		translate([0,0,20*explode]) cube(size = [layer1_length,layer1_width,layer1_height], center = true);
		//screen layer 2 cube
		wHeightLayer2=(base_height-layer1_height);
		translate([0,0,layer1_height/2+wHeightLayer2/2+20*explode]) cube(size = [layer2_length,layer2_width,wHeightLayer2], center = true);
	}  
}
module base_trims()
{
	color([0,0,1])
	/*
	translate([HDMI_HOLES_LENGTH/2+screw_standard*2+gap_mainscrews/2+base_outerpad/2+trim1_length/2,HDMI_HOLES_WIDTH/2+screw_standard*2+gap_mainscrews/2+base_outerpad/2+trim1_width/2,base_height/2+7*explode]) cube(size = [trim1_length,trim1_width,base_height], center = true);*/
	translate([0,HDMI_HOLES_WIDTH/2-10,base_height/2+1+7*explode]) cube([35,20,base_height],center=true);
	translate([-HDMI_HOLES_LENGTH/2+72.5,HDMI_HOLES_WIDTH/2-10,base_height/2+7*explode]) cube([18,20,base_height],center=true);
}
module base_traps()
{
	local_nut_height=nut_height+FRONT_COVER_TRAPS_TOLERANCE+HDMI_SHALLOW_BOTTOM_LAYER;
	local_hole_height=base_height-nut_height+FRONT_COVER_TRAPS_TOLERANCE;
	color([0,1,0]){
		translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+0*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([HDMI_HOLES_LENGTH/2+screw_standard*2+gap_mainscrews,-HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([HDMI_HOLES_LENGTH/2,-(HDMI_HOLES_WIDTH/2+screw_standard*2+gap_mainscrews),base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-(HDMI_HOLES_LENGTH/2+screw_standard*2+gap_mainscrews),HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-HDMI_HOLES_LENGTH/2,-(HDMI_HOLES_WIDTH/2+screw_standard*2+gap_mainscrews),base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-HDMI_HOLES_LENGTH/2,-HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-(HDMI_HOLES_LENGTH/2+screw_standard*2+gap_mainscrews),-HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
		translate([-HDMI_HOLES_LENGTH/2,+(HDMI_HOLES_WIDTH/2+screw_standard*2+gap_mainscrews),base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
	}
	//translate([base_length/2-left_size_bottom-join_length/2,-HDMI_HOLES_WIDTH/2-gap_mainscrews,0+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
	//translate([base_length/2-left_size_top-join_length/2,+HDMI_HOLES_WIDTH/2+gap_mainscrews,0+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
}
module base_back()
{
	translate([0,0,base_height+base_back_content_height+explode*70])  
	back_plate();
}
module traps_tunnels_sides()
{
	color([1,0,0]) translate([TOP_PANEL_DIST,5+HDMI_HOLES_WIDTH/2+GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2+BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([-90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([-TOP_PANEL_DIST,5+HDMI_HOLES_WIDTH/2+GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2+BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([-90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([TOP_PANEL_DIST-TOP_PANEL_GAP,5+HDMI_HOLES_WIDTH/2+GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2+BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([-90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([-TOP_PANEL_DIST+TOP_PANEL_GAP,5+HDMI_HOLES_WIDTH/2+GAP_MAINSCREWS_HDMI+SCREW_STANDARD_M3*2+BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([-90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([TOP_PANEL_DIST,-5-HDMI_HOLES_WIDTH/2-GAP_MAINSCREWS_HDMI-SCREW_STANDARD_M3*2-BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([-TOP_PANEL_DIST,-5-HDMI_HOLES_WIDTH/2-GAP_MAINSCREWS_HDMI-SCREW_STANDARD_M3*2-BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([TOP_PANEL_DIST-TOP_PANEL_GAP,-5-HDMI_HOLES_WIDTH/2-GAP_MAINSCREWS_HDMI-SCREW_STANDARD_M3*2-BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([-TOP_PANEL_DIST+TOP_PANEL_GAP,-5-HDMI_HOLES_WIDTH/2-GAP_MAINSCREWS_HDMI-SCREW_STANDARD_M3*2-BASE_OUTERPAD_HDMI,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([90,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*5);
	color([1,0,0]) translate([NUT_HEIGHT_M3*4+HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,SIDE_HOLES_DIST/2,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([NUT_HEIGHT_M3*4+HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-SIDE_HOLES_DIST/2,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([NUT_HEIGHT_M3*4+HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,SIDE_HOLES_DIST/2-SIDE_HOLES_GAP,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([NUT_HEIGHT_M3*4+HDMI_HOLES_LENGTH/2+SCREW_STANDARD_M3*2+GAP_MAINSCREWS_HDMI,-SIDE_HOLES_DIST/2+SIDE_HOLES_GAP,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=180,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);    
	color([1,0,0]) translate([-NUT_HEIGHT_M3*4-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,SIDE_HOLES_DIST/2,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([-NUT_HEIGHT_M3*4-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-SIDE_HOLES_DIST/2,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([-NUT_HEIGHT_M3*4-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,SIDE_HOLES_DIST/2-SIDE_HOLES_GAP,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
	color([1,0,0]) translate([-NUT_HEIGHT_M3*4-HDMI_HOLES_LENGTH/2-SCREW_STANDARD_M3*2-GAP_MAINSCREWS_HDMI,-SIDE_HOLES_DIST/2+SIDE_HOLES_GAP,HDMI_COVER_HEIGHT/2+0*explode]) rotate([0,90,0]) rotate([0,0,0]) hex_hole_exit_tunnel(h_trap=NUT_HEIGHT_M3,h_hole=NUT_HEIGHT_M3*3,r_trap=SCREW_STANDARD_M3,rot=0,l_exit=60,rot_exit=-180,l_tunnel=NUT_HEIGHT_M3*4);
}
module hdmi_plate()
{
	if (explode)
	{
		//base cube
		base_cube();
		base_screen();
		base_traps();
		base_trims();
		//base_back();
	}
	else
	{
		difference()
		{
			//base cube
			base_cube();
			union(){
				translate([0,0,HDMI_SHALLOW_BOTTOM_LAYER]) base_screen();
				translate([0,0,HDMI_SHALLOW_BOTTOM_LAYER]) base_traps();
				translate([0,0,HDMI_SHALLOW_BOTTOM_LAYER]) base_trims();
				traps_tunnels_sides();
			}
		}
	}
}
hdmi_plate();