package src.data_structures.lists;

import java.util.ArrayList;

/*
 * Sample ArrayList usage. Nothing fancy here
 */
public class ArrayListClass {
	public String getStrings() {
		ArrayList<String> strs = new ArrayList<String>();

		String[] s = { "Test", "String" };

		for (String str : s) {
			strs.add(str);
		}

		strs.add(1, "Updated element");

		System.out.println("Checking index 0: " + strs.get(0));

		// StringBuffer to manipulate strings for performance reason
		// String gets copied every time you copy
		StringBuffer sentence = new StringBuffer();
		sentence.append(strs);
		return sentence.toString();
	}

	public static void main(String[] args) {
		System.out.println(new ArrayListClass().getStrings());
	}
}
