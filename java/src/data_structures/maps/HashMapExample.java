package src.data_structures.maps;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Spliterator;

public class HashMapExample {

	public void example() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("One", 1);
		map.put("Two", 2);
		map.put("Three", 3);
	
		for (String key: map.keySet()) {
			System.out.println("[" + key + "] = " + map.get(key));
		}
		System.out.println();

		for (Map.Entry<String, Integer> entry: map.entrySet()) {
			System.out.println("[" + entry.getKey() + "] = " + entry.getValue());
		}
		System.out.println();
		System.out.println("Size = " + map.size() + " is empty ? = " + map.isEmpty());

		// (JAVA 8 version) Print the key value pair in one line.
		map.forEach((k,v) -> System.out.println("key: "+k+" value:"+v));
		
		// Old version
		Iterator<Map.Entry<String, Integer>> iterator = map.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, Integer> entry = iterator.next();
			System.out.println("[" + entry.getKey() + "] = " + entry.getValue());
			iterator.remove(); // Remove entry from map while iterating. This is not possible with other iteration approaches
		}
		
		System.out.println("Size = " + map.size() + " is empty ? = " + map.isEmpty());
	}
	
	public static void main(String[] args) {
		new HashMapExample().example();
	}
}
