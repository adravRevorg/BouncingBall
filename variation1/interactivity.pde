void mousePressed(){
  //depending on where mouse is pressed, we would update the the wind speed
  //have kept it such that if clicked on right half, wind towards right would be added to existing wind
  //and reverse for left half of the sketch window
  PVector change = new PVector((mouseX- width/2)/100,(mouseY-height/2)/100,0);
  vwind.add(change);
}

void keyPressed(){
  
  
    
  if (key=='d'){
     
     loop();
     rested = false;
    
     x = new PVector(random(width*0.25),random(height*0.25),-200);
     v = new PVector(random(20),random(20),0);
     a = new PVector(0,10,0);
    
     x0 = x.copy();
     v0 = v.copy();
     a0 = a.copy();
  }
  
  if (key=='m')         m+=1;
  if (key=='M')         m-=1;
  if (key=='r')         r+=1;
  if (key=='R')         r-=1;
  
  
  
}

  
