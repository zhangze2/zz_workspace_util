package sort;

public class BubbleSort implements SortUtil.Sort{
	 
    /** (non-Javadoc)
     * @see org.rut.util.algorithm.SortUtil.Sort#sort(int[])
     */
    public void sort(int[] data) {
        for(int i=0; i<data.length; i++){
            for(int j=data.length-1; j>i; j--){
                if(data[j] < data[j-1]){// 大的泡升起（向右）
                    SortUtil.swap(data,j,j-1);
                }
            }
            SortUtil.printSortArgs(data);//打印此时的数组
        }
        
        
//        for (int i = 0; i < data.length; i++){
//        	for (int j = 0; j < data.length - i - 1; j++){
//        		if (data[j] < data[j + 1])// 小的往上冒,由大到小
//        			SortUtil.swap(data, j, j + 1);
//        	}
//        	SortUtil.printSortArgs(data);//打印此时的数组
//      	} 
    }
    
    
    
    void bubbleSort_2(int []array, int l, int r) {
        boolean isStable;

        /**
         * 实现之二：当数组是顺序时，内层循环的每一次并不会进行交换；所以检测当且仅当内层循环一遍之后，没有发生任何交换，则可以跳出外层循环，此时排序完成。
         * 适应性算法，根据初始数据序列的状态决定排序时间；
         * 
         * 外循环从左向右遍历，每一次针对array上的一个位置i
         * 的值；由于每次都是讲最小的元素交换到i的位置，所以
         * 当处理array[r]的时候，最小的r-l个元素已经就位，
         * 所以不用处理r位置的元素
         * */
        for(int i=l;i<r;i++) {
            /**
             * 加入isStable标志，如果内循环没有发生任何交换
             * 操作，则说明序列已经就序，则直接跳出外循环；
             * */
            isStable=true;
            for(int j=r;j>i;j--) {
                    if(array[j-1]>array[j]) {
                            /**
                             * 内循环从右向左处理每两个元素，并将
                             * 较小的元素放置到左边的位置
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
