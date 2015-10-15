package main.java.datastruction.Tree;

import java.util.ArrayList;
import java.util.List;

public class TreeParent<E> {
	public static class Node<T>  
    {  
        T data;  
        //记录其父节点的位置  
        int parent;  
        public Node()  
        {  
        }  
        public Node(T data)  
        {  
            this.data = data;  
        }  
        public Node(T data , int parent)  
        {  
            this.data = data;  
            this.parent = parent;  
        }  
        public String toString()  
        {  
            return "TreeParent$Node[data=" + data + ", parent="  
                + parent + "]";  
        }  
    }  
    private final int DEFAULT_TREE_SIZE = 100;  
    private int treeSize = 0;  
    //使用一个Node[]数组来记录该树里的所有节点  
    private Node<E>[] nodes;  
    //记录节点数  
    private int nodeNums;  
    //以指定根节点创建树  
    public TreeParent(E data)  
    {  
        treeSize = DEFAULT_TREE_SIZE;  
        nodes = new Node[treeSize];  
        nodes[0] = new Node<E>(data , -1);  
        nodeNums++;  
    }  
    //以指定根节点、指定treeSize大小 创建树  
    public TreeParent(E data ,int treeSize)  
    {  
        this.treeSize = treeSize;  
        nodes = new Node[treeSize];  
        nodes[0] = new Node<E>(data , -1);  
        nodeNums++;  
    }  
    /**
     * Title: addNode
     * Description:为任意某一指定节点 添加子节点  
     * Created On: 2015-9-22 下午8:40:20
     * @author ZhangZe
     * @param data
     * @param parent 任意某一指定节点
     */
    public void addNode(E data , Node parent)  
    {  
        for (int i = 0 ; i < treeSize ; i++)  
        {  
            //找到数组中第一个为null的元素，该元素保存新节点  
            if (nodes[i] == null)  
            {  
                //创建新节点，并用指定的数组元素保存它  
                nodes[i] = new Node(data , pos(parent));;  
                nodeNums++;  
                return;  
            }  
        }  
        throw new RuntimeException("该树已满，无法添加新节点");  
    }  
    //判断树是否为空。  
    public boolean empty()  
    {  
        //根节点是否为null  
        return nodes[0] == null;  
    }  
    //返回根节点  
    public Node<E> root()  
    {  
        //返回根节点  
        return nodes[0];  
    }  
    //返回指定节点（非根节点）的父节点。  
    public Node<E> parent(Node node)  
    {  
        //每个节点的parent记录了其父节点的位置  
        return nodes[node.parent];  
    }  
    //返回指定节点（非叶子节点）的所有子节点。  
    public List<Node<E>> children(Node parent)  
    {  
        List<Node<E>> list = new ArrayList<Node<E>>();  
        for (int i = 0 ; i < treeSize  ; i++)  
        {  
            //如果当前节点的父节点的位置等于parent节点的位置  
            if (nodes[i] != null &&  
                nodes[i].parent == pos(parent))  
            {  
                list.add(nodes[i]);  
            }  
        }  
        return list;  
    }  
    //返回该树的深度。  
    public int deep()  
    {  
        //用于记录节点的最大深度  
        int max = 0;  
        for(int i = 0 ; i < treeSize && nodes[i] != null  
            ; i++)  
        {  
            //初始化本节点的深度  
            int def = 1;  
            //m记录当前节点的父节点的位置  
            int m = nodes[i].parent;  
            //如果其父节点存在  
            while(m != -1 && nodes[m] != null)  
            {  
                //向上继续搜索父节点  
                m = nodes[m].parent;  
                def++;  
            }  
            if(max < def)  
            {  
                max = def;  
            }  
        }  
        //返回最大深度  
        return max;   
    }  
    //返回包含指定值的节点。  
    public int pos(Node node)  
    {  
        for (int i = 0 ; i < treeSize ; i++)  
        {  
            //找到指定节点  
            if (nodes[i] == node)  
            {  
                return i;  
            }  
        }  
        return -1;  
    }  
      
    public static void main(String[] args)   
    {  
        TreeParent<String> treeParent = new TreeParent<String>("root");  
        Node root = treeParent.root();
        System.out.println(root);  
        treeParent.addNode("节点1" , root);  
        System.out.println("增加'节点1'后此树的深度:" + treeParent.deep());  
        treeParent.addNode("节点2" , root);  
        //获取根节点的所有子节点  
        List<Node<String>> nodes = treeParent.children(root);
        System.out.println("根节点的第一个子节点：" + nodes.get(0));  
        //为根节点的第一个子节点新增一个子节点  
        treeParent.addNode("节点3" , nodes.get(0));  
        System.out.println("此树的深度:" + treeParent.deep());  
    }
}
