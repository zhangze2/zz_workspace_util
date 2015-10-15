package main.java.Tread.producer_consumer;

public class ProducerConsumerTest {
	/** 
     * 生产者/消费者问题 
     * @param args 
     */  
      
    public static void main(String[] args) {  
  
        Box box = new Box();  
        Producer p = new Producer(box, "p");  
        Consumer c = new Consumer(box, "c");  
        p.start();  
        c.start();  
    }  
}
