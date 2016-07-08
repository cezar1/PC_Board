include <configuration/general.scad>
module antenna_connector_case()
{
    #cube([ANTENNA_CASE_LENGTH,ANTENNA_CASE_WIDTH,ANTENNA_CASE_HEIGHT],center=true);
}
module antenna_connector_head()
{
    translate([ANTENNA_CASE_LENGTH/2-ANTENNA_CONNECTOR_HEIGHT/2,0,0]) rotate([0,90,0]) cylinder(r=ANTENNA_CONNECTOR_RADIUS,h=ANTENNA_CONNECTOR_HEIGHT,center=true,$fn=30);
    local_hex_length=(ANTENNA_CASE_LENGTH-ANTENNA_CONNECTOR_HEIGHT);
    translate([-ANTENNA_CASE_LENGTH/2+(local_hex_length),0,0]) rotate([0,90,0]) hex_hole(h_trap=local_hex_length,h_hole=0,r_trap=SCREW_STANDARD_M6,rot=180);
}
antenna_connector_case();
antenna_connector_head();