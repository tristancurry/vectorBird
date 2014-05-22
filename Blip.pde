class Blip{
  
  float posX;
  float posY;
  color blipColour = color(255,0,0,255);
  float innerRadius = 5.0;
  float outerRadius = 20.0;

  
  ///CONSTRUCTOR - runs when object is instantiated///
  
  Blip(float _posX, float _posY, color _blipColour, float _innerRadius, float _outerRadius){
    
    posX = _posX;
    posY = _posY;
    blipColour = _blipColour;
    innerRadius = _innerRadius;
    outerRadius = _outerRadius;
  }
  
  
  ///Alternative constructors///
  
  Blip(float _posX, float _posY){
    posX = _posX;
    posY = _posY;
  }
  
  Blip(float _posX, float _posY, color _blipColour){
    posX = _posX;
    posY = _posY;
    blipColour = _blipColour;
  }
  
  ///Methods///
  
  void display(){
    ellipseMode(CENTER);
    noStroke();
    fill(blipColour);
    ellipse(posX, posY, 2*innerRadius, 2*innerRadius);
    strokeWeight(3);
    stroke(blipColour);
    noFill();
    ellipse(posX, posY, 2*outerRadius, 2*outerRadius);
  }
  
}
