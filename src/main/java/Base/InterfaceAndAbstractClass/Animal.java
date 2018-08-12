package main.java.Base.InterfaceAndAbstractClass;
//如果一个类没有足够的信息来描述一个具体的对象，而需要其他具体的类来支撑它，那么这样的类我们称它为抽象类。 我更喜欢叫 模板类
public abstract class Animal {
	//除了你不能实例化抽象类之外，它和普通Java类没有任何区别
    public abstract void cry();//抽象类不能被实例化，实例化的工作应该交由它的子类来完成，它只需要有一个引用即可
}

//子类
public class Cat extends Animal{
 
    @Override
    public void cry() {
        System.out.println("猫叫：喵喵...");
    }
}
 
public class Dog extends Animal{
 
    @Override
    public void cry() {
        System.out.println("狗叫:汪汪...");
    }
 
}
 
public class Test {
 
    public static void main(String[] args) {
        Animal a1 = new Cat();
        Animal a2 = new Dog();
        
        a1.cry();
        a2.cry();
    }
}
// 
//--------------------------------------------------------------------
//Output:
//猫叫：喵喵...
//狗叫:汪汪...

