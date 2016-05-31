function make_r_for_screw_standard(r_trap) =
((r_trap==2) ? 2.2 : (r_trap==3) ? 3.2 : (r_trap==4) ? 4.2 : r_trap);

function make_r_hole_for_screw_standard(r_trap) =
((r_trap==2) ? 1 : (r_trap==3) ? 1.5 : (r_trap==4) ? 2 : r_trap);

module hex_hole(h_trap,h_hole,r_trap,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    local_r_hole=make_r_hole_for_screw_standard(r_trap);
    
    
    rotate([rot,0,0]) {
translate([0,0,h_hole])
{
	cylinder(h = h_trap, r = local_r_trap, $fn = 6);
}

	cylinder(h = h_hole, r = local_r_hole, $fn = 20);

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
