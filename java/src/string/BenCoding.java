package src.string;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*The point of this exercise is to implement the bencoding format, by taking a bencoded string as input,
  and converting it to native JAVA types as output.

 Bencoding supports 4 different types.
 Integers are represented with delimiters 'i' and 'e'.
 Strings are prefixed with their string length as an integer, followed by a ':' character, and then the characters that make up that string.
 Lists are prefixed with an 'l' character, filled with a variable number of other bencoded types, then end with an 'e' character delimiter.
 Dictionaries are prefixed with a 'd' character, filed with a variable number of other bencoded types, then end with an 'e' character delimiter.
 The elements of the dictionary are encoded each key immediately followed by its value. All keys must be byte strings and must appear in
 lexicographical order. A dictionary that associates the values 42 and "spam" with the keys "foo" and "bar", respectively 
 (in other words, {"bar": "spam", "foo": 42}}), would be encoded as follows: d3:bar4:spam3:fooi42ee
 */

public class BenCoding {
	private String encodedString;
	private int currentIndex;
	
	public BenCoding(String encodedString) {
		this.encodedString = encodedString;
		this.currentIndex = 0;
	}
	
	public Object decode() {
		if (encodedString == null || encodedString.isEmpty() || currentIndex >= encodedString.length()) {
			return null;
		}
		
		if (encodedString.charAt(currentIndex) == 'i') {
			return decodeInteger();
		} else if (encodedString.charAt(currentIndex) == 'l') {
			return decodeList();
		} else if (encodedString.charAt(currentIndex) == 'd') {
			return decodeDictionary();
		} else if (encodedString.charAt(currentIndex) >= '0' && encodedString.charAt(currentIndex) <= '9') { // String
			return decodeString();
		}
		throw new RuntimeException("Invalid input: " + encodedString);
	}
	
	private String decodeString() {
		StringBuffer sBuff = new StringBuffer(encodedString);
		String subString = sBuff.substring(currentIndex);
		String[] inputs = subString.split(":", 2);
		if (inputs.length != 2) {
			throw new RuntimeException("Invalid input string: " + encodedString);
		}
		int length = Integer.parseInt(inputs[0]);
		currentIndex += length + 2; // One for colon separator and other for moving to next char after this string
		return new StringBuffer(inputs[1]).substring(0, length);
	}

	private Map<Object, Object> decodeDictionary() {
		Map<Object, Object> map = new HashMap<Object, Object>();

		currentIndex++; // For char 'd'
		while (encodedString.charAt(currentIndex) != 'e') {
			map.put(decode(), decode());
		}
		return map;
	}	

	private List<Object> decodeList() {
		List<Object> list = new ArrayList<Object>();
		
		currentIndex++; // For char 'l'
		while (encodedString.charAt(currentIndex) != 'e') {
			list.add(decode());
		}
		
		return list;
	}	

	private Integer decodeInteger() {
		StringBuffer sBuff = new StringBuffer(encodedString);
		String strVal = sBuff.substring(currentIndex+1, sBuff.indexOf("e", currentIndex+1));
		currentIndex += strVal.length() + 2; // +2 for i and e
		return Integer.parseInt(strVal);
	}
	
	public static void main(String[] args) {
		System.out.println(new BenCoding("i15e").decode());
		System.out.println(new BenCoding("3:dog").decode());
		System.out.println(new BenCoding("8:robots54").decode());
		System.out.println(new BenCoding("11:string:test").decode());
		
		System.out.println(new BenCoding("l5:green3:red4:bluei1143ee").decode());
		try {
			System.out.println(new BenCoding("A15").decode());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println(new BenCoding("d3:bar4:spam3:fooi42e3:keyl5:green3:redee").decode());
	}
}
