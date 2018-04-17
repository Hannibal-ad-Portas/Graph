class Node {
	int index;
	int degree;
	int exct = 100;
	float posX;
	float posY;
	float radius;
	char name;
	public boolean selected = false;
	public boolean adjacent = false;
	color circleFill = #FFFFFF;
	// This string is to assign a letter name to each node it limits the
    // number of nodes to the length of the string, 26
    String alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	

	Node(float x, float y, float r, int i, int deg) {
		posX = x;
		posY = y;
		radius  = r;
		index = i;
		name = alp.charAt(index);
		degree = deg;
	}

	void changeColor (color C) {
		circleFill = C;
	}

	boolean collisionCheck (float x, float y) {
		return collision (posX, posY, x, y, radius);
	}


	void display() {

		fill(circleFill);
		ellipse(posX, posY, radius, radius);

		fill(#000000);
		textSize(10);
		textAlign(CENTER, CENTER);
		text(name, posX, posY-2);
	}

}
