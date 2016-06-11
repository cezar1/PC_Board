include <hex_trap.scad>;
include <../configuration/general.scad>;
module adapter0(height)
{
    local_length=CIRCUIT_BOARD_ADAPTER0_BASE_WIDTH;
    difference()
    {
        union()
        {
        translate([-local_length/2,-local_length/2,0])
        cube([local_length,local_length,height]);
        }
        union()
        {
    translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(0,height,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(0,height,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(0,height,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(0,height,CIRCUIT_BOARD_SCREWSTANDARD0,0);
        }
    }
    
        
        
    
}
adapter0(3);