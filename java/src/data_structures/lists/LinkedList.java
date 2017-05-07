package src.data_structures.lists;

/* 
 * Sample linked list operations without making use of Collections LinkedList!!
 * Just for fun
 */
public class LinkedList {
	private Node head;
	
	public Node getHead() {
		return head;
	}
	
	public void addToEnd(int value) {
		Node newNode = new Node(value);
		if (head == null) {
			head = newNode;
			return;
		}
		Node n = getHead();
		while (n.next != null) {
			n = n.next; 
		}
		n.next = newNode;
	}
	
	public Node delete(int value) {
	    Node node = head;
	    
	    if (head == null) {
	    	return null;
	    }
	    
	    if (node.value == value) {
	    	head = node.next;
	    	return node;
	    }
	    
	    Node prev = head;
	    node = head.next;
	    while(node != null && node.value != value) {
	    	prev = node;
	    	node = node.next;
	    }
	    if (node == null) {
	    	return null;
	    }
	    
	    Node nodeToDelete = node;
	    prev.next = node.next;
		return nodeToDelete;
	}
	
	public void printValues() {
		if (head == null) {
			System.out.println("Empty list");
			return;
		}
		Node node = head;
		while (node != null) {
			System.out.print(node.value + " ");
			node = node.next;
		}
		System.out.println();
	}
	
	private static class Node {
		int value;
		Node next;
		
		public Node(int value) {
			this.value = value;
		}
	}

	public static void main(String[] args){
		LinkedList list = new LinkedList();
		list.addToEnd(4);
		list.addToEnd(10);
		list.addToEnd(15);
		
		System.out.println("Printing list 4,10 and 15");
		list.printValues();
		
		list.delete(10);
		System.out.println("Printing list 4 and 15");
		list.printValues();
		
		list.delete(15);
		System.out.println("Printing after deleting 15");
		list.printValues();

		list.delete(15);
		System.out.println("Printing after deleting 15 which is not present in the list");
		list.printValues();

		list.delete(4);
		System.out.println("Printing after deleting the last element");
		list.printValues();
	}
}