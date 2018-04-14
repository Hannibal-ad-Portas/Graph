public class Graph {
	int numNodes = 10;
	int radius = 20;
	int[][] adjMatrix;
	ArrayList<Node> nodes = new ArrayList<Node>();
	ArrayList<Edge> edges = new ArrayList<Edge>();

	Graph () {

	}
	void populate() {
		adjMatrix = new int [numNodes][numNodes];
		// insure the matrix is filled with nothing but 0
		adjMatrix = initMatrix (adjMatrix);
		randomGraph (numNodes, radius);
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



}
