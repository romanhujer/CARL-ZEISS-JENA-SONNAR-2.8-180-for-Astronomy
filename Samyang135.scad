/* 
   Samyang   2.0/135  holder

   Copyright (c) 2020 Roman Hujer   http://hujer.net

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
include <EAF_H.scad>; 
include <asiair.scad>; 
include <Gear_GT2.scad>; 


LISTA=0;
KRUH_Z=0;
KRUH_P=0;
KRUH_F=0;
KRUH_F2=0;
EAF=0;
EAF_H=1;
CAP=0;
KNOB=0;
SUP=0;
ASIAIR=0;
LISTA2=0;



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




module M4_imbus_B(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    union(){  
      cylinder(h=hm, r=rv2/1.732, center=false, $fn=6, center=true);
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
      cylinder(h=hm, r=rv2/1.732, center=false, $fn=6, center=true);
      
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
      cylinder(h=hm, r=rv2/1.732, center=false, $fn=6, center=true);
      translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
  }
}
}



module finder_patka() {

difference(){
    
    dovetail(width=48,length=20, height=17, angle=20);

 translate([0,0, 8 ] ) {    
dovetail(width=33,length=20, height=9, angle=20);
translate([-12,-16.5, -1] )cube([33,33 ,1]);  

}
translate([0,-7.75, 9.2 ] )  rotate ([-20,0,0] ) M3_dira_b();     

}
}


module objimka_zadni() {
 
difference(){
  union(){  
      
 translate([-10,-55,16 ]) cube([ 20, 2*55, 14]); 
 cylinder(h=30, r=46, center=false, $fn=360);
 translate([-63,-19, 0]) cube([30,38 ,30]);     
 translate([60,0,20 ]) rotate ([180,0,0]) rotate ([0,90,0]) finder_patka();    
 translate([40,-24,16 ]) cube([20,48 ,14 ]);          
  }
 {
  cylinder(h=30, r=35.5, center=false, $fn=360);
  translate([0,0,14 ])cylinder(h=20, r=33.5, center=false, $fn=360);
  translate([0,0,20 ])cylinder(h=15, r=35.5, center=false, $fn=360);   
  translate([-2,-55,0 ]) cube([ 4, 2*55, 30]);
 translate([-10.1,50,22.5]) rotate ([0,90,0])M3_dira_a();     
 translate([-10.1,-50,22.5]) rotate ([0,90,0])M3_dira_a();        
  cylinder(h=16, r=46, center=false, $fn=360);
  translate([-46,-19, 0]) cube([10,38 ,16]);     
     
 }    
}

}



module objimka_predni() {

difference(){
  union(){  
      
 translate([-10,-62,0 ]) cube([ 20, 2*62, 15]); 
 cylinder(h=15, r=50, center=false, $fn=360);
 translate([-63,-19,0 ])cube([20,38 ,15]);     
 translate([40,-20,0 ]) cube([22,40 ,15]);     
 
  }
 {
  cylinder(h=15, r=78/2, center=false, $fn=360);
  translate([0,0,5 ])cylinder(h=10, r=81.2/2, center=false, $fn=360);     
  translate([-2,-70,0 ]) cube([ 4, 2*70, 15]);
  translate([-10.1,-55, 7.5 ]) rotate ([0,90,0])M3_dira_a();     
  translate([-10.1,55, 7.5 ]) rotate ([0,90,0])M3_dira_a();        
  translate([55,-14,0 ]) cube([7,28 ,15]);           
  translate([58, 27, 7.5])  M3_dira_b();
  translate([58,-7 ,7.5]) M3_dira_b();     
   
 }    
}
}


module objimka_fokuser() {

difference(){
  union(){  
      
 translate([-10,-62,0 ]) cube([ 20, 2*62, 10]); 
 cylinder(h=10, r=50, center=false, $fn=360);
 translate([49,-4,0 ]) cube([14,8 ,10]);           
 translate([56,-4,0 ]) cube([12,8 ,33]);                 
  }
 {
  cylinder(h=10, r=78/2, center=false, $fn=360);
      translate([-2,-66,0 ]) cube([ 4, 2*66, 10]);
      translate([-10.1,-55,5 ]) rotate ([0,90,0])M3_dira_a();     
      translate([-10.1,55,5 ]) rotate ([0,90,0])M3_dira_a();        
      translate([59,-4,0 ])  rotate ([0,38,0]) cube([18,8 ,18]);                 

     }    
    }
    }








    



if ( KRUH_F == 1  ) {
   h=76-(130-112) ;
translate([0,0, h ]) objimka_fokuser();
}    

if ( KRUH_P == 1  ) {
    h=76;
difference() { translate([0,0,h ]) objimka_predni();
translate([-78,13.5, h+7.5 ] )  rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, h+7.5] )  rotate ([-90,0,-90] )M4_imbus_B();
}    
    

}
 
if ( KRUH_Z == 1  ) {
 difference() { translate([0,0, 30] ) rotate ([180,0,0] ) objimka_zadni();  
translate([-78,13.5, 15] )  rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, 15] )  rotate ([-90,0,-90] )M4_imbus_B();
  }
    
}    

if ( LISTA == 1  ) {
    h=76;
difference() {
translate([-77,0, 46] )rotate ([0,90,0])
 difference(){
  dovetail(width=44,length=92, height=15, angle=15);
  {  
     cylinder(h=30, r=8.8/2, center=false, $fn=360);
     translate([28,0,0 ])cylinder(h=30, r=5.2/2, center=false, $fn=360);
     translate([-28,0,0 ])cylinder(h=30, r=5.2/2, center=false, $fn=360);
      
  translate([141/2,0, 7.5]) M8_dira_a();
  translate([-141/2,0, 7.5]) rotate ([0,0,180])M8_dira_a();
  }    
}   
translate([-77,13.5, 15] )  rotate ([90,0,90] )M4_imbus_B();
translate([-77,-13.5, 15] )  rotate ([-90,0,-90] )M4_imbus_B();

translate([-77, 13.5, h + 7.5 ] ) rotate ([90,0,0] ) rotate ([90,0,90] )M4_imbus_B();
translate([-77,-13.5, h + 7.5] ) rotate ([-90,0,0] ) rotate ([-90,0,-90] )M4_imbus_B();
translate([-77,0,46+9 ])  rotate ([0,90,0] )M4_imbus_C();
translate([-77,0,46-9] )  rotate ([0,90,0] )M4_imbus_C();

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

difference() {            
translate([-63,-70, 31]) cube([13,200 ,30]);         
    
{    
translate([-77,0,46+9 ]) rotate ([180,0,0] ) rotate ([0,90,0] )M4_imbus_D();
translate([-77,0,46-9] )  rotate ([0,90,0] )M4_imbus_D();
translate([-63,-62.5,46+9 ]) rotate ([180,0,0] ) rotate ([0,90,0] )M4_imbus_B();
translate([-63,-62,46-9] )  rotate ([0,90,0] )M4_imbus_B();
translate([-63,115,46 ])  rotate ([0,90,0]  ) cylinder(h=30, r=5.2/2, center=false, $fn=360);
translate([-63,115,46 ])  rotate ([0,90,0]  ) cylinder(h=8, r=10, center=false, $fn=360);
      
}
}



}

if ( EAF  == 1  ) {
translate([0, -57,80])rotate([0,180,0])EAF();
    
}

if ( EAF_H  == 1  ) {

translate([0, -45,55]) EAF_Holder(); 
    
difference() {            
union()    
{         
translate([-50,-70, 31]) cube([75,15 ,30]);    
difference(){
translate([-50,-70, 61]) cube([30,15 ,14]);    
translate([-50,-70, 61])rotate ([0,-30,0] )cube([40,15 ,14]);       
}
    
}
{
 translate([-63,-62.5,46+9 ]) rotate ([90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
 translate([-63,-62,46-9] ) rotate ([90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
}
}
}



if ( KRUH_F2 == 1  ) {
  h=53;
 translate([0,0,h ]) difference() {            
gear(teeth = 132);
 cylinder(h=22, r=78/2, center=false, $fn=360);
}
}