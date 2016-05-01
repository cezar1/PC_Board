function make_r_for_screw_standard(r_trap) =
((r_trap==3) ? 3.2 : (r_trap==4) ? 4.2 : r_trap);

module hex_hole(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    
    
    
    rotate([rot,0,0]) {
translate([0,0,h_hole])
{
	cylinder(h = h_trap, r = local_r_trap, $fn = 6);
}

	cylinder(h = h_hole, r = r_hole, $fn = 20);

}
}
module hex_hole_fill_bottom(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    
    
    
    rotate([rot,0,0]) {
translate([0,0,h_hole-0.3])
{
	cylinder(h = 0.3, r = local_r_trap, $fn = 6);
}

	

}
}
module hex_hole_fill_top(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    rotate([rot,0,0]) {


	cylinder(h = 0.3, r = r_hole, $fn = 20);

}
}
/*
nut_height=2.5;
base_height=7;
screw_standard=3;
screw_hole=2;
hex_hole_fill_bottom(nut_height,base_height-nut_height,screw_standard,screw_hole,180);
*/