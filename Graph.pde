int NUMNODES = 15;
float RADIUS = 20;

ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edge = new ArrayList<Edge>();

void setup() {
  size (600, 600);
  surface.setResizable(true);
  
  randomGraph(NUMNODES, RADIUS);


}

void draw() {
  for (Edge edg : edge) {
   edg.display(); 
  }
  for (Node node : nodes) {
    node.display();
    details();
  }
}
