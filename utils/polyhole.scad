module polyhole(h, d) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}

x=10;
y=30;
z=5;
explode=true;
if (explode)
{
cube(size = [x,y,z], center = false);
translate([0,0,10]) {color([1,1,0]); cylinder(h = z, r = 1, $fn = 6);}
}