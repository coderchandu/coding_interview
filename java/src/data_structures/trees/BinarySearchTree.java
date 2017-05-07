package src.data_structures.trees;

import org.omg.CORBA.INTERNAL;

public class BinarySearchTree extends BinaryTree {
	public void insert(int data) {
		Node node = new Node(data);
		if (root == null) {
			root = node;
			return;
		}
		Node parent = root, prev = root;
		while (parent != null) {
			prev = parent;
			if (data < parent.data) {
				parent = parent.left;
			} else {
				parent = parent.right;
			}
		}
		if (data < prev.data) {
			prev.left = node;
		} else {
			prev.right = node;
		}
	}

	/* Create a balanced binary search tree */
	public void insert(int[] values) {
		root = insert(values, 0, values.length-1);
		System.out.println("Is BST = " + isBST());

		System.out.println("Is balanced = " + isBalanced(root));
		System.out.println("Height of tree = " + height(root));
		System.out.println("Num of nodes in tree = " + numNodes(root));

		printTree(root);
	}
	
	private boolean isBST() {
		return isBST(root, Integer.MIN_VALUE, Integer.MAX_VALUE);
	}
	
	private boolean isBST(Node node, int minVal, int maxVal) {
		if (node == null) {
			return true;
		}
		return isBST(node.left, minVal, node.data) && isBST(node.right, node.data + 1, maxVal);
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
		BinarySearchTree tree = new BinarySearchTree();
		System.out.println("Inserting 5, 1, 2, 4, 6, 34");
		tree.insert(arr);
	}
}
