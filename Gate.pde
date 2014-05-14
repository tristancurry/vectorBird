class Gate{
  
  //variable declarations with default values
  float posX = width/2;           //where to put the gate (x-coord)
  float posY = height/2;          //position for gate centre
  float gateWidth = 40;         //how wide in x-direction to make the gate
  float clearance = 100;         //how much vertical clearance the gate offers
  float ceiling = 0;             //where the ceiling of the simulation is
  float floor = height;          //where the floor of the simulation is
  float[] clearBounds = new float[4];   //used to store the extent of the clear region in the gate for collision detection
  
  
  
  ///Constructor: runs once when object is created///
  
  Gate(float _posX, float _posY, float _gateWidth, float _clearance, float _ceiling, float _floor){
    posX = _posX;
    posY = _posY;
    gateWidth = _gateWidth;
    clearance = _clearance;
    ceiling = _ceiling;
    floor = _floor;
    
    findClearBounds();
  }
  
  ///Alternative constructors: in case user doesn't specify all arguments///
  
  Gate(float _posX, float _posY, float _gateWidth, float _clearance){
    posX = _posX;
    posY = _posY;
    gateWidth = _gateWidth;
    clearance = _clearance;
    
    findClearBounds();
  }
  
  Gate(float _posX, float _posY, float _clearance){
    posX = _posX;
    posY = _posY;
    clearance = _clearance;
    
    findClearBounds();
  }
  
  Gate(float _posX, float _posY){
    posX = _posX;
    posY = _posY;
    
    findClearBounds();
  }
  
  Gate(){
    findClearBounds();
  }
  
  ///Methods///
    
  void display(){
    makeRectangles();
  }
    
  void makeRectangles(){
    rectMode(CORNER);
    strokeWeight(3);
    stroke(255,255,255,255);
    fill(0,0,0,255);
    rect(clearBounds[0], ceiling, clearBounds[1] - clearBounds[0], clearBounds[2] - ceiling);
    rect(clearBounds[0], clearBounds[3], clearBounds[1] - clearBounds[0], floor - clearBounds[3]);
  }
  
  void findClearBounds(){
    clearBounds[0] = this.posX - 0.5*gateWidth;
    clearBounds[1] = this.posX + 0.5*gateWidth;
    clearBounds[2] = this.posY - 0.5*clearance;
    clearBounds[3] = this.posY + 0.5*clearance;
  }
  
}





