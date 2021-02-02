/* 
   Samyang    2.0/85  holder

   Copyright (c) 2020, 2021 Roman Hujer   http://hujer.net

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,ss
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

  Description: 

*/

include <EAFx.scad>; 

include <asiair.scad>; 
include <Gear_GT2.scad>; 
include <parametric-spur-gear.scad>


FINDER=0;
GEAR=0;
LISTA=0;
LISTA2=0;
KRUH_Z=0;
KRUH_P=0;
EAF=0;
EAF_H=0;
CAP=0;
KNOB=0;
SUP=0;
SUP2=0;
ASIAIR=0;
ARCA=0;
ARC_PATKA = 1;

module arcaplate(L){
    difference(){
        translate([0,-38/2,0])cube([L,38,10]);
        translate([-.01,32/2,5])rotate([-45,0,0])cube([L+.02,10,10]);
        translate([-.01,-32/2,5])rotate([135,0,0])cube([L+.02,10,10]);
    }
}

module arcaplate2(L){
    difference(){
        translate([0,-41/2,0])cube([L,41,10]);
        translate([-.01,32/2,5])rotate([-45,0,0])cube([L+.02,10,10]);
        translate([-.01,-32/2,5])rotate([135,0,0])cube([L+.02,10,10]);
    }
}



module dovetail(width=44, angle=15, length=100,height=10, flatend=1) { 
	difference(){
	scale([length/width*2,1,1])
   rotate([0,0,45])
   cylinder(height,width/2*sqrt(2),sqrt(2)/2*width*cos(angle*2),$fn=4);
//		echo(width/2*cos(angle*2));
//		echo(width/2*cos(angle));
		if (flatend!=0) {
			translate([-length/2-length, -width-1,-1])
			{
				cube([length,width*2+2,height+2]);
			}
			translate([length/2,-width-1,-1]){
				cube([length, width*2+2, height+2]);
			}
		}
	}
}

module M3_dira_a(){
rv2=5.8;
hm = 2.7;
 
  union(){  
cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6);
cylinder(h=20, r=3/2, center=false, $fn=360);
translate([0,0,11 ])cylinder(h=10, r=3.3/2, center=false, $fn=360);
  }
}


module M3_dira_b(){
rv2=5.8;
hm = 2.7;
    
 rotate ([90,0,0]) rotate ([0,0,90]) union(){  
translate([0,0,10 ]) cylinder(h=hm, r=rv2/sqrt(3), center=true, $fn=6);
cylinder(h=20, r=3.2/2, center=false, $fn=360);
translate([10,0,10 ])cube([20,rv2,hm], center=true);     
  }
}





module M8_dira_a(){
 
 rv2=13.1;
 hm = 6.8;
    
 union(){  
  cylinder(h=hm, r=rv2/sqrt(3), center=true, $fn=6);
  translate([10,0,0 ])cube([20,rv2,hm], center=true);
  cylinder(h=32, r=4.2, center=true, $fn=360);
 }
}


module kladka(){
   union(){
   cylinder(h=6, r=6.25, center=true, $fn=360);
   translate([0,0,-45 ]) cylinder(h=50,r=2.25, center=false, $fn=360);    
   translate([0,0,0 ]) cylinder(h=15,r=2.25, center=false, $fn=360);        
}   
    
}


module M4_imbus_B(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
  }
}
}



module M4_imbus_D(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=35, r=4.2/2, center=false, $fn=360);
 translate([0,0,20.5 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
  }
}
}

module M4_imbus_C(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      
  }
}
}





module finder_patka(L=30) {

difference(){
  
    dovetail(width=48,length=L, height=17, angle=20);

 translate([0,0, 8 ] ) {    
dovetail(width=33,length=L, height=9, angle=20);
translate([-L/2,-16.5, -1] )cube([L,33 ,1]);  
     

}
translate([0,-7.75, 9.2 ] )  rotate ([-20,0,0] ) M3_dira_b();     

}
}


