package main.java.Collection;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class IteratorTest {
	public static void main(String args[]) {
		List <String> list = new LinkedList<String> ();
		
		list.add("Aa");
		list.add("Ba");
		list.add("Cc");
		
		for(Iterator<String> it = list.iterator(); it.hasNext();) {
			String str = it.next();
			System.out.println(str);
		}
	}
}
