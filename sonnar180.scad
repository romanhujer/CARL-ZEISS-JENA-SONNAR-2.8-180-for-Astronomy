/* 
   Sonar  2.8/180  holder

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


LISTA=1;
KRUH_Z=0;
KRUH_P=0;
KRUH_F=0;
CAP=0;




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
 
 rv2=13.8;
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


module finder_patka() {

difference(){
    
    dovetail(width=46,length=20, height=17, angle=20);

 translate([0,0, 8 ] ) {    
dovetail(width=32.5,length=30, height=9, angle=20);
translate([-15,-15.5, -3] )cube([30,31 ,3]);  

}
translate([0,-7, 9.2 ] )  rotate ([-20,0,0] ) M3_dira_b();     

}
}


module objimka_zadni() {
 
difference(){
  union(){  
      
 translate([-10,-55,14.5 ]) cube([ 20, 2*55, 15.5]); 
 cylinder(h=30, r=46, center=false, $fn=360);
 translate([-63,-19, 0]) cube([30,38 ,30]);     
 translate([60,0,20 ]) rotate ([180,0,0]) rotate ([0,90,0]) finder_patka();    
 translate([40,-23,14.5 ]) cube([20,46 ,15.5]);          
  }
 {
  cylinder(h=30, r=31.5, center=false, $fn=360);
  translate([0,0,14 ])cylinder(h=20, r=33.5, center=false, $fn=360);
  translate([0,0,20 ])cylinder(h=15, r=36.5, center=false, $fn=360);   
  translate([-2,-55,0 ]) cube([ 4, 2*55, 30]);
  translate([-10.1,-50,21 ]) rotate ([0,90,0])M3_dira_a();     
  translate([-10.1,50,21 ]) rotate ([0,90,0])M3_dira_a();        
  cylinder(h=14.5, r=46, center=false, $fn=360);
  translate([-46,-19, 0]) cube([10,38 ,14.5]);     
     
 }    
}

}



module objimka_predni() {

difference(){
  union(){  
      
 translate([-10,-70,0 ]) cube([ 20, 2*70, 8]); 
 cylinder(h=8, r=61, center=false, $fn=360);
 translate([-63,-19,0 ])cube([10,38 ,12]);     
 translate([55,-25,0 ]) cube([12,50 ,8]);     
 
  }
 {
  cylinder(h=15, r=45, center=false, $fn=360);
  translate([-2,-70,0 ]) cube([ 4, 2*70, 8]);
  translate([-10.1,-65,4 ]) rotate ([0,90,0])M3_dira_a();     
  translate([-10.1,65,4 ]) rotate ([0,90,0])M3_dira_a();        
  translate([55,-18,0 ]) cube([15,36 ,8]);           
  translate([62,31.5,4])  M3_dira_b();
  translate([62,-11.5,4]) M3_dira_b();     
   
 }    
}
}


module objimka_fokuser() {

difference(){
  union(){  
      
 translate([-10,-66,0 ]) cube([ 20, 2*66, 14]); 
 cylinder(h=14, r=56, center=false, $fn=360);
 translate([55,-4,0 ]) cube([14,8 ,14]);           
 translate([57,-4,0 ]) cube([12,8 ,30]);                 
  }
 {
  cylinder(h=14, r=47.5, center=false, $fn=360);
      translate([-2,-66,0 ]) cube([ 4, 2*66, 14]);
      translate([-10.1,-61,7 ]) rotate ([0,90,0])M3_dira_a();     
      translate([-10.1,61,7 ]) rotate ([0,90,0])M3_dira_a();        
     translate([59,-4,0 ])  rotate ([0,45,0]) cube([18,8 ,14]);                 

     }    
    }
    }








    



if ( KRUH_F == 1  ) {
translate([0,0,112 ]) objimka_fokuser();
}    

if ( KRUH_P == 1  ) {
    
difference() { translate([0,0,130 ]) objimka_predni();
translate([-78,13.5, 136 ] ) rotate ([90,0,0] ) rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, 136] ) rotate ([-90,0,0] ) rotate ([-90,0,-90] )M4_imbus_B();
}    
    

}
 
if ( KRUH_Z == 1  ) {
difference() {  objimka_zadni();  
translate([-78,13.5, 15] )  rotate ([90,0,90] )M4_imbus_B();
translate([-78,-13.5, 15] )  rotate ([-90,0,-90] )M4_imbus_B();
  }
    
}    

if ( LISTA == 1  ) {
    
difference() {
translate([-78,0, 55] )rotate ([0,90,0])
 difference(){
  dovetail(width=44,length=106, height=15, angle=15);
  {  

     cylinder(h=30, r=6/2, center=false, $fn=360);
     cylinder(h=9, r=17/2,  center=false, $fn=360);
     translate ([ 15,0,0]) cylinder(h=30, r=7/2, center=false, $fn=360);
     translate ([ 15,0,0]) cylinder(h=9, r=18/2,  center=false, $fn=360);
     translate ([-15,0,0]) cylinder(h=30, r=7/2, center=false, $fn=360);
     translate ([-15,0,0]) cylinder(h=9, r=18/2,  center=false, $fn=360);
//     translate ([ 30,0,0]) cylinder(h=30, r=7/2, center=false, $fn=360);
//     translate ([ 30,0,0]) cylinder(h=10, r=18/2,  center=false, $fn=360);
//     translate ([-30,0,0]) cylinder(h=30, r=7/2, center=false, $fn=360);
//     translate ([-30,0,0]) cylinder(h=10, r=18/2,  center=false, $fn=360);
     translate ([ 48,0,0]) cylinder(h=30, r=4/2, center=false, $fn=360);
//     translate ([ 45,0,0]) cylinder(h=10, r=18/2,  center=false, $fn=360);
     translate ([-48,0,0]) cylinder(h=30, r=4/2, center=false, $fn=360);
//     translate ([-45,0,0]) cylinder(h=10, r=18/2,  center=false, $fn=360);
      
//     translate([28,0,0 ])cylinder(h=30, r=5.2/2, center=false, $fn=360);
//     translate([-28,0,0 ])cylinder(h=30, r=5.2/2, center=false, $fn=360);
      
//  translate([140/2,0, 7.5]) M8_dira_a();
//  translate([-140/2,0, 7.5]) rotate ([0,0,180])M8_dira_a();
  }    
}   
//tanslate([-78,13.5, 15] )  rotate ([90,0,90] )M4_imbus_B();
//translate([-78,-13.5, 15] )  rotate ([-90,0,-90] )M4_imbus_B();

//translate([-78,13.5, 136 ] ) rotate ([90,0,0] ) rotate ([90,0,90] )M4_imbus_B();
//translate([-78,-13.5, 136] ) rotate ([-90,0,0] ) rotate ([-90,0,-90] )M4_imbus_B();


}

}

if ( CAP == 1  ) {
    
    difference() {
     cylinder(h=12, r=115/2, center=false, $fn=360);
     cylinder(h=10.5, r=112.5/2, center=false, $fn=360);
    
    }    
}    