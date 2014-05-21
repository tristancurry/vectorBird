
float[] gateHeightArray;


void loadGates(){
  
  //Step 1 - load the new gate data
  String[] gateString = loadStrings("data/gates.txt");
  gateHeightArray = float(split(gateString[0], ','));

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
  saveStrings("data/gates.txt", gateHeightList);
}
