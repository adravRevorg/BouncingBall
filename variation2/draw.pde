void draw(){
  
  lights();
  if (moveCamera)
            camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  background(0);
  draw_planes();  //draw the planes
  show_help();    //to show interactivity menu
  
  
  if (showLines){
    stroke(0.5);
    line(x.x, x.y,x.z, x.x, x.y, -w);
    line(x.x, x.y,x.z, 0, x.y, x.z);
    line(x.x, x.y,x.z, x.x, h, x.z);
  }
  
  noStroke();
  fill(ball_clr);
  translate(x.x, x.y,x.z);
  sphere(r);
  
  if (rested){
    noLoop();
    return;
  }
  
  //simulation loop
  float t = 0;
  
  while(t<tmax){
      
    updateState(h);
    float f = collisionDetection();
    if (f!=-1){
        updateStateCollision(f*h);
        
        if (atRest()){
            rested = true;
            break;
        }
        collisionResponse(); 
        updateState((1-f)*h);}
    t+=h;  
  }  
  //saveFrame("frames/####.tif");
}

void updateState(float h){
 
  //store previous values
  x0 = x.copy();
  v0 = v.copy();
  a0 = a.copy();
  
  //Calculate new ones at this timestep using euler integration
  a = PVector.add(grav, PVector.mult(v0,-ar/m));
  v.add(PVector.mult(a0,h));  // v(n+1) = v(n) + a(n)*h
  x.add(PVector.mult(v0,h));  // x(n+1) = x(n) + v(n)*h
}

void updateStateCollision(float h){
  
  //this time we recompute current state, so prev state doesnt change as of now
  v = PVector.add(v0,(PVector.mult(a0,h)));  // v(n+1) = v(n) + a(n)*h
  x = PVector.add(x0, PVector.mult(v0,h));  // x(n+1) = x(n) + v(n)*h
    
}

//simply drawing the cube's faces 
void draw_planes(){
  stroke(0);
  strokeWeight(2);
  
  int l = width;
  int w = 500;
  int h = height;
  
  
  //front face
  fill(clr[0]);
  beginShape();   
  vertex(0,0,-w); vertex(l,0,-w); vertex(l,h,-w); vertex(0,h,-w);
  endShape();
  
  
  
  //left face
  beginShape();
  fill(clr[1]);
  vertex(0,0,0); vertex(0,0,-w); vertex(0,h,-w); vertex(0,h,0);
  endShape();
  
  //right face
  beginShape();
  fill(clr[2]);
  vertex(l,0,0); vertex(l,0,-w); vertex(l,h,-w); vertex(l,h,0);
  endShape();
  
  //bottom face
  fill(clr[3]);
  beginShape();
  vertex(0,h,-w); vertex(l,h,-w); vertex(l,h,0); vertex(0,h,0);
  endShape();
  
  //top face
  beginShape();
  fill(clr[4]);
  vertex(0,0,-w); vertex(l,0,-w); vertex(l,0,0); vertex(0,0,0);
  endShape();
  
  
}

void show_help(){
  pushMatrix();
  translate(0,0,-w);
  image(img,0,0);
  popMatrix();
}
