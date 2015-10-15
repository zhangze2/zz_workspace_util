package sort;

import java.util.Collections;
import java.util.List;

//Shell排序:
public class ShellSort implements SortUtil.Sort{
	/**ϣ�������ԭ��:���������������Ҫ����Ӵ�С���У��������Ƚ�������з��飬Ȼ�󽫽ϴ�ֵ�Ƶ�ǰ�棬��Сֵ 
	 * �Ƶ����棬�������������в���������������һ��ʼ���ò���������������ݽ������ƶ��Ĵ���������˵ϣ�������Ǽ�ǿ��Ĳ������� 
	 * ����:
	 * ������5, 2, 8, 9, 1, 3��4��˵�����鳤��Ϊ7����incrementΪ3ʱ�������Ϊ�������� 
	 * 5��2��8��9��1��3��4����һ������9��5�Ƚϣ�1��2�Ƚϣ�3��8�Ƚϣ�4�ͱ����±�ֵСincrement������ֵ��Ƚ� 
	 * �������ǰ��մӴ�С���У����Դ�Ļ�����ǰ�棬��һ�����������Ϊ9, 2, 8, 5, 1, 3��4 
	 * ��һ�κ�increment��ֵ��Ϊ3/2=1,��ʱ��������в������� 
	 */
	/**
	 * ��������----ϣ����������ѡ�񲽳�Ϊ��15,7,3,1
	 * ����ѡ�񲽳���ʽΪ��2^k-1,2^(k-1)-1,����,15,7,3,1���� (2^4-1,2^3-1,2^2-1,2^1-1)
	 * ע�����������Ǵ�С�����š�
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
                SortUtil.printSortArgs(data);//��ӡ��ʱ������
            }
        }
    }
    
    // ʵ�� 3
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
    //����2
	private static void shellSort_2(int[] arr) {
		int j;
		int len = arr.length;
		for(int val=len>>1; val>0; val>>=1) {
			//�����ǶԱ��ε����з�����ֱ�Ӳ�������
			for(int i=val; i<len; i++) {
				int temp = arr[i];
				/*
				 * Ϊʲôÿ�ζ���temp�Ƚ��أ�
				 * ��Ϊֱ�Ӳ�������ҵ�temp�ĺ���λ�á�
				 * Ϊʲôtemp<arr[j-val]����������Է���for���أ�
				 * ��Ϊԭ�������������Ѿ������ҵ�λ�þ�ֹͣ���ǡ�
				 * ��������ȥ��ֱ�Ӳ�������ɡ�
				 */
				for(j=i; j>=val&&temp<arr[j-val]; j-=val) {
					/*
					 * Ϊʲô��arr[j-val]����arr[j]�أ�
					 * ��Ϊj=i��ʼ�ģ�����������j>=val&&temp<arr[j-val]
					 */
					arr[j] = arr[j-val];
				}
				/*
				 * ע�ⲻ��arr[i] = temp
				 * ֱ�Ӳ�������Ҳ�������ġ�
				 * Ϊʲô�أ���Ϊj��λ�ã�i�Ǵ�����Ԫ��
				 */
				arr[j] = temp;
			}
		}
	}
}