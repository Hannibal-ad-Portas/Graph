void details() {
  for (Node node : nodes) {
    if ( abs((mouseX - node.posX)) < RADIUS && abs((mouseY - node.posY)) < RADIUS) {
      node.circleFill = #00FF2C;
    } else {
      node.circleFill = #FFFFFF;
    }
  }
}
