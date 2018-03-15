public class Node {
  int index;
  float posX;
  float posY;
  float radius;
  public char name;
  ArrayList<Edge> adjacent = new ArrayList<Edge>();
  
  Node(float x, float y, float r, int i) {
    posX = x;
    posY = y;
    radius  = r;
    index = i;
    name = (char)(index);
  }
  
  
  void addEdge(int x, int y) {
    adjacent.add(new Edge(x, y));
  }
 
 void display() {
   
   //draw the eges first so that they don't block the nodes
   fill(#000000);
   for (Edge edge : adjacent) {
     edge.display();
   }
   
   fill(#FFFFFF);
   ellipse(posX, posY, radius, radius);
   
   fill(#000000);
   textSize(10);
   
   text(index, posX-2, posY+2);
 }
 

}
