package main.java.Tread;

public class Run_vs_Start extends Thread {
	/**
	 * @author Rollen-Holt 继承Thread类,直接调用run方法
	 * */
	 
	private String name;
    public Run_vs_Start() {
 
    }
 
    public Run_vs_Start(String name) {
        this.name = name;
    }
 
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + "运行     " + i);
        }
    }
 
    public static void main(String[] args) {
        Run_vs_Start h1=new Run_vs_Start("A");
        Run_vs_Start h2=new Run_vs_Start("B");
        
        h1.run();
        h2.run();
       /* 运行结果：们会发现这些都是顺序执行的，说明我们的调用方法不对，应该调用的是start（）方法。
        A运行     0
        A运行     1
        A运行     2
        A运行     3
        A运行     4
        B运行     0
        B运行     1
        B运行     2
        B运行     3
        B运行     4*/
        
        //h1.start();
        //h2.start();
        // 因为需要用到CPU的资源，所以每次的运行结果基本是都不一样的  
    }
 
}
