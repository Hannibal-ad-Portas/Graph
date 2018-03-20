public class Edge {
  int node1;
  int node2;
  Node current;
  Node adjacent;
  color edgeColor = #000000;
  boolean selected = false;

  Edge( int x, int y) {
    node1 = x;
    node2 = y;
    current = nodes.get(node1);
    adjacent = nodes.get(node2);
    
  }



  void display() {
    if (current.selc == true) {
      edgeColor = #FC0505;
    } else {
      edgeColor = #FFFFFF;
    }
    
    fill(edgeColor);
    line(current.posX, current.posY, adjacent.posX, adjacent.posY);
  }
}
