int NUMNODES = 15;
float RADIUS = 20;

ArrayList<Node> nodes = new ArrayList<Node>();

void setup() {
  size (600, 600);
  
  randomGraph(NUMNODES, RADIUS);

  
}

void draw() {
  for (Node node : nodes) {
   node.display();
  }

}
