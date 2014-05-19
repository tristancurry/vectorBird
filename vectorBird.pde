boolean[] downKeys = new boolean[256]; //declare an ARRAY of booleans, effectively a row of 256 switches that can be off or on
boolean[] downKeysOld = new boolean[256];

Player testPlayer;

ArrayList gateList;          /*dynamic list of Gates*/
ArrayList exhaustList;       /*dynamic list to store exhaust particles*/

float boostUpX;
float boostUpY;
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
  
  //if w or W are pressed, boost UP, unless key is already pressed
  if((downKeys[87] && !downKeysOld[87])||(downKeys[119] && !downKeysOld[119])){
    boostPlayer(boostUpX, boostUpY);
    downKeysOld[87] = true;
    downKeysOld[119] = true;
  } //if s or S are pressed, boost UP, unless key is already pressed
  else if((downKeys[83] && !downKeysOld[83])||(downKeys[115] && !downKeysOld[115])){
    boostPlayer(boostDownX, boostDownY);
    downKeysOld[83] = true;
    downKeysOld[115] = true;
  } 
  
  
  
  
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
<<<<<<< HEAD
  boostUpX = 0.50;
  boostUpY = -4.00;
  boostDownX = -0.25;
  boostDownY = 2.00;
  float g = 0.00;
=======
  boostX = 0.00;
  boostY = -4.0; /* strength of "kick" (8.5 looks about the same as flappy bird) */
  float g = 0.00; /* strength of gravity (0.1 looks about the same as flappy bird) */
>>>>>>> b456e942320f93fd34fe88d96a50740753f38fb7
  bounceDamping = 0.1;
  
  /*update player position and parameters*/
  testPlayer.boostUpdate();
  testPlayer.update(g);
  
  /*sort out player collisions*/
  checkCollisions(bumperBird, testPlayer);
  
  /*constrain y-velocity if classic mode is on*/
  if(classicMode){
    testPlayer.velY = constrain(testPlayer.velY, boostUpY, 10);
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

<<<<<<< HEAD
void boostPlayer(float boostX, float boostY){
=======
void keyPressed()
{
  switch (keyCode) {
    case 38: /* up arrow pressed */
      testPlayer.boost(boostX, boostY);
//      if(sfx){
//        //create a little cloud of exhaust particles
//        for(int i = 0; i < 25; i ++){
//        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, -1*boostX + random(-1.2,1.2),-1*boostY + random(-1.2,1.2));
//        exhaustList.add(newExhaust);
//        }
//      }
    break;
    case 40: /* down arrow pressed */
      testPlayer.boost(-1*boostX, -1*boostY);
      if(sfx){
        //create a little cloud of exhaust particles
        for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, -1*boostX - random(-1.2,1.2),-1*boostY - random(-1.2,1.2));
        exhaustList.add(newExhaust);
        }
    }
  }
}

void mouseReleased(){
>>>>>>> b456e942320f93fd34fe88d96a50740753f38fb7
  testPlayer.boost(boostX, boostY);
  if(sfx){
    //create a little cloud of exhaust particles
    for(int i = 0; i < 25; i ++){
    Exhaust newExhaust = new Exhaust(testPlayer.posX, testPlayer.posY, -1*boostUpX + random(-1.2,1.2),-1*boostUpY + random(-1.2,1.2));
    exhaustList.add(newExhaust);
    }
  }
}


void mouseReleased(){
boostPlayer(boostUpX, boostUpY);
  

}


void keyPressed() {
 if (key<256) {  //if a key is pressed, and its numerical code is less than 256,
   downKeys[key] = true;  //set the corresponding element of downKeys to 'true'
   /*  for(int i = 0; i< downKeys.length; i++){
     if(downKeys[i]){  
       println(i);
       } //this FOR LOOP is optional...it goes through the downKeys array
         //one entry at a time, and if it encounters a 'true' (which corresponds to a pressed key)
         //it prints the value of the key to the console (below), using the println() function.
         //This is useful for working out the numerical code for particular keys.
         //For instance, 'space' is 32.
   }*/
     
 }
}

void keyReleased() { //this function returns elements of downKeys to 'false'
 if (key<256) {      //if a change in the key's state is detected.
   downKeys[key] = false;
   downKeysOld[key] = false;
   //println(0);
  }
}

