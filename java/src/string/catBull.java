package src.string;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * Input is a string with four distinct chars => You make one guess with four chars to see what is the input
 * If same position and char, its a bull. Same char in different position, its a cow
 */
public class catBull {
	public static void countCatsAndBulls(String input, String guess) {
		List<Character> bulls = new ArrayList<Character>();
		List<Character> cats = new ArrayList<Character>();
		
		if (input == null || guess == null || input.length() != guess.length()) {
			return;
		}
		
		Map<Character, Integer> charMap = new HashMap<Character, Integer>();
		for (int i=0; i < input.length(); i++) {
			if (input.charAt(i) == guess.charAt(i)) {
				bulls.add(input.charAt(i));
			} else {
				charMap.put(input.charAt(i), i);
			}
		}
		for (int i=0; i < guess.length(); i++) {
			if (charMap.containsKey(guess.charAt(i)) && guess.charAt(i) != input.charAt(i)) {
				cats.add(guess.charAt(i));
			}
		}

		System.out.println("String = " + input + ", guess = " + guess);
		System.out.println("Num of cats = " + cats.size() + ": " + cats);
		System.out.println("Num of bulls = " + bulls.size() + ": " + bulls);
	}
	
	public static void main(String[] args) {
		countCatsAndBulls("1234", "0249");
		countCatsAndBulls("1234", "1234");
		countCatsAndBulls("1234", "4321");
		countCatsAndBulls("1234", "8765");
		countCatsAndBulls("1234", "1289");
		countCatsAndBulls("1234", "8912");
	}
}
