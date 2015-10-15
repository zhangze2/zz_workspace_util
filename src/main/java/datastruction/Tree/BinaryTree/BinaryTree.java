package main.java.datastruction.Tree.BinaryTree;
//二叉排序树的非递归插入，非递归查询，寻找最大值，寻找最小值
public class BinaryTree {
	private Node root;// 树根
    // 非递归方式插入新的节点数据，
    public void insert(int data) {
        Node newNode = new Node(data);
        if (root == null) {
            root = newNode;
        } else {
            // 子节点，当前节点
            Node current = root;
            // 父节点
            Node parent;
            while (true)// 寻找插入的位置
            {
                parent = current;
                // 当小于根节点，插入到左边
                if (data < current.getData()) {
                    current = current.getLeft();
                    // 跳出循环
                    if (current == null) {
                        parent.setLeft(newNode);
                        return;
                    }
                } else {
                    current = current.getRight();
                    if (current == null) {
                        parent.setRight(newNode);
                        return;
                    }
                }
            }
        }
    }
    /**
     * Title: find
     * Description:非递归方式实现查询
     * @param data
     * @return 返回找到的结点
     */
    public Node find(int data) {
        Node current = root;
        while (current.getData() != data) {
            if (current.getData() < data)
                current = current.getLeft();
            else
                current = current.getRight();
            // 当一个元素不在一个二叉树中，肯定为null了
            if (current == null)
                return null;
        }
        // 跳出循环说明找到了那个相等的
        return current;
    }
    // 找二叉树最小的节点,一直遍历左孩子，直到其左孩子为null
    public Node findMinNode() {
        Node current;
        Node parent;
        //
        if (root == null) {
            return null;
        } else {
            parent = root;
            current = parent.getLeft();
            while (current != null) {
                parent = current;
                current = current.getLeft();
            }
            return parent;
        }
    }
    // 找到二叉排序树的最大值，也就是最右边的孩子
    public Node findMaxNode() {
        Node current;
        Node parent;
        //
        if (root == null) {
            return null;
        } else {
            parent = root;
            current = parent.getRight();
            while (current != null) {
                parent = current;
                current = current.getRight();
            }
            return parent;
        }
    }
    // 先要找到节点，然后根据要删除节点的位置进行删除
    // 删除的节点有三种，叶子节点，有一个节点的节点，有两个节点的节点
    public boolean delete(int key) {
        Node current = root;
        Node parent = root;
        // 这里主要是为了区分删除的是左孩子还是右孩子
        boolean isLeftChild = false;
        // 显然，当current.iData == key 时，current就是需要删除的节点
        // 在循环中利用parent保存了父类节点
        while (current.getData() != key) {
            parent = current;
            if (key < current.getData()) {
                isLeftChild = true;
                current = current.getLeft();
            } else {
                isLeftChild = false;
                current = current.getRight();
            }
            if (current == null)// 找不到key时返回false
                return false;
        }
        // 当节点为叶子节点的时候
        if (current.getLeft() == null && current.getRight() == null) {
            if (current == root)
                root = null;
            else if (isLeftChild)
                parent.setLeft(null);
            else
                parent.setRight(null);
        }
        // 当删除的节点为含有一个子节点的节点
        // 删除的节点只有一个左子节点时
        // 必须要考虑被删除的节点是左节点还是右节点
        else if (current.getRight() == null) {
            if (current == root)// 要删除的节点为根节点
                root = current.getLeft();
            else if (isLeftChild)// 要删除的节点是一个左子节点
                parent.setLeft(current.getLeft());
            else
                parent.setRight(current.getLeft());// 要删除的节点是一个右子节点
        }
        // 当删除的节点为含有一个子节点的节点
        // 删除的节点只有一个右子节点时
        // 必须要考虑被删除的节点是左节点还是右节点
        else if (current.getLeft() == null) {
            if (current == root)// 要删除的节点为根节点
                root = current.getRight();
            else if (isLeftChild)// 要删除的节点是一个左子节点
                parent.setLeft(current.getRight());
            else
                parent.setRight(current.getRight());// 要删除的节点是一个右子节点
        }
        // 当要删除的节点是含有两个节点的时候
        else
         {
            //首先要获取被删除节点的后继节点，current
             Node successor = getSuccessor(current);
             if(current == root)
                root = successor ;
             //这里已经屏蔽了后继节点是叶子和非叶子节点
             else if(isLeftChild)
                    parent.setLeft(successor);
             else
                    parent.setRight(successor);
             successor.setLeft(current.getLeft());
         }
        return true;
    }
    // 寻找后记节点，主要是当要删除的节点包含了两个子节点的时候
    // 返回后继节点,后继节点就是比要删除的节点的关键值要大的节点集合中的最小值。
    //后继节点要么是被删除节点的不包含左子节点的右节点，要么就是包含左子节点的右节点的子节点
    private Node getSuccessor(Node delNode)
    {
        // 后继节点的父节点
        Node successorParent = delNode;
        // 后继节点
        Node successor = delNode.getRight();
        //判断后继节点是否有左孩子
        Node current = successor.getLeft();
        while (current != null) {
            successorParent = successor;
            successor = current;
            current = current.getLeft();
        }
        //当该后继节点是属于包含左子节点的右节点的子节点
        if (successor != delNode.getRight())
        {
            successorParent.setLeft(successor.getRight());
            //连接被删除节点的右孩子
            successor.setRight(delNode.getRight());
        }
        return successor;
    }
    // 下面三种遍历树
    // 三种遍历均是采用递归实现的
    // 前序遍历
    public void preOrder(Node localRoot) {
        if (localRoot != null) {
            localRoot.displayNode();// 访问这个节点
            preOrder(localRoot.getLeft());// 调用自身来遍历左子树
            preOrder(localRoot.getRight());// 调用自身来遍历右子树
        }
    }
    // 中序遍历
    public void midOrder(Node localRoot) {
        if (localRoot != null) {
            preOrder(localRoot.getLeft());// 调用自身来遍历左子树
            localRoot.displayNode();// 访问这个节点
            preOrder(localRoot.getRight());// 调用自身来遍历右子树
        }
    }
    // 后续遍历
    public void lastOrder(Node localRoot) {
        if (localRoot != null) {
            preOrder(localRoot.getLeft());// 调用自身来遍历左子树
            preOrder(localRoot.getRight());// 调用自身来遍历右子树
            localRoot.displayNode();// 访问这个节点
        }
    }
}
