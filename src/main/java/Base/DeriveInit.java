package main.java.Base;

import main.java.Base.BaseInit;

public class DeriveInit extends BaseInit {

    
    public static void main(String[] args) {
        new DeriveInit();
    }


    /**
     * ���캯��
     */
    public DeriveInit() {
        System.out.println("<<<-- 6. ���๹�캯��-->>>");


        if (testNonStatic == 555) {
            System.out.println("��Ա�����Ѿ���ʼ��");
        }
    }

    /**
     * ��̬
     */
    static private int testStatic = 100;

    static {
        System.out.println("<<<-------- 2. ���ྲ̬�����-------->>>");

        if (testStatic == 100) {
            System.out.println("ͬһ���ھ�̬��������˳���ʼ��");
        }
    }

    /**
     * �Ǿ�̬
     */
    private int testNonStatic = 555;

    {
        System.out.println("<<< 5. ����Ǿ�̬�����>>>");

        if (testNonStatic == 555) {
            System.out.println("ͬһ���ڷǾ�̬��������˳���ʼ��");
        }
    }

    /**
     * �ڻ����з�������ķǾ�̬��Ա����
     */
    private int derive0 = 888;
    final private int derive1 = 888;
    final private Integer derive2 = 888;
    final private String derive3 = new String("Hello World");
    final private String derive4 = "Hello World";

    @Override
    public void dangerTest() {
        System.out.println("�����Ա����derive0 = " + derive0);
        System.out.println("�����Ա����derive1 = " + derive1);
        System.out.println("�����Ա����derive2 = " + derive2);
        System.out.println("�����Ա����derive3 = " + derive3);
        System.out.println("�����Ա����derive4 = " + derive4);
    }

}