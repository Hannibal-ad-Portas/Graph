public class Node {
  int index;
  float posX;
  float posY;
  float radius;
  char name;
  public color circleFill = #FFFFFF;
  public color edgeColor = #000000;
  ArrayList<Edge> edges = new ArrayList<Edge>();
  
  Node(float x, float y, float r, int i, char n) {
    posX = x;
    posY = y;
    radius  = r;
    index = i;
    name = n;
    
  }
  
  
  void addEdge(int x, int y) {
    edges.add(new Edge(x, y));
  }
  
 void display() {
     //draw the eges first so that they don't block th e nodes
   //fill(circleFill);
   for (Edge edge : edges) {
     edge.display();
   }
   
   fill(circleFill);
   ellipse(posX, posY, radius, radius);
   
   fill(#000000);
   textSize(10);
   textAlign(CENTER, CENTER);
   text(name, posX, posY-2);
 }
 

}
