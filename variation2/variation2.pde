/* Program submitted by Varda Grover
Variation2 of Howework 1
- Shows a ball bouncing in a 3d cube
- Color of cube's face changes when the ball collides with it
- Color of ball canges when it collides with the frontmost(transparent face)
- Gravity, air resistance, friction, etc all in place;
- Has UI options like pause, continue, show lines, reset, move camera
*/


//Current State
PVector x = new PVector(random(100, 1000),random(100, 400),-200);
PVector v = new PVector(random(100),random(100),random(100));
PVector a = new PVector(0,10,0);


//To store state at previous timestep
PVector x0 = x.copy();
PVector v0 = v.copy();
PVector a0 = a.copy();


//Properties of Ball
float m = 100;   //mass
float g = 10;   //gravity
float r = 30;    //radius
color ball_clr = color(0);


//Time Stuff
float h = 0.01;     //step size
float tmax = 0.1;   //simulation time


//Environmental Parameters
float e = 0.95;    //elasticity
float cf = 0.2;   //coefficient of friction
float ar = 2 ;     //air resistance
PVector grav = new PVector(0,g,0);    //gravity
boolean rested = false;


//Planes or Faces of the Cube
PVector[] plane = new PVector[6];
PVector[] n = new PVector[6];
int planes = 6;                   //total planes
int planeCollided = -1;
color[] clr = new color[6];

//cube dimensions (naming height as hc because we already have h)
int l;        //x direction
int w;        //z
int hc;       //y direction


//Interactivity related
boolean showLines = false;
boolean moveCamera = false;
PImage img;
