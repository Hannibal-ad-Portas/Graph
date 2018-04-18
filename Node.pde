class Node {
  int index;
  int degree;
  int exc = -1;
  float posX = centerX;
  float posY = centerY;
  float desX = centerX;
  float desY = centerY;
  float radius;
  char name;
  public boolean selected = false;
  public boolean adjacent = false;
  color circleFill = #FFFFFF;
  // This string is to assign a letter name to each node it limits the
  // number of nodes to the length of the string, 26
  String alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";


  Node(float x, float y, float r, int i, int deg) {
    posX = x;
    desX = posX;
    posY = y;
    desY = posY;
    radius  = r;
    index = i;
    name = alp.charAt(index);
    degree = deg;
  }

  void changeColor (color C) {
    circleFill = C;
  }

  boolean collisionCheck (float x, float y) {
    return collision (posX, posY, x, y, radius);
  }


  void display() {

    fill(circleFill);
    ellipse(posX, posY, radius, radius);

    fill(#000000);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(name, posX, posY-2);
  }

  void move () {
    while (desX > width || desX < 0) { 
      if (desX > width) {
        desX--;
      }
      if (desX < 0) {
        desX++;
      }
    }
  while (desY > height || desY < 0) { 
      if (desY > height) {
        desY--;
      }
      if (desY < 0) {
        desY++;
      }
  }
    if (posX > desX) {
        posX--;
      }
      if (posX < desX) {
        posX++;
      }
    

      if (posY > desY) {
        posY--;
      }
      if (posY < desY) {
        posY++;
      }
    
  }
}
