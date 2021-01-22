/*

PARAMETRIC SPUR GEAR DESIGNER (METRIC)
Michael Murray 2014

Units are millimeters and degrees unless specified otherwise

This is a STAND ALONE PROGRAM, to be used directly. If you need to call 
it from another program please use Parametric Annular Gear Lib.scad

Units are millimeters and degrees unless specified otherwise.

Gears of down to 2 teeth can be made. 
The very low count gears may be useful for making gear type pumps.

For sensible results pressure angles should be not more than 45 degrees.

Just CHANGE THE VALUES BELOW as needed.
=============================

Note that gears are complex shapes. They compile quickly (f5) but
can take a long time to render (f6). To help with this the number of
facets used to create the involutes reduces as the tooth count increases.

*/

// Mandatory Gear Parameters - MUST BE PROVIDED
//-------------------------



module EvGerar(mod=0.8, teeth=40,width=7) {

//mod = 0.8;        // Gear Module
//teeth = 40;	// Number of Teeth
//width = 7;	// Width of Teeth

// Optional Parameters - SET AS REQUIRED
// -------------------

addendum = mod;         // Addendum [default = mod]
dedendum = mod>1.3 ? 2.25*mod-addendum : 2.4*mod-addendum; 
                        // Dedendum default depends on gear module and design needs
                        // [default = mod>1.3 ? 2.25*mod-addendum : 2.4*mod-addendum]
holeDia = 0;	        // Hole Diameter for tapping or pinning [0 = no hole]
filletStyle = "";	// values "simple", "round". Any other value = no fillet.
                        // use quotes as shown. "simple" adds 50% to render time,
                        // "round" adds 100% to render time
hubDia = 0;		// Hub Diameter [0 = no hub]
hubLen = 0;		// Hub Protrusion from the face of the gear [0 = no protrusion]
keyDepth = 0;	        // Keyway Depth [0 = no keyway]
keyWidth = 0;	        // Keyway Width [0 = no keyway]
pressAngle = 20;	// Pressure Angle [default = 20]
shaftDia = 0;	        // Centre Hole Size [0 = no hole]
markPCD = false;        // mark the pcd on each tooth to assist in correct engagement

/////////////////////////////////////////////
// THERE IS NO NEED TO CHANGE ANYTHING BELOW
/////////////////////////////////////////////

// gear related variables
//-----------------------

haveHub = hubDia!=0 && hubLen!=0;
haveKey = keyDepth!=0 && keyWidth!=0;
pcd = mod*teeth;
inner = 0.5*pcd-dedendum;       // Inner radius (at roots of teeth)
outer = 0.5*pcd+addendum;       // Outer radius (at tips of teeth)
baseDia = pcd*cos(pressAngle);	// Base Diameter
radius = baseDia/2;             // from which the involute is calculated
halfAngle = 90/teeth;	        // the angle at the origin for one half tooth
toothAngle = 360/teeth;	        // the angle at the origin from the crests of 2 adjacent teeth
totalLen = hubLen!=0 ? width+hubLen : width;

// do some sanity checking
//------------------------

error1 = mod==undef || teeth==undef || width==undef;
if (error1)
    echo("PARAMETER ERROR: The module, number of teeth and tooth width MUST be specified");

error2 = (keyWidth!=0 && keyDepth==0) || (keyWidth==0 && keyDepth!=0);
if (error2)
    echo("PARAMETER ERROR: key parameters must be both set or both zero");

error3 = (hubDia==0 && hubLen!=0) || (hubDia!=0 && hubLen==0);
if(error3)
    echo("PARAMETER ERROR: hubDia & hubLen must both be set or both be 0");

error4 = holeDia!=0 && !haveHub;
if(error4)
    echo("PARAMETER ERROR: A cross hole cannot be defined without a hub");

error5 = holeDia>hubDia*0.6;
if(error5)
    echo("PARAMETER ERROR:The cross hole is too big for the hub diameter");

error6 = holeDia>hubLen*0.6;
if(error6)
    echo("PARAMETER ERROR:The cross hole is too big for the hub length");

error7 = haveHub && shaftDia!=0 && hubDia<(shaftDia+1);
if(error7)
    echo("PARAMETER ERROR:The hub diameter is too small for the shaft");

error8 = haveKey && shaftDia==0;
if(error8)
    echo("PARAMETER ERROR:Cannot have a keyway without a shaft hole");

error9 = pressAngle>45;
if(error9)
    echo("PARAMETER ERROR:Pressure Angle > 45 degrees");

sane = !error1 && !error2 && !error3 && !error4 && !error5 && !error6 && 
        !error7 && !error8 && !error9;


// CONVERSION FUNCTIONS
//---------------------

function radians(degrees) = degrees*PI/180; // convert degrees to radians

function degrees(rads) = rads*180/PI; // convert radians to degrees

// FUNCTIONS TO DERIVE INVOLUTE - see involute_derivation.pdf for explanation
// --------------------------------------------------------------------------

function arcLen(angle) = PI*baseDia*angle/360;

function involutePoint(angle) = 
	[radius*cos(angle) + arcLen(angle)*sin(angle),
	 radius*sin(angle) - arcLen(angle)*cos(angle)];
         
// INVERSE INVOLUTE FUNCTIONS - see involute_derivation.pdf for explanation
// ------------------------------------------------------------------------
// These calculate the angle at the centre between the start of the involute 
// and where it crosses the pcd

incAngle =  degrees(tan(pressAngle)-radians(pressAngle));
totalAngle = halfAngle+incAngle;

// There is no direct way to determine how far the involute curve must
// be generated to create half the tooth profile, so we use a 3 stage 
// approximation which is accurate for up to 82 degrees.

// Let A be the angle (in radians) beyond the half tooth angle that we must
// unwind the involute in order to generate a half tooth profile. Then, 
// totalAngle in radians = tan(A) - radians(A);
// Let f1, f2, f3 & f4 be successive approximations for A.

function inv(f) = tan(degrees(f))-f; // angle f is in radians

I = radians(totalAngle);
    
// f1 = 1.441(I)^1/3 - 0.374(I)
f1 = 1.441*pow(I,1/3) - 0.374*I;

// f2 = f1 + [I-inv(f1)]/tan(f1)^2
f2 = f1 + (I-inv(f1))/pow(tan(degrees(f1)),2);

// f3 = f2 + [I-inv(f2)]/tan(f2)^2
f3 = f2 + (I-inv(f2))/pow(tan(degrees(f2)),2);

// f4 = f3 + [I-inv(f3)]/tan(f3)^2
f4 = f3 + (I-inv(f3))/pow(tan(degrees(f3)),2);

totalInvAngle = totalAngle + degrees(f4);// how far the involute must be unwound to generate the tooth

// variables for plotting the involute
// -----------------------------------

numPoints = teeth<=90 ? ceil(360/teeth) : 3;
stepAngle = totalInvAngle/numPoints;

invPoints = concat([[radius,0]],[for(i=[0 : stepAngle : totalInvAngle*1.01]) involutePoint(i)],[[0,0]]);

// MODULES
// -------

module makeOutline()
{
    // using mutually exclusive "if" statements to avoid deep nesting

