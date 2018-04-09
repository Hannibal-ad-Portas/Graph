/* ====================================================================
 This function creates a random disorganised connected graph. 
 
 Arguments:
 
 	num:    The number of nodes to create
 	r:      The radius of the elipeses to draw
 
 ==================================================================== */


void randomGraph (int size, float r) {
	// This string is to assign a letter name to each node it limits the
	// number of nodes to the length of the string, 26
	String alp = "abcdefghijklmnopqrstuvwxyz";
	
	for (int i = 0; i < size; i++) {
		// set the degree of each node
		int deg = (int)(random(1, size));
		// choses the position of each node and makes sure that it is not
		// colliding with any other node
		boolean collision;
		do {
		collision = false;
		float x = random(25, width - 25);
		float y = random(25, height - 25);

		for(Node node : nodes) {
			collision = node.collisionCheck( x, y );
		}

		if ( collision == false) {
			nodes.add(new Node(x, y, r, i, deg, alp.charAt(i)));
		}
		} while (collision == true);
	}
	
	// Generate the value of a row in the adj array inorder to track the
	// current degree in relation to the desired degree
	int [] adjSum = new int [size];
	adjSum = rowSum (adjMatrix);

	// this section randomly connects nodes.
	for (int i = 0; i < adjMatrix.length; i++) {
		for (int j = 0; j < adjMatrix.length; j++) {
				if (j == i) {
					adjMatrix[i][j] = 0;
				} else if (adjSum[i] < nodes.get(i).degree && 
						  adjSum[j] < nodes.get(j).degree	){	
							adjMatrix[i][j] = 1;
							adjMatrix[j][i] = 1;

							// create an edge for the now connected nodes
							// I only create one edge for each pair so
							// that I do not draw each edge twice.
							edges.add(new Edge( nodes.get(i).posX,
												nodes.get(i).posY,
												nodes.get(j).posX,
												nodes.get(j).posY ));
				}
		}
		adjSum = rowSum (adjMatrix);
	}
}
