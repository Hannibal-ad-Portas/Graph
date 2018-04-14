/* ====================================================================
 This function creates a random disorganised connected graph. 
 
 Arguments:
 
 	num:    The number of nodes to create
 	r:      The radius of the elipeses to draw
 
 ==================================================================== */


void randomGraph (int size, float r) {
	
	for (int i = 0; i < size; i++) {
		// set the upper bound of the degree of each node
		int deg = (int)(random(1, size));
		// choses the position of each node and makes sure that it is not
		// colliding with any other node
		boolean collision;
		do {
		collision = false;
		float x = random(25, width - 25);
		float y = random(25, height - 25);

		for(Node node : graph.nodes) {
			if ( node.collisionCheck( x, y ) == true ) {
				collision = true;
			}
		}

		if ( collision == false) {
			graph.nodes.add(new Node(x, y, r, i, deg));
		}
		} while (collision == true);
	}
	
	// Generate the value of a row in the adj array in order to track the
	// current degree in relation to the desired degree
	int [] adjSum = new int [size];
	adjSum = rowSum (graph.adjMatrix);

	// this section randomly connects nodes.
	for (int i = 0; i < graph.adjMatrix.length; i++) {
		for (int j = 0; j < graph.adjMatrix.length; j++) {
				if (j == i) {
					graph.adjMatrix[i][j] = 0;
				} else if (adjSum[i] < graph.nodes.get(i).degree && 
						   adjSum[j] < graph.nodes.get(j).degree ){	
							graph.adjMatrix[i][j] = 1;
							graph.adjMatrix[j][i] = 1;

							// create an edge for the now connected nodes
							// I only create one edge for each pair so
							// that I do not draw each edge twice.
							graph.edges.add(new Edge(	graph.nodes.get(i).posX,
														graph.nodes.get(i).posY,
														graph.nodes.get(j).posX,
														graph.nodes.get(j).posY
													));


							adjSum = rowSum (graph.adjMatrix);
				}
		}
	}

	// sets the nod's degree to be it's correct size
	for (Node node : graph.nodes) {
		node.degree = adjSum[node.index];
	}

}
