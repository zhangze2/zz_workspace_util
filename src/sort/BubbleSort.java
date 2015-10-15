package sort;

public class BubbleSort implements SortUtil.Sort{
	 
    /** (non-Javadoc)
     * @see org.rut.util.algorithm.SortUtil.Sort#sort(int[])
     */
    public void sort(int[] data) {
        for(int i=0; i<data.length; i++){
            for(int j=data.length-1; j>i; j--){
                if(data[j] < data[j-1]){// ������������ң�
                    SortUtil.swap(data,j,j-1);
                }
            }
            SortUtil.printSortArgs(data);//��ӡ��ʱ������
        }
        
        
//        for (int i = 0; i < data.length; i++){
//        	for (int j = 0; j < data.length - i - 1; j++){
//        		if (data[j] < data[j + 1])// С������ð,�ɴ�С
//        			SortUtil.swap(data, j, j + 1);
//        	}
//        	SortUtil.printSortArgs(data);//��ӡ��ʱ������
//      	} 
    }
    
    
    
    void bubbleSort_2(int []array, int l, int r) {
        boolean isStable;

        /**
         * ʵ��֮������������˳��ʱ���ڲ�ѭ����ÿһ�β�������н��������Լ�⵱�ҽ����ڲ�ѭ��һ��֮��û�з����κν�����������������ѭ������ʱ������ɡ�
         * ��Ӧ���㷨�����ݳ�ʼ�������е�״̬��������ʱ�䣻
         * 
         * ��ѭ���������ұ�����ÿһ�����array�ϵ�һ��λ��i
         * ��ֵ������ÿ�ζ��ǽ���С��Ԫ�ؽ�����i��λ�ã�����
         * ������array[r]��ʱ����С��r-l��Ԫ���Ѿ���λ��
         * ���Բ��ô���rλ�õ�Ԫ��
         * */
        for(int i=l;i<r;i++) {
            /**
             * ����isStable��־�������ѭ��û�з����κν���
             * ��������˵�������Ѿ�������ֱ��������ѭ����
             * */
            isStable=true;
            for(int j=r;j>i;j--) {
                    if(array[j-1]>array[j]) {
                            /**
                             * ��ѭ������������ÿ����Ԫ�أ�����
                             * ��С��Ԫ�ط��õ���ߵ�λ��
                             * */
                            array[j-1]=array[j-1]^array[j];
                            array[j]=array[j-1]^array[j];
                            array[j-1]=array[j-1]^array[j];
                            isStable=false;
                    }
            }
            if(isStable)
                    break;
        }
}
 
}
