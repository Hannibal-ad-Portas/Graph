public class Node { 
	int index;
	int degree;
	float posX;
	float posY;
	float radius;
	char name;
	color circleFill = #FFFFFF;

	Node(float x, float y, float r, int i, int deg,  char n) {
		posX = x;
		posY = y;
		radius  = r;
		index = i;
		name = n;
		degree = deg;
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
