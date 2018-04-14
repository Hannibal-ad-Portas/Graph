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

}
