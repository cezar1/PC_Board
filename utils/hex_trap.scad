
module hex_hole(h_trap,h_hole,r_trap,r_hole,x,y,z)
{
translate([x,y,z+h_hole])
{
	cylinder(h = h_trap, r = r_trap, $fn = 6);
}
translate([x,y,z])
{
	cylinder(h = h_hole, r = r_hole, $fn = 20);
}
}

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

