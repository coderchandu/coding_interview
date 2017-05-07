package src.string;

import java.util.HashMap;
import java.util.Map;

/*
 * Check if 2 strings are anagram or not - re-arranging can result in same string or not
 */
public class Anagram {
	public boolean isAnagram(String str1, String str2) {
		// Method 1: Sort and compare. O(n log n) for sorting
		// Method 2: count number of chars in hash map and compare : O(n)
		
		if (str1 == null || str2 == null || str1.length() != str2.length()) { // Length must be same for anagrams
			return false;
		}
		
		Map<Character, Integer> map = new HashMap<Character, Integer>();
		
		//for (char ch: str1.toCharArray()) {
		for (int i=0; i<str1.length(); i++) {
			char ch = str1.charAt(i);
			int count = 1;
			if (map.containsKey(ch)) {
				count += map.get(ch);
			}
			map.put(ch, count);
		}
		int count;
		//for (char ch: str2.toCharArray()) {
		for (int i=0; i<str2.length(); i++) {
				char ch = str2.charAt(i);
			if (!map.containsKey(ch) || ((count = map.get(ch)) <= 0)) {
				return false;
			}
			if (count > 1) {
				map.put(ch, count-1);
			} else {
				map.remove(ch);
			}
		}
		return map.size() == 0;
	}

	public static void main(String[] args) {
		System.out.println("Expect true: " + new Anagram().isAnagram("Anagram", "Anagamr"));
		System.out.println("Expect false: " + new Anagram().isAnagram("Anar", "Anag"));
		System.out.println("Expect false: " + new Anagram().isAnagram("Anag", "Anagr"));
	}
}
