package main.java.datastruction.Stack;

public class MyLinkedStack<T> implements MyStack<T>{

	 /** 
     * 栈顶指针 
     */  
    private Node top;  
    /** 
     * 栈的长度 
     */  
    private int size;  
      
    public MyLinkedStack() {  
        top = null;  
        size = 0;  
    }  
      
    @Override  
    public boolean isEmpty() {  
        return size == 0;  
    }  
      
    @Override  
    public void clear() {  
        top = null;  
        size = 0;  
    }  
      
    @Override  
    public int length() {  
        return size;  
    }  
      
    @Override  
    public boolean push(T data) {  
        Node node = new Node();  
        node.data = data;  
        node.pre = top;  
        // 改变栈顶指针  
        top = node;  
        size++;  
        return true;  
    }  
      
    @Override  
    public T pop() {  
        if (top != null) {  
            Node node = top;  
            // 改变栈顶指针  
            top = top.pre;  
            size--;  
            return node.data;  
        }  
        return null;  
    }  
      
    /** 
     * 将数据封装成结点 
     */  
    private final class Node {  
        private Node pre;  
        private T data;  
    } 
    
    
    
    /**
     * Title: Conversion
     * Description:将10进制正整数num转换为n进制
     * Created On: 2015-9-21 下午9:15:24
     * @author ZhangZe
     * Update On: 
     * Update By: 
     * @param num
     * @param n
     * @return 
     */
    public String Conversion(int num, int n) {
    	MyStack<Integer> myStack = new MyArrayStack<Integer>();  
        Integer result = num;  
        while (true) {  
            // 将余数入栈  
            myStack.push(result % n);  
            result = result / n;  
            if (result == 0) {  
                break;  
            }  
        }  
        StringBuilder sb = new StringBuilder();  
        // 按出栈的顺序倒序排列即可  
        while ((result = myStack.pop()) != null) {  
            sb.append(result);  
        }  
        return sb.toString();
    }
    
    
    
    
    /**
     * Title: isMatch
     * Description: 2.检验符号是否匹配. '['和']', '('和')'成对出现时字符串合法. 例如"[][]()", "[[([]([])()[])]]"是合法的; "([(])", "[())"是不合法的.
					遍历字符串的每一个char, 将char与栈顶元素比较. 如果char和栈顶元素配对, 则char不入栈, 否则将char入栈. 当遍历完成时栈为空说明字符串是合法的.
     * Created On: 2015-9-21 下午9:16:32
     * @author ZhangZe
     * Update On: 
     * Update By: 
     * @param str
     * @return 
     */
    public boolean isMatch(String str) {  
        MyStack<Character> myStack = new MyArrayStack<Character>();  
        char[] arr = str.toCharArray();  
        for (char c : arr) {  
            Character temp = myStack.pop();  
            // 栈为空时只将c入栈  
            if (temp == null) {  
                myStack.push(c);  
            }  
            // 配对时c不入栈  
            else if (temp == '[' && c == ']') {  
            }   
            // 配对时c不入栈  
            else if (temp == '(' && c == ')') {  
            }   
            // 不配对时c入栈  
            else {  
                myStack.push(temp);  
                myStack.push(c);  
            }  
        }  
        return myStack.isEmpty();  
    }  
    
    
    //如何用O(1)的时间复杂度求栈中最小的元素？
}
