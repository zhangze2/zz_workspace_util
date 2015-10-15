package main.java.String;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class StringEg {
	//@formatter:off 
	/**
	 * Title: getLowerId
	 * Description:1、递归查询结点	2、去掉字符串最后一个字符
	 * Created On: 2015-7-21 下午2:03:40
	 * @author ZhangZe
	 * @param globalId
	 * @return
	 * @throws ParseException 
	 */
	//@formatter:on
	@SuppressWarnings("unused")
	private String getLowerId(String globalId) throws ParseException{
		String sql = "select global_id from sz_talent_project p start with global_id = ? connect by PRIOR global_id = parentid ";
		List<String> list = new ArrayList<String>();
		StringBuffer sb = new StringBuffer();
		for(String cid : list){
			sb.append("'").append(cid).append("',");
		}
		String resut = sb.toString();
		return resut.substring(0, resut.length()-1);
	}
}
