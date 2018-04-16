class DomSet {
	int domNum;
	int [] domArray;
	ArrayList<Integer> nodeIndex = new ArrayList<Integer>();

	DomSet(ArrayList<Integer> x, int y, int[] dA) {
		for (int i = 0; i < x.size() -1; i++) {
			nodeIndex.add(x.get(i));
		}
		domNum = y;
		domArray = dA;
	}

	void colorDist () {
		for ( Node node : graph.nodes) {
			for (Integer index : nodeIndex) {
				if (index == node.index) {
					graph.changeColor (255, index);
					break;
				} else {
					int shortPath = 100;
					if (graph.neighborMatrix[index][node.index] < shortPath) {
						shortPath = graph.neighborMatrix[index][node.index];
					}
					graph.changeColor (shortPath, index);
				}
			}
		}
	}

  void exist () {
     println("Hello, num: " +domNum); 
  }
}
