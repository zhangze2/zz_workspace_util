package main.java.io;

import java.io.File;  

public class FilePathTest {  
    public static void main(String[] args) throws Exception {  
        System.out.println(Thread.currentThread().getContextClassLoader().getResource(""));  
  
        System.out.println(FilePathTest.class.getClassLoader().getResource(""));  
  
        System.out.println(ClassLoader.getSystemResource(""));  
        System.out.println(FilePathTest.class.getResource(""));  
        System.out.println(FilePathTest.class.getResource("/"));
        //Class文件所在路径
        System.out.println(new File("/").getAbsolutePath());  
        System.out.println(System.getProperty("user.dir"));  
    }  
}
