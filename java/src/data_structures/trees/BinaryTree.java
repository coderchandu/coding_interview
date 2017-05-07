package src.data_structures.trees;

public class BinaryTree {
	// Only nested classes like this can be static in JAVA. Inner class
	// can be static or non-static. If static, it doesn't need outer class to 
	// be initiated to access this class, but it can only access static members
	// of the outer class
	protected static class Node {
		int data;
		Node left;
		Node right;
		
		protected Node(int data) {
			this.data = data;
			this.left = null;
			this.right = null;
		}
	}
	
	protected Node root;
	
	public void BinaryTree() {
		root = null;
	}
	
	public void insert(int data) {
		Node node = new Node(data);
		
	}

	/* Create a balanced binary tree */
	public void insert(int[] values) {
		root = insert(values, 0, values.length-1);
		System.out.println("Is balanced = " + isBalanced(root));
		System.out.println("Height of tree = " + height(root));
		System.out.println("Num of nodes in tree = " + numNodes(root));

		printTree(root);
	}
	
	private Node insert(int[] values, int start, int end) {
		if (start > end || end >= values.length) {
			return null;
		}
		int mid = (start + end)/2;
		Node node = new Node(values[mid]);
		node.left = insert(values, start, mid-1);
		node.right = insert(values, mid+1, end);
		return node;
	}
	
	
	// Print in ore order
	public void printTree(Node node) {
		if (node == null) {
			System.out.println();
			return;
		}
		System.out.print(node.data + " ");
		printTree(node.left);
		printTree(node.right);
	}
	
	// Max depth from root to leaf node
	public int height(Node node) {
		if (node == null) {
			return 0;
		}
		return 1 + Math.max(height(node.left), height(node.right));
	}
	
	public int numNodes(Node node) {
		if (node == null) {
			return 0;
		}
		return 1 + numNodes(node.left) + numNodes(node.right);
	}
	
	// A binary tree is balanced if no two nodes in tree have more than 1 as its distance from root node
	public boolean isBalanced(Node node) {
		if (node == null) {
			return true;
		}
		int lHeight = height(node.left);
		int rHeight = height(node.right);
		if (Math.abs(lHeight - rHeight) > 1) {
			return false;
		}
		return isBalanced(node.left) && isBalanced(node.right);
	}

	public static void main(String[] args) {
		int[] arr = {5, 1, 2, 4, 6, 34, 31, 2};
		BinaryTree tree = new BinaryTree();
		System.out.println("Inserting 5, 1, 2, 4, 6, 34");
		tree.insert(arr);
	}
}
