package src.misc;

/* Find if a number is ugly or not.
   Number is ugly if it is divisible only by 2,3 or 5 and not by any other prime numbers
   1 is ugly and 0 or negative numbers are not
 */
public class IsUgly {
    public boolean isUgly(int num) {
        if (num <= 0)
          return false;
        if (num == 1)
          return true;
        while (num > 0) {
            if (num%5 == 0) {
                num = num / 5;
            } else if (num % 3 == 0) {
                num = num / 3;
            } else if (num % 2 == 0) {
                num = num / 2;
            } else {
                break;
            }
        }
        if (num <= 1) {
            return true;
        } else {
            return false;
        }
    }
    
    public static void main(String[] args) {
    	IsUgly ugly = new IsUgly();
    	System.out.println("1 is ugly: " + ugly.isUgly(1));
    	System.out.println("0 is ugly: " + ugly.isUgly(0));
    	System.out.println("-11 is ugly: " + ugly.isUgly(-11));
    	System.out.println("100 is ugly: " + ugly.isUgly(100));
    	System.out.println("5 is ugly: " + ugly.isUgly(5));	
	}
}
