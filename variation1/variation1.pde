/*Submitted by Varda grover for HW1
- Contains a fixed infinite plane in the x-z plane
- Has a bouncing ball, (euler integration for timesetps)
- with collision detection, determination, response and resting condition
- Gravity, air resistance, friction calculations
- simulation time independent of step size - tried to show this using random h
- Wind - mouse click anywhere on the screen would create a wind as per a function of mouse click position
- Key press to increase/decrease radius and mass
*/


//Current State
PVector x = new PVector(200,200,-200);
PVector v = new PVector(20,0,0);
PVector a = new PVector(0,10,0);

//To store state at previous timestep
PVector x0 = x.copy();
PVector v0 = v.copy();
PVector a0 = a.copy();

//Properties of Ball
float m = 100;   //mass
float g = 10;   //gravity
float r = 30;    //radius


//Time Stuff
float h = 0.01;           //step size
float tmax = 0.1;         //simulation time

//Plane (Considering an infinite plane in x-z plane)
PVector plane = new PVector(0,900,-100);
PVector n = new PVector(0,-1,0);

//Environmental Parameters
float e = 0.97;    //elasticity
float cf = 0.2;   //coefficient of friction
float ar = 2 ;     //air resistance
float d = 2;       //air resistanc e (new)
PVector grav = new PVector(0,g,0);    //gravity
PVector vwind = new PVector(0,0,0);   //wind
boolean rested = false;               //when rested becomes true, we set draw to noLoop()

//Interactivity
PImage img;
