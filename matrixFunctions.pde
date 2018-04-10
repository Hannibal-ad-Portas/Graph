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

/*	======================================================================
	This function returns a matrix that is the product of two other matrices.
	The rows of the first matrix must == the colums of the second or the math
	will not work.
	
	Argumetns:
		matrixA: a 2d int array
		matrixB: a 2d int array

	Returns 
		matrixOut: a 2d int array with the same number of rows as the first
			matrix and the same number of colums as the second matrix.
	=================================================================== */
	
int[][] matrixProduct (int[][] matrixA, int[][] matrixB) {
	int aRows = matrixA.length;
	int aColumns = matrixA[0].length;
	int bRows = matrixB.length;
	int bColumns = matrixB[0].length;
	
	int[][] matrixOut; 

	// Check to make sure the matrixies can be multiplied, otherwise return an
	// array of -1
	if (aColumns != bRows || aRows != bColumns) {
		matrixOut = new int[1][1];
		matrixOut[1][1] = -1;
	} else {
		matrixOut = new int[aRows][bColumns];
		
		for (int i = 0; i < aRows; i++) {
			for (int j = 0; j < bColumns; j++) {
				// initalise the matrix to 0 so we can add to it latter
				matrixOut[i][j] = 0;
				for (int k = 0; k < aColumns; k++) {
					matrixOut[i][j] += matrixA[i][k] * matrixB[k][j];
				}
			}
		}

	}
	return matrixOut;
}
