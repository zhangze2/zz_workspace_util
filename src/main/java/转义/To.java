package main.java.转义;

import java.io.IOException;

import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;

import com.lysoft.business.web.hrm.common.constants.AttachmentLocConstants;
import com.lysoft.business.web.hrm.ui._common.utils.PropsUtil;
import com.lysoft.web.repository.Attachment;
import com.lysoft.web.repository.RepositoryFactory;

public class To {
	public Resolution download() throws IOException{
		if(null==attachIds||attachIds.length()<2){
			return new StreamingResolution("text/plain;charset=UTF-8","没有附件");
		}			
		if(attachIds.contains("$file/")){
			String returnStr="";
			String[] str=attachIds.split(",");
			String url=PropsUtil.getProperty("bpm.domain.url").replace("/flow", "");
			for (int i = 0; i < str.length; i++) {
				String id=str[i];
				String name=id.substring(id.lastIndexOf("/")+1);				
				returnStr+="<span><a target='_blank' title='查看附件' href='"+url+id+"'>"+name+"</a>&nbsp;&nbsp;&nbsp;</span>";
				if(i%2==1){
					returnStr+="<br/>";
				}
			}
			return new StreamingResolution("text/plain;charset=UTF-8",returnStr);
		}else {
			String returnStr="";
			String[] str=attachIds.substring(1).split(",");
			for (int i = 0; i < str.length; i++) {
				String id=str[i];
				String name;
				try {
					final Attachment attachment = RepositoryFactory.getInstance().download(AttachmentLocConstants.DOCUMENT_LIBRARY,id,null);
					name = attachment.getFileName();
					returnStr+="<span id="+id+"><a title='查看附件' target='_blank' href='"+id+
					"/info/__common/upload/document.do?documentDown=&guid="+id+"'>"+name+"</a>&nbsp;&nbsp;&nbsp;"+
					"<span title='删除附件' style='cursor: hand;' class='k-icon k-delete' onclick=\"javascript:$.djs.invoke({ctxPath:'"+getContext().getRequest().getContextPath()+"',js:'/ui/staff_allocation/resignation/add.js'},'todel','"+id+"','"+name+"');\"></span></span></span>";
					if(i%2==1){
						returnStr+="<br/>";
					}
				} catch (Exception e) {
					return new StreamingResolution("text/plain;charset=UTF-8","没有附件");
				}
			}
			return new StreamingResolution("text/plain;charset=UTF-8",returnStr);
		}
	}
}
