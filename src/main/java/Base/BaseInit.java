package main.java.Base;

public class BaseInit {
    static {
        System.out.println("<<<-------- 1.���ྲ̬�����-------->>>");
    }

    public BaseInit() {
        System.out.println("<<< 4. ���๹�캯��>>>");


        //���������override��������������δ��ʼ���ķǾ�̬��Ա����
        dangerTest();
    }

    {
        System.out.println("<<<-------- 3. ����Ǿ�̬�����-------->>>");
    }


    //need override
    public void dangerTest() { }
}