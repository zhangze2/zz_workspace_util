package main.java.Collection.Array;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Random;


/** *//**
 * <p>
 * Title: LoonFramework
 * </p>
 * <p>
 * Description:ArrayUtil，数组操作工具类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2007
 * </p>
 * <p>
 * Company: LoonFramework
 * </p>
 *
 * @author chenpeng
 * @email：ceponline@yahoo.com.cn
 * @version 0.1
 */
public class ArrayUtil implements Serializable{
    /** *//**
     *
     */
    private static final long serialVersionUID = 8057374625909011982L;

    // 缓存数组对象
    private Object objArray;

    // 数组长度
    private int size = 0;

    // 缓存数组对象实体类型
    private String objType;

    final static private Random rand = new Random();

    private static ArrayUtil instance = null;
   
    /** *//**
     * 直接注入Collection
     *
     * @param collection
     * @return
     */
    public static ArrayUtil getInstance(Collection collection){
        return getInstance(collection.toArray());
    }
    /** *//**
     * 直接注入对象数组
     *
     * @param array
     */
    public static ArrayUtil getInstance(Object array) {
        if (instance == null) {
            instance = new ArrayUtil(array);
        }
        return instance;
    }
    /** *//**
     * 注入类产生指定大小对象数组
     *
     * @param clazz
     * @param maxSize
     */
    public static ArrayUtil getInstance(Class clazz, int maxSize) {
        if (instance == null) {
            instance = new ArrayUtil(clazz, maxSize);
        }
        return instance;
    }

    private ArrayUtil() {

    }

    /** *//**
     * 注入对象数组产生指定大小对象数组
     *
     * @param clazz
     * @param maxSize
     */
    private ArrayUtil(Class clazz, int maxSize) {
        // 转为指定大小对象数组
        Object array = (Object[]) Array.newInstance(clazz,
                maxSize);
        // 初始化
        init(array);
    }

    /** *//**
     * 直接注入对象数组
     *
     * @param array
     */
    private ArrayUtil(Object array) {
        init(array);
    }
   
    private void init(Object array){
        // 检查是否数组对象
        if (!(array instanceof Object[])) {
            throw new IndexOutOfBoundsException("Not object arrays！");
        }
        // 缓存数组对象
        objArray = array;
        // 缓存实体类型
        objType = array.getClass().getComponentType().getSimpleName();
        // 缓存数组长度
        size = Array.getLength(objArray);
    }

    /** *//**
     * 返回指定对象索引位置
     *
     * @param obj
     * @return
     */
    public int get(Object obj) {
        // 检查是否合法对象
        checkObject(obj);
        Object[] object = (Object[]) objArray;
        for (int i = 0; i < size; i++)
            if (object[i] == obj) {
                return i;
            }
        return -1;
    }

    /** *//**
     * 返回指定索引位置对象
     *
     * @param index
     * @return
     */
    public Object get(int index) {
        checkIndex(index);
        return getObjectArray()[index];
    }

    /** *//**
     * 加载对象在指定位置
     *
     * @param obj
     * @param index
     */
    public void add(Object obj, int index) {
        // 检查索引是否越界
        checkIndex(index);
        // 检查是否合法对象
        checkObject(obj);
        Object[] objTemp = (Object[]) objArray;
        objTemp[index] = obj;
        // copy临时数组到objArray
        System.arraycopy(objTemp, 0, objArray, 0, objTemp.length);
    }

    /** *//**
     * 加载对象
     *
     * @param obj
     */
    public void add(Object obj) {
        // 类型检查
        checkObject(obj);
        // 累加
        next();
        // 临时缓存旧数组数组
        Object[] objTemp = new Object[size];
        // 加载对象
        objTemp[size - 1] = obj;
        // copy
        System.arraycopy(objArray, 0, objTemp, 0, Array.getLength(objArray));
        // 转换
        objArray = objTemp;
    }

    /** *//**
     * 删除指定索引位置数组数据
     *
     * @param index
     * @return
     */
    public Object remove(int index) {
        // 检查索引是否越界
        checkIndex(index);
        Object[] objTemp = (Object[]) objArray;

        // 重新构建objArray
        int j;
        if ((j = size - index - 1) > 0) {
            System.arraycopy(objTemp, index + 1, objTemp, index, j);
        }
        // 减少size
        back();

        return objTemp[index];
    }

