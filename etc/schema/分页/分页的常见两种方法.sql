--һ��skip = 1; take=10��
--1.����row_number�����������з�ҳ(Ч�ʸ���)

SELECT xx.*
  FROM (SELECT t.*, row_number() over(ORDER BY sort_num) AS num FROM departments t) xx
 WHERE num BETWEEN 5 AND 15;--���ص�5-15������

--2.����rownum�ؼ���(����Ƕ��)
SELECT *
  FROM (SELECT A.*, ROWNUM RN
          FROM (SELECT * FROM TABLE_NAME) A
         WHERE ROWNUM <= 40)
 WHERE RN >= 21
--SELECT * FROM ( SELECT A.*, ROWNUM RN FROM (SELECT * FROM TABLE_NAME) A ) WHERE RN BETWEEN 21 AND 40

 
 
 
 
 
 
--ROW_NUMBER()
���﷨��ROW_NUMBER() OVER (PARTITION BY COL1 ORDER BY COL2) 
�����ܡ���ʾ����COL1���飬�ڷ����ڲ����� COL2���򣬶����ֵ�ͱ�ʾÿ���ڲ�������˳���ţ�����������Ψһ�ģ� 
row_number() ���ص���Ҫ�ǡ��С�����Ϣ����û������
��������
��˵����Oracle��������

��Ҫ���ܣ�����ȡǰ�����������������

��ʾ����
���������£�
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

������һ��sql��䣬�����Ľ���� 
A | 1 | test
A | 2 | test
B | 1 | test
B | 2 | test
C | 1 | test
C | 2 | test
ʵ��: 
select name,seqno,description 
from(select name,seqno,description,row_number() over (partition by name order by seqno) id
from table_name) where id<=3;

