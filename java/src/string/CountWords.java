package src.string;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CountWords {
	public static Map<String, Integer> getWordCount(String inputText) {
		if (inputText == null || inputText.trim().isEmpty()) { // "".equals(word) instead of isEmpty() check
			return Collections.emptyMap();
		}
		Map<String, Integer> countMap = new HashMap<String, Integer>();

		// Split at each non word chars (w stands for word, W not a word (no alpha numeric, no underscore)
		String[] words = inputText.trim().split("[\\W]+");
		//String[] words = inputText.trim().split("[ ,.;\n\t\r]");

		for (String word: words) {
			word = word.toLowerCase();
			int count = 1;
			if (countMap.containsKey(word)) {
				count += countMap.get(word);
			}	
			countMap.put(word, count);
		}
		
		return countMap;
	}
	
	public static void main(String[] args) {
		String[] inputs = {
				"",
				null,
				"Test input 123",
				"132 Test input Test",
				"test test Test test",
				"test; test ;; ser; ; test"
		};
		
		for (String input: inputs) {
			Map<String, Integer> map = getWordCount(input);
			
//			for (String key: map.keySet()) {
//				System.out.println("(" + key + ") = " + map.get(key));
//			}
//			
//			for (Map.Entry<String, Integer> entry: map.entrySet()) {
//				System.out.println("(" + entry.getKey() + ") = " + entry.getValue());
//			}
			
			Iterator<Map.Entry<String, Integer>> iterator = map.entrySet().iterator();
			while (iterator.hasNext()) {
				Map.Entry<String, Integer> entry = iterator.next();
				System.out.println("[" + entry.getKey() + "] = " + entry.getValue());
				iterator.remove(); // Remove entry from map while iterating. This is not possible with other iteration approaches
			}
			System.out.println();
		}
	}
}
