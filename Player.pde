class Player extends Particle {

  color strokeColour = color(255,255,0,255);
  color ellipseColour = color(100,0,100,255);


  ///Constructor: runs once when object is created///
  
  Player(float _posX, float _posY, float _velX, float _velY, float _size, color _strokeColour, color _ellipseColour){
    super( _posX,  _posY,  _velX, _velY, _size);
    strokeColour = _strokeColour;
    ellipseColour = _ellipseColour;
    
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  Player(){
    super();
    size = 5;
     
 }
 
   Player(float _posX, float _posY, float _velX, float _velY){
    super( _posX,  _posY,  _velX, _velY);
    size = 5;
  }
  
  
  ///Methods///
  
  
  
  //method to draw player to screen
  void display(){
    float rotation = findRotation(velX,velY);
    float drawsize = max(30,size);
    
    pushMatrix();
      translate(posX, posY);
      rotate(rotation);
      ellipseMode(CENTER);
      strokeWeight(2);
      stroke(strokeColour);
      fill(ellipseColour);
      
      ellipse(0,0,drawsize,drawsize);

      fill(0,0,0,255);
      stroke(strokeColour);
      ellipse(0,0,size,size);
      stroke(255,255,0,255);
      line(0,0,0.5*drawsize,0);
    popMatrix();
      
  }
  
  //methods to alter player velocity from boost
//  void boost(float compX, float compY){
//    boostCounter = 1 + boostCounter;
//    boostFractionX = compX/boostCounter;
//    boostFractionY = compY/boostCounter;  
//  }

 void boost(float compX, float compY){
      velY = velY + compY; 
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


