boolean collision (float xpos, float ypos, float radius) {
  boolean collision = false;
  float distance;

  for (Node node : nodes ) {
    distance = pow ( ( xpos - node.posX ), 2 ) + pow ( ( ypos - node.posY ), 2 );
    distance = sqrt(distance);
    if ( distance <= radius) {
      collision = true;
    }
  }
  return collision;
}
