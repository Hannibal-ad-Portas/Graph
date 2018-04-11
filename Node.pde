public class Node { 
	int index;
	int degree;
	float posX;
	float posY;
	float radius;
	char name;
	public boolean selected = false;
	public boolean adjacent = false;
	color circleFill = #FFFFFF;
	// This string is to assign a letter name to each node it limits the
    // number of nodes to the length of the string, 26
    String alp = "abcdefghijklmnopqrstuvwxyz";
	

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

	void details() {
		boolean collision = false;
			for (Node node : nodes) {
				collision = node.collisionCheck( mouseX, mouseY );
   
			if (collision == true) {
				node.changeColor(#597de0);
				node.selected = true;
				//node.displayDetails();
   
			} else {
				node.changeColor(#FFFFFF);
				node.selected = false;
			}
   
          for(int i = 0; i < nodes.size(); i++) {
              if (adjMatrix[node.index][i] == 1 && nodes.get(i).selected == true) {
                  node.changeColor(#d5e059);
              }
          }
      }
  }


	void display() {

		fill(circleFill);
		ellipse(posX, posY, radius, radius);

		fill(#000000);
		textSize(10);
		textAlign(CENTER, CENTER);
		text(name, posX, posY-2);
	}

	/*void displayDetails ( ) {
		fill(#000000);
		textSize(15);
		textAlign(LEFT);
		text("The Selected Node is: "+name, width * 0.01, height * 0.02 );
		text("It has a degree of: "+degree, width * 0.01, height * 0.035 );
	}*/
}
