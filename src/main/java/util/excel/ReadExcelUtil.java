package main.java.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ReadExcelUtil {
	private HSSFWorkbook workBook = null;

	public ReadExcelUtil(String filename) {
		try {
			File file = new File(filename);
			FileInputStream ins = new FileInputStream(file);
			workBook = new HSSFWorkbook(new POIFSFileSystem(ins));
			ins.close();
		} catch(Exception e) {
			System.out.println("Open file :'" + filename + "' failed...");
		}
	}
	
	public ReadExcelUtil(InputStream ins) {
		try {
			workBook = new HSSFWorkbook(new POIFSFileSystem(ins));
			ins.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return sheet count
	 */
	public int getSheetCount() {
		int sheetCount = -1;
		if (workBook != null) {
			sheetCount = workBook.getNumberOfSheets();
		}
		return sheetCount;
	}
	
	/**
	 * @param index sheet index
	 * @return row count 琛屾�鏁�
	 */
	public int getRowCount(int index) {
		int rowCount = -1;
		if (workBook != null) {
			rowCount = workBook.getSheetAt(index).getLastRowNum() + 1;
		}
		return rowCount;
	}
	
	/**
	 * @param row 褰撳墠琛�
	 * @return 鍗曞厓鏍兼�鏁�
	 */
	public int getCellCount(HSSFRow row) {
		int cellCount = -1;
		if(row != null) {
			cellCount = row.getLastCellNum() + 1;
		}
		return cellCount;
	}
	
	/**
	 * @param cell 鍗曞厓鏍�
	 * @return 鍗曞厓鏍煎唴瀹�
	 */
	public String getCellContent(HSSFCell cell) {
		String value = "";
		if(cell != null) {
			switch(cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC:
				value = getCellContentNumeric(cell);
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value = cell.getRichStringCellValue().toString();
				break;
			default:
				value = "";
				break;
			}
		}
		return value;
	}
	
	private String getCellContentNumeric(HSSFCell cell) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String value = "";
		if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				value = sdf.format(cell.getDateCellValue());
			} else {
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				value = "" + cell.getStringCellValue();
			}
		}
		return value;
	}
	
	/**
	 * @param cell 鍗曞厓鏍�
	 * @return 鍗曞厓鏍兼牱寮�
	 */
	public HSSFCellStyle getCellStyle(HSSFCell cell) {
		return cell.getCellStyle();
	}
	
	/**
	 * @param row 褰撳墠琛�
	 * @param start 寮�鍗曞厓鏍�
	 * @param end 缁撴潫鍗曞厓鏍�
	 * @return 琛屽唴瀹�
	 */
	public ExcelRow readExcelRow(HSSFRow row, int start, int end) {
		ExcelRow result = new ExcelRow();
		assert (start >= 0 && end >= start && row != null);
		HSSFCell cell = null;
		for (int i = start; i <= end; i++) {
			try {
				cell = row.getCell(i);
			} catch (Exception e) {
				cell = null;
			}
			result.add(getCellContent(cell));
		}
		return result;
	}
	
	public ExcelRow readExcelRow(HSSFRow row) {
		return readExcelRow(row, 0, getCellCount(row));
	}
	
	/**
	 * @param row 琛屽彿
	 * @param cells 鎸囧畾鍗曞厓鏍�
	 * @return
	 */
	public ExcelRow readRowInCell(HSSFRow row, int... cells) {
		ExcelRow result = new ExcelRow();
		HSSFCell cell = null;
		for (int index : cells) {
			try {
				cell = row.getCell(index);
			} catch (Exception e) {
				cell = null;
			}
			result.add(getCellContent(cell));
		}
		return result;
	}
	
	public class ExcelRow extends ArrayList<String> {
		private static final long serialVersionUID = -7663918241935117738L;
	}
	
	public ArrayList<ExcelRow> readSheetContent(int index) {
		ArrayList<ExcelRow> result = new ArrayList<ExcelRow>();
		if (index >= 0 && index <= getSheetCount()) {
			HSSFSheet sheet = workBook.getSheetAt(index);
			for (int i = 0; i < getRowCount(index); i++) {
				HSSFRow row = sheet.getRow(i);
				result.add(readExcelRow(row));
			}
		}
		return result;
	}
	
	/**
	 * 璇诲彇鏌怱heet鏌愯鏌愬垪鐨勫�
	 * @param index Sheet绱㈠紩
	 * @param row 琛屽彿
	 * @param col 鍒楀彿
	 * @return
	 */
	public String readCellContent(int index, int row, int col) {
		HSSFCell cell = workBook.getSheetAt(index).getRow(row)
				.getCell(col);
		return getCellContent(cell);
	}
	
	/**
	 * 璇诲彇鏌怱heet鏌愯鏌愬垪鐨勬牱寮�
	 * @param index Sheet绱㈠紩
	 * @param row 琛屽彿
	 * @param col 鍒楀彿
	 * @return
	 */
	public HSSFCellStyle readCellStyle(int index, int row, int col) {
		HSSFCell cell = workBook.getSheetAt(index).getRow(row)
				.getCell(col);
		return getCellStyle(cell);
	}
	
	/**
	 * @param index Sheet绱㈠紩
	 * @param cells 寮�鍗曞厓鏍�
	 * @param celle 缁撴潫鍗曞厓鏍�
	 * @return
	 */
	public ArrayList<ExcelRow> readSheetContent(int index, int cells, int celle) {
		ArrayList<ExcelRow> result = new ArrayList<ExcelRow>();
		if (index >= 0 && index <= getSheetCount()) {
			HSSFSheet sheet = workBook.getSheetAt(index);
			for (int i = 0; i < getRowCount(index); i++) {
				HSSFRow row = sheet.getRow(i);
				result.add(readExcelRow(row, cells, celle));
			}
		}
		return result;
	}
	
	/**
	 * @param index Sheet绱㈠紩
	 * @param rows 寮�琛�
	 * @param cells 寮�鍗曞厓鏍�
	 * @param celle 缁撴潫鍗曞厓鏍�
	 * @return
	 */
	public ArrayList<ExcelRow> readSheetContent(int index, int rows, int cells,
			int celle) {
		ArrayList<ExcelRow> result = new ArrayList<ExcelRow>();
		if (index >= 0 && index <= getSheetCount()) {
			HSSFSheet sheet = workBook.getSheetAt(index);
			for (int i = rows; i < getRowCount(index); i++) {
				HSSFRow row = sheet.getRow(i);
				result.add(readExcelRow(row, cells, celle));
			}
		}
		return result;
	}

	public HSSFWorkbook getWorkBook() {
		return this.workBook;
	}
	
}
