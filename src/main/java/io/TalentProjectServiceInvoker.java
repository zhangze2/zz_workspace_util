package main.java.io;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import main.java.util.excel.TempFileUtil;
import main.java.util.excel.WriteExcelUtil;

public class TalentProjectServiceInvoker extends AbstractServiceInvoker {
	
	/**
	 * ���������ļ�
	 * @return
	 */
	public Map<String, Object> exportDownload(final Map<String, Object> params) {
		if("success".equals(this.createFile(params))){
			File file = new File(System.getProperty("java.io.tmpdir") + "/hrm/�˲���Ŀ��Ϣ.xls");
			InputStream is = null;
			try {
				is = new FileInputStream(file);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("inputStream", is);
			map.put("filename", "�˲���Ŀ��Ϣ.xls");
			return map;
		}else{
			return new HashMap<String, Object>();
		}
	}
	private String createFile(final Map<String, Object> params){
		String result = "";
		List<Map<String, Object>> datas = this.getInitializer().getButterflyTemplate().execute(new JdbcCallback<List<Map<String,Object>>>() {
			@Override
			public List<Map<String, Object>> doInConnection(IDaos idaos)
					throws Exception {
				return projectBaseInfoDao.getExportProjectList(idaos,params);
			}
		});
		String fileName = "�˲���Ŀ��Ϣ.xls";
		OutputStream stream = TempFileUtil.instanse().createFile(fileName);
		WriteExcelUtil excel = new WriteExcelUtil();
		HSSFSheet sheet =excel.createSheet("�˲���Ŀ��Ϣ", 10, 100);
		String versions = "V1.0"; // Ŀǰ�̶�
		excel.writeTitleCell("ģ�����:", 0, 1);
		excel.writeCell("SZ_TALENT_PROJECT", 0, 2);
		excel.writeTitleCell("�汾��:", 0, 4);
		excel.writeCell(versions, 0, 5);
		int headRow =  2; // �ӵ����п�ʼд
		//���ֶ���Ϣ
		excel.writeTitleCell("��Ŀ���", headRow, 0);
		excel.writeTitleCell("��Ŀ���", headRow, 1);
		excel.writeTitleCell("�ٰ쵥λ", headRow, 2);
		excel.writeTitleCell("��Ŀ����", headRow, 3);
		excel.writeTitleCell("����Ŀ", headRow, 4);
		excel.writeTitleCell("�Ƿ���", headRow, 5);
		excel.writeTitleCell("��ʼʱ��", headRow, 6);
		excel.writeTitleCell("��λ������", headRow, 7);
		excel.writeTitleCell("��������", headRow, 8);
		excel.writeTitleCell("ѧУ���", headRow, 9);
		excel.writeTitleCell("�ļ�����", headRow, 10);
		excel.writeTitleCell("��ע", headRow, 11);
		//ѭ��д���¼����
		for(int i=0;i<datas.size();i++){
			HSSFRow row3 = sheet.createRow(3+i);
			Map<String,Object> data=new HashMap<String,Object>();
			data=datas.get(i);
			String projectId = (String) data.get("projectId");
			HSSFCell cell0 = row3.createCell(0);
			cell0.setCellValue(new HSSFRichTextString(projectId == null? "" : projectId));
			String name = (String) data.get("name");
			HSSFCell cell1 = row3.createCell(1);
			cell1.setCellValue(new HSSFRichTextString(name == null? "" : name));
			String organizers = (String) data.get("organizers");
			HSSFCell cell2 = row3.createCell(2);
			cell2.setCellValue(new HSSFRichTextString(organizers == null? "" : organizers));
			String proLevel = (String) data.get("proLevel");
			HSSFCell cell3 = row3.createCell(3);
			cell3.setCellValue(new HSSFRichTextString(proLevel == null? "" : proLevel));
			String parentid = (String) data.get("parentid");
			HSSFCell cell4 = row3.createCell(4);
			cell4.setCellValue(new HSSFRichTextString(parentid == null? "" : parentid));
			String status = (String) data.get("status");
			HSSFCell cell5 = row3.createCell(5);
			cell5.setCellValue(new HSSFRichTextString(status == null? "" : status));
			String beginDate = (String) data.get("beginDate");
			HSSFCell cell6 = row3.createCell(6);
			cell6.setCellValue(new HSSFRichTextString(beginDate == null? "" : beginDate));
			Object orgMoneyob = data.get("orgMoney");
			String orgMoney = orgMoneyob == null ? "0" : String.valueOf(orgMoneyob);
			HSSFCell cell7 = row3.createCell(7);
			cell7.setCellValue(new HSSFRichTextString(orgMoney));
			Object subsidizeYearob = data.get("subsidizeYear");
			String subsidizeYear = subsidizeYearob == null ? "0" : String.valueOf(subsidizeYearob);
			HSSFCell cell8 = row3.createCell(8);
			cell8.setCellValue(new HSSFRichTextString(subsidizeYear));
			Object schoolMoneyob = data.get("schoolMoney");
			String schoolMoney = schoolMoneyob == null ? "0" : String.valueOf(schoolMoneyob);
			HSSFCell cell9 = row3.createCell(9);
			cell9.setCellValue(new HSSFRichTextString(schoolMoney));
			String fileBased = (String) data.get("fileBased");
			HSSFCell cell10 = row3.createCell(10);
			cell10.setCellValue(new HSSFRichTextString(fileBased == null? "" : fileBased));
			String remark = (String) data.get("remark");
			HSSFCell cell11 = row3.createCell(11);
			cell11.setCellValue(new HSSFRichTextString(remark == null? "" : remark));
		}
		excel.writeFile(stream);
		try {
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		result = "success";
		return result;
	}
}
