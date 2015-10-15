package sort;
public class InsertSort implements SortUtil.Sort{
	
	public void sort(int data[]) {
		/*ע��� i=1 ��ʼ
		 * �ٶ�λ�ڵ�ǰ��������ߵ������Ѿ��ź���
		 * ����ǰ����뵽��������еĺ���λ�ã���λ�����Ǵ����������αȽϣ�������С�ڵ����Լ�����ʱֹͣ��ѭ�����У�ֱ���������
		 * */
        for(int i = 1; i<data.length; i++){
            for(int j = i; (j>0) && (data[j] < data[j-1]); j--){
                SortUtil.swap(data, j, j-1);
            }
            
            SortUtil.printSortArgs(data);//��ӡ��ʱ������
        }       
    }
	
	
	
	void insertSort_1(int []array, int l, int r) {
        int temp;
        int index;

        /**
         * ��ѭ���������ҵĵڶ���Ԫ�ؿ�ʼ����array��ÿһ��Ԫ�أ� ���ٶ���ǰ���� i ��ߵ�Ԫ�����ж��Ѿ�����
         * */
        for(int i=l+1;i<=r;i++) {
            temp=array[i];//��������Ĳ����ǽ�array[i]��ֵ���뵽 i ����Ѿ�����������У�
            index=i-1;
            /**
             * ��һ��ѭ��������֤�ڵ���array�����ʱֹͣ
             * �ڶ���ѭ��������֤����temp��Сʱ�ż������� (��������ò����������ȶ���)
             * */
            while(index>=l && array[index]>temp) {
                //������ʽʱ����ߵ�Ԫ��˳�θ��Ƶ��������ұߵ�Ԫ��
                array[index+1]=array[index];
                index--;
            }
            /**
             * ���ս�array[i]�ŵ�ָ��λ��
             * */
            array[index+1]=temp;
        }
	}
	/*
	 * 
	 * ʵ��֮������Ҫ�Ƕ�ʵ��֮һ�ĸĽ���
	 * ��Ե��ж���1��������ν�ĸ�ֵ�� 2�����ٲ���������
	 * ʵ��֮һ����ѭ����������������������±��Ƿ�С��0������Ԫ���Ƿ�С�ڵ��ڵ�ǰԪ�أ����ڵ�һ�������ں�������²ų��������Կ���취�򻯡�
	 * �����ǣ����Ƚ������е���Сֵ�������鿪ʼ����Ȼ����ʣ��ķ�Χ�н��в������򣬴Ӷ���ѭ������һ���������
	 * */
	void insertSort_2(int[] array, int l, int r) {
        int temp;
        int index;
        int minimum=l;

        /**
         * Ѱ��array����Сֵ����������array[l]��ֵ���н���
         * */
        for(int i=l+1;i<=r;i++) {
                if(array[minimum]>array[i])
                        minimum=i;
        }
        temp=array[minimum];
        array[minimum]=array[l];
        array[l]=temp;
        /**
         * ��ѭ���������ҵĵڶ���Ԫ�ؿ�ʼ����array��
         * ÿһ��Ԫ�أ� ���ٶ���ǰ����i��ߵ�Ԫ������
         * ���Ѿ�����
         * */
        for(int i=l+1;i<=r;i++) {
                /**
                 * ��������Ĳ����ǽ�array[i]��ֵ���뵽
                 * i����Ѿ�����������У�
                 * */
                temp=array[i];
                index=i-1;
                /**
                 * ����array[l]��Ԫ��Ϊarray����С��Ԫ��
                 * ���ԣ���ѭ��ֻ��Ҫһ��ѭ���������Ӷ�����
                 * �ڲ�ѭ���Ĵ��룬�ӿ�ִ���ٶ�
                 * */
                while(array[index]>temp) {
                        /**
                         * ������ʽʱ����ߵ�Ԫ��˳�θ��Ƶ�����
                         * ���ұߵ�Ԫ��
                         * */
                        array[index+1]=array[index];
                        index--;
                }
                /**
                 * ���ս�array[i]�ŵ�ָ��λ��
                 * */
                array[index+1]=temp;
        }
}
}
