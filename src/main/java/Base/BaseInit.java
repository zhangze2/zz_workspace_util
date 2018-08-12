package main.java.Base;

public class BaseInit {
    static {
        System.out.println("<<<-------- 1.基类静态代码块-------->>>");
    }

    public BaseInit() {
        System.out.println("<<< 4. 基类构造函数>>>");


        //调用子类的override函数，访问子类未初始化的非静态成员变量
        dangerTest();
    }

    {
        System.out.println("<<<-------- 3. 基类非静态代码块-------->>>");
    }


    //need override
    public void dangerTest() { }
}