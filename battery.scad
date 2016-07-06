include <configuration/general.scad>
module battery(clearance){
	union(){
		translate([0,0,BATT_HEIGHT/2]){
			color([0.3,0.3,0.3]) hull(){
				cube([BATT_LENGTH,BATT_INNER_WIDTH,BATT_HEIGHT],center=true);
				cube([BATT_LENGTH,BATT_WIDTH,BATT_INNER_HEIGHT],center=true);
			}
			//Battery frontlight
			translate([BATT_LENGTH/2-18,0,BATT_HEIGHT/2]) color([0.9,0.9,0.9]) cylinder(r=6,h=1,center=true);
			translate([BATT_LENGTH/2-18,0,BATT_HEIGHT/2]) cylinder(r=2.7,h=1.2,center=true);
			//Battery on/off switch
			translate([BATT_LENGTH/2-BATT_PWR_SWITCH_FROM_TOP,-BATT_WIDTH/2,-3.8]) color([0.9,0.9,0.9]) cube([10,1,3],center=true);
			//USB ports
			translate([BATT_LENGTH/2,0,-BATT_HEIGHT/2+USB_PORT_HEIGHT/2+BATT_USB_PORT_FROM_TOP]) color([0.9,0.9,0.9]) cube([1,USB_PORT_WIDTH,USB_PORT_HEIGHT],center=true);
			translate([BATT_LENGTH/2,0,(BATT_HEIGHT/2-BATT_USB_PORT_FROM_TOP)-USB_PORT_HEIGHT/2]) color([0.9,0.9,0.9]) cube([1,USB_PORT_WIDTH,USB_PORT_HEIGHT],center=true);
			//Clearance
			translate([BATT_LENGTH/2+clearance/2,0,0]) color([0.9,0.9,0.9]) cube([clearance,USB_PORT_WIDTH*1.5,USB_PORT_HEIGHT*2.3],center=true);
		}
	}
}
module battery_assembly(clearance,clearance2)
{
	local_length=HDMI_HOLES_LENGTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
	local_width=HDMI_HOLES_WIDTH+2*(SCREW_STANDARD_M3*3+GAP_MAINSCREWS_HDMI+BASE_OUTERPAD_HDMI);
	translate ([-local_length/2-BATT_WIDTH_MAX/2-SIDE_PANEL_ZIPTIE_EXTRA,-BATT_SHIFT_FRONT+local_width/2+BOTTOM_PANEL_EXTENSION_WITDH-BATT_LENGTH/2,0]) rotate([180,0,-90]) battery(clearance=clearance);
}
battery(clearance=10);