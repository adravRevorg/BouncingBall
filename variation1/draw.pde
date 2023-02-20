void draw(){
  
  lights();   background(0);
  image(img,width/2,5);
  
  //stroke(255);
  println("frameNumber : " + frameCount+ "     Time : " + millis());
  
  draw_planes();
  
  translate(x.x, x.y,plane.z);
  sphere(r);
  
  if (rested){
    noLoop();
    return;
  }
  
  //simulation loop
  float t = 0;
  h = random(0.01,tmax-0.01);                  //keeping h i.e. the step size random to show that simulation is being displayed at the same irrespective of h
  
  println("frameNumber : " + frameCount+ "     Time : " + millis()+ "    h : "+h);
  
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
        updateState((1-f)*h);
        
    }
    t+=h;
  }
  
}

void updateState(float h){
 
  //store previous values
  x0 = x.copy();
  v0 = v.copy();
  a0 = a.copy();
  
  
  //get new state values
  a = PVector.add(grav, PVector.mult(PVector.sub(vwind,v0),d/m));
  v.add(PVector.mult(a0,h));  // v(n+1) = v(n) + a(n)*h
  x.add(PVector.mult(v0,h));  // x(n+1) = x(n) + v(n)*h
}

void updateStateCollision(float h){
  
  //this time we recompute current state, so prev state doesnt change as of now
  v = PVector.add(v0,(PVector.mult(a0,h)));  // v(n+1) = v(n) + a(n)*h
  x = PVector.add(x0, PVector.mult(v0,h));  // x(n+1) = x(n) + v(n)*h
    
}

void draw_planes(){
  pushMatrix();
  translate(0,0,plane.z);
  rect(0,plane.y,width,2);
  popMatrix();
}
