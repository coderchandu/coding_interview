package src.data_structures.arrays;

import java.util.Arrays;

// Given an array of non-negative numbers, find continuous sub array with given sum
public class SumSubArray {
	public int[] findSubArray(int[] arr, int sum) {
		// All positive numbers. so we can use sliding window technique with 2 pointers
		int start = 0, end = 0, sumSoFar = 0;
		
		while (start<=end && end < arr.length) {
			sumSoFar += arr[end];
		    if (sumSoFar == sum) {
		    	return Arrays.copyOfRange(arr, start, end+1);
		    } 
		    while (start<=end && sumSoFar > sum) {
		    	sumSoFar -= arr[start];
		    	start++;
		    	if (sumSoFar == sum) {
		    		return Arrays.copyOfRange(arr, start, end+1);
		    	}
		    	if (start >= end) {
		    		end = start;
		    	}
		    }
		    end++;
		}
		
		return new int[0];
	}
	
	public static void main(String[] args) {
		int[] arr = new int[] {4,3,1,5,6,2,54,20,12,200};
		
		int[] result = new SumSubArray().findSubArray(arr, 12);
		System.out.println(Arrays.toString(result));
	}
}
