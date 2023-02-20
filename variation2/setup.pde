void setup() {
  size(1700, 1000, P3D);
  surface.setLocation(10, 10);
  colorMode(RGB,1.0);
  
  img = loadImage("help.png");
 
  noStroke();
  setup_planes();
}


//set the faces of cube

void setup_planes() {

  l = width;
  hc = height;
  w = 500;
  int h = hc;
  
  //all faces
  
  //front face
  plane[0] = new PVector(0,0,-w);  n[0] = new PVector(0,0,1);     clr[0] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
  //left face
  plane[1] = new PVector(0,0,-w); n[1] = new PVector(1,0,0);      clr[1] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
  //right face 
  plane[2] = new PVector(l,0,0);  n[2] = new PVector(-1,0,0);     clr[2] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
  //bottom face
  plane[3] = new PVector(0,h,-w); n[3] = new PVector(0,-1,0);     clr[3] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
  //top face
  plane[4] = new PVector(0,0,-w); n[4] = new PVector(0,1,0);      clr[4] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
  //frontmost face
  plane[5] = new PVector(0,0,0); n[5] = new PVector(0,0,-1);      clr[5] = color(random(0.5,1), random(0.5,1), random(0.5,1));
  
}
