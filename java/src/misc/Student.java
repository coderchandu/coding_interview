package src.misc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* Another random program just to familiarize with ArrayList and HashMap.
 * Feel free to ignore this class
 */
class Student {
   private int id;
   private String name;

   public Student(String name) {
     this.name = name;
     this.id = (int)( Math.random() * 10);
   }
   
   public static void store_data(ArrayList<Student> students) {
     HashMap<Integer, Student> map = new HashMap<Integer, Student>();
     for (Student s: students) {
    	 if (map.containsKey(s.id)) {
    		 System.out.println("Student with Id " + s.id + " = " + ((Student)(map.get(s.id))).name + ". And it is replaced by "
    				 + s.name);
    	 }
    	 map.put(s.id, s);
     }
     
     System.out.println("Total map content size = " + map.size());
     
     // Print final map contents
     for (Map.Entry<Integer, Student> entry: map.entrySet()) {
    	 System.out.println("id = " + entry.getKey());
    	 System.out.println("name = " + ((Student)entry.getValue()).name);
     }
   }
   
   public static void main(String[] args) {
	  ArrayList<Student> students = new ArrayList<Student>();
	  String[] names = {"S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10", "S11"};
	  for (String name: names) {
		  students.add(new Student(name));
	  }
	  
	  Student.store_data(students);
   }
}
