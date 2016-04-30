function make_r_for_screw_standard(r_trap) =
((r_trap==3) ? 3.2 : (r_trap==4) ? 4.2 : r_trap);

module hex_hole(h_trap,h_hole,r_trap,r_hole,rot)
{
    
    
    local_r_trap=make_r_for_screw_standard(r_trap);
    echo(r_trap);
    
    echo(local_r_trap);
    rotate([rot,0,0]) {
translate([0,0,h_hole])
{
	cylinder(h = h_trap, r = local_r_trap, $fn = 6);
}

	cylinder(h = h_hole, r = r_hole, $fn = 20);

}
}
/*
width=18;
length=60;
h_hole=2;
h_trap=4;
r_trap=3;
r_hole=2;
spacer=4;
explode=false;
if (explode)
{
cube(size = [width,length,h_hole+h_trap], center = false);
translate([0,0,10]){
hex_hole(h_trap,h_hole,r_trap,r_hole,width/2,4,0);
hex_hole(h_trap,h_hole,r_trap+1,r_hole,width/2,12,0);
hex_hole(h_trap,h_hole,r_trap+2,r_hole,width/2,22,0);
hex_hole(h_trap,h_hole,r_trap+3,r_hole,width/2,33,0);}
}
else
{
difference() {
cube(size = [width,length,h_hole+h_trap], center = false);
hex_hole(h_trap,h_hole,r_trap-0.5,r_hole,width/2,5,0);
hex_hole(h_trap,h_hole,r_trap,r_hole,width/2,13,0);
hex_hole(h_trap,h_hole,r_trap+1,r_hole,width/2,23,0);
hex_hole(h_trap,h_hole,r_trap+2,r_hole,width/2,36,0);
hex_hole(h_trap,h_hole,r_trap+3,r_hole,width/2,50,0);
}
}

*/