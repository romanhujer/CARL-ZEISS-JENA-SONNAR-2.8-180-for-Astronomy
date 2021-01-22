

include  <parametric-spur-gear.scad>

include <Gear_GT2.scad>;


translate([0,0.8*101/2+0.8*30/2,0]) {
translate([0,0,1.5])gearGT2(20);
 EvGerar(0.8, 30, 7);}
#rotate([0,0,1])EvGerar(0.8, 101, 7);

cylinder(h=5, r=41, center=true, $fn=360); 
 