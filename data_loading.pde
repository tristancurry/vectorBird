float[] gateHeightArray;


void loadLevel(String level){
  
  //Step 0 - load all level information into an array
  String[] levelStrings = loadStrings("data/" + level + ".txt");
  for(int i = 0; i < levelStrings.length; i++){
     String[] tempLevelStrings = split(levelStrings[i],":");
     levelStrings[i] = tempLevelStrings[1];
  }
  
  
  //Step 1 - assign the array elements to the right variables
  String[] gateString = loadStrings("data/" + level + ".txt");
  levelName = levelStrings[0];  
  author = levelStrings[1];
  par = int(levelStrings[2]);
  gateHeightArray = float(splitTokens(levelStrings[3], ", "));
  gateClearance = float(levelStrings[4]);
  gateWidth = float(levelStrings[5]);
  birdDiameter = float(levelStrings[6]);
  startingVeloX = float(levelStrings[7]);
  startingVeloY = float(levelStrings[8]);
  int[] colourArray = int(splitTokens(levelStrings[9],", "));
  lineColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[10],", "));
  textColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[11],", "));
  birdColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[12],", "));
  skyColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  antiSkyColour = color((red(skyColour)+128)%255,(green(skyColour)+128)%255,(blue(skyColour)+128)%255,255);
  

  //Step 2 - remove existing gates
  for(int i = 0; i < numGates; i++){
    gateList.remove(0);
  } 

  //Step 3 - generate new gates
  numGates = gateHeightArray.length;
  for(int i = 0; i < numGates; i++){
    Gate newGate = new Gate(arenaWidth*(i+1)/(numGates + 1) + 0.3*viewportWidth, gateHeightArray[i], gateWidth, gateClearance);
  gateList.add(newGate);
  }  

  //Step 4 - cleanup trails and plonk player at starting coordinates (will eventually call a more general 'resetPlayer' function...
  blipList = new ArrayList();
  blipShadowList = new ArrayList();
  boostList = new ArrayList();
  goodPlayer = new Player(20,arenaHeight/2, startingVeloX, startingVeloY, birdDiameter, lineColour, birdColour);
    Blip newBlip = new Blip(goodPlayer.posX, goodPlayer.posY, antiSkyColour);
  blipList.add(newBlip);
  boostList.add(0.0);
  storedVelX = startingVeloX;
  storedVelY = startingVeloY;
}




void saveReplay(){
  
  //Step 1 - initalise the string for temporary storage
  String replayForWriting = "";
  
  //Step 2 - append the gate height values to this string
  for(int i = 0; i < blipList.size(); i++){
    Blip thisBlip = (Blip) blipList.get(i);
    float thisBoost = (Float) boostList.get(i);
    replayForWriting = replayForWriting + str(thisBlip.posX) + "," + str(thisBoost);
    if(i == gateList.size() - 1){
      replayForWriting = replayForWriting + "/";
    }else{
      replayForWriting = replayForWriting + ";";
    }
  }
  
  //Step 3 - turn this string into an array, split into another string and save it.
  String[] replayList = split(replayForWriting,"/");
  saveStrings("data/replay01.txt", replayList);
}




void loadReplay(String replay){
  
  //Step 0 - load all level information into an array
  String[] replayStrings = loadStrings("data/" + replay + ".txt");
  for(int i = 0; i < replayStrings.length; i++){
     String[] tempReplayStrings = split(replayStrings[i],";");
     println(replayStrings[i]);
     replayStrings[i] = tempReplayStrings[1];
     println(replayStrings[i]);
  }
  
  //Step 1 - clobber existing blip and boost lists, replace with loaded numbers
  /*
  blipList = new ArrayList();
  blipShadowList = new ArrayList();
  boostList = new ArrayList();
  
  

  
  
  
  //Step 1 - assign the array elements to the right variables
  String[] gateString = loadStrings("data/" + level + ".txt");
  levelName = levelStrings[0];  
  author = levelStrings[1];
  par = int(levelStrings[2]);
  gateHeightArray = float(splitTokens(levelStrings[3], ", "));
  gateClearance = float(levelStrings[4]);
  gateWidth = float(levelStrings[5]);
  birdDiameter = float(levelStrings[6]);
  startingVeloX = float(levelStrings[7]);
  startingVeloY = float(levelStrings[8]);
  int[] colourArray = int(splitTokens(levelStrings[9],", "));
  lineColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[10],", "));
  textColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[11],", "));
  birdColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  colourArray = int(splitTokens(levelStrings[12],", "));
  skyColour = color(colourArray[0],colourArray[1],colourArray[2],colourArray[3]);
  antiSkyColour = color((red(skyColour)+128)%255,(green(skyColour)+128)%255,(blue(skyColour)+128)%255,255);
  

  //Step 2 - remove existing gates
  for(int i = 0; i < numGates; i++){
    gateList.remove(0);
  } 

  //Step 3 - generate new gates
  numGates = gateHeightArray.length;
  for(int i = 0; i < numGates; i++){
    Gate newGate = new Gate(arenaWidth*(i+1)/(numGates + 1) + 0.3*viewportWidth, gateHeightArray[i], gateWidth, gateClearance);
  gateList.add(newGate);
  }  

  //Step 4 - cleanup trails and plonk player at starting coordinates (will eventually call a more general 'resetPlayer' function...
  blipList = new ArrayList();
  blipShadowList = new ArrayList();
  boostList = new ArrayList();
  goodPlayer = new Player(20,arenaHeight/2, startingVeloX, startingVeloY, birdDiameter, lineColour, birdColour);
    Blip newBlip = new Blip(goodPlayer.posX, goodPlayer.posY, antiSkyColour);
  blipList.add(newBlip);
  boostList.add(0.0);
  storedVelX = startingVeloX;
  storedVelY = startingVeloY;
  */
}
