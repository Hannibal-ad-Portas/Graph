import controlP5.*;

ControlP5 cp5;
public int myColorRect = 200;
public int myColorBackground = 100;
public int SetK = 5;

Graph graph = new Graph();

void setup() {
	//fullScreen(1);
	size(500,500);
	frameRate(30);


	cp5 = new ControlP5(this);
	
	// creats a slider
	// parameters: name, minVal, maxVal, defaultVal, x, y, width, height
	cp5.addSlider ("sliderNodes", 1, 26, 10, 25 , 25, 100, 20);
	cp5.addSlider ("SetK")
		.setRange (1, 10)
		.setPosition (25, 50)
		.setSize (100, 20)
		.setNumberOfTickMarks(10)
		.setValue(2)
		;	
	// create two buttons
	cp5.addButton ("createGraph")
		.setPosition (25, 75)
		.setSize (100, 20)
		;
	cp5.addButton ("clearGraph")
		.setPosition (25, 100)
		.setSize (100, 20)
		;
	cp5.addButton ("DominatingSets")
		.setPosition (25, 125)
		.setSize (100, 20)
		;
  cp5.addButton ("organise")
    .setPosition (25, 150)
    .setSize (100, 20)
    ;


//	graph.populate();
//	graph.distanceK(1);
//	graph.findDomMin();
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
public void SetK (int x) {
	graph.k = x;
}

public void sliderNodes (int x) {
	graph.setNodes(x);
}

public void createGraph () {
	graph.destroy();
	graph.populate();
}

public void clearGraph () {
	graph.destroy();	
}

public void DominatingSets () {
	//graph.domSet.get(0).colorDist();
	graph.neighborMatrix = graph.distanceK(graph.k);
  graph.findDomMin();
}

public void organise () {
 graph.totalMatrix = graph.distanceK(graph.numNodes);
 printMatrix(graph.totalMatrix);
}
