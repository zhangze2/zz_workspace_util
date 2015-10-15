package main.java.XML;
import java.io.*;
import javax.xml.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import javax.xml.parsers.DocumentBuilderFactory;//除掉错误！为什么javax.xml.*类不能包含这行的类！！！


public class DOMDemo01{
	public static void main(String []args) throws Exception{
		// （1）建立DocumentBuilderFactory，用以取得DocumentBuilder
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// (2)
		javax.xml.parsers.DocumentBuilder builder = null;
		
		builder = factory.newDocumentBuilder();

		// (3)
		Document doc = null;
		// 读取指定路径的文件
		doc = builder.parse("D:" + File.separator + "dom_demo_02.xml");
		NodeList nl = doc.getElementsByTagName("name");
		System.out.println("姓名：" + nl.item(0).getFirstChild().getNodeValue());

	}
}