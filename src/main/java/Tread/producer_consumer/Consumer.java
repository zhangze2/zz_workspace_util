package main.java.Tread.producer_consumer;

class Consumer extends Thread {
	
	private Box box;
	private String name;
	public Consumer(Box b, String n) {
		box = b;
		name = n;
	}
	
	public void run() {
		
		int value = 0;
		for (int i = 1; i < 6; i++) {
			
			value = box.get();
			System.out.println("Consumer " + name+ " consumed: " + value);
		}
		try {
			sleep((int)(Math.random() * 100));
			
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
