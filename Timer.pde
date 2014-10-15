
class Timer {
  int timeSoFar; //timer has started
  int totalTime;
  int x,y; //timer location upper left
  
  Timer( int tempX, int tempY, int tempTotalTime) {
   totalTime = tempTotalTime; 
  }
  
  
  //starting timer at the beginning 
  void start() {
    timeSoFar = millis();
  }
}
