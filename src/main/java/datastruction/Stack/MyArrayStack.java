package main.java.datastruction.Stack;

public class MyArrayStack<T> implements MyStack<T> {
	private Object[] objs = new Object[16];  
    private int size = 0;  
  
    @Override  
    public boolean isEmpty() {  
        return size == 0;  
    }  
  
    @Override  
    public void clear() {  
        // 将数组中的数据置为null, 方便GC进行回收  
        for (int i = 0; i < size; i++) {  
            objs[size] = null;  
        }  
        size = 0;  
    }  
  
    @Override  
    public int length() {  
        return size;  
    }  
  
    @Override  
    public boolean push(T data) {  
        // 判断是否需要进行数组扩容  
        if (size >= objs.length) {  
            resize();  
        }  
        objs[size++] = data;  
        return true;  
    }  
  
    /** 
     * 数组扩容 
     */  
    private void resize() {  
        Object[] temp = new Object[objs.length * 3 / 2 + 1];  
        for (int i = 0; i < size; i++) {  
            temp[i] = objs[i];  
            objs[i] = null;  
        }  
        objs = temp;  
    }  
  
    @SuppressWarnings("unchecked")  
    @Override  
    public T pop() {  
        if (size == 0) {  
            return null;  
        }  
        return (T) objs[--size];  
    }  
  
    @Override  
    public String toString() {  
        StringBuilder sb = new StringBuilder();  
        sb.append("MyArrayStack: [");  
        for (int i = 0; i < size; i++) {  
            sb.append(objs[i].toString());  
            if (i != size - 1) {  
                sb.append(", ");  
            }  
        }  
        sb.append("]");  
        return sb.toString();  
    }
}
