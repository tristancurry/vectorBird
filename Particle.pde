class Particle{
  
  float posX;        //stores x coordinate
  float posY;        //stores y coordinate 
  float velX;        //stores x (horizontal) velocity
  float velY;        //stores y (vertical) velocity
  float size;        //stores radius of collision boundary
  
 


  ///Constructor: runs once when object is created///
  
  Particle(float _posX, float _posY, float _velX, float _velY, float _size){
    posX = _posX;
    posY = _posY;
    velX = _velX;
    velY = _velY;
    size = _size;
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  Particle(){
    posX = 20;
    posY = height/2;
    velX = 2;  /* sets initial horizontal velocity (right is positive) */
    velY = 1;  /* sets initial vertical velocity (upwards is positive) */
    size = birdDiameter;
     
 }
 
   Particle(float _posX, float _posY, float _velX, float _velY){
    posX = _posX;
    posY = _posY;
    velX = _velX;
    velY = _velY;
    size = birdDiameter;
  }
  
  
  ///Methods///
  
  //method to update player parameters (location, velocity etc)
  void update(float gravAccn){


    
    //update position using velocity components
    posX = posX + velX;                
    posY = posY + velY;
    
    //update velocity components using acceleration components
   
//    velY = velY + gravAccn;
      
  }
  
 
  

  
  
  
    
  
  
}


