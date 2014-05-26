void dealWithZoom(){
  if(zoom){
   translate(0,arenaHeight/3.0);
   scale(1.0*viewportWidth/arenaWidth);
  } else if(goodPlayer.posX > offsetX && goodPlayer.posX < arenaWidth - viewportWidth + offsetX){
  translate(-1*goodPlayer.posX + offsetX, 0);
  }
  else if(goodPlayer.posX >= arenaWidth - viewportWidth + offsetX && goodPlayer.posX < arenaWidth){
  translate(-1*(arenaWidth - viewportWidth), 0);
  }
}

void drawBlips(){
  if(drawPath == true){
  for(int i = 0; i < blipList.size(); i++){
    Blip thisBlip = (Blip) blipList.get(i);
    stroke(thisBlip.blipColour);
    strokeWeight(2);
    if(i > 0){
      Blip prevBlip = (Blip) blipList.get(i-1);
      line(prevBlip.posX, prevBlip.posY, thisBlip.posX, thisBlip.posY);
    }
    if(i == blipList.size() - 1){
      line(thisBlip.posX, thisBlip.posY, goodPlayer.posX, goodPlayer.posY);
    }
    
  }
  }
   for(int i = 0; i < blipList.size(); i++){
    Blip thisBlip = (Blip) blipList.get(i);
    float thisBoost = (Float) boostList.get(i);
    pushMatrix();
    translate(0, arenaHeight - thisBlip.posY);
    thisBlip.display(thisBoost);
    popMatrix();
    if(drawVerticals == true){
      stroke(thisBlip.blipColour);
      strokeWeight(1);
      line(thisBlip.posX, 0, thisBlip.posX, arenaHeight);
    }
    
  }
}

void drawGates(){
    for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
    thisGate.display();
  }
}

void drawSky(){
  fill(skyColour);
  noStroke();
  rect(0,0,arenaWidth,arenaHeight);
}

void drawUI(){
  pushMatrix();
  translate(viewportWidth,0);
  strokeWeight(5);
  stroke(255,0,255,255);
  fill(0);
  rectMode(CORNER);
  rect(0,0,width-viewportWidth,arenaHeight);
  fill(255);
  textAlign(LEFT,TOP);
  textSize(25);
  text("this is where the\n scoreboard will go", 5,5);
  popMatrix();
}

void drawWalls(){
  strokeWeight(3);
  stroke(lineColour);
  line(0,0,arenaWidth,0);
  line(0,arenaHeight,arenaWidth,arenaHeight);
}


