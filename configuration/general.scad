include <../utils/hex_trap.scad>;
use <../utils/adapter0.scad>;
EXPLODE=0;
exploded = $exploded == undef ? 0 : $exploded; // 1 for exploded view

//Screw standards
SCREW_STANDARD_M3=3;
NUT_HEIGHT_M3=2.5;

//HDMI screen cover
HDMI_HOLES_LENGTH=157;
HDMI_HOLES_WIDTH=108;
GAP_MAINSCREWS_HDMI=3;
BASE_OUTERPAD_HDMI=2;
FRONT_COVER_TRAPS_TOLERANCE=0.1;
HDMI_COVER_HEIGHT=8;
HDMI_SHALLOW_BOTTOM_LAYER=1;//very thin layer at the front of the hdmi cover

//Battery
BATT_LENGTH=155;
BATT_WIDTH=41;
BATT_INNER_WIDTH=25;
BATT_HEIGHT=23.5;
BATT_INNER_HEIGHT=15;
BATT_PWR_SWITCH_FROM_TOP=17.5;
BATT_USB_PORT_FROM_TOP=4.3;

//Side plates
SIDE_HOLES_DIST=75;
SIDE_HOLES_GAP=20;
SIDE_PANEL_EXTENSION_WIDTH=30;
SIDE_PANEL_ZIPTIE_EXTRA=4;//on each side of the battery
SIDE_PANEL_EXTENSION_WIDTH_BATTERY=BATT_WIDTH+SIDE_PANEL_ZIPTIE_EXTRA*2;   
SIDE_PANEL_BATT_EXTRA_TOP=20;
//Back plate
BACK_PLATE_CENTER_BLOB=8;
BACK_PLATE_WALL=5;
BACK_PLATE_WALL_INNER=2.5;
BACK_PLATE_THICKNESS=9;
SCREW_BLOCK_SIZE=12;
BACK_PLATE_SENSORBOARD_X=40;
BACK_PLATE_SENSORBOARD_Y=10;
BACK_PLATE_RPI_BOARD_X=-40;
BACK_PLATE_RPI_BOARD_Y=10;
BACK_PLATE_ADAPTER0_THICKNESS=3;
BACK_PLATE_ADAPTER0_SPACING=100;
BACK_PLATE_SENSORBOARD_X=40;
BACK_PLATE_SENSORBOARD_Y=10;

//ZIP TIES
ZIPTIE_WIDTH=4;
ZIPTIE_HEIGHT=1.6;
ZIPTIE2_WIDTH=5;
ZIPTIE_LENGTH1=30;
ZIPTIE_LENGTH2=10;
ZIPTIE_LENGTH3=15;
ZIPTIE_LENGTH4=20;
ZIPTIE_SIDE_DIST1=7;
ZIPTIE_SIDE_DIST2=28;
ZIPTIE_SIDE_DIST3=45;
ZIPTIE_TB_DIST1=7;
ZIPTIE_TB_DIST2=38;
ZIPTIE_TB_DIST3=64;
ZIPTIE_MID_DIST1=14;
ZIPTIE_MID_DIST2=77;
ZIPTIE_MID_DIST3=85;
ZIPTIE_MID_VERT_DIST1=10;
ZIPTIE_MID_VERT_DIST2=20;
ZIPTIE_MID_VERT_DIST3=30;
ZIPTIE_MID_VERT_DIST4=40;
ZIPTIE_MID_VERT_DIST5=50;
ZIPTIE_MID_VERT_DIST6=60;
ZIPTIE_DIAG_DIST1=15;
ZIPTIE_DIAG_DIST2=40;
ZIPTIE_DIAG_DIST3=75;
ZIPTIE_DIAG_DIST4=90;


//PILLARS
PILLARS_HEIGHT=50;
PILLARS_THICKNESS=BASE_OUTERPAD_HDMI+SCREW_STANDARD_M3*2+2;
PILLARS_THICKNESS2=5;
PILLARS_BOTTOM_OFFSET_X=0;
PILLARS_BOTTOM_OFFSET_Y=0;
PILLARS_TOP_OFFSET_X=0;
PILLARS_TOP_OFFSET_Y=0;
PILLARS_SMALL_WALL_CONFIG_DEFAULT=1;
PILLARS_SMALL_WALL_CONFIG_BATTERY=2;
//Top panels
TOP_PANEL_DIST=50;
TOP_PANEL_GAP=25;
TOP_PANEL_EXTENSION_WITDH=30;
TOP_PANEL_THICKNESS=5;



//General connectors
USB_PORT_WIDTH=15;
USB_PORT_HEIGHT=6.7;

//Adapter0
CIRCUIT_BOARD_SCREWSTANDARD0=2;
CIRCUIT_BOARD_ADAPTER0_SPACING=10;
CIRCUIT_BOARD_ADAPTER0_SCREW_HEIGHT=6-BACK_PLATE_ADAPTER0_THICKNESS;
CIRCUIT_BOARD_ADAPTER0_SCREW_TRAP_HEIGHT=1.6;
CIRCUIT_BOARD_ADAPTER0_PLUS_WIDTH=5;
CIRCUIT_BOARD_ADAPTER0_BASE_WIDTH=CIRCUIT_BOARD_ADAPTER0_SPACING+10;