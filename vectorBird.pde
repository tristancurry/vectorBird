String levelName = "Hello Bird";
String author = "Hieronymous Bosch";
int par = 24;

float startingVeloX = 2.0;
float startingVeloY = 1.0;
color lineColour = color(255,255,255,255);
color textColour = color(255,255,255,255);
color birdColour = color(50,0,50,255);
color skyColour = color(0,0,40,255);
color antiSkyColour = color(255,255,215,255);

int numGates = 4;
float gateWidth = 60;
float gateClearance = 100;
float birdDiameter = 5;
float boostY = -4.00;

boolean bumperBird = false;    /*like bumper bowling - player will bounce off surfaces instead of dying. Glitchy! */
boolean sfx = true;   /*displays neat rocket exhaust effect. */
float bounceDamping = 0.00;
boolean zoom = false;
boolean pause = false;
float storedVelX;
float storedVelY;

Player goodPlayer;
ArrayList blipList;          /*dynamic list of Blips*/
ArrayList blipShadowList;
ArrayList boostList;
ArrayList gateList;          /*dynamic list of Gates*/
ArrayList exhaustList;       /*dynamic list to store exhaust particles (can this be done as a local variable in the exhaust code?) */

int arenaWidth = 3072;
int arenaHeight = 640;
int viewportWidth = 768;
int offsetX = 200;

//SETUP runs once at program start
void setup(){
  size(1024,768);
  background(0);
  
  goodPlayer = new Player(20,arenaHeight/2, startingVeloX, startingVeloY, birdDiameter, lineColour, birdColour);
  blipList = new ArrayList();
  blipShadowList = new ArrayList();
  boostList = new ArrayList();
  exhaustList = new ArrayList();
  gateList = new ArrayList();
  
  /*add initial player position to blipList, corresponding lack of boost to boostList*/
  Blip newBlip = new Blip(goodPlayer.posX, goodPlayer.posY, antiSkyColour);
  Blip newBlipShadow = new Blip(goodPlayer.posX, 0, antiSkyColour);
  blipList.add(newBlip);
  blipShadowList.add(newBlip);
  boostList.add(0.0);
  
  /*generate gates */
  for(int i = 0; i < numGates; i++){
    Gate newGate = new Gate(arenaWidth*(i+1)/(numGates + 1) + 0.3*viewportWidth, arenaHeight/2, gateWidth, gateClearance);
  gateList.add(newGate);
  }    
     

}


//DRAW runs over and over, approx. 60 times per second
//main jobs: clear background, update positions of all objects and display them on the screen
void draw(){
  
  background(0);
  /*update player position*/
  goodPlayer.update();
  
  /*see if player has bumped into anything=*/
  checkCollisions(bumperBird, goodPlayer);  
  
  /*draw all objects to the screen*/
  pushMatrix();
    dealWithZoom();
    drawSky();
    drawWalls();
    drawGates();
    goodPlayer.display();
    drawBlips();
  
    /* if special effects are active, update and display the exhaust particles */
    if(sfx){
      updateExhaust();
    }
    


  popMatrix();
      drawUI();
  /*if player leaves the screen, start them again on the other side */  
  if(goodPlayer.posX > arenaWidth + 0.5*goodPlayer.size){
    //goodPlayer.posX = -0.5*goodPlayer.size;
    pauseGame();
  }
  if(goodPlayer.posX < -0.5*goodPlayer.size){
    goodPlayer.posX = arenaWidth + 0.5*goodPlayer.size;
  }
  
}

/*User input*/  

void keyPressed()
{
  switch (keyCode) {
    case 38: /* up arrow pressed */
      if(!pause){
        goodPlayer.boost(0, boostY);
        Blip upBlip = new Blip(goodPlayer.posX, goodPlayer.posY, antiSkyColour);
        blipList.add(upBlip);
        upBlip = new Blip(goodPlayer.posX, arenaHeight, antiSkyColour);
        blipShadowList.add(upBlip);
        boostList.add(1.0);
        if(sfx){
        //create a little cloud of exhaust particles
          makeExhaust(0,-1*boostY);
        }
      }
    break;

    case 40: /* down arrow pressed */
      if(!pause){
        goodPlayer.boost(0, -1*boostY);
        Blip downBlip = new Blip(goodPlayer.posX, goodPlayer.posY, antiSkyColour);
        blipList.add(downBlip);
        downBlip = new Blip(goodPlayer.posX, arenaHeight, antiSkyColour);
        blipShadowList.add(downBlip);
        boostList.add(-1.0);
        if(sfx){
        //create a little cloud of exhaust particles
          makeExhaust(0, boostY);
        }
      }
    break;
    case 90: /* Z-key pressed */
      zoom = !zoom;
    break;
    case 83: /* S-key pressed */
      saveReplay();
    break;
    case 76: /* L-key pressed */
      loadLevel("levelX");
      
    case 80: /* P-key pressed */
      pauseGame();
      break;
      case 65: /* A-key pressed */
      autoPilot();
  }
}



void pauseGame(){
  if(!pause){
  storedVelX = goodPlayer.velX;
  storedVelY = goodPlayer.velY;
  goodPlayer.velX = 0.0;
  goodPlayer.velY = 0.0;
  } else {
    goodPlayer.velX = storedVelX;
    goodPlayer.velY = storedVelY;
  }
  pause = !pause;
}

void autoPilot(){
  goodPlayer.posX = 20;
  goodPlayer.posY = arenaHeight/2;
  goodPlayer.velX = startingVeloX;
  goodPlayer.velY = startingVeloY;
  pauseGame();
  for(int i = 0; i < blipShadowList.size(); i++){
    Blip thisBlip = (Blip) blipShadowList.get(i);
    Float thisBoost = (Float) boostList.get(i);
    if(goodPlayer.posX == thisBlip.posX){
      println("overlap");
      goodPlayer.boost(0,thisBoost*boostY);
      if(sfx){
        //create a little cloud of exhaust particles
      makeExhaust(0, thisBoost*boostY);
      }
      break;
    }
  }
}



