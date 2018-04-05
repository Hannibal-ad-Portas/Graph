public class Node {  //<>//
  int index;
  float posX;
  float posY;
  float radius;
  char name;
  color circleFill = #FFFFFF;

  ArrayList<AdjNode> adjacent = new ArrayList<AdjNode>();

  Node(float x, float y, float r, int i, char n) {
    posX = x;
    posY = y;
    radius  = r;
    index = i;
    name = n;
  }


  void adjancency(int x, int y) {
    adjacent.add( new AdjNode(x, y));
  }

  void selected (boolean x) {
    if (x == true) {
      circleFill = #05FC17;
    } else {
      circleFill = #FFFFFF;
    }
  }

  void display() {

    fill(circleFill);
    ellipse(posX, posY, radius, radius);

    fill(#000000);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(name, posX, posY-2);
  }
}

public class AdjNode {
  int currIndex;
  int adjIndex;
  boolean edgeMade = false;


  AdjNode( int x, int y ) {
    currIndex = x;
    adjIndex = y;
  }

  void dontUse (boolean x) {
    edgeMade = x;
  }
}
