class Edge {
  float posX1;
  float posX2;
  float posY1;
  float posY2;
  color edgeColor = #000000;
  boolean selected = false;

  Edge( float x1, float y1, float x2, float y2) {
    posX1 = x1;
    posX2 = x2;
    posY1 = y1;
    posY2 = y2;
    
  }



  void display() {
    //edgeColor = #FFFFFF;
    
    
    fill(edgeColor);
    line(posX1, posY1, posX2, posY2);
  }
}
