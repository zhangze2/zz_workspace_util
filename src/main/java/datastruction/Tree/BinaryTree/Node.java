package main.java.datastruction.Tree.BinaryTree;

public class Node {
	private int data;
    private Node left;
    private Node right;
    public Node(int data) {
        this.data = data;
    }
    public int getData() {
        return data;
    }
    public Node getLeft() {
        return left;
    }
    public void setLeft(Node left) {
        this.left = left;
    }
    public Node getRight() {
        return right;
    }
    public void setRight(Node right) {
        this.right = right;
    }
    // 展示节点数据
    public void displayNode() {
        System.out.println(" " + data + " ");
    }
}
