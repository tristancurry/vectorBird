class Exhaust extends Particle {

  int exhaustMaxTime = 60;  //used to arrange a nice fade and removal when expired
  int exhaustTime = exhaustMaxTime;
  float spread = 1.2;
  
  ///Constructor: runs once when object is created///
  
  Exhaust(float _posX, float _posY, float _velX, float _velY, float _size){
    super( _posX,  _posY,  _velX, _velY, _size);
    velX = velX + random(-1*spread, spread);
    velY = velY + random(-1*spread, spread);  
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  Exhaust(){
    super();
    size = 3.0;
    velX = velX + random(-1*spread, spread);
    velY = velY + random(-1*spread, spread);   
 }
 
   Exhaust(float _posX, float _posY, float _velX, float _velY){
    super( _posX,  _posY,  _velX, _velY);
    size = 4.0;
    velX = velX + random(-1*spread, spread);
    velY = velY + random(-1*spread, spread);  
  }
  
  
  ///Methods///
  
  
  
  //method to draw exhaust particles to screen
  void display(){
    
    pushMatrix();
      translate(posX, posY);
      ellipseMode(CENTER);
      noStroke();
      fill(255*(1 - 0.5*exhaustTime/exhaustMaxTime),0*(1.0 - exhaustTime/exhaustMaxTime),255*(1.0*exhaustTime/exhaustMaxTime),255*(1.0*exhaustTime/exhaustMaxTime));
      ellipse(0,0,size,size);
    popMatrix();     
  }
  
 
  void countdown(){
    exhaustTime --;
  }
  
  
  
}