    if(!haveHub && shaftDia==0)     // plain gear, no hub or centre hole
        cylinder(h=width, d=2*inner, $fn=100);

    if(!haveHub && shaftDia!=0)	// plain gear with centre hole
    {
        difference()
        {
            cylinder(h=width, d=inner*2, $fn=100);
                translate ([0,0,-1])
                    cylinder(h=width+2, d=shaftDia, $fn=100);
        }
    }

    if(haveHub && shaftDia==0)	// gear with hub but no centre hole
    {
        union()
        {
            cylinder(h=width, d=2*inner, $fn=100);
            cylinder(h=width+hubLen, d=hubDia, $fn=100);
        }
    }

    if(haveHub && shaftDia!=0)	// gear with hub and centre hole
    {
        difference()
        {
            union()
            {
                cylinder(h=width, d=inner*2, $fn=100);
                cylinder(h=width+hubLen, d=hubDia, $fn=100);
            }
            translate ([0,0,-1])
                cylinder(h=width+hubLen+2, d=shaftDia, $fn=100);
        }
    }
}

module makeHole()	// make a hole in the hub for pinning or tapping
{
    translate([0,0,width+hubLen/2])
        rotate([0,90.0])
            cylinder(h=hubDia+2, d=holeDia, $fn=100, center=true);
}

module makeKey()	// make a keyway (at 90 degrees to the hole, so both possible)
{
    // the keyway has to be translated so that one side is a chord to the shaft circle

