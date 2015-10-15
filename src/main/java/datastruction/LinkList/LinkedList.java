package main.java.datastruction.LinkList;

public class LinkedList {
	private Node first; // 定义头结点
	private int pos; //定义头结点位置
	
	public void LikedList(){
		this.first = null;
	}
	
	public void addFirstNode(int value){
		Node node = new Node(value);
		node.next = first;
		first = node;
	}
	
}