module objimka_zadni() {
 
difference(){
  union(){  
      
 translate([-10,-55,0 ]) cube([ 20, 2*55, 12]); 
 cylinder(h=12, r=46, center=false, $fn=360);
 translate([-63,-19,0 ])cube([20,38 ,12]);     
 translate([30,-20,0 ]) cube([22,40 ,12]);     

 
  }
 {
  cylinder(h=12, r=72/2, center=false, $fn=360);
  cylinder(h=8, r=76/2, center=false, $fn=360);
  translate([-2,-55,0 ]) cube([ 4, 2*55, 12]);
  translate([-10.1,50,6]) rotate ([0,90,0])M3_dira_a();     
  translate([-10.1,-50,6]) rotate ([0,90,0])M3_dira_a();        
  
     
 }    
}

}

module M5_imbus_A(){
 rv2=8.2+0.4;
 hm = 4.2;

 union(){  
 translate([0,0,-0.5 ]) cylinder(h=5.7, r=8.5/2, center=false, $fn=360);
 cylinder(h=40, r=5.2/2, center=false, $fn=360);
 translate([0,0,34 ])    union(){  
      cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6, center=true);
      translate([7.5,0,0 ]) cube([15,rv2,hm], center=true);
  }
}
}




module objimka_predni() {

difference(){
 union(){  
 translate([-10,-62,0 ]) cube([ 20, 2*62, 12]); 
 cylinder(h=12, r=50, center=false, $fn=360);
 translate([-63,-19,0 ])cube([20,38 ,12]);     
 translate([30,-20,0 ]) cube([22,40 ,12]);     
   }
 {
  cylinder(h=15, r=76/2, center=false, $fn=360);
  translate([-3,0,0 ]) cube([ 6,70, 15]);
  translate([-10.1,55, 6]) rotate ([0,90,0])M3_dira_a();        
     

   
  }    
}
}





