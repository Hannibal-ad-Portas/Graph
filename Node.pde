public class Node { //<>// //<>// //<>// //<>//
  int index;
  float posX;
  float posY;
  float radius;
  char name;
  public color circleFill = #FFFFFF;

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

  void makeEdge () {
    for (AdjNode curr : adjacent) {
      if (curr.edgeMade == false) {
        int x = curr.currIndex;
        int y = curr.adjIndex;

        edge.add(new Edge( x, y ));
        curr.dontUse(true);
        Node node = nodes.get(y);
        for (AdjNode adj : node.adjacent) {
          if (adj.adjIndex == curr.currIndex) {
            adj.dontUse(true);
          }
        }
      }
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
