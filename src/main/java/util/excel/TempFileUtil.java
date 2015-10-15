package main.java.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class TempFileUtil {
	private String rootPath;
	private String appPath;
	
	public static TempFileUtil instanse() {
		return new TempFileUtil("hrm");
	}
	
	private TempFileUtil(String appPath) {
		rootPath = System.getProperty("java.io.tmpdir");
		this.appPath = appPath;
		File f = new File(rootPath + "/" + appPath);
		if (!f.exists()) {
			f.mkdirs();
		}
	}
	
	public OutputStream createFile(String fileName) {
		boolean isExisted = fileExists(fileName);
		if (isExisted) {// 如果文件存在，删除原来文件
			deleteFile(fileName);
		}
		try {
			System.out.println(rootPath + "/" + appPath + "/" + fileName);
			return new FileOutputStream(rootPath + "/" + appPath + "/" + fileName);
		} catch (IOException e) {
			return null;
		}
	}
	public File docFile(String fileName) throws IOException {
		File file = new File(rootPath + "/" + appPath + "/"+ fileName+".doc");
		if(!file.exists()){
			file.createNewFile();
		}else{
			if(file.delete()){
				file.createNewFile();
			}
		}
		return file;
	}
	private boolean fileExists(String fileName) {
		File f = new File(rootPath + "/" + appPath + "/" + fileName);
		return f.exists();
	}
	
	public void deleteFile(String fileName) {
		File f = new File(rootPath + "/" + appPath + "/" + fileName);
		if (f.exists()) f.delete();
	}
	
	public boolean save(InputStream is, String fileName) {
		boolean isExisted = fileExists(fileName);
		if (isExisted) {
			deleteFile(fileName);
		}
		File file = new File(rootPath + "/" + appPath + "/" + fileName);
		try {
			OutputStream os = new FileOutputStream(file);
			byte[] buff = new byte[1024 * 10];
			int len = -1;
			while ((len = is.read(buff)) != -1) {
				os.write(buff, 0, len);
			}
			os.flush();
			os.close();
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	public InputStream read(String fileName) {
		File file = new File(rootPath + "/" + appPath + "/" + fileName);
		try {
			return new FileInputStream(file);
		} catch (Exception e) {
			return null;
		}
	}
}
