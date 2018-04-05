/* =================================================== //<>//
 This function creates a random disorganised graph. 
 
 Arguments:
 
 num:    The number of nodes to create
 r:      The radius of the elipeses to draw
 
 =================================================== */


void randomGraph (int size, float r) {
  String alp = "abcdefghijklmnopqrstuvwxyz";

  for (int i = 0; i < size; i++) {
    boolean collision;
    do {
      collision = true;
      float x = random(25, width - 25);
      float y = random(25, height - 25);

      collision = collision( x, y, r);

      if ( collision == false) {
        nodes.add(new Node(x, y, r, i, alp.charAt(i)));
      }
    } while (collision == true);
  }


  // this section randomly connects nodes.
  for (int i = 0; i < adjMatrix.length; i++) {
    for (int j = 0; j < adjMatrix.length; j++) {
      if (j == i) {
        adjMatrix[i][j] = 0;
      } else if (adjMatrix[i][j] == -1) {
        if (noise(i) > .6) {
          adjMatrix[i][j] = 0;
          adjMatrix[j][i] = 0;
        } else {
          adjMatrix[i][j] = 1;
          adjMatrix[j][i] = 1;
          
          //create an edge for the now connected nodes since I'm making one now
          //the program will not overdraw edges
          Node node1 = nodes.get(i);
          Node node2 = nodes.get(j);
          edges.add(new Edge(node1.posX, node1.posY, node2.posX, node2.posY));
          
          
        }
      }
    }
  }
  
  
}
