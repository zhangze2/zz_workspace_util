package sort;

import sort.SortUtil.Sort;

public class SelectionSort implements Sort {
	/**
	 * 选择排序：又称“还会发现更好的”算法 ，非稳定性算法
	 * 搜索整个数组，查找最小值元素，并将它与位于数组首位的元素交换；
	 * 然后在除第一个元素的范围内查找最小值元素，并将它与位于数组次首位的元素交换；
	 * 重复进行，直到数组最后一个元素终止。
	 * */
    public void sort(int[] data) {
    	 /**
         * 外循环从左向右遍历处理array的每一个元素，
         * 由于到达array[r]的时候，其左边的元素已经就序
         * 所以不用处理array[r]；
         * */
        for (int i = 0; i < data.length; i++) {
            int lowIndex = i;// 假设第一任最小
            for (int j = data.length - 1; j > i; j--) {
                if (data[j] < data[lowIndex]) {
                	/**
                     * 发现更小元素 j 时仅更新索引，因为还会发现更小元素时仅更新索引..不断更新
                     * */
                    lowIndex = j;
                }
            }
            /**
             * 经过一次遍历，找到最小的第 lowIndex 个元素
             * 由于选择排序并不是"相邻元素之间的交换"，
             * 所以可能破坏数据的稳定性，选择排序是非稳定性算法
             * 如：2,5,8,2,1,6序列中，第一个2就会因为与1交换，
             * 从而排在第二个2的后面
             * */
            SortUtil.swap(data,i,lowIndex);
            SortUtil.printSortArgs(data);//打印此时的数组
        }
        
        
    }
 
}