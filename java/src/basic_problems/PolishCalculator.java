package src.basic_problems;

import java.util.LinkedList;

/**
 * Prefix notation
 */
public class PolishCalculator {
	// * 10 25 gets converted to 25 10 *
	public String reverseByWords(String str) {
		//Step 1: Reverse full string. 
		//Step 2: Reverse each words
		
		StringBuffer result = new StringBuffer();
		StringBuffer strBuff = new StringBuffer(str).reverse();
		String[] words = strBuff.toString().split(" ");
		for (String word: words) {
			result.append(new StringBuffer(word).reverse() + " ");
		}
		
		return result.toString();
	}
	
	public int calculate(String prefix) {
		// Reverse by words of prefix
		String reversedString = reverseByWords(prefix);
		
		System.out.println("Output = " + reversedString);
		int result = 0;
		LinkedList<Integer> stack = new LinkedList<Integer>();
		
		String[] tokens = reversedString.split(" ");
		
		for (String s: tokens) {
			switch(s.trim()) {
			case "+": 
				result = stack.pop() + stack.pop();
				stack.push(result);
				break;
			case "-":
				result = stack.pop() - stack.pop();
				stack.push(result);
				break;
			case "*":
				result = stack.pop() * stack.pop();
				stack.push(result);
				break;
			case "/":
				result = stack.pop() / stack.pop();
				stack.push(result);
				break;
			default:
				stack.push(Integer.parseInt(s));
			}
		}
			
		if (stack.size() != 1) {
			System.out.println("error");
			return -1;
		}
		return stack.pop();
	}

	public static void main(String[] args) {
		System.out.println("Value of ÷ 10 5 : " + new PolishCalculator().calculate("/ 10 5"));

		System.out.println("Value of − × ÷ 15 − 7 + 1 (=5): " + new PolishCalculator().calculate("- * / 15 - 7 + 1 1 3 + 2 + 1 1"));
	}
}
