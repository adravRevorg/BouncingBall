//to detect if collision happened, and if yes, return fraction of timestep
//else return -1 if no collision
float collisionDetection() {

  for (int i=0; i<plane.length; i++) {
      float d0 = n[i].dot(PVector.sub(x0, plane[i])) + r;
      float d1 = n[i].dot(PVector.sub(x, plane[i])) - (r);
  
      if ((d0*d1)<0) {
        planeCollided = i;
        float f = abs(d0)/(abs(d0)+abs(d1));
        
        //change plane color and change ballColor if it is the frontmost face
        clr[i] = color(random(0.5,1), random(0.5,1), random(0.5,1));
        if (i==5)
          ball_clr = color(random(0.5), random(0.5), random(0.5));
        return f;
        
      }
  }
  return -1;
}

void collisionResponse() {

  //what's our collision response ?
  //our velocities will change
  PVector v_bc = v.copy();      //bc : before collision
  PVector v_bcN = PVector.mult(n[planeCollided], n[planeCollided].dot(v_bc));  //bcN : before collision normal part
  PVector v_bcT = PVector.sub(v_bc, v_bcN);      //bcT : before collision tangential part

  //normal component would be -1*e*v
  PVector v_acN = PVector.mult(v_bcN, -e);
  PVector v_acT = PVector.mult(v_bcT, max(0, (1-cf)));
  v = PVector.add(v_acN, v_acT);
}

//to check if at rest
boolean atRest(){
  
  if (v.mag()>20)    return false;              //not slow enough to consider for rest (Condition 1 in book)
  
  float d = n[planeCollided].dot(PVector.sub(x,plane[planeCollided])) + r;
  if (abs(d)>100)    return false;              //not near enough to the plane to consider rest  (Condition 2 in book)
  
  if (PVector.dot(a,n[planeCollided])>0.0001)  return false;         //force isnt opposite to plane, ex : vertical plane (Condition 3 in book)
  
  PVector aN = PVector.mult(n[planeCollided],n[planeCollided].dot(a));
  PVector aT = PVector.sub(a,aN);
  if ((aT.mag()-aN.mag()*cf)>0.0001)               return false;     //(Condition 4 in book)
      
  
  return true;
}
