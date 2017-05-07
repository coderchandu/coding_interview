package src.data_structures.arrays;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//Design an algorithm to find all pairs of integers within an array which sum to a specified value.
public class SumPair {
	public List<Integer[]> findAllPairs(int[] arr, int sum) {
		List<Integer[]> result = new ArrayList<Integer[]>();
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		for (int element: arr) {
			if (map.containsKey(sum - element)) {
				// Found a pair
				Integer[] pair = {element, sum-element};
				result.add(pair);
				int currentCount = map.get(sum - element);
				currentCount--;
				if (currentCount <= 0) {
					map.remove(sum - element);
				} else {
					map.put(sum - element, currentCount); // Storing for multiple occurrence of same numbers
				}
			} else {
				map.put(element, 1);
			}
		}
		
		return result;
	}
	
	public List<Integer[]> findAllPairsNew(int[] arr, int sum) {
		Arrays.sort(arr);
		return findAllPairsSort(arr, sum);
	}
	
	public List<Integer[]> findAllPairsSort(int[] arr, int sum) {
		List<Integer[]> result = new ArrayList<Integer[]>();
		
		for (int i=0,j=arr.length-1; i<j; ) {
			if (arr[i] + arr[j] == sum) {
				Integer[] pair = {arr[i], arr[j]};
				result.add(pair);
				i++;
				j--;
			} else if (arr[i] + arr[j] > sum) {
				j--;
			} else {
				i++;
			}
		}
		
		return result;
	}
	
	
	public static void main(String[] args) {
		int[] arr = {2,3,11,8,0,9,-1,3,12, 8};
		List<Integer[]>result = new SumPair().findAllPairsNew(arr, 11);
		for (Integer[] pair: result) {
			System.out.println(pair[0] + ", " + pair[1]);
		}
	}
}
