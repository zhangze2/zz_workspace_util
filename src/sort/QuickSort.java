package sort;

import sort.SortUtil.Sort;

public class QuickSort implements Sort {
		// http://www.cnblogs.com/luchen927/archive/2012/02/29/2368070.html
	    //http://blog.csdn.net/wangkuifeng0118/article/details/7286332
	    //http://blog.csdn.net/morewindows/article/details/6684558  白话经典算法系列之六 快速排序 快速搞定   (挖坑填数+分治法)
	 	public void sort(int[] data) {
			quickSort(data, 0, data.length-1);
	    }

	    //把整个序列看做一个数组，把第零个位置看做中轴，和最后一个比，如果比它小交换，比它大不做任何处理；
	 	//交换了以后再和小的那端比，比它小不交换，比他大交换。这样循环往复，一趟排序完成，左边就是比中轴小的，右边就是比中轴大的，
	 	//然后再用【分治法】，分别对这两个独立的数组进行排序。
	 	public void quickSort(int[] list, int low, int high) {
			if (low < high) {
				int middle = getMiddle(list, low, high);  //将list数组进行一分为二,找到中轴的位置
				quickSort(list, low, middle - 1);        //对低字表(即小于中轴的一边)进行递归排序
				quickSort(list, middle + 1, high);       //对高字表进行递归排序
			}
		}

	 
	 	public int getMiddle(int[] list, int low, int high) {
			int temp = list[low];    //将list[low]中的数保存到temp中，可以理解成在数组list[low]上挖了个坑,数组的第一个作为中轴【坑】
			while (low < high) {
				while (low < high && list[high] > temp) {// 从右向左找第一个小于 temp 的数 去【填坑】 (试着把while 循环转成 for形式的)
					high--;//(正常情况 )
				}
				list[low] = list[high];   //把异常的list[high] 比中轴小的记录 移到低端 list[low], 同时产生新坑即中轴list[higt]
				while (low < high && list[low] < temp) {
					low++;
				}
				list[high] = list[low];   //比中轴大的记录移到高端，
			}
			list[low] = temp;              //退出时，low等于high。将temp填到这个坑中，中轴记录到尾
			return low;                   //返回中轴的位置
		}

}
