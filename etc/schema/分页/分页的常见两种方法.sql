--一般skip = 1; take=10条
--1.采用row_number解析函数进行分页(效率更高)

SELECT xx.*
  FROM (SELECT t.*, row_number() over(ORDER BY sort_num) AS num FROM departments t) xx
 WHERE num BETWEEN 5 AND 15;--返回第5-15行数据

--2.采用rownum关键字(三层嵌套)
SELECT *
  FROM (SELECT A.*, ROWNUM RN
          FROM (SELECT * FROM TABLE_NAME) A
         WHERE ROWNUM <= 40)
 WHERE RN >= 21
--SELECT * FROM ( SELECT A.*, ROWNUM RN FROM (SELECT * FROM TABLE_NAME) A ) WHERE RN BETWEEN 21 AND 40

 
 
 
 
 
 
--ROW_NUMBER()
【语法】ROW_NUMBER() OVER (PARTITION BY COL1 ORDER BY COL2) 
【功能】表示根据COL1分组，在分组内部根据 COL2排序，而这个值就表示每组内部排序后的顺序编号（组内连续的唯一的） 
row_number() 返回的主要是“行”的信息，并没有排名
【参数】
【说明】Oracle分析函数

主要功能：用于取前几名，或者最后几名等

【示例】
表内容如下：
name | seqno | description
A | 1 | test
A | 2 | test
A | 3 | test
A | 4 | test
B | 1 | test
B | 2 | test
B | 3 | test
B | 4 | test
C | 1 | test
C | 2 | test
C | 3 | test
C | 4 | test

我想有一个sql语句，搜索的结果是 
A | 1 | test
A | 2 | test
B | 1 | test
B | 2 | test
C | 1 | test
C | 2 | test
实现: 
select name,seqno,description 
from(select name,seqno,description,row_number() over (partition by name order by seqno) id
from table_name) where id<=3;

