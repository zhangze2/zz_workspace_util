package sort;

import java.util.Collections;
import java.util.List;

//Shell鎺掑簭:
public class ShellSort implements SortUtil.Sort{
	/**希尔排序的原理:根据需求，如果你想要结果从大到小排列，它会首先将数组进行分组，然后将较大值移到前面，较小值 
	 * 移到后面，最后将整个数组进行插入排序，这样比起一开始就用插入排序减少了数据交换和移动的次数，可以说希尔排序是加强版的插入排序 
	 * 举例:
	 * 拿数组5, 2, 8, 9, 1, 3，4来说，数组长度为7，当increment为3时，数组分为两个序列 
	 * 5，2，8和9，1，3，4，第一次排序，9和5比较，1和2比较，3和8比较，4和比其下标值小increment的数组值相比较 
	 * 此例子是按照从大到小排列，所以大的会排在前面，第一次排序后数组为9, 2, 8, 5, 1, 3，4 
	 * 第一次后increment的值变为3/2=1,此时对数组进行插入排序， 
	 */
	/**
	 * 插入排序----希尔排序：我们选择步长为：15,7,3,1
	 * 我们选择步长公式为：2^k-1,2^(k-1)-1,……,15,7,3,1　　 (2^4-1,2^3-1,2^2-1,2^1-1)
	 * 注意所有排序都是从小到大排。
	 */ 
    public void sort(int[] data) {
        for(int i=data.length/2; i>2; i/=2){
            for(int j=0; j<i; j++){
                insertSort(data,j,i);
            }
        }
        int increment = 1;
        insertSort(data,0,increment);
    }
 
    private void insertSort(int[] data, int start, int inc) {
        for(int i=start+inc; i<data.length; i+=inc){
            for(int j=i; (j >= inc) && (data[j] < data[j-inc]); j-=inc){
                SortUtil.swap(data,j,j-inc);
                SortUtil.printSortArgs(data);//打印此时的数组
            }
        }
    }
    
    // 实现 3
    static  void shellSort(List<Integer> a) {
        int h = 1;
        while (h < a.size()/3) {
              h = h*3 + 1;    // <O(n^(3/2)) by Knuth,1973>: 1, 4, 13, 40, 121, ...
        }
     
        for (; h >= 1; h /= 3) {
            for (int k = 0; k < h; k++) {
                for (int i = h + k; i < a.size(); i+=h) {
                    for (int j = i; j >= h && a.get(j).compareTo(a.get(j-h)) < 0; j-=h) {
                       Collections.swap(a, j, j-h);
                    }
                }
            }
        }
    }
    //方法2
	private static void shellSort_2(int[] arr) {
		int j;
		int len = arr.length;
		for(int val=len>>1; val>0; val>>=1) {
			//下面是对本次的所有分组做直接插入排序
			for(int i=val; i<len; i++) {
				int temp = arr[i];
				/*
				 * 为什么每次都用temp比较呢？
				 * 因为直接插入就是找到temp的合适位置。
				 * 为什么temp<arr[j-val]这个条件可以放在for内呢？
				 * 因为原来的组内数据已经有序，找到位置就停止便是。
				 * 不甚理解的去看直接插入排序吧。
				 */
				for(j=i; j>=val&&temp<arr[j-val]; j-=val) {
					/*
					 * 为什么是arr[j-val]不是arr[j]呢？
					 * 因为j=i开始的，而且条件是j>=val&&temp<arr[j-val]
					 */
					arr[j] = arr[j-val];
				}
				/*
				 * 注意不是arr[i] = temp
				 * 直接插入排序也是这样的。
				 * 为什么呢？因为j是位置，i是待插入元素
				 */
				arr[j] = temp;
			}
		}
	}
}