float[] gateHeightArray;




void loadLevel(String level){
  
  //Step 0 - load all level information into an array, delimit with carriage returns
  String[] levelStrings = loadStrings("data/" + level + ".txt");
  for(int i = 0; i < levelStrings.length; i++){
     String[] tempLevelStrings = split(levelStrings[i],":");
     println(tempLevelStrings[1]);
     levelStrings[i] = tempLevelStrings[1];
     println(levelStrings);
  }
  
  

  
  
  //Step 1 - load the new gate data
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
  

  //Step 2 - remove existing gates
  for(int i = 0; i < numGates; i++){
    gateList.remove(0);
  } 

  //Step 3 - generate new gates
  numGates = gateHeightArray.length;
  for(int i = 0; i < numGates; i++){
    Gate newGate = new Gate(arenaWidth*(i+1)/(numGates + 1) + 0.3*width, gateHeightArray[i], gateWidth, gateClearance);
  gateList.add(newGate);
  }    
}




void saveGates(){
  
  //Step 1 - initalise the string for temporary storage
  String gatesForWriting = "";
  
  //Step 2 - append the gate height values to this string
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
    gatesForWriting = gatesForWriting + str(thisGate.posY);
    if(i == gateList.size() - 1){
      gatesForWriting = gatesForWriting + ";";
    }else{
      gatesForWriting = gatesForWriting + ", ";
    }
  }
  
  //Step 3 - turn this string into an array, split into another string and save it.
  String[] gateHeightList = split(gatesForWriting,';');
  saveStrings("data/level01.txt", gateHeightList);
}
