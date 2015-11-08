package sort;

import sort.SortUtil.Sort;

public class QuickSort implements Sort {
		// http://www.cnblogs.com/luchen927/archive/2012/02/29/2368070.html
	    //http://blog.csdn.net/wangkuifeng0118/article/details/7286332
	    //http://blog.csdn.net/morewindows/article/details/6684558  �׻������㷨ϵ��֮�� �������� ���ٸ㶨   (�ڿ�����+���η�)
	 	public void sort(int[] data) {
			quickSort(data, 0, data.length-1);
	    }

	    //���������п���һ�����飬�ѵ����λ�ÿ������ᣬ�����һ���ȣ��������С���������������κδ���
	 	//�������Ժ��ٺ�С���Ƕ˱ȣ�����С�������������󽻻�������ѭ��������һ��������ɣ���߾��Ǳ�����С�ģ��ұ߾��Ǳ������ģ�
	 	//Ȼ�����á����η������ֱ�������������������������
	 	public void quickSort(int[] list, int low, int high) {
			if (low < high) {
				int middle = getMiddle(list, low, high);  //��list�������һ��Ϊ��,�ҵ������λ��
				quickSort(list, low, middle - 1);        //�Ե��ֱ�(��С�������һ��)���еݹ�����
				quickSort(list, middle + 1, high);       //�Ը��ֱ���еݹ�����
			}
		}

	 
	 	public int getMiddle(int[] list, int low, int high) {
			int temp = list[low];    //��list[low]�е������浽temp�У���������������list[low]�����˸���,����ĵ�һ����Ϊ���᡾�ӡ�
			while (low < high) {
				while (low < high && list[high] > temp) {// ���������ҵ�һ��С�� temp ���� ȥ����ӡ� (���Ű�while ѭ��ת�� for��ʽ��)
					high--;//(������� )
				}
				list[low] = list[high];   //���쳣��list[high] ������С�ļ�¼ �Ƶ��Ͷ� list[low], ͬʱ�����¿Ӽ�����list[higt]
				while (low < high && list[low] < temp) {
					low++;
				}
				list[high] = list[low];   //�������ļ�¼�Ƶ��߶ˣ�
			}
			list[low] = temp;              //�˳�ʱ��low����high����temp�������У������¼��β
			return low;                   //���������λ��
		}

}
