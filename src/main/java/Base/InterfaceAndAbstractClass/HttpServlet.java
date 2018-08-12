package main.java.Base.InterfaceAndAbstractClass;
//接口本身就不是类, new Runnable();肯定是错误的
public class HttpServlet extends GenericServlet {
	//Interface的方所有法访问权限自动被声明为public
//一个子类只能存在一个父类，但是可以存在多个接口 
	//所有方法都是抽象的
    void service(ServletRequest req, ServletResponse res) {
        // implementation
    }
 
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        // Implementation
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        // Implementation
    }
 
    // some other methods related to HttpServlet
}
