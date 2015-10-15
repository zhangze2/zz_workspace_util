--左右链接只是以哪個表為主

--RIGHT JOIN 关键字会从右表 (Orders) 那里返回所有的行，即使在左表 (Persons) 中没有匹配的行。

原始的表 (用在例子中的)：
"Persons" 表：

Id_P LastName FirstName Address City 
1 Adams John Oxford Street London 
2 Bush George Fifth Avenue New York 
3 Carter Thomas Changan Street Beijing 

"Orders" 表：

Id_O OrderNo Id_P 
1 77895 3 
2 44678 3 
3 22456 1 
4 24562 1 
5 34764 65 
右连接（RIGHT JOIN）实例
现在，我们希望列出所有的定单，以及定购它们的人 - 如果有的话。

SELECT Persons.LastName, Persons.FirstName, Orders.OrderNo
FROM Persons
RIGHT JOIN Orders
ON Persons.Id_P=Orders.Id_P
ORDER BY Persons.LastName



您可以使用下面的 SELECT 语句：

