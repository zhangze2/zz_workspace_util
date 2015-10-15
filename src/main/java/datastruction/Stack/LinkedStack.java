package main.java.datastruction.Stack;

public class LinkedStack {
	private StackADT stack = new StackADT();  
    
    public void push(Object obj){  
        stack.insertFirst(obj);  
    }  
      
    public Object pop() throws Exception{  
        return stack.deleteFirst();  
    }  
      
    public void display(){  
        stack.display();  
    }  
      
    public static void main(String[] args) throws Exception{  
    	LinkedStack newStack = new LinkedStack();  
        newStack.push(1);  
        newStack.push(2);  
        newStack.push(3);  
        newStack.display();  
        System.out.println(newStack.pop());  
        newStack.display();  
    }
}
