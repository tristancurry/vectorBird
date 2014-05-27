
void checkCollisions(boolean bounce, Player p){
  
  //for each gate, check to see if the player has collided. 
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
      if((p.posX + 0.5*p.size) > thisGate.clearBounds[0] && (p.posX - 0.5*p.size) < thisGate.clearBounds[1]){
        if((p.posY - 0.5*p.size) < thisGate.clearBounds[2] || (p.posY + 0.5*p.size) > thisGate.clearBounds[3]){
          finishGame();;
        }
      }
    }
  
  if((p.posY - 0.5*p.size) < 0 && p.velY < 0){          //did you hit the roof?
    if(bounce){
      p.velY = reverseDirection(p.velY, bounceDamping);
    } else {
      finishGame();
    }
  }
  
  if((p.posY + 0.5*p.size) > arenaHeight && p.velY > 0){    //did you hit the floor?
    if(bounce){  
      p.velY = reverseDirection(p.velY, bounceDamping);
    } else {
      finishGame();
    }
  }
 }



float reverseDirection(float comp, float damping){
  return -1*(1-damping)*comp;
}

void resetParticle(Particle p){
  p.posX = -0.5*p.size;
  p.posY = arenaHeight/2;
  p.velX = startingVeloX;
  p.velY = startingVeloY;
 
}
