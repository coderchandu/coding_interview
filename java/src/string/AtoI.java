package src.string;

/*
 * Given integer represented in string, print its value
 * "324" => 324, "-234" => -234
 */
public class AtoI {

	public static int getIntVal(String str) {
		if (str == null || str.trim().isEmpty()) {
			return 0;
		}
		int sign = 1;
		str = str.trim();
		
		int i=0;
		
		if (str.charAt(i) == '-') {
			sign = -1;
			i++;
		}
		if (str.charAt(i) == '0') {
			return 0;
		}
		int num = 0;
		while (i<str.length()) {
			char ch = str.charAt(i);
			if (ch < '0' || ch > '9') {
				return num; // Return partial integer, just an implementation choice similar to C atoi
			}
			num = num*10 + str.charAt(i) - '0';
			i++;
		}
		return num * sign;
	}
	
	public static void main(String[] args) {
		System.out.println("324 = " + getIntVal("324"));
		System.out.println("-234 = " + getIntVal("-234"));
		System.out.println(" -234 = " + getIntVal("  -234"));

		System.out.println("abc = " + getIntVal("abc"));
		System.out.println("123Abc = " + getIntVal("123Abc"));
		System.out.println("12.3 = " + getIntVal("12.3"));
	}
}
