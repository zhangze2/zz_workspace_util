package main.java.XML;
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;//除掉错误！为什么javax.xml.*类不能包含这行的类！！！
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
// 将生成的XML文档输出到文件中
public class DOMDemo03{
	public static void main(String []args) {
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
		// 创建一个新的文档
		doc = builder.newDocument();
		// （4）建立各个操作点
		Element addresslist = doc.createElement("addresslist");
		Element linkman = doc.createElement("linkmane");
		Element name = doc.createElement("name");
		Element e_mail = doc.createElement("e_mail");
		// (5)设置节点的文本内容，即为每一个节点添加文本节点
		name.appendChild(doc.createTextNode("张泽"));	// 设置文本
		e_mail.appendChild(doc.createTextNode("1003648856@qq.com"));
		// (6)设置节点关系
		linkman.appendChild(name);
		linkman.appendChild(e_mail);
		addresslist.appendChild(linkman);
		doc.appendChild(addresslist);	// 文档上保存节点
		// (7)输出文档到 文件中
		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer t = null;
		try{
			t = tf.newTransformer();			
		}catch (TransformerConfigurationException e){
			e.printStackTrace();
		}
		t.setOutputProperty(OutputKeys.ENCODING, "GBK");
		DOMSource doms = new DOMSource(doc);
		StreamResult sr = new StreamResult(new File("D:" + File.separator + "output.xml"));	
		try{
			t.transform(doms, sr);
		}catch (TransformerException e){
			e.printStackTrace();
		}		
	}
}