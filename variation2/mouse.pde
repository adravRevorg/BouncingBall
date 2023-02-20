void keyPressed(){
  
  if (key=='p')             {noLoop();return;}          //pause if 'p' key pressed
  if (key=='c')             { loop(); return;}          // continue for 'c'
  
  if (key=='r')             //reset ball's state and start again
  {
     x = new PVector(random(100, width/2),random(100, height/2),-200);
     v = new PVector(random(100),random(100),random(100));
     a = new PVector(0,10,0);
     
     x0 = x.copy();
     PVector v0 = v.copy();
     PVector a0 = a.copy();
     
     rested = false;  showLines = false;
     loop();
     delay(1000);
  }
  
  if (key=='o')           //toggle showLines
    showLines = !showLines;
    
  if (key=='m')
     moveCamera = !moveCamera;
}
