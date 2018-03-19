public class Edge {
  int node1;
  int node2;
  Node current;
  Node adjacent;
  public color edgeColor = #000000;
  
  Edge( int x, int y){
    node1 = x;
    node2 = y;
    current = nodes.get(node1);
    adjacent = nodes.get(node2);
}
  
  
  
  void display() {
    fill(#000000);
    line(current.posX, current.posY, adjacent.posX, adjacent.posY);
  }
}
  
