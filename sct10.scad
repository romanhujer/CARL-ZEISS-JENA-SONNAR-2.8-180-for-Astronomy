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


EAF=0;
EAF_H=1;

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



module M4_imbus(){

  union(){  

 translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
      
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






module EAF_Holder() {
difference() {                
   union() { 

      translate([-25,-25, -10] ) cube([50,12.5 ,30]);    
      translate([-15,-25, -60] ) cube([30,12.5 ,80]);    

       translate([-25,-96,7 ]) cube([ 50, 73, 13]); 
/*    difference() {            
        union() {
            translate([-25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
            translate([ 25,-23, 7 ]) cylinder(h=13, r=13, center=false, $fn=360);
        }   
        union() {  
            translate([ 25,-36, 7 ]) cube([ 13, 26, 13]); 
            translate([-38,-36, 7 ]) cube([ 13, 26, 13]); 
        }
    }
*/  
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
       
       translate([ -25,-10, -10 ]) rotate ([90,0,0]) cylinder(h=15, r=10, center=false, $fn=100);
       translate([ 25,-10, -10 ]) rotate ([90,0,0]) cylinder(h=15, r=10, center=false, $fn=100);  
       
       translate([ 0,-25, 7-20.5 ]) rotate ([-90,0,0])M4_imbus(); 
       translate([ 0,-25, 7-52 ]) rotate ([-90,0,0])M4_imbus(); 
         
   }    
  } 
}    





if ( EAF  == 1  ) {
translate([0, 0,25])rotate([0,180,0])EAF();
    
}

if ( EAF_H  == 1  ) {

    
difference() {            
union()    
{         
  EAF_Holder();     
  
}

/*
{
    
 translate([-63,-62.5,62+9 ]) rotate ([-90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
 translate([-63,-62,62-9] ) rotate ([-90,0,0] ) rotate ([0,90,0] )M4_imbus_B();
 translate([0,-52,48])cylinder(h=28, r=15, center=false, $fn=360);       
  translate([ -12,-70,53, ]) cube([ 24, 49, 15]); 
}
*/
}

}


