/* ===========================================================================
		This function returns the sum of each row of a matrix

		Arguments:
			matrix:	a 2d int array

		Returns
			array: an int array containing the sum of each row of the matrix 

    ======================================================================= */

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

 /* ======================================================================
		This function returns a matrix that is the product of two other matrices.
	 	The rows of the first matrix must == the colums of the second or the
		math will not work.
	
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

/* ============================================================================
		This function sets all of the values of a matrix to 0's

		Arguments:
			matrix:	a 2d array who's internal arrays are all the same length

		Returns:
			matrix: a 2d array with all values = 0;
   ========================================================================= */

int [][] initMatrix (int [][] matrix ) {
	for (int i = 0; i < matrix.length; i ++) {
		for (int j = 0; j < matrix[0].length; j++) {
			matrix[i][j] = 0;
		}
	}

	return matrix;
}

/* ============================================================================
		This function sets the \ diagonal of a matrix all to 1;

		Arguments:
			matrix:	a 2d array who's internal arrays are all the same length

		Returns:
			matrix: a 2d array with who's \ diagonals are all 1;
   ========================================================================= */

int [][] initNeighbor (int [][] matrix ) {
	for (int i = 0; i < matrix.length; i ++) {
		for (int j = 0; j < matrix[0].length; j++) {
			if (i == j) {
				matrix[i][j] = 1;
			}
		}
	}

	return matrix;
}

/* ============================================================================
	This function takes two matrix and returs a single matrix containing the
	lower positive number in each coordinate of both matrixes. 

	So if matrixA had a 3 in coordinate [3][4] and matrixB had a 2 in [3][4] the
	output will have 2 in [3][4].
	
	The two matrices must be of the same dementions

	Arguments:
		matrixA
		matrixB

	Returns:
		matrixOut
		
   ========================================================================= */

int [][] matrixOverlay ( int [][] matrixA, int [][] matrixB ) {
	int [][] matrixOut = new int[matrixA.length][matrixA[0].length];
	for ( int i = 0; i < matrixA.length; i++ ) {
		for (int j = 0; j < matrixA[0].length; j++) {
			//print("matrixA["+i+"]["+j+"] = "+matrixA[i][j]);
			//println(" matrixB["+i+"]["+j+"] = "+matrixB[i][j]);
			if (matrixB[i][j] != 0 && matrixA[i][j] == 0) {
				matrixOut[i][j] = matrixB[i][j];
				//println("Gets B: "+matrixB[i][j]);
			} else if (matrixA[i][j] != 0 && matrixB[i][j] == 0){
				matrixOut[i][j] = matrixA[i][j];
				//println("Gets A: "+matrixA[i][j]);
			} else {
				if (matrixA[i][j] < matrixB[i][j]) {
					matrixOut[i][j] = matrixA[i][j];
					//println("Gets A: "+matrixA[i][j]);
				} else {
					matrixOut[i][j] = matrixB[i][j];
					//println("Gets B: "+matrixB[i][j]);

				}
			}
		}
	}
	return matrixOut;
}

/* ===========================================================================
	This is used to see if the provided array is filled with non zero numbers.
	If it has no zero's then it returns a positie int, otherwise it returns 0.

	Arguments:
		array: an int array
	Returns:
		domNum: a intiger indicating if the array has any zero's
   ======================================================================== */

int checkDom ( int[] array ) {
	int domNum = 1;
	
	for (int i = 0; i < array.length; i++) {
		domNum *= array[i];
	}

	return domNum;
}

/* ==========================================================================
	This function adds all the elements at the same vertical coordinates into an
	array.

	Arguments:
		iter:	an array list of int indicating the rows of a matrix
		matrix:	a 2d square array 

	Returns:
		arrayOut:	an int array
   ======================================================================= */

int [] colAdd (ArrayList<Integer> iter, int [][] matrix) {
	int[] arrayOut = new int [matrix.length];
	for (int i = 0; i < arrayOut.length; i++){
		arrayOut[i] = 0;
		//print(arrayOut[i]+" ");
	}
	if (iter.size() == 1) {
		for (int i = 0; i < arrayOut.length; i++) {
			arrayOut[i] += matrix[iter.get(0)][i];
			//print(arrayOut[i]+" ");
			
		}
	} else {
		for (int i = 0; i < iter.size(); i++){
			for (int j = 0; j < arrayOut.length; j++) {
				arrayOut[j] += matrix[j][iter.size()];
			}
			//print(arrayOut[i]+" ");
		}
	}
	return arrayOut;
}
/* ==============================================================================
	This Function prints a 2d array to the consol. It can handel arrays of up to
	size 26.

	Argument:
		matrix:	a 2d array to be printed.
	
   ========================================================================== */

void printMatrix (int[][] matrix) {
	String alp = "abcdefghijklmnopqrstuvwxyz";
	print("  ");
	for (int i = 0; i < matrix.length; i++) {
		print(" \033[4m"+alp.charAt(i)+"\033[0m");
	}
	println();
	for (int i = 0; i < matrix.length; i++) {
		print(alp.charAt(i)+"| ");
		for (int j = 0; j < matrix.length; j++) {
			//print(alp.charAt(j));
			print(matrix[i][j]+" ");
		}
		print("\n");
	}
}

/* ============================================================================
	This function returns the contents of a 2d array. This is so you can create
	copies of a matrix and not have them all refer back to the dame date.
	Arguments:
		matrixA:	The array to be copied

	Returns:
		matrixOut
   ========================================================================= */

int[][] copyMatrix (int [][]matrixA) {
	int [][] matrixOut = new int [matrixA.length][matrixA[0].length];
	for (int i = 0; i < matrixA.length; i++){
		for(int j =0; j < matrixA[i].length; j++) {
			matrixOut[i][j] = matrixA[i][j];
		}
	}
	return matrixOut;
}
