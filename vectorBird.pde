
Player testPlayer;
Gate testGate;
float boostX;
float boostY;
boolean classicMode = false;  //limits vertical velocity in keeping with traditional FlappyBird


void setup(){
  size(960,540);
  background(0);
  testPlayer = new Player();
  testGate = new Gate();
}

void draw(){
  
  
  
  //draw semi-transparent rectangle for neat blur etc
  fill(0,0,0,15);
  noStroke();
  rect(0,0,width,height);
  
  
  boostX = 0.00;
  boostY = -8.50;
  float g = 0.10;
  
  testPlayer.update(g);
  checkCollisions();
  
  if(classicMode){
    testPlayer.velY = constrain(testPlayer.velY, boostY, 10);
  }
  
  testPlayer.display();
  testGate.display();
  
  //wrap the player position (for testing purposes)
  
  if(testPlayer.posX > width + 0.5*testPlayer.size){
    testPlayer.posX = -0.5*testPlayer.size;
  }
    if(testPlayer.posX < -0.5*testPlayer.size){
    testPlayer.posX = width + 0.5*testPlayer.size;
  }
  
}



void mouseReleased(){
  testPlayer.boost(boostX, boostY);

}

void checkCollisions(){
  //will adapt this for multiple pipes soon
  
  if((testPlayer.posX + 0.5*testPlayer.size) > testGate.clearBounds[0] && (testPlayer.posX - 0.5*testPlayer.size) < testGate.clearBounds[1]){
    if((testPlayer.posY - 0.5*testPlayer.size) < testGate.clearBounds[2] || (testPlayer.posY + 0.5*testPlayer.size) > testGate.clearBounds[3]){
      testPlayer.posX = -0.5*testPlayer.size;
      testPlayer.posY = height/2;
    }
  }
}
 

