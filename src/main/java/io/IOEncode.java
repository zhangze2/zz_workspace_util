package main.java.io;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

public class IOEncode {
	//java io写文件 在linux出现中文乱码
	public void read(String path, String fileName) throws IOException {
		
		String fileEncode = System.getProperty("file.encoding");
		File outFile = new File(path+File.separator+fileName);
		if(!outFile.exists()){
			outFile.createNewFile();
		}
		else{
			outFile.delete();
			outFile.createNewFile();
		}
		List<String> failList = new ArrayList<String>();
		
		OutputStreamWriter ow=new OutputStreamWriter(new FileOutputStream(outFile),fileEncode);
		for(int i=0;i<failList.size();i++)
		{
			ow.write(new String(failList.get(i).getBytes("UTF-8"),fileEncode)+"/r/n");
		}
		ow.close();
	}
	
	
     
}
