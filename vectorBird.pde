int numGates = 4;
float gateWidth = 60;
float gateClearance = 100;
float birdDiameter = 5;
float boostY = -4.00;

boolean bumperBird = true;    /*like bumper bowling - player will bounce off surfaces instead of dying. Glitchy! */
boolean sfx = true;   /*displays neat rocket exhaust effect. */
float bounceDamping = 0.10;

Player testPlayer;
ArrayList gateList;          /*dynamic list of Gates*/
ArrayList exhaustList;       /*dynamic list to store exhaust particles (can this be done as a local variable in the exhaust code?) */



//SETUP runs once at program start
void setup(){
  size(960,540);
  background(0);
  
  testPlayer = new Player();
  exhaustList = new ArrayList();
  gateList = new ArrayList();
  
  /*generate gates */
  for(int i = 0; i < numGates; i++){
  Gate newGate = new Gate(width*(i+1)/(numGates + 1), height/2, gateWidth, gateClearance);
  gateList.add(newGate);
  }    
}


//DRAW runs over and over, approx. 60 times per second
//main jobs: clear background, update positions of all objects and display them on the screen
void draw(){
  
  /*draw semi-transparent background*/
  fill(0,0,0,30);
  noStroke();
  rect(0,0,width,height);
  

  /*update player position*/
  testPlayer.update();
  
  /*see if player has bumped into anything=*/
  checkCollisions(bumperBird, testPlayer);  
  
  /*draw player and gates to the screen*/
  testPlayer.display();
  
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
    thisGate.display();
  }


  /*if player leaves the screen, start them again on the other side */  
  if(testPlayer.posX > width + 0.5*testPlayer.size){
    testPlayer.posX = -0.5*testPlayer.size;
  }
  if(testPlayer.posX < -0.5*testPlayer.size){
    testPlayer.posX = width + 0.5*testPlayer.size;
  }
  
/* if special effects are active, update and display the exhaust particles */
  if(sfx){
    updateExhaust();
  }
  
}

/*User input*/  

void keyPressed()
{
  switch (keyCode) {
    case 38: /* up arrow pressed */
      testPlayer.boost(0, boostY);
      if(sfx){
        //create a little cloud of exhaust particles
        makeExhaust(0,-1*boostY);
      }
    break;
    case 40: /* down arrow pressed */
      testPlayer.boost(0, -1*boostY);
       if(sfx){
        //create a little cloud of exhaust particles
        makeExhaust(0, boostY);
    }
  }
}



void makeExhaust(float _velX, float _velY){
  for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, _velX,_velY);
        exhaustList.add(newExhaust);
        }
}

