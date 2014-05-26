
void checkCollisions(boolean bounce, Particle p){
  
  //for each gate, check to see if this particle has collided. There are lots of nested conditionals in case we want particles to bounce off the sides
  for(int i = 0; i < gateList.size(); i++){
    Gate thisGate = (Gate) gateList.get(i);
      if((p.posX + 0.5*p.size) > thisGate.clearBounds[0] && (p.posX - 0.5*p.size) < thisGate.clearBounds[1]){
        if((p.posY - 0.5*p.size) < thisGate.clearBounds[2] || (p.posY + 0.5*p.size) > thisGate.clearBounds[3]){
          if(bounce){
            if(sq(p.velX) < 0.005){
              p.velX = p.velX + random(-0.010,0.010);
            }
            if(p.posY  > thisGate.clearBounds[2] && p.posY  < thisGate.clearBounds[3]){
              if((p.posY - 0.5*p.size) < thisGate.clearBounds[2] && p.velY < 0){
                p.velY = reverseDirection(p.velY, bounceDamping);
              } 
              else if((p.posY + 0.5*p.size) > thisGate.clearBounds[3] && p.velY > 0){
                p.velY = reverseDirection(p.velY, bounceDamping);
              }
            } else {
            p.velX = reverseDirection(p.velX, 0);
            }
          }
        else {
          resetParticle(p);
        }
      }
    }
  
  if((p.posY - 0.5*p.size) < 0 && p.velY < 0){          //did you hit the roof?
    if(bounce){
      p.velY = reverseDirection(p.velY, bounceDamping);
    } else {
      resetParticle(p);
    }
  }
  
  if((p.posY + 0.5*p.size) > arenaHeight && p.velY > 0){    //did you hit the floor?
    if(bounce){  
      p.velY = reverseDirection(p.velY, bounceDamping);
    } else {
      resetParticle(p);
    }
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
  pauseGame();
}
