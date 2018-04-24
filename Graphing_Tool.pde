import controlP5.*;

ControlP5 cp5;
public int myColorRect = 200;
public int myColorBackground = 100;
public int SetK = 5;
public int regions = 0;
public float bacWidth;
public float backHeight;
public float centerY = height * 0.5;
public float centerX = width * 0.5;
public int domShow = 0;
public color [] domColor = new color [10];
Graph graph = new Graph();


void setup() {
	fullScreen(2);
	//size(500,500);
	frameRate(30);
	centerY = height * 0.5;
	centerX = width * 0.5;
	
	domColor = setAllColors(domColor);

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
	cp5.addButton ("Connect")
		.setPosition (25, 150)
		.setSize (100, 20)
		;
	
	cp5.addButton ("showNextDom")
		.setPosition (25, 175)
		.setSize (100, 20)
		;
	
//	createGraph(); 
//	DominatingSets(); 
}

void draw() {
	background (#D3D3D3);
	for (int i = 0; i < domColor.length; i++) {
		fill(domColor[i]);
		rect(25, 200 + (i*25), 100, 20);
	}
	stroke(0);
	graph.update();
	if (graph.domSet.isEmpty() == false) {
		graph.domSet.get(domShow).display();
	}
}

public void showNextDom() {
	for(Node node : graph.nodes) {
		node.domDist = 101;
	}
	if (graph.domSet.isEmpty() == false) {
		graph.domSet.get(domShow).setNodeColor();
	}
	if (domShow+1 < graph.domSet.size()) {
		domShow++;
	} else {
		domShow = 0;
	}
	
} 
/*
public void controlEvent(ControlEvent theEvent) {
	println(theEvent.getController().getName());
}
*/
public void SetK (int x) {
	graph.k = x;
	domShow = 0;
}

public void Connect () {
	graph.checkConnect();
}

public void sliderNodes (int x) {
	graph.setNodes(x);
}

public void createGraph () {
	graph.destroy();
	graph.populate();
	//printMatrix(graph.adjMatrix);
	graph.totalMatrix = graph.distanceK(graph.numNodes);
}

public void clearGraph () {
	graph.destroy();
	regions = 0;
}

public void DominatingSets () {
	//graph.domSet.get(0).colorDist();
	graph.neighborMatrix = graph.distanceK(graph.k);
	printMatrix(graph.neighborMatrix);
	graph.forgetDom();
	graph.findDomMin();
}

public void organise () {
	graph.findExcent();
	graph.ExcFindNum();
	regions = numCircles();
	bacWidth = ((width*0.5)/regions);
	backHeight  = ((0.5* height)/regions);
}

public void setNewPos () {
	float distance = 0.25*bacWidth;
	for (int i = 1; i <= graph.excts.size(); i++) {
		graph.setNewPos(graph.excts.get(i), (distance*i));
	}
}

public int numCircles () {
	int x; 
	x = graph.totalExc;
	return x;
}

public void divideBack (int num) {  
    fill (#D3D3D3);
    for (int i = num; i > 0; i--){
    ellipse(centerX, centerY, bacWidth*i, backHeight*i);  
  }
}

public color[] setAllColors( color[] input) {
	colorMode(HSB, 1.0);
	float r = 0.2;
	for (int i = 0; i < input.length; i++) {
		r += 0.618033988749895;
		r %= 1;
		input[i] = color ( r , 0.7, 0.95);
	}

	return input;
}
