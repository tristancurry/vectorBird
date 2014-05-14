
void updateExhaust(float g){
 for(int i = 0; i < exhaustList.size(); i++){
    Exhaust thisExhaust = (Exhaust) exhaustList.get(i);
    thisExhaust.update(g);
    thisExhaust.countdown();
    if(thisExhaust.exhaustTime < 0){
      exhaustList.remove(i);
    } else {
    checkCollisions(true, thisExhaust);
    thisExhaust.display();
    }
  }
  
}
