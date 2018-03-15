public class Edge {
  public int adjacent;
  public int current;
  Edge( int x, int y){
    current = x;
    adjacent = y;
  }
  
  void display() {
    Node node1 = nodes.get(current);
    Node node2 = nodes.get(adjacent);
    line( node1.posX, node1.posY, node2.posX, node2.posY);

   }
}
