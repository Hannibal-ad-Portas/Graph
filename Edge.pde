class Edge {
  float posX1;
  float posX2;
  float posY1;
  float posY2;
  int node1;
  int node2;
  color edgeColor = #000000;
  boolean selected = false;

  Edge( int x, int y) {
    node1 = x;
	node2 = y;
	Node node = graph.nodes.get(x);
	
	posX1 = node.posX;
    posY1 = node.posY;

    node = graph.nodes.get(y);
	posX2 = node.posX;
    posY2 = node.posY;
    
  }
  
  void reCheck() {
    posX1 = graph.nodes.get(node1).posX;
    posX2 = graph.nodes.get(node2).posX;
    posY1 = graph.nodes.get(node1).posY;
    posY2 = graph.nodes.get(node2).posY;
  }


  void display() {
    //edgeColor = #FFFFFF;
    
    
    fill(edgeColor);
    line(posX1, posY1, posX2, posY2);
  }
}
