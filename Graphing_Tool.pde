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

Graph graph = new Graph();


void setup() {
	fullScreen(2);
	//size(500,500);
	frameRate(30);
  centerY = height * 0.5;
  centerX = width * 0.5;

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
	/*
	cp5.addButton ("organise")
		.setPosition (25, 175)
		.setSize (100, 20)
		;
	cp5.addButton ("setNewPos")
		.setPosition (25, 200)
		.setSize (100, 20)
		;
	*/


//	graph.populate();
//	graph.distanceK(graph.numNodes);
//	graph.findDomMin();
//	graph.neighborMatrix = graph.distanceK(graph.k);
//	graph.totalMatrix = graph.distanceK(graph.numNodes);
//	graph.checkConnect();
//	graph.ExcFindNum();
//	organise ();
//	setNewPos ();
}

void draw() {
	background (#D3D3D3);
	divideBack(regions);
	stroke(0);
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
