package main.java.Tread.producer_consumer;

public class Box {
	private int value;  
    private boolean available = false;  
    public synchronized int get() {//synchronized：给方法加锁  
          
        while (available == false) {  
            try {  
                //等待生产者写入数据  
                wait();  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
          
        available = false;  
          
        //通知生产者数据已被取走，可以再次写入数据  
        notifyAll();  
        return value;  
    }  
    
    public synchronized int get2 () throws InterruptedException {
    		while (available == true) {
    			wait();
    		}
    		available = false;
    		notifyAll();
    		
    		return value;
    }
    
    public synchronized void put2(int value) throws InterruptedException {
    		while (available == true) {
    			wait();
    		}
    		
    		this.value = value;
    		available = true;
    		
    		notifyAll();
    }
    
    public synchronized void put(int value) {  
        while (available == true) {  
            try {  
                //等待消费者取走数据  
                wait();  
            } catch (InterruptedException e) {  
                e.printStackTrace();  
            }  
        }  
        this.value = value;  
        available = true;  
          
        //通知消费者可以来取数据  
        notifyAll();  
    } 
}
