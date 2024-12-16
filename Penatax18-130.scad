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

ARC_PATKA = 0;
FINDER=0;
//FINDER_B=1;
//GEAR=1;
LISTA= 0;
//LISTA2=1;
KRUH_Z=1;
KRUH_P=1;
//EAF=1;
//EAF_H=1;
CAP=0;
//KNOB=1;
SUP=0;
//SUP2=0;
//ASIAIR=1;
//ARCA=1;
SUP_RING=0; 
//SUPP1=1;
//KN=1;
GG=0;

//ARC_PATKA = 1;

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




module objimka_zadni() {
 
difference(){
  union(){  
      
 #translate([-21,0,0 ]) cube([ 42, 112, 6]); 
 translate([-10,-60,0 ]) cube([ 20, 65, 10]); 
 cylinder(h=10, r=50, center=false, $fn=360);
 translate([-58,-19,0 ])cube([20,38 ,10]);     
 translate([30,-20,0 ]) cube([22,40 ,10]);     

   }
 {
  
#   translate([0,62,-1]) {
     cylinder(h=12, r=12, center=false, $fn=360);
     translate([0,10,0]) cylinder(h=12, r=12, center=false, $fn=360);
     translate([-12,0,0]) cube([ 24, 10, 12]);
    }
 
   translate([9,62+34,-1]) {
     cylinder(h=12, r=2.2, center=false, $fn=360);
     translate([0,10,0]) cylinder(h=12, r=2.2, center=false, $fn=360);
     translate([-2.2,0,0]) cube([ 4.4, 10, 12]);
    }
   translate([-9,62+34,-1]) {
     cylinder(h=12, r=2.2, center=false, $fn=360);
     translate([0,10,0]) cylinder(h=12, r=2.2, center=false, $fn=360);
     translate([-2.2,0,0]) cube([ 4.4, 10, 12]);
    }
  
 
 
    
  translate([0,0,-1]) cylinder(h=12, r=70.5/2, center=false, $fn=360);
  translate([-2,-61,-1 ]) cube([ 4, 65, 12]);
  translate([-10.1,-55,5]) rotate ([0,90,0])M3_dira_a();        
  
     
 }    
}

}



