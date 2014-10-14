//move wario  
float warioX=20;
float warioY=450;

//wario image
PImage wario;

//speed
float speed;
float speedX;

Box box1;
Box box2;
Box box3;

void setup () {
  size (500, 500, P3D);
  wario = loadImage("wario.jpg"); 
  speed=0;
  box1 = new Box();
  box2 = new Box();
  box3 = new Box();
}

void draw () {
  background (255);
  image(wario, warioX, warioY);
  warioX = warioX + speedX;

  //moving wario right
  if (warioX >=width-40) {
    warioX= 460;
    speedX *= -1;
  }
  //moving wario left
  if (warioX <=0) {
    warioX=1;
    speedX *= -1;
  }

  box1.display();
  box2.display();
  box3.display();
  if(contact(box1) == true) {
    println("I hit box 1");
  }
  if(contact(box2) == true) {
    println("I hit box 2");
  }
  if(contact(box3) == true) {
    println("I hit box 3");
  }
}

// Box b is made for a temporary reference of either box1 or box2 when they pass through the boolean
boolean contact(Box b) {
  float myX2 = warioX + wario.width;
  float myY2 = warioY + wario.height;
  float otherX2 = b.boxX + b.boxWidth;
  float otherY2 = b.boxY + b.boxHeight;  
  
  //checking if the boxes hit each other by returning false when they are not touching 
  if( warioX < b.boxWidth && myX2 <b.boxX) { //totally to the left not touching
    return false;
  }
  
  if ( myX2 > otherX2 && warioX > otherX2) { //totally right not touching 
    return false;
  }
  
  if ( myY2 < b.boxY && warioY < b.boxY) { //totally above not touching 
    return false;
  }
  
  if ( myY2 > otherY2 && warioY > otherY2) { //totally below not touching 
    return false;
  }
  
  return true; //because if all are false then they are colliding BOOM 
  
}

void keyPressed() {
  if (keyCode == RIGHT) {
    speedX++;
  } 
  if (keyCode == LEFT) {
    speedX--;
  }
  if (key == ' ') { //that means spacebar to stop car
    speedX = 0;
  }
}

