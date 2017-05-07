package src.data_structures.arrays;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

/* Find number of water bodies (opposite of islands). 0 represent water,
 * non zero represent land with height of land at each point. Just find
 * number of cells in each water body. Print them in ascending order
 * All adjacent and diagonal 0s form a single water body
 */
public class FindWaterBodySize {
    private boolean[][] isVisited;
    private int[][] matrix;

    private static final int[][] NEIGHBOURS = {{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,1}, {1,-1}, {1,0}, {1,1}};

    public static void main(String args[] ) throws Exception {
        new FindWaterBodySize().execute();
    }

    public void execute() {
        Scanner scanner = new Scanner(System.in);
        int numRows = scanner.nextInt();
        matrix = new int[numRows][numRows];
        isVisited = new boolean[numRows][numRows];
        for (int i=0; i<numRows; i++) {
            for (int j=0; j<numRows; j++) {
                matrix[i][j] = scanner.nextInt();
                isVisited[i][j] = false;
            }
        }
        scanner.close();

        ArrayList<Integer> resultArray = new ArrayList<Integer>();
        for (int i=0; i<numRows; i++) {
            for (int j=0; j<numRows; j++) {
                if (matrix[i][j] == 0 && !isVisited[i][j]) {
                    resultArray.add(traverse(i, j));
                }
            }
        }

        Collections.sort(resultArray);
        for (int a: resultArray) {
            System.out.println(a);
        }
    }

    public int traverse(int i, int j) {
    	int count = 1;
        isVisited[i][j] = true;

        for (int[] arr: NEIGHBOURS) {
        	int newX = i+arr[0];
        	int newY = j+arr[1];
            if (isValidWaterBody(newX, newY) && !isVisited[newX][newY]) {
            	count += traverse(newX, newY);
            }
        }

        return count;
    }

    public boolean isValidWaterBody(int x, int y) {
        return (x>=0 && x<matrix[0].length && y>=0 && y<matrix[0].length && matrix[x][y] == 0);
    }
}