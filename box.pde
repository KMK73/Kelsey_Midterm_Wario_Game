class Box {

  float speedY; //speed down for rect
  float boxWidth;
  float boxHeight;
  float boxX;
  float boxY;
  boolean hit;

  Box () {
    boxHeight = random (10, 30);
    boxWidth = random (40, 400);
    boxX= random (0, width);
    boxY= random (-boxHeight, boxHeight);
    speedY= random(1, 2.5);
    hit = false;
  }

  void display () {
    fill (255, 0, 0);
    rect(boxX, boxY, boxWidth, boxHeight);
    boxY= boxY + speedY;
    reset();
  }

  void reset() {
    if (boxY > height) {
      boxY=-10;
      boxX = random(width); //change x position at the top
      speedY = random(1, 2.5);
      boxX  = constrain(boxX, 0, 450); //trying to make sure they stay in the screen
    }
  }
}

