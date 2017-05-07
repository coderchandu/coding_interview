package src.data_structures.arrays;

import java.util.ArrayList;
import java.util.Arrays;

/*
 * Give a N*N square matrix, return an array of its anti-diagonals.
 *[1,2,3],
  [4,5,6],
  [7,8,9]
  
  should return 
  
  [1],
  [2, 4],
  [3, 5, 7],
  [6, 8],
  [9]
 */
public class AntiDiagonals {
	private int[][] matrix;
	
	public AntiDiagonals(int[][] matrix) {
		this.matrix = matrix;
	}
	
	public ArrayList<ArrayList<Integer>> findAntiDiagonals() {
		// -1 in size as last element of 1st row is considered twice
		@SuppressWarnings("unchecked")
		ArrayList<Integer>[] antiDiagonals = new ArrayList[matrix.length + matrix[0].length - 1];

		for (int i=0; i<matrix.length; i++) {
			for (int j=0; j<matrix[0].length; j++) {
				if (antiDiagonals[i+j] == null) {
					antiDiagonals[i+j] = new ArrayList<Integer>();
				}
				antiDiagonals[i+j].add(matrix[i][j]);
			}
		}

		return new ArrayList<ArrayList<Integer>>(Arrays.asList(antiDiagonals));
	}
	
	public static void main(String[] args) {
		int[][] matrix = {
				{1,2,3},
				{4,5,6},
				{7,8,9}
		};
		ArrayList<ArrayList<Integer>> arr = new AntiDiagonals(matrix).findAntiDiagonals();
		for (ArrayList<Integer> a: arr) {
			for (int element: a) {
				System.out.print(element + " ");
			}
			System.out.println();
		}
	}
}
