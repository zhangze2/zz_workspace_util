package main.java.Base;

public abstract class Animal {
    public abstract void cry();
}

public class Cat extends Animal{

    @Override
    public void cry() {
        System.out.println("è�У�����...");
    }
}

public class Dog extends Animal{

    @Override
    public void cry() {
        System.out.println("����:����...");
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
