class Player{
  
  float posX;        //stores x coordinate
  float posY;        //stores y coordinate
  
  float velX;        //stores x (horizontal) velocity
  float velY;        //stores y (vertical) velocity
  
  float size;        //stores radius of collision boundary
  

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

    //update velocity components using acceleration components
    velY = velY + gravAccn;            
    
    //update position using velocity components
    posX = posX + velX;                
    constrain(posX, 0, width);
    posY = posY + velY;
    constrain(posY, 0, height);
      
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
  void boost(){
    
  }
  
  //method to determine player rotation from velocity
  float findRotation(float compX, float compY){
    float angle = atan(compY/compX);
    if(compY < 0){
      angle = angle + PI;
    }
    return angle;
  }
  
  
}


