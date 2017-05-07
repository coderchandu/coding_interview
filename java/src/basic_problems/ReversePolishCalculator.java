package src.basic_problems;

import java.util.LinkedList;

/**
 * Reverse polish aka postfix notation
 */
public class ReversePolishCalculator {
	public int calculate(String postfix) {
		int result = 0;
		LinkedList<Integer> stack = new LinkedList<Integer>();
		
		String[] tokens = postfix.split(" ");
		
		for (String s: tokens) {
			switch(s.trim()) {
			case "+": 
				result = stack.pop() + stack.pop();
				stack.push(result);
				break;
			case "-":
				result = stack.pop();
				result = stack.pop() - result;
				stack.push(result);
				break;
			case "*":
				result = stack.pop() * stack.pop();
				stack.push(result);
				break;
			case "/":
				System.out.println("division");
				result = stack.pop();
				System.out.println("result " + result);

				result = stack.pop() / result;
				System.out.println("final result " + result);

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
		System.out.println("Value of 30 50 + : " + new ReversePolishCalculator().calculate("30 50 +"));

		System.out.println("Value of 30 10 50 + - : " + new ReversePolishCalculator().calculate("30 10 50 + -"));

		System.out.println("Expect 14: Result = " + new ReversePolishCalculator().calculate("5 1 2 + 4 * + 3 -"));
	}
}
