include <utils/hex_trap.scad>;
base_trap_height=2;
base_hole_height=2;
screw_standard0=2;
screw_standard1=3;
screw_standard2=4;
module traps()
{
translate([-10,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard0,0);
hex_hole(base_trap_height,base_hole_height,screw_standard1,0);
translate([10,0,0])
hex_hole(base_trap_height,base_hole_height,screw_standard2,0);
}
traps();
