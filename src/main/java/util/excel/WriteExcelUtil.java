package main.java.util.excel;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class WriteExcelUtil {
	private HSSFWorkbook workBook = null;
	private HSSFSheet currentSheet = null;
	private HSSFCellStyle cellStyle = null;
	private int max_cols_num = 0; // 当前表单元最大列数
	private int max_rows_num = 0; // 当前表单元最大行数
	
	public WriteExcelUtil() {
		workBook = new HSSFWorkbook();
		HSSFFont font = workBook.createFont();
        
        cellStyle = workBook.createCellStyle();
        cellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setFont(font);
	}
	
	public WriteExcelUtil(InputStream is) throws IOException {
		workBook = new HSSFWorkbook(is);
		currentSheet = workBook.getSheetAt(0);
		max_rows_num = currentSheet.getLastRowNum() + 1;
		max_cols_num = currentSheet.getRow(0).getLastCellNum() + 1;
		
		HSSFFont font = workBook.createFont();
        font.setFontName("黑体");
		cellStyle = workBook.createCellStyle();
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setFont(font);
	}
	
	/**
	 * 最终生成Excel文件
	 * @param stream 输出文件流
	 */
	public void writeFile(OutputStream stream) {
		try {
			ByteArrayOutputStream ostream = new ByteArrayOutputStream();
			workBook.write(ostream);
			stream.write(ostream.toByteArray());
			stream.close();
			ostream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获得workbook
	 * */
	public HSSFWorkbook getworkBook(){
		return workBook;
	}
	
	/**
	 * 创建rows * cols的表单元
	 * @param sheetname 单元名称
	 * @param rows 行数
	 * @param cols 列数
	 * @return 
	 */
	public HSSFSheet createSheet(String sheetname, int rows, int cols) {
		currentSheet = workBook.createSheet(sheetname);
		currentSheet.setDefaultColumnWidth(13);
		for (int i = 0; i < rows; i++) {
			HSSFRow row = currentSheet.createRow(i);
			for (int j = 0; j < cols; j++) {
				row.createCell( j);
			}
		}
		
		this.max_cols_num = cols;
		this.max_rows_num = rows;
		return currentSheet;
	}
	
	/**
	 * 写当前表单元的单元格
	 * @param value 写入值
	 * @param row 第几行
	 * @param col 第几列
	 */
	public void writeCell(String value,int row, int col) {
		try {
			if (row >= max_rows_num) {
				int count = (row - max_rows_num) / 10 + 1;
				for (int x = 0; x < count; x++) {
					for (int i = max_rows_num; i < max_rows_num + 10; i++) {
						HSSFRow crow = currentSheet.createRow(i);
						for (int j = 0; j < max_cols_num; j++) {
							crow.createCell(j);
						}
					}
					max_rows_num = max_rows_num + 10;
				}
			}
			currentSheet.getRow(row).getCell(col).setCellValue(value);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("写单元格失败");
		}
	}
	
	/**
	 * 写当前表单元的单元格样式
	 * @param style 写入样式
	 * @param row 第几行
	 * @param col 第几列
	 */
	public void writeCellStyle(HSSFCellStyle style,int row, int col) {
		try {
			currentSheet.getRow(row).getCell(col).setCellStyle(style);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("写单元格样式失败");
		}
	}
	
	/**
	 * 写当前表单元的单元格,带样式
	 * @param value 写入值
	 * @param row 第几行
	 * @param col 第几列
	 */
	public void writeTitleCell(String value,int row, int col) {
		writeCell(value,row, col);
		HSSFFont font = workBook.createFont();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		currentSheet.getRow(row).getCell(col).setCellStyle(cellStyle);
	}
	
}
