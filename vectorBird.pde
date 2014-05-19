
Player testPlayer;

ArrayList gateList;          /*dynamic list of Gates*/
ArrayList exhaustList;       /*dynamic list to store exhaust particles*/

float boostX;
float boostY;
float boostDownX;
float boostDownY;
float bounceDamping;

boolean classicMode = false;  /*limits vertical velocity in keeping with traditional FlappyBird*/
boolean bumperBird = true;    /*like bumper bowling - player will bounce off surfaces instead of dying. Glitchy! */
boolean sfx = true;           /*displays neat rocket exhaust effect. */

int numGates;
float gateWidth;
float gateClearance;

void setup(){
  size(960,540);
  background(0);
  
  testPlayer = new Player();
  exhaustList = new ArrayList();
  
}

void draw(){
  
  /*draw semi-transparent rectangle for neat blur etc */
  fill(0,0,0,30);
  noStroke();
  rect(0,0,width,height);
  
  /*User input*/
  
  
  
  
  
  
  /*setting up the gates here so that they can be dynamically adjusted using tweak mode...*/
  numGates = 4;
  gateWidth = 60;
  gateClearance = 100;
  
  gateList = new ArrayList();
  
  for(int i = 0; i < numGates; i++){
  Gate newGate = new Gate(width*(i+1)/(numGates + 1), height/2, gateWidth, gateClearance);
  gateList.add(newGate);
  }
  
  
  /*specifying boost values (impulse components) here for dynamic adjustment...*/

  boostX = 0;
  boostY = -4.00;
  float g = 0.00;

  bounceDamping = 0.1;
  
  /*update player position and parameters*/
  testPlayer.boostUpdate();
  testPlayer.update(g);
  
  /*sort out player collisions*/
  checkCollisions(bumperBird, testPlayer);
  
  /*constrain y-velocity if classic mode is on*/
  if(classicMode){
    testPlayer.velY = constrain(testPlayer.velY, boostY, 10);
  }
  


  
  
  /*draw various elements to the screen*/
  
  testPlayer.display();
  
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
    thisGate.display();
  }


  
  //wrap the player position (for testing purposes)
  
  if(testPlayer.posX > width + 0.5*testPlayer.size){
    testPlayer.posX = -0.5*testPlayer.size;
  }
    if(testPlayer.posX < -0.5*testPlayer.size){
    testPlayer.posX = width + 0.5*testPlayer.size;
  }
  
  /*update position, sort collisions, display exhaust particles*/
  if(sfx){
    updateExhaust(g);
  }
  
}

void keyPressed()
{
  switch (keyCode) {
    case 38: /* up arrow pressed */
      testPlayer.boost(boostX, boostY);
      if(sfx){
        //create a little cloud of exhaust particles
        for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, -1*boostX + random(-1.2,1.2),-1*boostY + random(-1.2,1.2));
        exhaustList.add(newExhaust);
        }
      }
    break;
    case 40: /* down arrow pressed */
      testPlayer.boost(-1*boostX, -1*boostY);
       if(sfx){
        //create a little cloud of exhaust particles
        for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, boostX + random(-1.2,1.2),boostY + random(-1.2,1.2));
        exhaustList.add(newExhaust);
        }
    }
  }
}

void boostPlayer(float boostX, float boostY){
     testPlayer.boost(-1*boostX, -1*boostY);
      if(sfx){
        //create a little cloud of exhaust particles
        for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, boostX + random(-1.2,1.2),boostY + random(-1.2,1.2));
        exhaustList.add(newExhaust);
        }
    }
  }


void mouseReleased(){
boostPlayer(boostX, boostY);
  
}