    translateInY = sqrt(pow(shaftDia/2, 2) - pow(keyWidth/2, 2));	// local function
    translate([0, translateInY, 1+(totalLen)/2])
        cube(size=[keyWidth, keyDepth, totalLen+2], center=true);
}

module makeBlank()	// the gear without teeth
{
    // using mutually exclusive "if" statements to avoid deep nesting

    if(holeDia==0 && !haveKey)	// no cross hole or key way
        makeOutline();

    if(holeDia!=0 && !haveKey)	// add a cross hole
        difference()
        {
            makeOutline();
            makeHole();
        }

    if(holeDia==0 && haveKey)	// add a key way
        difference()
        {
            makeOutline();
            makeKey();
        }

    if(holeDia!=0 && haveKey)	// add a cross hole and key way
        difference()
        {
            makeOutline();
            makeHole();
            makeKey();
    }
}

module plotCurve() // plot from the base circle but discard the part between the base circle and the pcd
{
    difference()
    {
        rotate([0,0,-incAngle])// rotate so the pcd lies on the x axis
            linear_extrude(height = width, center = false)
                polygon(points=invPoints);  // generate from the base circle
        translate([0,-radius,-1])
            cube(size=[1.5*radius,radius,width+2]); // cut off the part below the x axis
    }
}

module halfProfile()
{
    rotate([0,0,-halfAngle])
        plotCurve();
}

module mark() // narrow ring for marking the pcd on the tooth
{
    markX = outer*cos(halfAngle);
    markY = outer*sin(halfAngle);
    
    translate([0,0,width-0.5])
        intersection()
        {
            linear_extrude(height=10, center=false)
                polygon(points=[[0,0],[markX,markY],[markX,-markY]]);
            difference()
            {
                cylinder(d=pcd+0.2,h=1,$fn=100);
                translate([0,0,-0.5])
                    cylinder(d=pcd-0.2,h=2,$fn=100);
            }
        }
}

module profile()
{
    union()
    {
        halfProfile();
        mirror([0,1,0]) halfProfile();
        if (markPCD)
            mark();
    }
}

module tooth()
{
    difference()
    {
        intersection() // truncate the tooth at the addendum
        {
            profile();
            translate([0,0,-1])
                cylinder(d=2*outer,h=width+2,$fn=100);
        }
        translate([0,-0.5*inner,-1])
            cube([inner*cos(halfAngle),inner,width+2]);// remove the 'tail' of the tooth
    }
}

module fillet()
{
    arcLen = PI*inner/teeth;
    filletRadius = arcLen/3;
    $fn=50;

    translate([inner, 0, 0])
    {
        difference()
        {
            translate([-0.2*filletRadius, -0.7*arcLen, 0])
                cube(size=[1.2*filletRadius, 1.4*arcLen, width]);
            translate([filletRadius, filletRadius-0.55*arcLen, 0])
            {
                minkowski()
                {
                    cylinder(r=filletRadius, h=width);
                    cube([arcLen-2*filletRadius, 1.1*arcLen-2*filletRadius, width]);
                }
            }
        }
    }
}

module simpleFillet()
{
    arcLen = PI*inner/teeth;

    translate([inner+0.4*arcLen, 0, 0])
    difference()
    {
        translate([-arcLen, -arcLen, 0])
            cube([arcLen, 2*arcLen, width]);
        translate([0, -0.707*arcLen, 0])
            rotate([0, 0, 45])
                cube([arcLen, arcLen, width]);
    }
}

module allFillets()
{
    toothAngle = 360/teeth;	// the angle at the origin from the crests of 2 adjacent teeth

    for(i=[toothAngle/2 : toothAngle : 360-toothAngle/2])
    {
        rotate([0,0,i]) 
        if(filletStyle=="simple")
            simpleFillet();
        else if(filletStyle=="round")
            fillet();
    }
}

module allTeeth()	// make a collection of all teeth
{
    toothAngle = 360/teeth;	// the angle at the origin from the crests of 2 adjacent teeth

    for(i=[toothAngle : toothAngle : 360])
    {
        rotate([0,0,i]) tooth();
    }
}

module gear()	// combine the gear blank and the ring of teeth
{
    union()
    {
        makeBlank();
        allTeeth();
        allFillets();
    }
}

if (sane) 
    gear();
else
    echo("***** PLEASE RECTIFY PARAMETER ERRORS *****");

}
