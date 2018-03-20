void details() {
  for (Node node : nodes) {
    if ( abs((mouseX - node.posX)) < RADIUS && abs((mouseY - node.posY)) < RADIUS) {
      //if (collision (mouseX, mouseY, RADIUS) == true) {
      node.selected(true);
      
    } else {
      node.selected(false);
      
    }
  }
}
