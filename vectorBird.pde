//USER PARAMETERS and INTERACTIVE ELEMENTS

//GATES
//number of gates
//vertical width of each gate
//horizontal width of each gate?
//spacing between gates

//PLAYER
//size
//boost components (acceleration vector)
//when to apply the acceleration

//GENERAL ENVIRONMENT
//gravity
//atmosphere drag
//visibility of collision model
//visibility of coordinate axes
//visibility of vectors
//paths of previous attempts with 'boost' points highlighted
//visualisation of the boost vector


//OTHER THINGS
//facility for saving screenshots
//facility for saving parameters between sessions

Player testPlayer;

void setup(){
  size(960,540);
  background(0);
  testPlayer = new Player();
}

void draw(){
  
  
  
  float g = 0.03;
  
  testPlayer.update(g);
  testPlayer.display();
  
  
  
  
}

