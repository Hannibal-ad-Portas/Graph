public class Edge {
  int adjacent;
  int current;
  public boolean draw = true;
  Edge( int x, int y){
    current = x;
    adjacent = y;
  }
  
  void display() {
    if (draw == true) {
      Node node1 = nodes.get(current);
      Node node2 = nodes.get(adjacent);
      line( node1.posX, node1.posY, node2.posX, node2.posY);
      for (Edge  edge : node2.edges) {
        if (edge.adjacent == current){
          edge.draw = false;
        }
      }
    }
  }
}
  
