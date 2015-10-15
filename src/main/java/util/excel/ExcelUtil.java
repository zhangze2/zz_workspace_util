package main.java.util.excel;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtil {
	public static void replaceModel(List<ReplaceData> datas, InputStream ins,
			OutputStream out) throws Exception {
		replaceModel(datas, ins, out, 0, 100, false);
	}
	
	public static void replaceModel(List<ReplaceData> datas, InputStream ins,
			OutputStream out,int start, int end, boolean single) throws Exception {
		List<ReplaceData> arrs = new ArrayList<ReplaceData>();
		arrs.addAll(datas);
		HSSFWorkbook workBook = new HSSFWorkbook(ins);
		HSSFSheet sheet = workBook.getSheetAt(0);
		int rownum = sheet.getLastRowNum() + 1;
		if (end > rownum) {
			end = rownum;
		}
		for (int r = start; r < end; r++) {
			HSSFRow row = sheet.getRow(r);
			int cellnum = row.getLastCellNum() + 1;
			for (int c = 0; c < cellnum; c++) {
				HSSFCell cell = row.getCell(c);
				if(cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
					String value = cell.getRichStringCellValue().toString();
					for (int i = 0; i < arrs.size(); i++) {
						ReplaceData data = arrs.get(i);
						String key = data.getKey();
 						if (value.contains(key)) {
 							if(value.contains("content")){
 								System.out.println("Excl表格存在特殊关键字符：content");
 							}
							if(data.getValue()!=null){
								value = value.replace(key, data.getValue());
							}else{
								value ="";
							}
							if (single) {
								arrs.remove(i);
							}
							cell.setCellValue(value);
						}
					}
				}
			}
		}
		ByteArrayOutputStream ostream = new ByteArrayOutputStream();
		workBook.write(ostream);
		out.write(ostream.toByteArray());
		out.close();
		ostream.close();
	}
}
