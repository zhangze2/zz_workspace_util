package sort;
public class InsertSort implements SortUtil.Sort{
	
	public void sort(int data[]) {
		/*注意从 i=1 开始
		 * 假定位于当前索引项左边的序列已经排好序，
		 * 将当前项插入到左边序列中的合适位置，定位方法是从右向左依次比较，当遇到小于等于自己的项时停止，循环进行，直到数组结束
		 * */
        for(int i = 1; i<data.length; i++){
            for(int j = i; (j>0) && (data[j] < data[j-1]); j--){
                SortUtil.swap(data, j, j-1);
            }
            
            SortUtil.printSortArgs(data);//打印此时的数组
        }       
    }
	
	
	
	void insertSort_1(int []array, int l, int r) {
        int temp;
        int index;

        /**
         * 外循环从左向右的第二个元素开始处理array的每一个元素； 并假定当前索引 i 左边的元素序列都已经就序；
         * */
        for(int i=l+1;i<=r;i++) {
            temp=array[i];//插入排序的策略是将array[i]的值插入到 i 左边已经就序的序列中；
            index=i-1;
            /**
             * 第一个循环条件保证在到达array最左边时停止
             * 第二个循环条件保证仅当temp更小时才继续处理 (这个条件让插入排序是稳定性)
             * */
            while(index>=l && array[index]>temp) {
                //交换方式时将左边的元素顺次复制到紧靠其右边的元素
                array[index+1]=array[index];
                index--;
            }
            /**
             * 最终将array[i]放到指定位置
             * */
            array[index+1]=temp;
        }
	}
	/*
	 * 
	 * 实现之二：主要是对实现之一的改进。
	 * 针对点有二：1、避免无谓的赋值； 2、减少测试条件。
	 * 实现之一的内循环有两个检测条件，数组下标是否小于0和数组元素是否小于等于当前元素，由于第一个条件在很少情况下才成立，所以可想办法简化。
	 * 方法是：首先将数组中的最小值放于数组开始处，然后在剩余的范围中进行插入排序，从而内循环仅有一个检测条件
	 * */
	void insertSort_2(int[] array, int l, int r) {
        int temp;
        int index;
        int minimum=l;

        /**
         * 寻找array中最小值，并将其与array[l]的值进行交换
         * */
        for(int i=l+1;i<=r;i++) {
                if(array[minimum]>array[i])
                        minimum=i;
        }
        temp=array[minimum];
        array[minimum]=array[l];
        array[l]=temp;
        /**
         * 外循环从左向右的第二个元素开始处理array的
         * 每一个元素； 并假定当前索引i左边的元素序列
         * 都已经就序；
         * */
        for(int i=l+1;i<=r;i++) {
                /**
                 * 插入排序的策略是将array[i]的值插入到
                 * i左边已经就序的序列中；
                 * */
                temp=array[i];
                index=i-1;
                /**
                 * 由于array[l]的元素为array中最小的元素
                 * 所以，内循环只需要一个循环条件，从而减少
                 * 内部循环的代码，加快执行速度
                 * */
                while(array[index]>temp) {
                        /**
                         * 交换方式时将左边的元素顺次复制到紧靠
                         * 其右边的元素
                         * */
                        array[index+1]=array[index];
                        index--;
                }
                /**
                 * 最终将array[i]放到指定位置
                 * */
                array[index+1]=temp;
        }
}
}
