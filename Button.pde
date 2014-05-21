class Button {
  
  float posX;
  float posY;
  float buttonWidth = 80;
  float buttonHeight = 80;
  boolean mouseIn;
  String buttonText = "";
  
  
  //Constructor (called when object is instantiated)
  Button(float _posX, float _posY, float _buttonWidth, float _buttonHeight, String _buttonText){
    
  posX = _posX;
  posY = _posY;
  buttonWidth = _buttonWidth;
  buttonHeight = _buttonHeight;
  buttonText = _buttonText;
  }
  
  //Alternative constructors
  Button(float _posX, float _posY, String _buttonText){
  posX = _posX;
  posY = _posY;
  buttonText = _buttonText;
  }
  
  Button(float _posX, float _posY){
  posX = _posX;
  posY = _posY;
  }
  
  void detectMouseOver(){  //uh oh, broke modularity here, but I was in a hurry...
   
     
      if(mouseX > (posX - 0.5*buttonWidth)*(1.0*width/arenaWidth) && mouseX < (posX + 0.5*buttonWidth)*(1.0*width/arenaWidth) && mouseY > (posY - 0.5*buttonHeight)*(1.0*width/arenaWidth) && mouseY < (posY + 0.5*buttonHeight)*(1.0*width/arenaWidth)){
        mouseIn = true;
        } else {
        mouseIn = false;
    } 
  }
  
  void display(){
      color b = color(0,0,0,255);
      color t = color(255,255,255,255);
    if(mouseIn){
      b = color(100,100,100,255);
      t = color(255,255,255,255);
    } 
    
    rectMode(CENTER);
    strokeWeight(3);
    textAlign(CENTER,CENTER);
    textSize(18);


    pushMatrix();
      translate(posX,posY);
      stroke(255,255,255,255);
      fill(b);
      rect(0,0, buttonWidth, buttonHeight);
      fill(t);
      text(buttonText,0,0);
    popMatrix();
      
  }
  
}
