package main.java.XML;
import java.io.*;
import javax.xml.*;
import org.w3c.dom.*;
import org.xml.sax.*;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilderFactory;//除掉错误！为什么javax.xml.*类不能包含这行的类！！！

// 解析XML文件
public class DOMDemo02{
	public static void main(String []args) throws Exception{
		// (1)建立DocumentBuilderFactory，用以取得DocumentBuilder
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		// (2)通过DocumentBuilderFactory取得DocumentBuilder
		javax.xml.parsers.DocumentBuilder builder = null;
		try{
			builder = factory.newDocumentBuilder();
		}catch (ParserConfigurationException e){
			e.printStackTrace();
		}

		// (3)定义Document接口对象，通过DocumentBuilder类进行DOM树的转换操作
		Document doc = null;
		// 读取指定路径的文件
		try{
			doc = builder.parse("D:" + File.separator + "dom_demo_01.xml");		
		}catch (SAXException e){
			e.printStackTrace();
		}catch (IOException e){
			e.printStackTrace();
		}
		// 查找linkman的节点
		NodeList nl = doc.getElementsByTagName("linkman");
		// 输出NodeList中第一个子节点中文本的内容
		for (int i = 0; i < nl.getLength(); i++){
			Element e = (Element)nl.item(i);	// 取得每一个元素
			System.out.println("姓名：" + e.getElementsByTagName("name").item(0).getFirstChild().getNodeValue());
			System.out.println("邮箱：" + e.getElementsByTagName("e-mail").item(0).getFirstChild().getNodeValue());			
		}

	}
}