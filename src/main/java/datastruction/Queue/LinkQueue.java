package main.java.datastruction.Queue;

public class LinkQueue<T> {
	 //链的数据结构  
    private class Node{  
        public  T data;  
        public  Node next;  
        //无参构造函数  
        public Node(){}  
          
        public Node(T data,Node next){  
            this.data=data;  
            this.next=next;  
        }  
    }  
    //队列头指针  
    private Node front;  
    //队列尾指针  
    private Node rear;  
    //队列长度  
    private int size=0;  
      
    public LinkQueue(){  
        Node n=new Node(null,null);  
        n.next=null;  
        front=rear=n;  
    }  
      
    /** 
     * 队列入队算法 
     * @param data 
     * @author WWX 
     */  
    public void enqueue(T data){  
        //创建一个节点  
        Node s=new Node(data,null);  
        //将队尾指针指向新加入的节点，将s节点插入队尾  
        rear.next=s;  
        rear=s;  
        size++;  
    }  
      
    /** 
     * 队列出队算法 
     * @return 
     * @author WWX 
     */  
    public  T dequeue(){  
        if(rear==front){  
            try {  
                throw new Exception("堆栈为空");  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
            return null;  
        }else{  
            //暂存队头元素  
            Node p=front.next;  
            T x=p.data;  
            //将队头元素所在节点摘链  
            front.next=p.next;  
            //判断出队列长度是否为1  
            if(p.next==null)  
                rear=front;  
            //删除节点  
            p=null;  
            size--;  
            return  x;  
        }  
    }  
      
    /** 
     * 队列长队 
     * @return 
     * @author WWX 
     */  
    public int size(){  
        return size;  
    }  
      
    /** 
     * 判断队列是否为空 
     * @return 
     * @author WWX 
     */  
    public  boolean isEmpty(){  
        return  size==0;  
          
    }  
      
      
    public String toString() {  
        if(isEmpty()){  
            return "[]";  
        }else{  
            StringBuilder sb = new StringBuilder("[");  
            for(Node current=front.next;current!=null;current=current.next){  
                sb.append(current.data.toString() + ", ");  
            }  
            int len = sb.length();  
            return sb.delete(len - 2, len).append("]").toString();  
        }  
    }  
      
    //测试  
    public static void main(String[] args) {  
        LinkQueue<Integer> queue=new LinkQueue<Integer>();  
        queue.enqueue(1);  
        queue.enqueue(2);  
        queue.enqueue(3);  
        queue.enqueue(4);  
        queue.enqueue(5);  
        queue.enqueue(6);  
        System.out.println(queue);  
        System.out.println("出队："+queue.dequeue());  
        System.out.println("队列长度="+queue.size());  
        System.out.println(queue);  
        System.out.println("出队："+queue.dequeue());  
        System.out.println("队列长度="+queue.size());  
        System.out.println(queue);  
        System.out.println("出队："+queue.dequeue());  
        System.out.println("队列长度="+queue.size());  
        System.out.println(queue);  
    } 
}


/*输出结果：

[1, 2, 3, 4, 5, 6]
出队：1
队列长度=5
[2, 3, 4, 5, 6]
出队：2
队列长度=4
[3, 4, 5, 6]
出队：3
队列长度=3
[4, 5, 6]

*/
