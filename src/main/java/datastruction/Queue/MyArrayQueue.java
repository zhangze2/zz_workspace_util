package main.java.datastruction.Queue;

import main.java.datastruction.LinkList.LinkList;
import main.java.datastruction.LinkList.Node;

public class MyArrayQueue<E> {
	private LinkList list = new LinkList();
	private int size = 0;
	
	public synchronized void put(int data){
		list.addFirstNode(data);
		size++;
	}
	
	public synchronized Node pop(){
		size--;
		return list.deleteFirstNode();
	}
	
	public synchronized boolean empty(){
		return size == 0;
	}
	
	public synchronized int size(){
		return size;
	}
}
