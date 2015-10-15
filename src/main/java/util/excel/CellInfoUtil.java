package main.java.util.excel;

public class CellInfoUtil {
	private int row;
	private int col;
	private String cellName;
	private String codeId;
	private String defaultVal;

	public CellInfoUtil(int row, int col, String cellName, String codeId) {
		this.row = row;
		this.col = col;
		this.cellName = cellName;
		this.codeId = codeId;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getCellName() {
		return cellName;
	}

	public void setCellName(String cellName) {
		this.cellName = cellName;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getDefaultVal() {
		return defaultVal;
	}

	public void setDefaultVal(String defaultVal) {
		this.defaultVal = defaultVal;
	}

}
