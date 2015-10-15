package main.java.XML;
import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;//��������Ϊʲôjavax.xml.*�಻�ܰ������е��࣡����
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
// �����ɵ�XML�ĵ�������ļ���
public class DOMDemo03{
	public static void main(String []args) {
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
		// ����һ���µ��ĵ�
		doc = builder.newDocument();
		// ��4����������������
		Element addresslist = doc.createElement("addresslist");
		Element linkman = doc.createElement("linkmane");
		Element name = doc.createElement("name");
		Element e_mail = doc.createElement("e_mail");
		// (5)���ýڵ���ı����ݣ���Ϊÿһ���ڵ�����ı��ڵ�
		name.appendChild(doc.createTextNode("����"));	// �����ı�
		e_mail.appendChild(doc.createTextNode("1003648856@qq.com"));
		// (6)���ýڵ��ϵ
		linkman.appendChild(name);
		linkman.appendChild(e_mail);
		addresslist.appendChild(linkman);
		doc.appendChild(addresslist);	// �ĵ��ϱ���ڵ�
		// (7)����ĵ��� �ļ���
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