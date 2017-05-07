package src.string;

// String is immutable. Use StringBuffer instead of string for any string manipulations
// as it is much efficient compared to String, where operations like 
// append always end up creating new strings
public class StringBufferExample {
	public void execute() {
		String str = "Abc \n BCD";
		
		StringBuffer strBuff = new StringBuffer(str);
		strBuff.append("END");
		System.out.println("New string after appending 'End': "+ strBuff);

		strBuff.insert(3, "Inserted String ");
		System.out.println("New string inserted: "+ strBuff);

		
		strBuff.replace(0, 3, "C");
		System.out.println("New string after replacing from 0 to 3 with C: "+ strBuff);

		int index = strBuff.indexOf("\n");
		index = strBuff.lastIndexOf("\n");
		strBuff.replace(index, index+1, "\t");
		System.out.println("New string after replacing new line with tab: "+ strBuff);

		strBuff.reverse();
		System.out.println("Reversed string: "+ strBuff);

		System.out.println("Sub string - 1st 5 chars: " + strBuff.substring(0, 5));
		System.out.println("Sub string from 5th char onward: " + strBuff.substring(5));
	}
	
	public static void main(String[] args) {
		new StringBufferExample().execute();
	}
}
