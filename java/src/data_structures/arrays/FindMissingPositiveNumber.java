package src.data_structures.arrays;

import java.util.Arrays;

/*
 * Given an unsorted integer array, find the first missing positive integer.
 * Given [1,2,0] return 3
 * [3,4,-1,1] return 2
 * [-8, -7, -6] returns 1
 * Your algorithm should run in O(n) time and use constant space.
 */
public class FindMissingPositiveNumber {
	public int firstMissingPositiveNumber(int[] arr) {
		int missingNumber = arr.length+1;
		int i = 0;
		while (i < arr.length) {
			int new_index = arr[i]-1;
			if (arr[i] > 0 && arr[i] < arr.length && arr[new_index] != arr[i] && arr[i] != i+1) {
				int tmp = arr[new_index];
				arr[new_index] = arr[i];
				arr[i] = tmp;
			} else {
				i++;
			}
		}

		for (i=0; i<arr.length;i++) {
			if (arr[i] != i+1) {
				return i+1;
			}
		}
		return missingNumber;
	}

	public static void main(String[] args) {
		int[] arr = {3,4,-1,1,2};
		int val = new FindMissingPositiveNumber().firstMissingPositiveNumber(arr);
		System.out.print(val);
	}
}
