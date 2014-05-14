class Player{
  
  float posX;        //stores x coordinate
  float posY;        //stores y coordinate 
  float velX;        //stores x (horizontal) velocity
  float velY;        //stores y (vertical) velocity
  float size;        //stores radius of collision boundary
  
  int boostCounter;  //how many frames to apply boost over (no instant accn!)
  float boostFractionX; //stores the calculated amount of boost for each frame
  float boostFractionY; //stores the calculated amount of boost for each frame
  


  ///Constructor: runs once when object is created///
  
  Player(float _posX, float _posY, float _velX, float _velY, float _size){
    posX = _posX;
    posY = _posY;
    velX = _velX;
    velY = _velY;
    size = _size;
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  Player(){
    posX = 20;
    posY = height/2;
    velX = 3;
    velY = 0;
    size = 20;
     
 }
 
   Player(float _posX, float _posY, float _velX, float _velY){
    posX = _posX;
    posY = _posY;
    velX = _velX;
    velY = _velY;
    size = 20;
  }
  
  
  ///Methods///
  
  //method to update player parameters (location, velocity etc)
  void update(float gravAccn){

    
    


    
    //update position using velocity components
    posX = posX + velX;                
    //posX = constrain(posX, 0, width);
    posY = posY + velY;
    //posY = constrain(posY, 0, height);
    
    //update velocity components using acceleration components
    
    if(boostCounter > 0){
      velX = velX + boostFractionX;
      velY = velY + boostFractionY;
      boostCounter --;
    } else {
      boostCounter = 0;
    }
    
    velY = velY + gravAccn;
      
  }
  
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
      line(0,0,0.5*size,0);
    popMatrix();
      
  }
  
  //method to alter player velocity from boost
  void boost(float compX, float compY){
    boostCounter = 8 + boostCounter;
    boostFractionX = compX/boostCounter;
    boostFractionY = compY/boostCounter;
    
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


