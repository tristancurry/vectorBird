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
  
  void display(float boost){
    int boostInt = int(boost);
    ellipseMode(CENTER);
    pushMatrix();
    translate(posX,posY);
    if(boostInt == 0){
      noStroke();
      fill(blipColour);
      ellipse(0, 0, 2*innerRadius, 2*innerRadius);
      strokeWeight(3);
      stroke(blipColour);
      noFill();
      ellipse(0, 0, 2*outerRadius, 2*outerRadius); 
      
    } else if(boostInt > 0){
      for(int i = 0; i < boostInt; i++){
        noStroke();
        fill(blipColour);
        ellipse(0, 0, 2*innerRadius, 2*innerRadius);
        translate(0, 1.732*outerRadius);
        strokeWeight(3);
        stroke(blipColour);
        noFill();
        drawTriangle(); 
      } 
    }
    if(boostInt < 0){
       rotate(PI);
       translate(0,boostInt*1.732*outerRadius);
       for(int i = 0; i > boostInt; i--){
        translate(0, 1.732*outerRadius);
        
        noStroke();
        fill(blipColour);
        ellipse(0, 0, 2*innerRadius, 2*innerRadius);
        strokeWeight(3);
        stroke(blipColour);
        noFill();
        drawTriangle(); 
      } 
    }
    popMatrix();
  }
  
  void drawTriangle(){
    triangle(-outerRadius,0,outerRadius,0,0,-1.732*outerRadius);
  }
  
}
