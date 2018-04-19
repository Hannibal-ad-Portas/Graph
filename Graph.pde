public class Graph {
	int numNodes = 10;
	int size = 20;
	public int k = 2;
	int radius = 100;
	int diameter = -1;
	int totalExc = 0;
	int[][] adjMatrix;
	int[][] neighborMatrix;
	int[][] totalMatrix;	
	ArrayList<Node> nodes = new ArrayList<Node>();
	ArrayList<Edge> edges = new ArrayList<Edge>();
	ArrayList<DomSet> domSet = new ArrayList<DomSet>();
	IntList excts = new IntList();

	Graph () {}

	void populate() {
		adjMatrix =  new int [numNodes][numNodes];
		neighborMatrix = new int [numNodes][numNodes];
		// insure the matrix is filled with nothing but 0
		adjMatrix = initMatrix (adjMatrix);
		randomGraph (numNodes, size);
		//println("The adjMatrix for the graph is: ");
		//printMatrix(adjMatrix);	
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

	void destroy () {
		nodes.clear();
		edges.clear();
		forgetDom();
		adjMatrix = null;
		neighborMatrix = null;
		totalMatrix = null;
	}

	void forgetDom () {
		for (int i = domSet.size() - 1; i >= 0; i--) {
			domSet.remove(i);
		}
		for (Node node : nodes) {
			node.domDist = 101;
		}
	}
	
	void setNodes(int x) {
		numNodes = x;
	}

	void update() {
		for (Edge edge : edges) {
			edge.display();
			edge.reCheck();
		}
		for (Node node : nodes) {
			node.display();
			node.move();
			node.changeColor(domColor);
		}
	}

	void findDomMin () {
		IntList iterators = new IntList();
		int domNum;	
		int temp;
		int [] domArray = new int [numNodes];
		while (domSet.isEmpty()) {
			iterators.append(0);
			for (int i = 0; i < iterators.size(); i++) {
				iterators.set(i, i);
			}
			println("There are "+iterators.size()+" iterators");
			for (int i =0; i < iterators.size(); i++) {
				print("Ite: "+i+" is: "+iterators.get(i)+"\t");
			}
			println();
			while (iterators.get(iterators.size()-1) < numNodes) {
				domArray = colAdd(iterators, neighborMatrix);
				domNum = checkDom(domArray);
				
				//println("The domNum is: "+domNum);
				if (domNum > 0) {
					domSet.add(new DomSet (iterators, domNum, domArray));
				}
				
				temp = iterators.get(iterators.size()-1);
				temp++;
				iterators.set(iterators.size() -1, temp);
				if (iterators.get(iterators.size()-1) > numNodes &&
								iterators.size() > 1) {
					temp = iterators.get(iterators.size()-2);
					temp++;
					iterators.set(iterators.get(0), temp);
					iterators.sort();
					temp = iterators.get(iterators.size()-2);
					temp++;
					iterators.set(iterators.get(size-1), temp);
				}
				for (int i = 0; i < iterators.size()-1; i++) {
					print("Ite: "+i+" is: "+iterators.get(i)+"\t");

				}
			}
		}
		println();

		String alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		println("There are: "+domSet.size()+" minimum dominating sets for distance "+k);
		for (int i = 0; i < domSet.size(); i++) {
			println("The "+i+" domSet is:");
			for (int j = 0; j < domSet.get(i).nodeIndex.size(); j++) {
				print(alp.charAt(domSet.get(i).nodeIndex.get(j))+"\t");
			}
			println();
		}
		
	}


	int[][] distanceK (int k) {
		int[][] tempMatrix = new int [numNodes][numNodes];
		int[][] kMatrix = new int[numNodes][numNodes];
		int[][] distKMatrix = new int [numNodes][numNodes];
		tempMatrix = copyMatrix (adjMatrix);
		kMatrix = copyMatrix(tempMatrix);
		kMatrix = initMatrix(kMatrix); 
		distKMatrix = copyMatrix(initNeighbor(adjMatrix));
		for (int i = 1; i < k; i++) {
			tempMatrix = matrixProduct (tempMatrix, adjMatrix);
			for (int j = 0; j < tempMatrix.length; j++) {
				for (int l = 0; l < tempMatrix[i].length; l++) {
					if (tempMatrix[j][l] != 0) {
						kMatrix[j][l] = i+1;
					} else {
						kMatrix[j][l] = 0;
					}
				}
			}
			//println("The Two matrices to overlay");
			//printMatrix(distKMatrix);
			//printMatrix(kMatrix);
			distKMatrix = matrixOverlay (distKMatrix, kMatrix);
		}
		return distKMatrix;
	}


	void findExcent () {
		 for (int i = 0; i < numNodes; i++) {
			for (int j = 0; j < numNodes; j++) {
				if (totalMatrix[i][j] > nodes.get(i).exc) {
					nodes.get(i).exc = totalMatrix[i][j];
				}
			}
			if (nodes.get(i).exc > diameter) {
				diameter = nodes.get(i).exc;
			}
			if (nodes.get(i).exc < graph.radius) {
				graph.radius = nodes.get(i).exc;
			}
		}
	}

	void checkConnect () {
		int [] adjSum = new int [numNodes];
		for (int i = 0; i < numNodes; i++) {
			for (int j = 0; j < numNodes; j++) {
				if (totalMatrix[i][j] == 0) {
					adjMatrix[i][j] = 1;
					adjMatrix[j][i] = 1;
					edges.add(new Edge (nodes.get(i).index, nodes.get(j).index));
					adjSum = rowSum (adjMatrix);
					totalMatrix = distanceK(numNodes);
				}
			}
		}
		for (Node node : nodes) {
			node.degree = adjSum[node.index];
		}
	}

	void ExcFindNum () {
		for (Node node : nodes) {
			boolean ectPrez = false;
			for (int i = 0; i < excts.size(); i++) {
				if (node.exc == excts.get(i)) {
					ectPrez = true;
				}
			}
			if (ectPrez == false) {
				excts.append(node.exc);
			}
			totalExc = excts.size();
			excts.sort();
		}
	}


	void setNewPos (int exc, float distance) {
		IntList excNodes = new IntList();
		float angle;
		// gets the numbner of nodes with the specified exc 
		for (Node node : nodes) {
			if (node.exc == exc) {
				excNodes.append(node.index);
			}
		}
		//Finds the angel between the nodes.
		angle = TWO_PI/(float)excNodes.size();
		for (int i = 0; i < excNodes.size(); i++) {
			nodes.get(excNodes.get(i)).desX = distance*cos(angle) + centerX;
			nodes.get(excNodes.get(i)).desY = distance*sin(angle) + centerY;
			angle += angle + 50;
		}
	}
}
