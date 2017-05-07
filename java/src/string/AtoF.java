package src.string;

/*
 * Given float represented in string, print its value
 * "324" => 324, "-234.33" => -234.33
 */
public class AtoF {

	public static float getFloatVal(String str) {
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
		int decimalPlace = 0;
		float num = 0;
		while (i<str.length()) {
			char ch = str.charAt(i);
			if (ch == '.') {
				if (decimalPlace > 0) {
					throw new RuntimeException("Error, invalid input with multiple decimals: " + str);
				}
				decimalPlace = str.length() - 1 - i;
				i++;
				continue;
			}
			if (ch < '0' || ch > '9') {
				break; // Return partial integer, just an implementation choice similar to C atoi
			}
			num = num*10 + str.charAt(i) - '0';
			i++;
		}
		if (decimalPlace > 0) {
			num = num / (float)(Math.pow(10, decimalPlace));
		}
			
		return (num * sign);
	}
	
	public static void main(String[] args) {
		System.out.println("324.1 = " + getFloatVal("324.1"));
		System.out.println("-234.0 = " + getFloatVal("-234.0"));
		System.out.println(" -234 = " + getFloatVal("  -234"));

		System.out.println("abc = " + getFloatVal("abc"));
		System.out.println("123Abc = " + getFloatVal("123Abc"));
		System.out.println("12.30 = " + getFloatVal("12.30"));
		System.out.println("0.32 = " + getFloatVal("0.32"));
		
		try {
			System.out.println("0.3.4 = " + getFloatVal("0.3.4"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
