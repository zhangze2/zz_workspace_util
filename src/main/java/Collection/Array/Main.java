package main.java.Collection.Array;


public static void main(String[] args){
    /**//*TestBean[] tb = new TestBean[3];
    for (int i = 0; i < tb.length; i++) {
        tb[i] = new TestBean();
        tb[i].setName("name" + i);
        tb[i].setId(i);
    }
    //直接载入已有数组对象
    ArrayUtil arrayUtil = ArrayUtil.getInstance(tb);
    TestBean tb1 = new TestBean();
    // arrayUtil.add(tb[0]);
    arrayUtil.remove(tb[0]);
    // arrayUtil.remove(tb[2]);
    System.out.println(arrayUtil.contains(tb1));
    System.out.println(((TestBean) arrayUtil.get(0)).getName());
    System.out.println(arrayUtil.size());
    // 打乱数组
    arrayUtil.mixElements();
    for (int i = 0; i < arrayUtil.size(); i++) {
        System.out.println(((TestBean) arrayUtil.get(i)).getName());
    }*/
    //生成TestBean的数组实例，初始容量为5
    ArrayUtil arrayUtil = ArrayUtil.getInstance(TestBean.class,5); 
    		
    TestBean t = new TestBean();
    t.setName("test");
    //在数组载入t的实例
    arrayUtil.add(t,0);
    TestBean t1 = new TestBean();
    t1.setName("test1");
    arrayUtil.add(t1,1);
    arrayUtil.add(t,2);
    arrayUtil.add(t,3);
    arrayUtil.add(t,4);
    //会自动增加数组容量
    arrayUtil.add(t);
    //显示索引5数据
    System.out.println(((TestBean)arrayUtil.get(5)).getName());
    //截取索引1-3，显示1数据
    System.out.println(((TestBean)arrayUtil.sub(1, 3)[1]).getName());

}
