include <common.scad>
module myRPI2_EdgeBoard_Holes() {

//rpi2
//put rpi at the edge of the board, positive x and y direction
//base_length
//base_width
//rpi2_x, rpi2_y denote offset from center point
rpi2_length=85;
rpi2_width=56;
rpi2_holes_length_dist=58;
rpi2_holes_width_dist=49;
rpi2_holes_radius=2.75;

rpi2_x=cG_base_length/2-rpi2_length;
rpi2_y=cG_base_width/2-rpi2_width;
color([1,0,0])
translate([rpi2_x,rpi2_y,cG_explode*cG_explodesize])
{
    //cube([rpi2_length,rpi2_width,50], center=false);
    translate([rpi2_length-32-rpi2_holes_length_dist/2,rpi2_width/2-rpi2_holes_width_dist/2,0])
    {
        cylinder(d=rpi2_holes_radius, h=100, center=true);
        translate([0,rpi2_holes_width_dist,0]) cylinder(d=rpi2_holes_radius, h=100, center=true);
        translate([rpi2_holes_length_dist,rpi2_holes_width_dist,0]) cylinder(d=rpi2_holes_radius, h=100, center=true);
        translate([rpi2_holes_length_dist,0,0]) cylinder(d=rpi2_holes_radius, h=100, center=true);
    }

}
}




module myRPI2_EdgeBoard_Board() {

//rpi2
//put rpi at the edge of the board, positive x and y direction
//base_length
//base_width
//rpi2_x, rpi2_y denote offset from center point
rpi2_length=85;
rpi2_width=56;
rpi2_holes_length_dist=58;
rpi2_holes_width_dist=49;
rpi2_holes_radius=2.75;

rpi2_x=cG_base_length/2-rpi2_length;
rpi2_y=cG_base_width/2-rpi2_width;
color([1,0,0])
    translate([rpi2_x,rpi2_y,cG_base_height+cG_explode*cG_explodesize])
    {
        if (cG_ShowRPI2)
        {
            import("rPi2_01.stl", convexity=3);
        }

    }
}






//myRPI2_EdgeBoard_PosX_PosY(100,100,0,0,1);