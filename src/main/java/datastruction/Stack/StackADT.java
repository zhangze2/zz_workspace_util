package main.java.datastruction.Stack;

public class StackADT {
	private class Node{  
        private Object data;  
        private Node next = null;  
          
        Node(Object obj){  
            this.data = obj;  
        }  
    }  
      
    private Node first = null;  
      
    public void insertFirst(Object obj){  
        Node newNode = new Node(obj);  
        newNode.next = first;  
        first = newNode;  
    }  
      
    public Object deleteFirst() throws Exception{  
        if(first == null)  
            throw new Exception("empty!");  
        Node temp = first;  
        first = first.next;  
        return temp.data;  
    }  
              
    public void display(){  
        if(first == null)  
            System.out.println("empty");  
        System.out.print("top -> bottom : | ");  
        Node cur = first;  
        while(cur != null){  
            System.out.print(cur.data + " | ");  
            cur = cur.next;  
        }  
        System.out.print("\n");  
    }
}


/*

top -> bottom : | 3 | 2 | 1 |   
3  
top -> bottom : | 2 | 1 | 

*/
