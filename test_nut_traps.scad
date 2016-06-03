include <utils/hex_trap.scad>;
base_trap_height=4;
base_hole_height=2;
screw_standard0=2;
screw_standard1=2.5;
screw_standard2=3;
screw_standard3=4;
module traps()
{
translate([-14,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard0,0);
translate([-6,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard1,0);
translate([3,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard2,0);
translate([13,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard3,0);
}
module box()
{
    box_length=40;
    box_width=12;
    translate([-box_length/2,-box_width/2,0])
    cube(size=[box_length,box_width,base_hole_height+base_trap_height],center=false);
}
difference(){
box();
traps();
}