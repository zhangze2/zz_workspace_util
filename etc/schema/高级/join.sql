--��������ֻ�����Ă������

--RIGHT JOIN �ؼ��ֻ���ұ� (Orders) ���ﷵ�����е��У���ʹ����� (Persons) ��û��ƥ����С�

ԭʼ�ı� (���������е�)��
"Persons" ��

Id_P LastName FirstName Address City 
1 Adams John Oxford Street London 
2 Bush George Fifth Avenue New York 
3 Carter Thomas Changan Street Beijing 

"Orders" ��

Id_O OrderNo Id_P 
1 77895 3 
2 44678 3 
3 22456 1 
4 24562 1 
5 34764 65 
�����ӣ�RIGHT JOIN��ʵ��
���ڣ�����ϣ���г����еĶ������Լ��������ǵ��� - ����еĻ���

SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
FROM Persons
RIGHT JOIN Orders
ON Persons.Id_P=Orders.Id_P
ORDER BY Persons.LastName



������ʹ������� SELECT ��䣺

