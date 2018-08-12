package main.java.Base;

import main.java.Base.BaseInit;

public class DeriveInit extends BaseInit {

    
    public static void main(String[] args) {
        new DeriveInit();
    }


    /**
     * 构造函数
     */
    public DeriveInit() {
        System.out.println("<<<-- 6. 子类构造函数-->>>");


        if (testNonStatic == 555) {
            System.out.println("成员变量已经初始化");
        }
    }

    /**
     * 静态
     */
    static private int testStatic = 100;

    static {
        System.out.println("<<<-------- 2. 子类静态代码块-------->>>");

        if (testStatic == 100) {
            System.out.println("同一类内静态按照声明顺序初始化");
        }
    }

    /**
     * 非静态
     */
    private int testNonStatic = 555;

    {
        System.out.println("<<< 5. 子类非静态代码块>>>");

        if (testNonStatic == 555) {
            System.out.println("同一类内非静态按照声明顺序初始化");
        }
    }

    /**
     * 在基类中访问子类的非静态成员变量
     */
    private int derive0 = 888;
    final private int derive1 = 888;
    final private Integer derive2 = 888;
    final private String derive3 = new String("Hello World");
    final private String derive4 = "Hello World";

    @Override
    public void dangerTest() {
        System.out.println("子类成员变量derive0 = " + derive0);
        System.out.println("子类成员变量derive1 = " + derive1);
        System.out.println("子类成员变量derive2 = " + derive2);
        System.out.println("子类成员变量derive3 = " + derive3);
        System.out.println("子类成员变量derive4 = " + derive4);
    }

}