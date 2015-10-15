package main.java.Tread;

class Info {
    
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
 
    public synchronized void set(String name, int age){
        if(!flag){
            try{
                super.wait();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.name=name;
        try{
            Thread.sleep(100);
        }catch (Exception e) {
            e.printStackTrace();
        }
        this.age=age;
        flag=false;//加上标志位，并且通过判断标志位完成等待和唤醒的操作
        super.notify();
    }
     
    public synchronized void get(){
        if(flag){
            try{
                super.wait();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        try{
            Thread.sleep(100);
        }catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(this.getName()+"<===>"+this.getAge());
        flag=true;
        super.notify();
    }
    private String name = "张三";
    private int age = 20;
    private boolean flag=false;
}
 
/**
 * 生产者
 * */
class Producer implements Runnable {
    private Info info = null;
 
    Producer(Info info) {
        this.info = info;
    }
 
    public void run() {
        boolean flag = false;
        for (int i = 0; i < 25; ++i) {
            if (flag) {
                 
                this.info.set("张三", 20);
                flag = false;
            } else {
                this.info.set("李四", 100);
                flag = true;
            }
        }
    }
}
 
/**
 * 消费者类
 * */
class Consumer implements Runnable {
    private Info info = null;
 
    public Consumer(Info info) {
        this.info = info;
    }
 
    public void run() {
        for (int i = 0; i < 25; ++i) {
            try {
                Thread.sleep(100);
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.info.get();
        }
    }
}
 
