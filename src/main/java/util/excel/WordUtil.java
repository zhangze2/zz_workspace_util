package main.java.util.excel;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

public class WordUtil {
	public static void replaceModel(List<ReplaceData> datas, InputStream ins,
			OutputStream out) throws Exception {
		HWPFDocument hdt = new HWPFDocument(ins);
		Range range = hdt.getRange();
		for (ReplaceData entry : datas) {
			range.replaceText(entry.getKey(), entry.getValue());
		}
		ByteArrayOutputStream ostream = new ByteArrayOutputStream();
		hdt.write(ostream);
		out.write(ostream.toByteArray());
		out.close();
		ostream.close();
	}
}
