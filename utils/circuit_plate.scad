include <hex_trap.scad>;
include <../configuration/general.scad>;


module traps(base_height,base_hole_height,offset_x)
{
translate([base_length/2,base_width/2,base_height])
hex_hole(base_trap_height,base_hole_height,CIRCUIT_BOARD_SCREWSTANDARD0,180);
translate([base_length/2,-base_width/2,base_height])
hex_hole(base_trap_height,base_hole_height,CIRCUIT_BOARD_SCREWSTANDARD0,180);
translate([-base_length/2,base_width/2,base_height])
hex_hole(base_trap_height,base_hole_height,CIRCUIT_BOARD_SCREWSTANDARD0,180);
translate([-base_length/2,-base_width/2,base_height])
hex_hole(base_trap_height,base_hole_height,CIRCUIT_BOARD_SCREWSTANDARD0,180);
    translate([offset_x,0,0]){
translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT - CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT - CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT - CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_SCREWSTANDARD0,0);
translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
hex_hole(CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT - CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT,CIRCUIT_BOARD_SCREWSTANDARD0,0);}
}
module pillars(base_height,offset_x)
{
    translate([base_length/2,base_width/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=base_height,$fn=50);
    translate([base_length/2,-base_width/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=base_height,$fn=50);
    translate([-base_length/2,base_width/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=base_height,$fn=50);
    translate([-base_length/2,-base_width/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=base_height,$fn=50);
    translate([offset_x,0,0]){
    translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT,$fn=50);
    translate([CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT,$fn=50);
    translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT,$fn=50);
    translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2,-CIRCUIT_BOARD_ADAPTER0_SPACING/2,0])
cylinder(r=CIRCUIT_BOARD_SCREWSTANDARD0*1.7,h=CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT,$fn=50);
    }
}
module box()
{
    
    translate([-base_length/2-base_padding,-base_width/2-base_padding,0])
    cube(size=[base_length+base_padding*2,base_width+base_padding*2,base_trap_height],center=false);
}
module extrusions(offset_x)
{

    difference(){
        translate([-base_length/2+base_padding,-base_width/2+base_padding,0])
        cube(size=[base_length-base_padding*2,base_width-base_padding*2,base_trap_height],center=false);
        union(){
            translate([-CIRCUIT_BOARD_ADAPTER0_SPACING/2-base_padding+offset_x,-CIRCUIT_BOARD_ADAPTER0_SPACING/2-base_padding,0])
            cube(size=[CIRCUIT_BOARD_ADAPTER0_SPACING+base_padding*2,CIRCUIT_BOARD_ADAPTER0_SPACING+base_padding*2,base_trap_height],center=false);
            translate([-base_length/2-base_padding,-CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH/2,0])
            cube(size=[base_length+base_padding*2,CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH,base_trap_height],center=false);
            translate([-base_length/2-base_padding,-CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH/2,0])
            cube(size=[base_length+base_padding*2,CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH,base_trap_height],center=false);
            translate([-CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH/2+offset_x,-base_width/2-base_padding,0])
            cube(size=[CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH,base_width+base_padding*2,base_trap_height],center=false);
        }
    }
}
module circuit_plate(base_length,base_width,base_padding,pcb_thickness,base_trap_height,screw_height)
{
circuit_plate_offset_adapter(base_length,base_width,base_padding,pcb_thickness,base_trap_height,screw_height,0,0);
}
module circuit_plate_offset_adapter(base_length,base_width,base_padding,pcb_thickness,base_trap_height,screw_height,offset_x,offset_y)
{
base_height=screw_height-pcb_thickness;    
base_hole_height=base_height-base_trap_height;

difference(){
    union(){
        box();
        pillars(base_height,offset_x);
        }
    union(){    
        extrusions(offset_x);
        traps(base_height,base_hole_height,offset_x);
    }
}
}