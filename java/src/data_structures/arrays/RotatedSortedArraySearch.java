package src.data_structures.arrays;

/*
 * Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Question from leet code: https://leetcode.com/problems/search-in-rotated-sorted-array/#/description
*/

public class RotatedSortedArraySearch {
	private int[] arr;
	
	public RotatedSortedArraySearch(int[] arr) {
		this.arr = arr;
	}
	
	public int search(int val) {
		if (arr == null) {
			return -1;
		}
		return search(val, 0, arr.length-1);
	}
	
	public int search(int val, int start, int end) {
		if (start >= end) {
			if (start <= arr.length-1 && val == arr[start]) {
				return start;
			} else {
				return -1;
			}
		}
		int mid = (start + end) / 2;
		if (arr[mid] == val) {
			return mid;
		}
		if (arr[start] < arr[mid]) {
			if (val >= arr[start] && val <= arr[mid]) {
				return search(val, start, mid-1);
			} else {
				return search(val, mid+1, end);
			}
		} else if (val >= arr[mid] && val <= arr[end]) {
			return search(val, mid+1, end);
		} else {
			return search(val, start, mid-1);
		}
	}
	
	public static void main(String[] args) {
		int[] arr = {6,7,8,9,10,11,1,2,3,5};
		int index = new RotatedSortedArraySearch(arr).search(3);
		System.out.println(index);
	}
}
