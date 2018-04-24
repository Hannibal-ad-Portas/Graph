class DomSet {
	int domNum;
	int [] domArray;
	IntList nodeIndex = new IntList();
	String alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	String set = " ";
	DomSet(IntList x, int y, int[] dA) {
		for (int i = 0; i < x.size(); i++) {
			nodeIndex.append(x.get(i));
			set = set + alp.charAt(nodeIndex.get(i));
		}
		domNum = y;
		domArray = dA;
	}

	void setNodeColor () {
		for (int i = 0; i < nodeIndex.size(); i++) {
			graph.nodes.get(nodeIndex.get(i)).domDist = 0;
			for (Node node : graph.nodes) {
				if (graph.neighborMatrix[nodeIndex.get(i)][node.index] != 0 && graph.neighborMatrix[nodeIndex.get(i)][node.index] < node.domDist) {
					node.domDist = graph.neighborMatrix[nodeIndex.get(i)][node.index];
				}
			}
		}
	}

	void display () {
		textAlign(CENTER);
		textSize(32);
		fill(0);
		text(set, centerX, 20);
	}
}
