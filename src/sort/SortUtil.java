package sort;

public class SortUtil {

	/*
	 * ��������ѡ�񣬲��룬ð�ݣ�ϣ��(N3/2)
	 * �����㷨������С��ģ�ļ��������ļ������򣬲����ʺϴ��ģ���������ļ�
	 * 
	 *         http://www.douban.com/note/217907660/    <�����㷨--���ֻ������򷽷�����������>
	 *         http://www.educity.cn/wenda/360396.html  <Java���ָ��������㷨>
	 * */
	public final static int INSERT = 1;
	 
    public final static int BUBBLE = 2;
 
    public final static int SELECTION = 3;
 
    public final static int SHELL = 4;
 
    public final static int QUICK = 5;
 
    public final static int IMPROVED_QUICK = 6;
 
    public final static int MERGE = 7;
 
    public final static int IMPROVED_MERGE = 8;
 
    public final static int HEAP = 9;
 
//    public static void sort(int[] data) {
//        sort(data, SELECTION);
//    }
    private static String[] name={
            "insert","bubble","selection","shell","quick","improved_quick","merge","improved_merge","heap"
    };
     
    private static Sort[] fun=new Sort[]{
            new InsertSort(),
            new BubbleSort(),
            new SelectionSort(),
            new ShellSort(),
            new QuickSort(),
            new ImprovedQuickSort(),
            new MergeSort(),
            new ImprovedMergeSort(),
            new HeapSort()
    };
 
    public static String toString(int algorithm){
        return name[algorithm-1];
    }
     
    public static void sort(int[] data, int algorithm) {
        fun[algorithm-1].sort(data);
    }
 
    public static interface Sort {
        public void sort(int[] data);
    }
 
    public static void swap(int[] data, int i, int j) {
        int temp = data[i];
        data[i] = data[j];
        data[j] = temp;
    }
	
	// ��ӡ����������
    public static void printSortArgs(int []data){
    	StringBuffer dataStr = new StringBuffer();
    	for(int i = 0; i< data.length; i++){
    		dataStr.append(data[i]+", ");
    	}
    	System.out.println(dataStr.toString());
    }
    
	public static void main(String[] args) {
		int[] intArr = { 7, 2, 4, 3, 12, 1, 9, 6, 8, 5,11,10};
//		System.out.println("----------��������-----------");
//		sort(intArr, INSERT);
//		System.out.println("----------ѡ������-----------");
//		sort(intArr, SELECTION);
//		System.out.println("----------ð������-----------");
//		sort(intArr, BUBBLE);
        System.out.println("----------ϣ������-----------");
        sort(intArr, SHELL);
//		System.out.println("----------��������-----------");
//		sort(intArr, QUICK);
//		System.out.println("----------�Ľ���������-----------");
//		sort(intArr, IMPROVED_QUICK);
		System.out.println("----------�鲢����-----------");
		sort(intArr, MERGE);
//		System.out.println("----------�Ľ��鲢����-----------");
//		sort(intArr, IMPROVED_MERGE);
//		System.out.println("----------������-----------");
//		sort(intArr, HEAP);
	}

}
