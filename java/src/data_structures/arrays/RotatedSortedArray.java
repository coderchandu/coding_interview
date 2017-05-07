package src.data_structures.arrays;

/* An array which was sorted got rotated at some element.
 * Eg: sorted array 1, 2, 3, 4, 5, 6 got rotated at 2 and resulted in 3, 4, 5, 6, 1, 2
 * Find minimum element in such an array
 */
public class RotatedSortedArray {
	public int findMin(int[] nums) {
		return search(nums, 0, nums.length - 1);
	}

	public int search(int[] arr, int start, int end) {
		if (start >= end) {
			return arr[start];
		}
		int mid = (start + end) / 2;
		if (mid > 0 && arr[mid] < arr[mid - 1]) {
			return arr[mid];
		}
		if (mid < arr.length && arr[mid + 1] < arr[mid]) {
			return arr[mid + 1];
		}
		if (arr[start] > arr[mid]) {
			return search(arr, start, mid - 1);
		} else if (arr[mid] > arr[end]) {
			return search(arr, mid + 1, end);
		} else {
			return arr[0];
		}

	}

	public static void main(String[] args) {
		int[] values = { 1, 3, 4, 7, 10, -1, 0 };
		System.out.print(new RotatedSortedArray().findMin(values));
	}
}
