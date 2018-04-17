public class Graph {
	int numNodes = 10;
	int radius = 20;
	public int k = 2;
	int[][] adjMatrix;
	int[][] neighborMatrix;
	int[][] totalMatrix;	
	ArrayList<Node> nodes = new ArrayList<Node>();
	ArrayList<Edge> edges = new ArrayList<Edge>();
	ArrayList<DomSet> domSet = new ArrayList<DomSet>();

	Graph () {}

	void populate() {
		adjMatrix =  new int [numNodes][numNodes];
		neighborMatrix = new int [numNodes][numNodes];
		// insure the matrix is filled with nothing but 0
		adjMatrix = initMatrix (adjMatrix);
		randomGraph (numNodes, radius);
		println("The adjMatrix for the graph is: ");
		printMatrix(adjMatrix);	
		//neighborMatrix = adjMatrix;
		//println("The Neighbor Matrix is:");
		//printMatrix(neighborMatrix);
		neighborMatrix = copyMatrix(adjMatrix);
		totalMatrix = copyMatrix(adjMatrix);
		neighborMatrix = initNeighbor (neighborMatrix); 
		//println("The Neighbor Matrix is initalised to: ");
		//printMatrix(neighborMatrix);
		//println("Leaving the adjMatrix unchanged");
		//printMatrix(adjMatrix);	
	}

	void destroy (){
		for (int i = nodes.size() - 1; i >= 0; i--) {
			nodes.remove(i);
		}
		for (int i = edges.size() - 1; i >= 0; i--) {
			edges.remove(i);
		}
		forgetDom();
		println("\t============================================================");
	}

	void forgetDom (){
		for (int i = domSet.size() - 1; i >= 0; i--) {
			domSet.remove(i);
		}	
	}
	void setNodes(int x) {
		numNodes = x;
	}

	void update() {
		for (Edge edge : edges) {
			edge.display();
		}
		for (Node node : nodes) {
			node.display();
		}
		if (domSet.size() < 0) {
			domSet.get(0).colorDist();
		}
	}

	void findDomMin () {
		ArrayList<Integer> iterators = new ArrayList<Integer>();
		int domNum;	
		Integer temp;
		int [] domArray = new int [numNodes];
		while (domSet.size() == 0 && iterators.size() <= numNodes) {
			iterators.add(0);
			temp = iterators.get(0);
			temp = 0;
			println("There are "+iterators.size()+" iterators");
			while (iterators.get(0) < numNodes) {
				domArray = colAdd(iterators, neighborMatrix);
				domNum = checkDom(domArray);  
				//println("The domNum is: "+domNum);
				if (domNum > 0) {
					domSet.add(new DomSet (iterators, domNum, domArray));
				}
				temp = iterators.get(iterators.size()-1);
				temp += 1;
				iterators.set(iterators.size() -1, temp);
				if (iterators.size()-1 > numNodes) {
					for (int i = 0; i < iterators.size()-2; i++) {
						iterators.set(i,iterators.get(i)+1);
					}
					iterators.set(iterators.size()-1,
						iterators.get(iterators.size()-2)+1);
				}
			}
		}
		println("There are: "+domSet.size()+" minimum dominating sets for distance "+k);
	}
	

	int[][] distanceK (int k) {
		int[][] tempMatrix = new int [numNodes][numNodes];
		int[][] kMatrix = new int[numNodes][numNodes];
		int[][] distKMatrix = new int [numNodes][numNodes];
		tempMatrix = copyMatrix (adjMatrix);
		kMatrix = copyMatrix(tempMatrix);
		kMatrix = initMatrix(kMatrix); 
		distKMatrix = copyMatrix(initNeighbor(kMatrix));
		for (int i = 1; i < k; i++) {
			tempMatrix = matrixProduct (tempMatrix, adjMatrix);
			int iterator = i + 1;
			//println("The adj to the "+iterator+" is: ");
			//printMatrix(tempMatrix);
			for (int j = 0; j < tempMatrix.length; j++) {
				for(int l = 0; l < tempMatrix[i].length; l++) {
					if (tempMatrix[j][l] != 0) {
						kMatrix[j][l] = i+1;
					} else {
						kMatrix[j][l] = 0;
					}
				}
			}
			//println("The k Matrix is: ");
			//printMatrix(kMatrix);
			//println("The Overlay Should be:");
			//printMatrix(matrixOverlay (neighborMatrix, kMatrix));
			distKMatrix = matrixOverlay (distKMatrix, kMatrix);
			//println("The kMatrix overlay is: ");
			//printMatrix(distKMatrix);
		}
    return distKMatrix;
	}

	void changeColor (color k , int index) {
		color fill = color(k, 3*k, 5*k);
		nodes.get(index).changeColor(fill);
	}

	void findExcent () {
		for (int i = 0; i < numNodes; i++) {
			for (int j = 0; j < numNodes; j++) {
				if (totalMatrix[i][j] > nodes.get(i).exc) {
					nodes.get(i).exc = totalMatrix[i][j];
				}
			}
	   }
	} 


}
