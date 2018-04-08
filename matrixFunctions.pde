/* =====================================================================
	This function returns the sum of each row of a matrix

	Arguments:
		matrix:	a 2d int array

	Returns
		array: an int array containing the sum of each row of the matrix

   ================================================================== */

int[] rowSum (int[][] matrix) {
	int [] array = new int [matrix.length];
	for (int i = 0; i < matrix.length; i++) {
		int sum = 0; 
		for (int j = 0; j < matrix.length; j++) {
			sum = sum + matrix[i][j];
        }
			array[i] = sum;
	}
	return array;
}

