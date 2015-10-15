package main.java.Tread.producer_consumer;

public class Producer extends Thread {  
	  
    private Box box;  
    private String name;  
  
    public Producer(Box b, String n) {  
        box = b;  
        name = n;  
    }  
  
    public void run() {  
  
        for (int i = 1; i < 6; i++) {  
  
            box.put(i);  
            System.out.println("Producer " + name  
                                + " produed: " + i);  
        }  
        try {  
            sleep((int) (Math.random() * 100));  
        } catch (InterruptedException e) {  
            e.printStackTrace();  
        }  
    }  
}  
