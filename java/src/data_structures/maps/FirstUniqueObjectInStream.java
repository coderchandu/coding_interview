package src.data_structures.maps;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * Given a stream of objects, find first unique object.
 * If stream is A B C A B C A D => First unique char is D. If stream is A B C => first unique char is A
 * 
 * Given 2 helper methods hasNext() and getNext() for checking and getting next object in the stream
 */
public class FirstUniqueObjectInStream {
	public static class Stream {
		private List<Object> objects;
		private int lastReadIndex;
		
		public Stream() {
			objects = new ArrayList<Object>();
			lastReadIndex = -1;
		}
		public void add(Object object) {
			objects.add(object);
		}
		
		public Object getNext() {
			if (lastReadIndex < objects.size()-1) {
				lastReadIndex++;
				return objects.get(lastReadIndex);
			} else {
				return null;
			}
		}
		
		public boolean hasNext() {
			return (lastReadIndex < objects.size()-1);
		}
	}
	
	public static class DoublyLinkedList {
		public static class Node {
			Object data;
			Node left;
			Node right;
			public Node(Object data) {
				this.data = data;
				this.left = null;
				this.right = null;
			}
		}
		
		Node head;
		
		public DoublyLinkedList() {
			head = null;
		}
		
		public Node add(Object element) {
			Node node = new Node(element);
			if (head == null) {
				head = node;
				return node;
			}
			node.right = head;
			head.left = node;
			head = node;
			return  node;
		}
		
		public void remove(Node node) {
			if (node.left != null) {
				node.left.right = node.right;
			}
			if (node.right != null) {
				node.right.left = node.left;
			}
			if (node == head) {
				head = head.right;
			}
		}
	}
	
	/*
	 * Use hashmap to store the objects as it comes
	 * Use doubly linked list to preserve the order. Hashmap value points to linked list node
	 * Remove entry from doubly linked list whenever duplicate object comes. That way head of the
	 * list will be always the 1st unique object in the stream at any point in time
	 */
	public static Object firstUniqueObject(Stream stream) {
		DoublyLinkedList linkedList = new DoublyLinkedList();
		Map<Object, DoublyLinkedList.Node> map = new HashMap<Object, DoublyLinkedList.Node>();

		while (stream.hasNext()) {
			Object obj = stream.getNext();
			if (map.containsKey(obj)) { // Its not unique, remove from list
				DoublyLinkedList.Node node = map.get(obj);
				if (node != null) { // This arises when the element comes for third time or later as 2nd time itself we would've deleted the node
					linkedList.remove(node);
					map.put(obj, null);
				}
			} else { // First time this object is coming, store in the list and in hash map
				DoublyLinkedList.Node node = linkedList.add(obj);
				map.put(obj, node);
			}
		}

		return (linkedList.head == null) ? null : linkedList.head.data;
	}
	
	public static void main(String[] args) {
		Stream stream = new Stream();
		String[] inputs = {
			"AB",
			"bA",
			"AB",
			"BA",
			"ba"
		};
		for (String str: inputs) {
			stream.add(str);			
		}
		System.out.println(firstUniqueObject(stream));
	}
}
