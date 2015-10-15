package main.java.XML;
import java.io.*;
import javax.xml.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import javax.xml.parsers.DocumentBuilderFactory;//��������Ϊʲôjavax.xml.*�಻�ܰ������е��࣡����


public class DOMDemo01{
	public static void main(String []args) throws Exception{
		// ��1������DocumentBuilderFactory������ȡ��DocumentBuilder
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// (2)
		javax.xml.parsers.DocumentBuilder builder = null;
		
		builder = factory.newDocumentBuilder();

		// (3)
		Document doc = null;
		// ��ȡָ��·�����ļ�
		doc = builder.parse("D:" + File.separator + "dom_demo_02.xml");
		NodeList nl = doc.getElementsByTagName("name");
		System.out.println("������" + nl.item(0).getFirstChild().getNodeValue());

	}
}