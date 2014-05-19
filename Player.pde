class Player extends Particle {

  int boostCounter;  //how many frames to apply boost over (no instant accn!)
  float boostFractionX; //stores the calculated amount of boost for each frame
  float boostFractionY; //stores the calculated amount of boost for each frame
  


  ///Constructor: runs once when object is created///
  
  Player(float _posX, float _posY, float _velX, float _velY, float _size){
    super( _posX,  _posY,  _velX, _velY, _size);
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  Player(){
    super();
     
 }
 
   Player(float _posX, float _posY, float _velX, float _velY){
    super( _posX,  _posY,  _velX, _velY);
  }
  
  
  ///Methods///
  
  
  
  //method to draw player to screen
  void display(){
    float rotation = findRotation(velX,velY);
    
    
    pushMatrix();
      translate(posX, posY);
      rotate(rotation);
      ellipseMode(CENTER);
      strokeWeight(3);
      stroke(255,255,0,255);
      fill(100,0,100,255);
      
      ellipse(0,0,size,size);
      //fill(100,0,100,255);
      //ellipse(0,0,1,1);
      line(0,0,0.5*size,0);
    popMatrix();
      
  }
  
  //methods to alter player velocity from boost
  void boost(float compX, float compY){
    boostCounter = 1 + boostCounter;
    boostFractionX = compX/boostCounter;
    boostFractionY = compY/boostCounter;  
  }
  
  void boostUpdate(){
      if(boostCounter > 0){
      velX = velX + boostFractionX;
      velY = velY + boostFractionY;
      boostCounter --;
    } else {
      boostCounter = 0;
    }
    
  }
  
  //method to determine player rotation from velocity
  float findRotation(float compX, float compY){
    float angle = atan(compY/compX);
    
    //correct the angle if it should really be in quadrants 3 or 4
    if(compX < 0){
      angle = angle + PI;
    }
    
    return angle;
  }
  
  
}


