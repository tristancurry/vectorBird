int numGates = 4;
float gateWidth = 60;
float gateClearance = 100;
float birdDiameter = 5;
float boostY = -4.00;

boolean bumperBird = true;    /*like bumper bowling - player will bounce off surfaces instead of dying. Glitchy! */
boolean sfx = true;   /*displays neat rocket exhaust effect. */
float bounceDamping = 0.00;
boolean zoom = false;

Player testPlayer;
ArrayList gateList;          /*dynamic list of Gates*/
ArrayList exhaustList;       /*dynamic list to store exhaust particles (can this be done as a local variable in the exhaust code?) */
int arenaWidth = 2048;
int offsetX = 200;

//SETUP runs once at program start
void setup(){
  size(640,540);
  background(0);
  
  testPlayer = new Player();
  exhaustList = new ArrayList();
  gateList = new ArrayList();
  
  /*generate gates */
  for(int i = 0; i < numGates; i++){
  Gate newGate = new Gate(arenaWidth*(i+1)/(numGates + 1) + 0.3*width, height/2, gateWidth, gateClearance);
  gateList.add(newGate);
  }    
}


//DRAW runs over and over, approx. 60 times per second
//main jobs: clear background, update positions of all objects and display them on the screen
void draw(){
  
   background(0);
  

  /*update player position*/
  testPlayer.update();
  
  /*see if player has bumped into anything=*/
  checkCollisions(bumperBird, testPlayer);  
  
  /*draw player and gates to the screen*/
  
  pushMatrix();
  if(zoom){
   translate(0,height/3.0);
   scale(1.0*width/arenaWidth);
  } else if(testPlayer.posX > offsetX && testPlayer.posX < arenaWidth - width + offsetX){
  translate(-1*testPlayer.posX + offsetX, 0);
  }
  else if(testPlayer.posX >= arenaWidth - width + offsetX && testPlayer.posX < arenaWidth){
  translate(-1*(arenaWidth - width), 0);
  }
  
  /*draw semi-transparent background*/
  fill(0,0,40,255);
  noStroke();
  rect(0,0,arenaWidth,height);
  
  testPlayer.display();
  
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
    thisGate.display();
  }
  
  strokeWeight(3);
  stroke(255,255,255,255);
  line(0,0,arenaWidth,0);
  line(0,height,arenaWidth,height);
  
  /* if special effects are active, update and display the exhaust particles */
  if(sfx){
    updateExhaust();
  }

popMatrix();
  /*if player leaves the screen, start them again on the other side */  
  if(testPlayer.posX > arenaWidth + 0.5*testPlayer.size){
    testPlayer.posX = -0.5*testPlayer.size;
  }
  if(testPlayer.posX < -0.5*testPlayer.size){
    testPlayer.posX = arenaWidth + 0.5*testPlayer.size;
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
    break;
    case 90: /* Z-key pressed */
      zoom = !zoom;
    break;
    case 83: /* S-key pressed */
      saveGates();
    break;
    case 76: /* L-key pressed */
      loadGates();
  }
}



void makeExhaust(float _velX, float _velY){
  for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, _velX,_velY);
        exhaustList.add(newExhaust);
        }
}

