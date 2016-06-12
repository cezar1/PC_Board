include <configuration/general.scad>;
use <back_plate.scad>;
include <utils/hex_trap.scad>;


layer1_length=163;
layer1_width=98;
layer1_height=1.5;
layer2_length=167;
layer2_width=102;

screw_standard=SCREW_STANDARD_M3;
nut_height=2.5;

gap_mainscrews=GAP_MAINSCREWS_HDMI;
base_height=7;
base_outerpad=BASE_OUTERPAD_HDMI;
trim1_length=5;
trim1_width=5;

base_back_content_height=0;

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

module base_left1()
{
    translate([base_length/2-left_size_top/2,base_width/2-base_width/4+150*explode,base_height/2]) cube(size = [left_size_top,base_width/2,base_height], center = true); 
    translate([base_length/2-left_size_top-join_length/2,base_width/2-base_width/4+150*explode,nut_height/2]) cube(size = [join_length,base_width/2,nut_height], center = true); 
    
    color([0,0,1])
    translate([base_length/2-left_size_bottom/2,-base_width/2+base_width/4+150*explode,base_height/2]) cube(size = [left_size_bottom,base_width/2,base_height], center = true); 
    color([0,0,1])
    translate([base_length/2-left_size_bottom-join_length/2,-base_width/2+base_width/4+150*explode,nut_height/2]) cube(size = [join_length,base_width/2,nut_height], center = true); 
}

module base_right1()
{
    
    translate([-base_length/2+(base_length/2-left_size_top/2-join_length/2),base_width/2-base_width/4-150*explode,base_height/2]) cube(size = [(base_length-left_size_top-join_length),base_width/2,base_height], center = true); 
    translate([-base_length/2+(base_length-left_size_top)-join_length/2,base_width/2-base_width/4-150*explode,nut_height+(base_height-nut_height)/2]) cube(size = [join_length,base_width/2,base_height-nut_height], center = true); 
    leg_width=2;
    color([0,1,0])
    translate([-base_length/2+(base_length-left_size_top)-leg_width/2,base_width/2-base_width/4-150*explode,nut_height/2]) cube(size = [leg_width,base_width/2,nut_height], center = true); 
    
    
    color([1,0,0])
    translate([-base_length/2+(base_length/2-left_size_bottom/2-join_length/2),-base_width/2+base_width/4-150*explode,base_height/2]) cube(size = [(base_length-left_size_bottom-join_length),base_width/2,base_height], center = true); 
    
    color([1,0,0])
   translate([-base_length/2+(base_length-left_size_bottom)-join_length/2,-base_width/2+base_width/4-150*explode,nut_height+(base_height-nut_height)/2]) cube(size = [join_length,base_width/2,base_height-nut_height], center = true); 
    color([0,1,0])
    translate([-base_length/2+(base_length-left_size_bottom)-leg_width/2,-base_width/2+base_width/4-150*explode,nut_height/2]) cube(size = [leg_width,base_width/2,nut_height], center = true); 
    
    
}

module base_screen()
{
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
    local_nut_height=nut_height+FRONT_COVER_TRAPS_TOLERANCE;
    local_hole_height=base_height-nut_height+FRONT_COVER_TRAPS_TOLERANCE;
    color([0,1,0]){
            translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+0*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
            translate([HDMI_HOLES_LENGTH/2+screw_standard*2+gap_mainscrews,HDMI_HOLES_WIDTH/2,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
            translate([HDMI_HOLES_LENGTH/2,HDMI_HOLES_WIDTH/2+screw_standard*2+gap_mainscrews,base_height+FRONT_COVER_TRAPS_TOLERANCE+50*explode]) hex_hole(h_trap=local_nut_height,h_hole=local_hole_height,r_trap=screw_standard,rot=180);
        
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

module hdmi_plate()
{
    if (explode)
        {
            
            //base cube
            base_cube();
            base_left1();
            base_right1();
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
                    base_screen();
                    base_traps();
                    base_trims();
                    }
                }
                
           //base_back();
        }
    
}
module left_piece()
{
    intersection()
                {
                    hdmi_plate();
                
           base_left1();}
}

module right_piece()
{
    intersection()
                {
                    {
                    hdmi_plate();
                    }
                
           base_right1();}
           
translate([base_length/2-left_size_bottom-join_length/2,-HDMI_HOLES_WIDTH/2-gap_mainscrews,base_height+50*explode]) hex_hole_fill_bottom(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([base_length/2-left_size_top-join_length/2,+HDMI_HOLES_WIDTH/2+gap_mainscrews,base_height+50*explode]) hex_hole_fill_bottom(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
}
//left_piece();
//right_piece();
intersection(){
hdmi_plate();
    translate([base_length/2,base_width/2,0]) cube(50,center=true);
}
