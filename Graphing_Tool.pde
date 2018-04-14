import controlP5.*;

ControlP5 cp5;
public int myColorRect = 200;
public int myColorBackground = 100;

Graph graph = new Graph();

void setup() {
	fullScreen(2);
	frameRate(30);


	cp5 = new ControlP5(this);

	// creats a slider
	// parameters: name, minVal, maxVal, defaultVal, x, y, width, height
	cp5.addSlider ("sliderNodes", 1, 26, 10, 25, 25, 100, 15);
	
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
	graph.update();
}

/*
public void controlEvent(ControlEvent theEvent) {
	println(theEvent.getController().getName());
}
*/

public void sliderNodes (int x) {
	graph.setNodes(x);
}

public void createGraph () {
	graph.destroy();
	graph.populate();
	graph.findDomMin();
}

public void clearGraph () {
	graph.destroy();	
}
