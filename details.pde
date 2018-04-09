void details() {
	boolean collision = false;
	for (Node node : nodes) {
		  collision = node.collisionCheck( mouseX, mouseY );
    
		if (collision == true) {
			node.changeColor(#597de0);
			node.selected = true;
			node.displayDetails();

		} else {
			node.changeColor(#FFFFFF);
			node.selected = false;
		}

		for(int i = 0; i < NUMNODES; i++) {
			if (adjMatrix[node.index][i] == 1 && nodes.get(i).selected == true) {
				node.changeColor(#d5e059);
			}
		}
	}
}
