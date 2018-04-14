public class Graph {
	int numNodes = 10;
	int radius = 20;
	int k = 2;
	int[][] adjMatrix;
	int[][] neighborMatrix;
	
	ArrayList<Node> nodes = new ArrayList<Node>();
	ArrayList<Edge> edges = new ArrayList<Edge>();
	ArrayList<DomSet> domSet = new ArrayList<DomSet>();

	Graph () {}

	void populate() {
		adjMatrix = new int [numNodes][numNodes];
		neighborMatrix = new int [numNodes][numNodes];
		// insure the matrix is filled with nothing but 0
		adjMatrix = initMatrix (adjMatrix);
	
		randomGraph (numNodes, radius);
		
		neighborMatrix = adjMatrix;
		neighborMatrix = initNeighbor (neighborMatrix); 
		distanceK(k);
	}

	void destroy (){
		for (int i = nodes.size() - 1; i >= 0; i--) {
			nodes.remove(i);
		}
		for (int i = edges.size() - 1; i >= 0; i--) {
			edges.remove(i);
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
	}

	void findDomMin () {
		
		ArrayList<Integer> iterators = new ArrayList<Integer>();
		int domNum;	
		Integer temp;
		int [] domArray = new int [numNodes];
		while (domSet.size() == 0) {
			iterators.add(0);
			temp = iterators.get(0);
			temp = 0;
			while (iterators.get(0) < numNodes) {
				domArray = colAdd(iterators, neighborMatrix);
				domNum = checkDom(domArray);  
				if (domNum < 0) {
					domSet.add(new DomSet (iterators, domNum, domArray));
				}
				temp = iterators.get(iterators.size() -1);
				temp += 1;
				for (int i = iterators.size() -1; i >= 1; i--) {
					if (iterators.get(i) > numNodes) {
						temp = iterators.get(i);
						temp = 0;
						temp = iterators.get(i-1);
						temp += 1;

					}
				}
			}
		}
	}

	
	
	void distanceK (int k) {
		int[][] tempMatrix = neighborMatrix;

		for (int i = 0; i < k; i++) {
			tempMatrix = matrixProduct ( tempMatrix, tempMatrix);
			neighborMatrix = matrixOverlay (neighborMatrix, tempMatrix);
		}
	}


}
