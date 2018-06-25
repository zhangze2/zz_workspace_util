package main.java.Tread.producer_consumer;

class Consumer extends Thread {
	
	private Box box;
	private String name;
	public Consumer(Box b, String n) {
		box = b;
		name = n;
	}
	
	
}