module objimka_predni() {

difference(){
 union(){  
// translate([-10,-62,0 ]) cube([ 20, 2*62, 12]); 
 cylinder(h=18, r=50, center=false, $fn=360);
 translate([-58,-19,0 ])cube([20,38 ,18]);     
 translate([30,-20,0 ]) cube([22,40 ,18]);     
 translate([20,-57,0 ]) rotate ([0,-90,-70])  difference() {
        translate([0,-55/2, 2 ] )cube([18,55,25]);
        arcaplate(40);  
       }    
   }
 {
   translate([0,0,-1]) cylinder( h=20, r=79/2, center=false, $fn=360);
   translate([-39.5,0,-1]) cylinder( h=20, r=5, center=false, $fn=360);
   
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
   h=70;
 
difference() {
union(){    
translate([62,0, 35] )  rotate ([0,90,0]) finder_patka(L=30);    
translate([52,-20,0] ) cube([10,40,h]);  
}    
{    
translate([62,13.5, h-9 ] ) rotate ([0,-90, 0] )  M4_imbus_B();
translate([62,-13.5, h-9 ] ) rotate ([0,-90,0] )  M4_imbus_B();
translate([62,13.5,  5 ] ) rotate ([0,-90, 0] ) rotate ([0,0,180])M4_imbus_B();
translate([62,-13.5, 5 ] ) rotate ([0,-90,0] ) rotate ([0,0,180]) M4_imbus_B();

translate([60,-30,0] ) cube([20,10,52]);      
translate([60,20, 0] ) cube([20,10,52]);          
    
}   
}    
    
}
 
if ( KRUH_Zx == 1  ) {
    h=48;

// difference() { 
translate([0,0, 48] ) rotate ([180,0,0] ) objimka_zadni();  
/* {     
translate([-78,13.5, h-6] )  rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, h-6] )  rotate ([-90,0,-90] )M4_imbus_B();

translate([66,13.5, h-6 ] ) rotate ([0,-90, 0] )  M4_imbus_B();
translate([66,-13.5, h-6 ] ) rotate ([0,-90,0] )  M4_imbus_B();

  }
 } */  
}    









if ( LISTA == 1  ) {
    h=70;
//translate([-4,0,0])
    
difference() {
    
union(){    
 translate( [-76,0,0]) rotate([90,0,0])rotate([90,0,90])arcaplate(h);  
 translate([-70,0,35] )rotate ([0,90,0]) dovetail(width=40,length=h, height=12, angle=15);
} 
translate([-76, 13.5, 70-9] )  rotate ([90,0,90] )M4_imbus_B();
translate([-76,-13.5, 70-9] )  rotate ([-90,0,-90] )M4_imbus_B();

translate([-76, 13.5,5 ] ) rotate ([90,0,0] ) rotate ([90,0,90] )M4_imbus_B();
translate([-76,-13.5,5 ] ) rotate ([-90,0,0] ) rotate ([-90,0,-90] )M4_imbus_B();






//translate([-77,-10,17+9 ])  rotate ([0,90,0] )M4_imbus_C();
//translate([-77,-10,17-9] )  rotate ([0,90,0] )M4_imbus_C();
     
translate([-78,0,65])rotate ([0,90,0]) cylinder(h=15, r=2.5/2, center=false, $fn=360);
translate([-78,0,5])rotate ([0,90,0])  cylinder(h=15, r=2.5/2, center=false, $fn=360);


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
     cylinder(h=8, r=5.5, center=false, $fn=12);
        cylinder(h=8, r=2.1, center=false, $fn=360);
      cylinder(h=3, r=4, center=false, $fn=6);
    
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


if (SUP_RING ==1 ) {
    
difference(){
 union(){  
 cylinder(h=18, r=41, center=false, $fn=360);
 cylinder(h=1.5, r=42, center=false, $fn=360);
 translate([0,0,16.5]) cylinder(h=1.5, r=42, center=false, $fn=360);
   }
 {
  cylinder(h=19, r=33, center=false, $fn=360);
  translate([-5,0,0 ]) cube([ 10,70, 19]);
 

   
  }    
}
}
    

module Lozisko_A(){
 rv2=8.2+0.4;
 hm = 4.2;

 union(){  
 cylinder(h=40, r=5.2, center=false, $fn=360);
 translate([0,0,34 ])    union(){  
      cylinder(h=4, r=7.2, center=false, $fn=360, center=true);
      translate([7.5,0,0 ]) cube([15,14.4,4.2], center=true);
  }
}
}



if ( KRUH_P == 1  ) {
    h=0;
//    zuby=101;
 difference() { translate([0,0,h ]) objimka_zadni();
  translate([-72,13.5, h+5 ] )  rotate ([90,0,90] )M4_imbus_B();
  translate([-72,-13.5, h+5] )  rotate ([-90,0,-90] )M4_imbus_B();
     
     
 translate([66,13.5, h+5 ] ) rotate ([0,-90, 0] ) rotate ([0,0,0])M4_imbus_B();
 translate([66,-13.5, h+5 ] ) rotate ([0,-90,0] ) rotate ([0,0,0]) M4_imbus_B();


 }    
  
}
if ( KRUH_Z == 1  ) {
    h=70-18;
//    zuby=101;
 difference() 
    
    { translate([0,0,h ]) {objimka_predni();
        
       
    }

  translate([-72,13.5, h+9 ] )  rotate ([90,0,90] )M4_imbus_B();
  translate([-72,-13.5, h+9] )  rotate ([-90,0,-90] )M4_imbus_B();
//  translate([0,-55,h-28])rotate([0,0,-90])Lozisko_A();
     
     
 translate([66,13.5, h+9 ] ) rotate ([0,-90, 0] ) rotate ([0,0,180])M4_imbus_B();
 translate([66,-13.5, h+9 ] ) rotate ([0,-90,0] ) rotate ([0,0,180]) M4_imbus_B();


}    
  
     
}


if (  FINDER_B == 1  ) {
   h=70;
 
difference() {
union(){    
translate([62,0, 0] )  rotate ([0,90,0]) finder_patka(L=30);    
translate([52,-20, -35] ) cube([10,40,h]);  
}    
{    
translate([62,13.5, 65-6 ] ) rotate ([0,-90, 0] )  M4_imbus_B();
translate([62,-13.5,65-6 ] ) rotate ([0,-90,0] )  M4_imbus_B();
translate([62,13.5, -65+6 ] ) rotate ([0,-90, 0] ) rotate ([0,0,180])M4_imbus_B();
translate([62,-13.5,-65+6 ] ) rotate ([0,-90,0] ) rotate ([0,0,180]) M4_imbus_B();

translate([60,-30, -20] ) cube([20,10,52]);      
translate([60,20,  -20] ) cube([20,10,52]);          
    
}   
}    
    
}


module focus_gear() {
// rotate([180,0,0]) translate([0,0.8*zuby/2+0.8*30/2,0]) 
  
 difference() {
  union() {     
   translate([0,0,13])gearGT2(39);
   EvGerar(1, 30, 12);
//  EvGerar(0.8, 35, 12);
   translate([0,0,12]) cylinder(h=6.5, r=13.65, center=false, $fn=360);               
   translate([0,0,30.5]) cylinder(h=10, r=13.65, center=false, $fn=360);        
  } 
  union(){
  
 translate([0,0,36])    for ( i = [0, 1, 2] ) { 
      rotate([ 0,0,i*120]) { rotate([0,90,0]) cylinder(h=20, r=1.8, center=false, $fn=360);  }    
     }
    cylinder(h=48, r=4.3, center=false, $fn=360);       
      
 } 
  
} 
}



if ( GEAR == 1  ) {

//translate([0,0,-65])   rotate([180,0,0]) translate([0,55,0]) 
    focus_gear();

}    



if ( SUPP1 == 1  ) {
 difference() {
cylinder(h=8, r=5.2, center=false, $fn=360);
cylinder(h=8, r=4.2, center=false, $fn=360);    
 }
}    

if ( KN == 1  ) {
 difference() {
cylinder(h=25, r=7, center=false, $fn=8);
cylinder(h=23, r=3.8, center=false, $fn=360);    
 }
}

if ( GG == 1  ) {
 difference() {
  union() {     
  gearGT2(122);     
//  EvGerar(1, 80, 14);
// translate([0,0,8]) cylinder(h=8, r=79.5/2, center=false, $fn=360);
  
  }
  cylinder(h=29, r=73.5/2, center=false, $fn=360);  
  
//  translate([0,0,18])    for ( i = [0, 1, 2] ) { 
//      rotate([ 0,0,i*120]) { rotate([0,90,0]) cylinder(h=40, r=1.25, center=false, $fn=360);  }    
//     }
 
  
  }
    
}
  

