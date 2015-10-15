package main.java.io;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import main.java.util.excel.TempFileUtil;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class exportGraduation {
	public Map<String, Object> doInConnection(Map<String,Object> params) throws Exception {
		//在模版定入数据 导出word
		int pre=(int) System.currentTimeMillis();
		InputStream inStream = (InputStream)params.get("fileStream");
		
		Configuration  configuration  =   new  Configuration(); 
		configuration.setDefaultEncoding("UTF-8");

	    StringTemplateLoader stringTemplateLoader = new StringTemplateLoader();
	    configuration.setTemplateLoader(stringTemplateLoader);
		configuration.setObjectWrapper(new DefaultObjectWrapper());
//		configuration.setClassForTemplateLoading(this.getClass(), "/com.lysoft.business.component.sztz.service.practice/graduation_info.ftl");
		Template template=null;
		//graduation_info.ftl为要装载的模板     
	    InputStreamReader reader = new InputStreamReader(inStream);  
	    template  =  new Template("test",reader, configuration, "UTF-8");
	    
	    Writer out = null; 
	    final String 	periodParam=(String)params.get("period");
	    final List<Map<String, Object>> semesterIdList= new ArrayList<Map<String,Object>>();
	    //某届分数详情
		Map<String, Object> periodCredits = params;
		BigDecimal decimal=(BigDecimal) periodCredits.get("totalFraction");
		final double totalFraction=decimal.doubleValue();
		//学生所在届学期应修分列表
		final List<Map<String, Object>> scoreList=new ArrayList<Map<String,Object>>();
	    final List<Map<String, Object>> graduationCertificateInfoList = new ArrayList<Map<String,Object>>();
	    final SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
	    final List<Map<String, Object>> graduationIdList = new ArrayList<Map<String,Object>>();
	   
	    for(Map<String, Object> map : graduationIdList){
	    	String studentInfoId = (String) map.get("studentInfoId");
	    	String period = (String) map.get("period");
	    	BigDecimal totalScoreBig=(BigDecimal) map.get("totalScore");
	    	double totalScore=totalScoreBig.doubleValue();
	    	//判断是否合格
	    	if(totalScore>=totalFraction){//学生获的分数大于等于所在届应修分数
	    		Map<String, Object> stacticScoreMap= params;
	    		String makeupCondition=(String) stacticScoreMap.get("makeupCondition");
	    		if(makeupCondition.equals("fasle")){ //有学期分数没合格进入补分
	    			Map<String, Object> makeupScoreMap= params;
			    	String graduationPass=(String) makeupScoreMap.get("graduationPass");
			    	if(graduationPass.equals("合格")){//合格时划分成绩等级
			    		String gradeRank = "";
			    		map.put("gradeRank", gradeRank);
			    	}else{
			    		map.put("gradeRank", "不及格");
			    	}
	    		}else{
	    			String gradeRank = "";
		    		map.put("gradeRank", gradeRank);
	    		}
	    	}else{
	    		map.put("gradeRank", "不及格");
	    	}
	    	map.put("date", sdf.format(new Date()));
	    	graduationCertificateInfoList.add(map);// 素质拓展证信息
	    	map=null;
	    }
	    Map<String,Object> root=new HashMap<String,Object>();
		root.size();
	    String fileName = "素质拓展证书";
		File outFile= TempFileUtil.instanse().docFile(fileName);
		OutputStreamWriter oWriter = new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8");
		try {
			out = new BufferedWriter(oWriter);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	try {
    		root.put("userList", graduationCertificateInfoList);
    		template.process(root, out);
    	} catch (TemplateException e) {
    		e.printStackTrace();
    	} catch (IOException e) {
    		e.printStackTrace();
    	}finally{
    		graduationCertificateInfoList.clear();
    		out.close();  
    	}
		Map<String, Object> result = new HashMap<String, Object>();
		int post=(int) System.currentTimeMillis();
		System.out.println("运行时间:"+(post-pre));
		result.put("filename", fileName);
		result.put("path", "temp");
		return result;
	}
	
	
	//打zip包
//	final byte[] zip = (byte[])resultData.get("documentByte");
//	final String fileName = (String)resultData.get("filename");
//	if (zip != null) {
//		String contentType = MimeTypesUtil.getContentType(fileName);
//		return new StreamingResolution(contentType) {
//			public void stream(HttpServletResponse resp)
//					throws Exception {
//				OutputStream os = resp.getOutputStream();
//				os.write(zip);
//				os.close();
//				getContext().getRequest().getSession().setAttribute("exportSuceess", 1); 
//			}
//		}.setFilename(new String(fileName.getBytes("gbk"),"ISO8859-1"));
//	} else {
//		return new ErrorResolution(404);
//	}
}