module EAF_Holder() {
difference() {                
   union() { 
    translate([-25,-25,6 ]) cube([ 50, 15, 1]); 
    translate([-25,-96,7 ]) cube([ 50, 73, 13]); 
    difference() {            
        union() {
            translate([-25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
            translate([ 25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
        }   
        union() {  
            translate([ 25,-36, 7 ]) cube([ 13, 26, 13]); 
            translate([-38,-36, 7 ]) cube([ 13, 26, 13]); 
        }
    } 
   } 
   union () {
       translate([-25,  -102,7 ]) cube([ 4.5, 77, 13]); 
       translate([ 20.5,-102,7 ]) cube([ 4.5, 77, 13]); 
       
       translate([-30,-64, 14 ]) rotate ([0,90,0]) cylinder(h=60, r=2, center=false, $fn=360);   //Sroub
       
       translate([-36.5,-64, 14 ]) rotate ([0,90,0]) M4_imbus_B();
       translate([36.5,-64, 14 ]) rotate ([0,0,180]) rotate ([0,90,0]) M4_imbus_B();
       
       translate([0,-57, 7 ]) cylinder(h=13, r=12, center=false, $fn=360);  
       translate([ -12,-57.5, 7 ]) cube([ 24, 49, 13]); 
       
       translate([ -12.7,-90.5, 7 ]) cube([ 7.4, 18, 5]); 
       translate([   5.3,-90.5, 7 ]) cube([ 7.4, 18, 5]); 
       translate([  9,-72.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([  9,-90.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([ -9,-72.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       translate([ -9,-90.5, 7 ]) cylinder(h=5, r=3.7, center=false, $fn=360);  
       
   }    
  } 
}    


module focus_gear(zuby=101) {
 rotate([180,0,0]) translate([0,0.8*zuby/2+0.8*30/2,0]) 
 difference() {
  union() {   
   translate([0,0,1.5])gearGT2(30);
   EvGerar(0.8, 30, 7);
   translate([0,0,19]) cylinder(h=1, r=11, center=false, $fn=360);        
  } 
  union(){
    cylinder(h=5, r=5.8, center=false, $fn=360);     
    translate([0,0,11])    cylinder(h=10, r=5.8, center=false, $fn=360);     
    cylinder(h=30, r=3.2, center=false, $fn=360);       
      
 } 
  
} 
}

if (  FINDER == 1  ) {
   h=48;
 
difference() {
union(){    
translate([62,0, h+14] )  rotate ([0,90,0]) finder_patka(L=30);    
translate([52,-20, h-12] ) cube([10,40,52]);  
}    
{    
translate([62,13.5, h-6 ] ) rotate ([0,-90, 0] )  M4_imbus_B();
translate([62,-13.5, h-6 ] ) rotate ([0,-90,0] )  M4_imbus_B();
translate([62,13.5, h+34 ] ) rotate ([0,-90, 0] ) rotate ([0,0,180])M4_imbus_B();
translate([62,-13.5, h+34 ] ) rotate ([0,-90,0] ) rotate ([0,0,180]) M4_imbus_B();

translate([60,-30, h-12] ) cube([20,10,52]);      
translate([60,20, h-12] ) cube([20,10,52]);          
    
}   
}    
    
}
 
if ( KRUH_Z == 1  ) {
    h=48;

 difference() { 
translate([0,0, 48] ) rotate ([180,0,0] ) objimka_zadni();  
{     
translate([-78,13.5, h-6] )  rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, h-6] )  rotate ([-90,0,-90] )M4_imbus_B();

translate([66,13.5, h-6 ] ) rotate ([0,-90, 0] )  M4_imbus_B();
translate([66,-13.5, h-6 ] ) rotate ([0,-90,0] )  M4_imbus_B();

  }
 }   
}    



if ( KRUH_P == 1  ) {
    h=76;
    zuby=101;
 difference() { translate([0,0,h ]) objimka_predni();
  translate([-78,13.5, h+6 ] )  rotate ([90,0,90] )M4_imbus_B();
  translate([-78,-13.5, h+6] )  rotate ([-90,0,-90] )M4_imbus_B();
  translate([0,-(0.8*zuby/2+0.8*30/2),h-28])rotate([0,0,-90])M5_imbus_A();
 translate([66,13.5, h+6 ] ) rotate ([0,-90, 0] ) rotate ([0,0,180])M4_imbus_B();
 translate([66,-13.5, h+6 ] ) rotate ([0,-90,0] ) rotate ([0,0,180]) M4_imbus_B();


}    
  
}


if ( GEAR == 1  ) {

translate([0,0,75])focus_gear(zuby=101);

}    




if ( LISTA == 1  ) {
    h=76;
translate([-4,0,15])difference() {
    
union(){    
 translate( [-77,0,-14]) rotate([90,0,0])rotate([90,0,90])arcaplate(120);  
 translate([-71,0, 46] )rotate ([0,90,0]) dovetail(width=40,length=120, height=12, angle=15);
} 
translate([-77,13.5, 27] )  rotate ([90,0,90] )M4_imbus_B();
translate([-77,-13.5, 27] )  rotate ([-90,0,-90] )M4_imbus_B();

translate([-77, 13.5, 67 ] ) rotate ([90,0,0] ) rotate ([90,0,90] )M4_imbus_B();
translate([-77,-13.5, 67 ] ) rotate ([-90,0,0] ) rotate ([-90,0,-90] )M4_imbus_B();

translate([-77,0,46+9 ])  rotate ([0,90,0] )M4_imbus_C();
translate([-77,0,46-9] )  rotate ([0,90,0] )M4_imbus_C();
     
translate([-78,0,46+57])rotate ([0,90,0]) cylinder(h=15, r=2.5/2, center=false, $fn=360);
translate([-78,0,46-57])rotate ([0,90,0])  cylinder(h=15, r=2.5/2, center=false, $fn=360);
translate([-77,0,46+16.5 ])rotate ([0,90,0]) cylinder(h=30, r=3.4/2, center=false, $fn=360);
translate([-77,0,46-16.5 ])rotate ([0,90,0]) cylinder(h=30, r=3.4/2, center=false, $fn=360);


}


}

if ( CAP == 1  ) {
    
    difference() {
     cylinder(h=12, r=115/2, center=false, $fn=360);
     cylinder(h=10.5, r=112.5/2, center=false, $fn=360);
    
    }    
}    

if ( KNOB == 1  ) {
    
    difference() {
     cylinder(h=5, r=5, center=false, $fn=10);
        cylinder(h=5, r=1.6, center=false, $fn=360);
     cylinder(h=3, r=3, center=false, $fn=360);
    
    }    
}    


if ( SUP == 1  ) {
difference() {        
translate([0,0,-19/2 ]) cube([12,5 ,19]);           

{
translate([8.5, 2, 0])  M3_dira_b();

translate([0,0, -15.4/2]) cube([5, 5 ,15.4]);           
}
}
    
}

if ( ASIAIR  == 1  ) {
translate([-45,115, 46]) rotate([180,-90,0]) asiair();    
}


if ( LISTA2 == 1) {


translate([0,0,17])
difference() {            
translate([-63,-70, 31]) cube([13,200 ,28]);         
    
{    
translate([-77,0,45+9 ]) rotate ([180,0,0] ) rotate ([0,90,0] )M4_imbus_D();
translate([-77,0,45-9] )  rotate ([0,90,0] )M4_imbus_D();
translate([-63,-62.5,45+9 ]) rotate ([180,0,0] ) rotate ([0,90,0] )M4_imbus_B();
translate([-63,-62,45-9] )  rotate ([0,90,0] )M4_imbus_B();
translate([-63,115,45 ])  rotate ([0,90,0]  ) cylinder(h=30, r=5.2/2, center=false, $fn=360);
translate([-63,115,45 ])  rotate ([0,90,0]  ) cylinder(h=8, r=10, center=false, $fn=360);
      
}
}



}

if ( EAF  == 1  ) {
translate([0, -57,80])rotate([0,180,0])EAF();
    
}

if ( EAF_H  == 1  ) {

    
difference() {            
union()    
{         
translate([0, -45,47]) EAF_Holder();     
translate([-50,-70,48]) cube([75,15 ,28]);    
  
}

{
    
 translate([-63,-62.5,62+9 ]) rotate ([-90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
 translate([-63,-62,62-9] ) rotate ([-90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
 translate([0,-52,48])cylinder(h=28, r=15, center=false, $fn=360);       
  translate([ -12,-70,53, ]) cube([ 24, 49, 15]); 
}
}

}





if ( SUP2 == 1  ) {

difference() {            
        translate([ 10,-55, 36 ]) cube([ 15, 12, 52]); 
    {
      translate([ 0,0, 36 ]) cylinder(h=12, r=46, center=false, $fn=360);   
      translate([ 0,0, 36+12 ])cylinder(h=40, r=50, center=false, $fn=360);
      translate([0,-52,48])cylinder(h=28, r=18, center=false, $fn=360);
translate([-20,-50,42]) rotate ([0,90,0]) cylinder(h=60,r=3.4/2, center=false, $fn=360);
translate([20,-50,42]) rotate ([0,90,0]) cylinder(h=6,r=3, center=false, $fn=360);                         
    }
}
}

if (ARCA == 1){
difference() {
 arcaplate(50);  
 {
translate([25,0,0]) cylinder(h=30, r=5.2/2, center=false, $fn=360);
translate([25,0,0 ]) cylinder(h=5.5, r=10, center=false, $fn=360);
     
 }   
    
    
}
}

if (ARC_PATKA == 1){

 

difference() {
translate([0,-27,3])cube([50,52,16]);

 {

 translate([0,0,-3])arcaplate2(50);               
translate([25,0,10.5]) M5_imbus_A();
#translate([0,-5,7])cube([50,10,3.5]);
translate([0,-5,7])cube([50,10,3.5]);     
translate([0,-20.5,6.5])cube([50,41,1.5]);     
translate([25,-13, 4 ] ) rotate( [-15,0,0]) rotate([0,180,0]) M3_dira_b();          
 }   
    
}
    
 
}

