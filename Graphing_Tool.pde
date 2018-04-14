import controlP5.*;

ControlP5 cp5;
public int myColorRect = 200;
public int myColorBackground = 100;

int NUMNODES = 10;
float RADIUS = 20;

//adjacency matrix for the entire graph
int [][] adjMatrix;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges = new ArrayList<Edge>();

void setup() {
	fullScreen(2);
	frameRate(30);

	cp5 = new ControlP5(this);

	// creats a slider
	// parameters: name, minVal, maxVal, defaultVal, x, y, width, height
	cp5.addSlider ("sliderNodes", 1, 26, NUMNODES, 25, 25, 100, 15);
	
	// create two buttons
	cp5.addButton ("createGraph")
		.setPosition (25, 45)
		.setSize (100, 20)
		;
	cp5.addButton ("clearGraph")
		.setPosition (25, 65)
		.setSize (100, 20)
		;

//	adjMatrix = initMatrix (adjMatrix);
//	randomGraph(NUMNODES, RADIUS);

}

void draw() {
	background (#D3D3D3);
	for (Edge edg : edges) {
		edg.display();
	}
	for (Node node : nodes) {
		node.display();
		node.details();
	}
}

/*
public void controlEvent(ControlEvent theEvent) {
	println(theEvent.getController().getName());
}
*/

public void sliderNodes (int x) {
	NUMNODES = x;
}

public void createGraph () {
	clearGraph();
	adjMatrix = new int [NUMNODES][NUMNODES];
	adjMatrix = initMatrix (adjMatrix);
	randomGraph(NUMNODES, RADIUS);
}

public void clearGraph () {
	for (int i = nodes.size() - 1; i >= 0; i--) {
		nodes.remove(i);		
	}
	for (int i = edges.size() - 1; i >= 0; i--) {
		edges.remove(i);
	}
	adjMatrix = null; 
}
