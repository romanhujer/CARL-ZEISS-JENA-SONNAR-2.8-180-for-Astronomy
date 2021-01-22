/*[ Plate Parameter ]*/

module swiss_arca(length=120,end_stops = true) {

//length of the plate in mm (38mm for a square plate)
length = 100;//[30:300]

//should there be an grid pattern on top?
top_grid = false;

//how many grid lines per mm?
grid_resolution = 5;

//should there be round corners?
round_corners = false;

//should there be end stops?
end_stops = true;

/*[ Mounting Parameter ]*/
//what screws do you want to mount on the plate: 1/4" or 3/8"?
hole_diameter = 0;//[1:1/4,2:3/8]

//select the mounting design:
hole_design = 0; // [1:Single slit, 2:Double slit, 3:Double slit mixed,4: Center hole, 5: Center hole double slit, 6: Cheese plate, 7: Vertical Slits, 8: Custom example]

/*[ Render Settings ]*/
//detail
$fn = 60;


//------------------ NOTES ------------------
//if you want a really simple plate for other projects use simpleplate(L);
//simpleplate(50);

//for custom mounting designs just place your own slit and hole functions

//render:
plate();

//------------------ Modules ------------------
module plate(){
    difference(){
        union(){
            if(round_corners){
                minkowski(){
                    translate([0,-38/2,0])cube([length-10,38-10,5]);
                    translate([5,5,0])cylinder(5,d=10);
                }
            } else {
                translate([0,-38/2,0])cube([length,38,10]);
            }
            if(end_stops){
                translate([3.25,0,-1])cylinder(6,d=5.5);
                translate([length-3.25,0,-1])cylinder(6,d=5.5);
            }
        }
        //translate([6,-38/2+5,-1.01])cube([length-12,38-10,6.5]);
        
        translate([-.01,32/2,5])rotate([-45,0,0])cube([length+.02,10,10]);
        translate([-.01,-32/2,5])rotate([135,0,0])cube([length+.02,10,10]);
        
        if(top_grid){
            translate([length/2,0,10]){
                rotate([0,0,45])grid_lines();
                rotate([0,0,-45])grid_lines();
            }
        }
        mounting_holes();
}}


module grid_lines(){
    for (i = [0:grid_resolution:(length+38)*0.35]) {
        translate([0,i,0])rotate([45,0,0])cube([length*1.8,0.6,0.6],true);
        translate([0,-i,0])rotate([45,0,0])cube([length*1.8,0.6,0.6],true);
    }
}

module mounting_holes(){
    if(hole_design == 1){ //single slit
        translate([15,0,0])slit(length-15*2);
    } else if (hole_design == 2){ //double slit
        if(length >= 45){
            translate([length-15,0,0])rotate([0,0,180])slit(length/2-15*1.5);
            translate([15,0,0])slit(length/2-15*1.5);
        } else {
            echo("for this design we need at least a length of 45mm");
            translate([15,0,0])slit(length-15*2);
        }
    } else if (hole_design == 3){ //double slit mixed
        if(length >= 45){
            translate([length-15,0,0])rotate([0,0,180])slit_1_4(length/2-15*1.5);
            translate([15,0,0])slit_3_8(length/2-15*1.5);
        } else {
            echo("for this design we need at least a length of 45mm");
            translate([15,0,0])slit(length-15*2);
        }
    } else if (hole_design == 4){ // center hole
        translate([length/2,0,0])slit(0);
    } else if (hole_design == 5){ // center hole double slit
        if(length >= 53){
            translate([length/2,0,0])slit(0);
            translate([length-15,0,0])rotate([0,0,180])slit(length/2-15*1.75);
            translate([15,0,0])slit(length/2-15*1.75);
        } else {
            echo("for this design we need at least a length of 53mm");
            translate([15,0,0])slit(length-15*2);
        }
    } else if (hole_design == 6){ //cheese plate
        if (hole_diameter == 1){
            cheese(7);
        } else {
            cheese(11);
        }
    } else if (hole_design == 7){ //vertical slits
        if (hole_diameter == 1){
            for(i = [0:10:length/2-15-((length/2-15)%10)]) {
                translate([length/2+i,0,0])vertical_slit();
                translate([length/2-i,0,0])vertical_slit();
            }
        } else {
            for(i = [0:12:length/2-15-((length/2-15)%12)]) {
                translate([length/2+i,0,0])vertical_slit();
                translate([length/2-i,0,0])vertical_slit();
            }
        }
    } else if (hole_design == 8){ //custom example
        if(length >= 82){
            custom_example();
        } else {
            echo("for this design we need at least a length of 82mm");
        }
    }
}

module slit(L){
    if (hole_diameter == 1){
        slit_1_4(L);
    } else {
        slit_3_8(L);
    }
}

module vertical_slit(){
    if (hole_diameter == 1){
        vertical_slit_1_4();
    } else {
        vertical_slit_3_8();
    }
}

module slit_1_4(L){
    translate([0,-5/2,0])cube([L,5,12]);
    translate([0,0,0])cylinder(12,d = 6);
    translate([L,0,0])cylinder(12,d = 5);
    
    translate([0,-7/2,9])cube([L,7,2]);
    translate([0,0,9])cylinder(2,d = 7);
    translate([L,0,9])cylinder(2,d = 7);
}

module slit_3_8(L){
    translate([0,-6/2,0])cube([L,6,12]);
    translate([0,0,0])cylinder(12,d = 9);
    translate([L,0,0])cylinder(12,d = 6);
    
    translate([0,-10.5/2,9])cube([L,10.5,2]);
    translate([0,0,9])cylinder(2,d = 10.5);
    translate([L,0,9])cylinder(2,d = 10.5);
}

module vertical_slit_1_4(){
    rotate([0,0,90])translate([-8/2,0,0])slit_1_4(8);
}

module vertical_slit_3_8(){
    rotate([0,0,90])translate([-8/2,0,0])slit_3_8(8);
}


module cheese(S){
    for(i = [0:S:length/2-15-((length/2-15)%S)]) {
        if (i%2 == 0){
            translate([length/2+i,0,0])slit(0);
            translate([length/2-i,0,0])slit(0);
        } else {
            translate([length/2+i,-5.5,0])slit(0);
            translate([length/2+i,5.5,0])slit(0);
            
            translate([length/2-i,-5.5,0])slit(0);
            translate([length/2-i,5.5,0])slit(0);
        }
    }
}

module custom_example(){
        //Places a 3/8" hole in the middle of the plate by making a 0mm long slit
        translate([length/2,0,0])slit_3_8(0);
        
        //Places a 1/4" slit 15mm to the top of the middle with a length reaching to 15mm before the end of the plate
        translate([length/2+15,0,0])slit_1_4(length/2-15*2);
    
        //Places two 1/4" vertical slits 15 and 25mm under the middle
        translate([length/2-15,0,0])vertical_slit_1_4();
        translate([length/2-25,0,0])rotate([0,0,180])vertical_slit_1_4();
        
}

module simpleplate(L){
    difference(){
        translate([0,-38/2,0])cube([L,38,10]);
        translate([-.01,32/2,5])rotate([-45,0,0])cube([L+.02,10,10]);
        translate([-.01,-32/2,5])rotate([135,0,0])cube([L+.02,10,10]);
    }
}
}