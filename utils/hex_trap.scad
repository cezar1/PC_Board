function make_r_for_screw_standard(r_trap) =
((r_trap==2) ? 2.2 : (r_trap==2.5) ? 2.5 : (r_trap==3) ? 3.4 : (r_trap==4) ? 4.2 : r_trap);
//Utimaker 2 @ ESOC
//((r_trap==2) ? 2.2 : (r_trap==2.5) ? 2.5 : (r_trap==3) ? 3.2 : (r_trap==4) ? 4.2 : r_trap);

function make_r_hole_for_screw_standard(r_trap) =
((r_trap==2) ? 1.1 : (r_trap==2.5) ? 1.5 : (r_trap==3) ? 1.8 : (r_trap==4) ? 2.5 : r_trap);
//Ultimaker2 @ ESOC
//((r_trap==2) ? 1.5 : (r_trap==2.5) ? 2 : (r_trap==3) ? 2 : (r_trap==4) ? 2.5 : r_trap);

module hex_hole(h_trap,h_hole,r_trap,rot)
{
    
    echo("hex_hole h_trap[",h_trap,"]");
    echo("hex_hole h_hole[",h_hole,"]");
    local_r_trap=make_r_for_screw_standard(r_trap);
    echo("hex_hole r_trap[",r_trap,"]");
    local_r_hole=make_r_hole_for_screw_standard(r_trap);
    echo("hex_hole local_r_hole[",local_r_hole,"]");
    
    rotate([rot,0,0]) {
translate([0,0,h_hole])
{
	cylinder(h = h_trap, r = local_r_trap, $fn = 6);
}

	cylinder(h = h_hole, r = local_r_hole, $fn = 20);

}
}
module hex_hole_exit(h_trap,h_hole,r_trap,rot,l_exit,rot_exit)
{
    hex_hole(h_trap,h_hole,r_trap,rot);
    rotate([rot,0,0]) translate([0,r_trap,h_hole]) rotate([0,0,rot_exit]) cube([l_exit,r_trap*2,h_trap]);
    
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
