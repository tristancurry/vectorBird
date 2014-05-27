
void updateExhaust(){
 for(int i = 0; i < exhaustList.size(); i++){
    Exhaust thisExhaust = (Exhaust) exhaustList.get(i);
    if(pause == false){
    thisExhaust.update();
    thisExhaust.countdown();
    }
    if(thisExhaust.exhaustTime < 0){
      exhaustList.remove(i);
    } else {
    //checkCollisions(true, thisExhaust);
    thisExhaust.display();
    }
  }
  
}

void makeExhaust(float _velX, float _velY){
  for(int i = 0; i < 25; i ++){
        Exhaust newExhaust = new Exhaust(goodPlayer.posX, goodPlayer.posY, _velX,_velY);
        exhaustList.add(newExhaust);
        }
}



