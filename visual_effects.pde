
void updateExhaust(){
 for(int i = 0; i < exhaustList.size(); i++){
    Exhaust thisExhaust = (Exhaust) exhaustList.get(i);
    thisExhaust.update();
    thisExhaust.countdown();
    if(thisExhaust.exhaustTime < 0){
      exhaustList.remove(i);
    } else {
    checkCollisions(true, thisExhaust);
    thisExhaust.display();
    }
  }
  
}