    public boolean contains(Object obj) {
        Object[] objTemp = (Object[]) objArray;
        for (int i = 0; i < size; i++) {
            if (hash(objTemp[i]) == hash(obj)) {
                return true;
            }
        }
        return false;
    }
   
    public Object[] sub(int startIndex,int endIndex) {
        //验证索引范围
        checkIndex(startIndex);
        checkIndex(endIndex);
        int over=endIndex-startIndex;
        if(over<0){
            throw new IndexOutOfBoundsException("Index beyond the end of the border!");
        }
        Object[] objTemp = (Object[]) objArray;
        Object[] objs = (Object[]) Array.newInstance(objArray.getClass().getComponentType(),
                over);
        for(int i=startIndex;i<endIndex;i++){
            objs[i-1]=objTemp[i-1];
        }
        return objs;
    }

    public void clear() {
        Object[] objTemp = (Object[]) objArray;
        // 清空数据
        for (int i = 0; i < size; i++) {
            objTemp[i] = null;
            size = 0;
        }
    }

    /** *//**
     * 删除指定的对象实体
     *
     * @param obj
     * @return
     */
    public boolean remove(Object obj) {
        // 检查是否合法对象
        checkObject(obj);
        Object[] object = (Object[]) objArray;
        for (int i = 0; i < size; i++)
            if (object[i] == obj) {
                remove(i);
                return true;
            }
        return false;
    }

    /** *//**
     * 混淆数组元素
     *
     * @return
     */
    public void mixElements() {
        mixElements(objArray);
    }

    /** *//**
     * 检查数组内元素是否为空
     *
     * @return
     */
    public boolean isEmpty() {
        return (size == 0);
    }

    /** *//**
     * 转为list
     *
     * @return
     */
    public List getList() {
        return Arrays.asList((Object[]) objArray);
    }

    /** *//**
     * 减少size
     *
     */
    private void back() {
        size--;
    }

    /** *//**
     * 增加size
     *
     */
    private void next() {
        size++;
    }

    /** *//**
     * 检查索引是否溢出
     *
     * @param index
     */
    private void checkIndex(int index) {

        if (index >= size || index < 0) {
            throw new IndexOutOfBoundsException("Index " + index
                    + " out of bounds！");
        }
    }

    /** *//**
     * 检查对象类型
     *
     * @param obj
     */
    private void checkObject(Object obj) {
        if (obj instanceof Object[]) {
            throw new IndexOutOfBoundsException("Not loading arrays！");
        }
        String type;
        if (!objType.equals(type = obj.getClass().getSimpleName())) {
            throw new IndexOutOfBoundsException("Not this " + type
                    + " type of loading！");
        }
    }

    /** *//**
     * 扩充数组对象
     *
     * @param obj
     * @param i
     * @param flag
     * @return
     */
    static public Object expand(Object obj, int i, boolean flag) {
        int j = Array.getLength(obj);
        Object obj1 = Array.newInstance(obj.getClass().getComponentType(), j
                + i);
        System.arraycopy(obj, 0, obj1, flag ? 0 : i, j);
        return obj1;
    }

    /** *//**
     * 扩充数组对象
     *
     * @param obj
     * @param i
     * @param flag
     * @return
     */
    static public Object expand(Object obj, int i) {
        return expand(obj, i, true);
    }

    /** *//**
     * 随机返回数组内容
     *
     * @param obj
     */
    static public void mixElements(Object obj) {
        int i = Array.getLength(obj);
        for (int k = 0; k < i; k++) {
            int j = getRandom(k, i - 1);
            Object obj1 = Array.get(obj, j);
            Array.set(obj, j, Array.get(obj, k));
            Array.set(obj, k, obj1);
        }

    }

    static public Random getRandomObject() {
        return rand;
    }

    static public int getRandom(int i, int j) {
        return i + rand.nextInt((j - i) + 1);
    }

    private int hash(Object obj) {
        int h = obj.hashCode();
        h += ~(h << 9);
        h ^= (h >>> 14);
        h += (h << 4);
        h ^= (h >>> 10);
        return h;
    }

    public int hashCode() {
        return hash(objArray.getClass());
    }

    public int size() {
        return size;
    }

    /** *//**
     * 反回当前数组对象
     *
     * @return
     */
public Object[] getObjectArray() {
    return (Object[]) objArray;
}