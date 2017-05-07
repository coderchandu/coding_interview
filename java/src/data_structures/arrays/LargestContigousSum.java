package src.data_structures.arrays;

//You are given an array of integers (both positive and negative). Find the continuous sequence with the largest sum. Return the sum.
//EXAMPLE
//Input: {2, -8, 3, -2, 4, -10}
//Output: 5 (i.e., {3, -2, 4} )
//
//Sliding window - if sum drops less than 0, drop it as it will not contribute to max
public class LargestContigousSum {
	public int findSum(int[] arr) {
		int sumSoFar = arr[0], maxSum = arr[0];
		int maxStart = 0, start = 0, maxLen = 1;
		for (int i=1; i<arr.length; i++) {
			sumSoFar += arr[i];
			if (sumSoFar > maxSum) {
				maxSum = sumSoFar;
				maxStart = start;
				maxLen = i-start+1;
			}
			if (sumSoFar < 0) {
				sumSoFar = 0;
				start = i+1;
			}
		}
		for (int i = maxStart; i<maxLen+maxStart; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();
		return maxSum;
	}
	
	public static void main(String[] args) {
		int[] arr = {2, -8, 5, -2, 8, -10, 12};
		int sum = new LargestContigousSum().findSum(arr);
		
		System.out.println(sum);
	}
}
