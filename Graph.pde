int NUMNODES = 5;
float RADIUS = 20;

ArrayList<Node> nodes = new ArrayList<Node>();

void setup() {
  size (600, 600);
  surface.setResizable(true);
  
  randomGraph(NUMNODES, RADIUS);


}

void draw() {
    for (Node node : nodes) {
     node.display();
    details();
  }
}
