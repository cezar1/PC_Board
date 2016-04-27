include <utils/hex_trap.scad>;

hdmi_length=157;
hdmi_width=108;
layer1_length=161;
layer1_width=97;
layer1_height=1.5;
layer2_length=layer1_length+4;
layer2_width=layer1_width+3;

screw_standard=3;//M3
screw_hole=2;
nut_height=2.5;

gap_mainscrews=2;
base_height=7;
base_outerpad=2;

explode=0;
module base_cube()
{
  color([1,0,0]) translate([0,0,base_height/2]) cube(size = [hdmi_length+2*(screw_standard*3+gap_mainscrews+base_outerpad),hdmi_width+2*(screw_standard+base_outerpad),base_height], center = true);  
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
                    
module base_traps()
{
    color([0,1,0]){
            translate([hdmi_length/2,hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([hdmi_length/2+screw_standard*2+gap_mainscrews,hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([hdmi_length/2,-hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([hdmi_length/2+screw_standard*2+gap_mainscrews,-hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([-hdmi_length/2,hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([-(hdmi_length/2+screw_standard*2+gap_mainscrews),hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([-hdmi_length/2,-hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            translate([-(hdmi_length/2+screw_standard*2+gap_mainscrews),-hdmi_width/2,base_height+50*explode]) hex_hole(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
            }
}
module hdmi_plate()
{
    if (explode)
        {
            
            //base cube
            base_cube();
            base_screen();
            base_traps();
        }
    else
        {
            difference()
                {
                    //base cube
                    base_cube();
                    base_screen();
                    base_traps();
                }
        }
    
}

hdmi_plate();
