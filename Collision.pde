/*	===========================================================================
		This is a simple collision checker. It returns true if the distance
		between two points is less than the provided radius. It only works in
		2d and only with circles.

		Arguments:
			xpos1:	a float indicating a position on the x axis.
			xpos2:	a float indicating a position on the x axis.
			ypos1:	a float indicating a position on the y axis.
			ypos2:	a float indicating a position on the y axis.
			radius:	a flaot which is the sise of the object to compare to.

	======================================================================== */

boolean collision (float xpos1, float ypos1, float xpos2, float ypos2, float radius) {
  boolean collision = false;
  float distance;

    distance = pow ( ( xpos1 - xpos2 ), 2 ) + pow ( ( ypos1 - ypos2 ), 2 );
    distance = sqrt(distance);
    if ( distance <= radius) {
      collision = true;
    }
  return collision;
}
