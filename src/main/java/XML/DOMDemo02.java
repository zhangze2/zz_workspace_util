package main.java.XML;
import java.io.*;
import javax.xml.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilderFactory;//��������Ϊʲôjavax.xml.*�಻�ܰ������е��࣡����

// ����XML�ļ�
public class DOMDemo02{
	public static void main(String []args) throws Exception{
		// (1)����DocumentBuilderFactory������ȡ��DocumentBuilder
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// (2)ͨ��DocumentBuilderFactoryȡ��DocumentBuilder
		javax.xml.parsers.DocumentBuilder builder = null;
		try{
			builder = factory.newDocumentBuilder();
		}catch (ParserConfigurationException e){
			e.printStackTrace();
		}

		// (3)����Document�ӿڶ���ͨ��DocumentBuilder�����DOM����ת������
		Document doc = null;
		// ��ȡָ��·�����ļ�
		try{
			doc = builder.parse("D:" + File.separator + "dom_demo_01.xml");		
		}catch (SAXException e){
			e.printStackTrace();
		}catch (IOException e){
			e.printStackTrace();
		}
		// ����linkman�Ľڵ�
		NodeList nl = doc.getElementsByTagName("linkman");
		// ���NodeList�е�һ���ӽڵ����ı�������
		for (int i = 0; i < nl.getLength(); i++){
			Element e = (Element)nl.item(i);	// ȡ��ÿһ��Ԫ��
			System.out.println("������" + e.getElementsByTagName("name").item(0).getFirstChild().getNodeValue());
			System.out.println("���䣺" + e.getElementsByTagName("e-mail").item(0).getFirstChild().getNodeValue());			
		}

	}
}