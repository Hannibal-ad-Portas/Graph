int NUMNODES = 5; //(int)(random(5, 26));
float RADIUS = 20;

//adjacency matrix for the entire graph
int [][] adjMatrix = new int [NUMNODES] [NUMNODES];

ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges = new ArrayList<Edge>();

void setup() {
  size (1920, 1000);
  surface.setResizable(true);
  
  // initialize the matris so that every value is -1
  for (int i = 0; i < adjMatrix.length; i++) {
    for (int j = 0; j < adjMatrix.length; j++){
      adjMatrix[i][j] = -1; //<>//
    }
  }

  randomGraph(NUMNODES, RADIUS);
}

void draw() {
  for (Edge edg : edges) {
    edg.display();
  }
  for (Node node : nodes) {
    node.display();
    details();
  }
}
