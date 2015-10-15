package main.java.datastruction.LinkList;

/**
 * @author http://blog.csdn.net/tayanxunhua/article/details/11100097/
 * 
 * 1. add方法 经测试发现可换位置  (by zz)
 */
public class LinkList {
	
	public Node first; // 定义一个头结点  
    private int pos = 0;// 节点的位置  
 
    public LinkList() {  
          this. first = null;  
    }  
 
    // 插入一个头节点  ,即入栈
    public void addFirstNode( int data) {  
         Node node = new Node(data);  
         node.next = first;  
         first = node;  
    }  
 
    // 删除一个头结点,并返回删除的头结点   ,即出栈
    public Node deleteFirstNode() {  
         Node tempNode = first;  
          first = tempNode. next;  
          return tempNode;  
    }  
 
    // 在任意位置插入节点 在index的后面插入  
    public void add(int index, int data) {  
         Node node = new Node(data);  
         Node current = first;  
         Node previous = first;  
         while ( pos != index) {  
             previous = current;  //开始从头结点遍历链表
             current = current.next;  
             pos++;  
         }  
         node.next = current;  //测试发现可换位置  (by zz)
         previous.next = node;  
         pos = 0;  
    }  
    
    
    /**
     * Title: addNodeAtEnd
     * Description:向链表中尾插入数据
     * Created On: 2015-9-17 下午10:22:56
     * @author ZhangZe
     * Update On: 
     * Update By: 
     * @param data 插入数据的内容
     */
    public void addNodeAtEnd( int data){
    	Node node = new Node(data);
    	if(first==null){//如果是空链表
    		first = node;
    		return ;
    	}
    	
    	Node temp = first;
    	while(temp.next!=null){
    		temp = temp.next;
    	}
    	temp.next = node;
    }
 
    // 删除任意位置的节点  
    public Node deleteByPos( int index) {  
         Node current = first;  
         Node previous = first;  
         while ( pos != index) {  
             pos++;  
             previous = current;  
             current = current. next;  
         }  
         if(current == first) {  
              first = first. next;  
         } else {  
             pos = 0;  
             previous. next = current. next;  
         }  
          return current;  
    }  
 
    // 根据节点的data删除节点(仅仅删除第一个)  
    public Node deleteByData( int data) {  
         Node current = first;  
         Node previous = first; //记住上一个节点  
         while (current.data != data) {  
              if (current.next == null) { //如果是首节点 
                   return null;  
             }  
             previous = current;  
             current = current. next;  
         }  
         if(current == first) {  
              first = first. next;  
         } else {  
             previous. next = current. next;  
         }  
          return current;  
    }  
 
    // 显示出所有的节点信息  
    public void displayAllNodes() {  
         Node current = first;  
         while (current != null) {  
             current.display();  
             current = current. next;  
         }  
         System. out.println();  
    }  
 
    // 根据位置查找节点信息  
    public Node findByPos( int index) {  
         Node current = first;  
          if ( pos != index) {  
             current = current. next;  
              pos++;  
         }  
          return current;  
    }  
 
    // 根据数据查找节点信息  
    public Node findByData( int data) {  
         Node current = first;  
          while (current. data != data) {  
              if (current. next == null)  
                   return null;  
             current = current. next;  
         }  
          return current;  
    }  
}
