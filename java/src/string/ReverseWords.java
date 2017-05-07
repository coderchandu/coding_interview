package src.string;

/*
 * Given a string, reverse the words in the string
 * 
 * This is a String => String a is This
 */
public class ReverseWords {
	
	/*
	 * Approach: 
	 * 1) Reverse whole sentence first. "I am" becomes "ma I"
	 * 2) Reverse chars in each word: "ma I" then becomes "am I" which is the desired output
	 */
	public String reverse(String str) {
		StringBuffer strBuff = new StringBuffer(str.trim());
		strBuff.reverse();
		
		// Split at each non word chars (w stands for word, W not a word (no alpha numeric, no underscore)
		//String[] words = strBuff.toString().trim().split("[\\W]+");

		//Depending on requirement we can use space char or word
		String[] words = strBuff.toString().trim().split("[\\s]+");

		strBuff.setLength(0); // Reuse the strBuff to get the reversed words
		for (String word: words) {
			strBuff.append(new StringBuffer(word).reverse().append(" "));
		}
		return strBuff.toString();
	}
	
	// Return true if one string can be rotated to form the other
	// Eg: apple can be rotated to form pleap or leapp
	public static boolean isRotation(String str1, String str2) {
		// Concatenate 1st string with itself. For eg: appleapple. In case of rotation, 2nd one should
		// be a sub-string now
		StringBuffer strBuff = new StringBuffer(str1);
		strBuff.append(str1);
		return (strBuff.indexOf(str2) > 0);
	}
	
	public static void main(String[] args) {
		String val = "  One  \n\n \r T\tT Two;;; Three; Four...a e";
		System.out.println(new ReverseWords().reverse(val));

		val = "This is aa  String";
		System.out.println(new ReverseWords().reverse(val));
		
		System.out.println("Check rotation: expect true: " + isRotation("Apple", "leApp"));
		System.out.println("Check rotation: expect false: " + isRotation("Apple", "lAepp"));

	}
}
