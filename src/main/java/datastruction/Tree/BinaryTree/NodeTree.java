package main.java.datastruction.Tree.BinaryTree;

public class NodeTree {
	public int value;
    public NodeTree left;
    public NodeTree right;
    //递归实现存储
    public void store(int value) {
        if (value < this.value) {
            if (left == null) {
                left = new NodeTree();
                left.value = value;
            } else {
                left.store(value);
            }
        } else if (value > this.value) {
            if (right == null)
            {
                right = new NodeTree();
                right.value = value;
            } else {
                right.store(value);
            }
        }
    }
    public boolean find(int value) {
        System.out.println("find happen " + this.value);
        if (value == this.value) {
            return true;
        } else if (value > this.value) {
            if (right == null)
                return false;
            return right.find(value);
        } else {
            if (left == null)
                return false;
            return left.find(value);
        }
    }
    //前序遍历
    public void preList() {
        System.out.print(this.value + ",");
        if (left != null)
            left.preList();
        if (right != null)
            right.preList();
    }
             
    //中序遍历
    public void middleList() {
        if (left != null)
            left.middleList();
        System.out.print(this.value + ",");
        if (right != null)
            right.middleList();
    }
     //后续遍历
    public void afterList() {
        if (left != null)
            left.afterList();
        if (right != null)
            right.afterList();
        System.out.print(this.value + ",");
    }
    public static void main(String[] args) {
        int[] data = new int[20];
        for (int i = 0; i < data.length; i++) {
            data[i] = (int) (Math.random() * 100) + 1;
            System.out.print(data[i] + ",");
        }
        System.out.println();
        NodeTree root = new NodeTree();
        root.value = data[0];
        for (int i = 1; i < data.length; i++) {
            root.store(data[i]);
        }
        //查询
        root.find(data[19]);
        //先序
        root.preList();
        System.out.println();
        //中序
        root.middleList();
        System.out.println();
        //后续
        root.afterList();
    }
}
