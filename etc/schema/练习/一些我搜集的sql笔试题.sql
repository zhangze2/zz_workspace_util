--1�������������ã� 
�𣺴�������һ������Ĵ洢���̣���Ҫ��ͨ���¼�����������ִ�еġ�������ǿ��Լ������ά�����ݵ������Ժ�һ���ԣ����Ը������ݿ��ڵĲ����Ӷ�������δ����ɵĸ��º�
�仯�������������㡣�磬ĳ���ϵĴ������ϰ�������һ��������ݲ��������ò����ֻᵼ�¸ñ������������� 

--2��ʲô�Ǵ洢���̣���ʲô�����ã� 
�𣺴洢������һ��Ԥ�����SQL��䣬�ŵ�������ģ�黯����ƣ�����˵ֻ�贴��һ�Σ��Ժ��ڸó����оͿ��Ե��ö�Ρ����ĳ�β�����Ҫִ�ж��SQL��ʹ�ô洢���̱ȵ���
SQL���ִ��Ҫ�졣������һ��������������ô洢���̡� 

--3�����������ã��������ŵ�ȱ����ʲô�� 

��������һ������Ĳ�ѯ�����ݿ����������������������ٶ����ݵļ�����������������ʵ���������Ŀ¼������Ҫ��ѯ���������ݾͿ����ҵ���Ҫ�����ݡ�����������Ψ
һ�ģ�������������ָ�������л����Ƕ���С�ȱ����������������¼����ٶȣ�ͬʱҲ���������ݿ�ĳߴ��С�� 

3��ʲô���ڴ�й©�� 
��һ��������˵���ڴ�й©ָ���Ƕ��ڴ��й©�����ڴ��ǳ���Ӷ���Ϊ�����ģ���С����ģ�ʹ�����Ҫ��ʾ�ͷ��ڴ档��Ӧ�ó����ùؼ���new�ȴ�������ʱ���ʹӶ���Ϊ
������һ���ڴ棬ʹ�����������free����delete�ͷŸ��ڴ棬�����˵���ڴ�Ͳ��ܱ�ʹ�ã����Ǿ�˵���ڴ汻й©�ˡ� 

4��ά�����ݿ�������Ժ�һ���ԣ���ϲ���ô�����������дҵ���߼���Ϊʲô�� 
��������������
1����������ʹ��Լ������check,������������ǿ��ֶε���Լ����������Ч����ߣ�Ҳ��㡣
2���������ʹ�ô����������ַ������Ա�֤������ʲôҵ��ϵͳ�������ݿⶼ���Ա�֤���ݵ������º�һ���ԡ�
3��������ǵ�����дҵ���߼������������鷳����̸��ӣ�Ч�ʵ��¡�

5��ʲô������ʲô������ 
��������Ǳ�����һ����Ϊһ���߼�������Ԫ��SQL�����飬����κ�һ��������ʧ����ô���������ͱ�ʧ�ܣ��Ժ�����ͻ�ع�������ǰ״̬�����������и��ڵ㡣Ϊ��

ȷ��Ҫôִ�У�Ҫô��ִ�У��Ϳ���ʹ������Ҫ�����������Ϊ�����ǣ�����Ҫͨ��ACID���ԣ���ԭ���ԣ�һ���ԣ������Ժͳ־��ԡ� 
���������Ե�DBMS�У�����ʵ������Ĺؼ��������Ա�֤����������ԺͲ����ԡ�����ʵ��������һ����������ʹĳЩ���ݵ�ӵ���ߣ���ĳ��ʱ���ڲ���ʹ��ĳЩ���ݻ����ݽṹ

����Ȼ�����ּ���ġ� 
6��ʲô����ͼ���α���ʲô��
����ͼ��һ������ı����к��������ͬ�Ĺ��ܡ����Զ���ͼ���������ģ��飬��������ͼͨ������һ������߶������л��е��Ӽ�������ͼ���޸Ĳ�Ӱ���������ʹ��
���ǻ�ȡ���ݸ����ף���ȶ���ѯ��
�α꣺�ǶԲ�ѯ�����Ľ������Ϊһ����Ԫ����Ч�Ĵ����α���Զ��ڸõ�Ԫ�е��ض��У��ӽ�����ĵ�ǰ�м���һ�л���С����ԶԽ������ǰ�����޸ġ�һ�㲻ʹ���α꣬
������Ҫ�����������ݵ�ʱ���α��Ե�ʮ����Ҫ��

7��Ϊ����ҵ����ѵ��Ϣ������3����
     S(S#,SN,SD,SA)S#,SN,SD,SA�ֱ����ѧ�ţ�ѧԱ������������λ��ѧԱ����
     C(C#,CN)C#,CN�ֱ����γ̱�ţ��γ�����
      SC(S#,C#,G) S#,C#,G�ֱ����ѧ�ţ���ѡ�Ŀγ̱�ţ�ѧϰ�ɼ�
��1��ʹ�ñ�׼SQLǶ������ѯѡ�޿γ�����Ϊ��˰�ջ�������ѧԱѧ�ź�����?
          �𰸣�select s# ,sn from s where S# in(select S# from c,sc where c.c#=sc.c# and cn=��˰�ջ�����)
(2) ʹ�ñ�׼SQLǶ������ѯѡ�޿γ̱��Ϊ��C2����ѧԱ������������λ?
��select sn,sd from s,sc where s.s#=sc.s# and sc.c#=��c2��
      (3) ʹ�ñ�׼SQLǶ������ѯ��ѡ�޿γ̱��Ϊ��C5����ѧԱ������������λ?
��select sn,sd from s where s# not in(select s# from sc where c#=��c5��)
       (4)��ѯѡ���˿γ̵�ѧԱ����
��select ѧԱ����=count(distinct s#) from sc
       (5) ��ѯѡ�޿γ̳���5�ŵ�ѧԱѧ�ź�������λ?
��select sn,sd from s where s# in(select s# from sc group by s# having count(distinct c#)>5)
8�������Թ����ж����������SQL��ѯ����Ŀ��һ�ǲ�ѯA(ID,Name)���е�31��40����¼��ID��Ϊ���������ǲ��������������У������Ĳ�ѯ������£�

select top 10 * from A where ID >(select max(ID) from (select top 30 ID from A order by A ) T) order by A

��Ϊoracle ��֧��Top�����ȡNAME����ĸ˳�ĵ�2����¼��ʼ��3����¼��SQL���Ϊ��
   SELECT post_global_id, NAME
   FROM (SELECT ROWNUM RECNO, post_global_id, NAME
           FROM (SELECT * FROM R_APPLY ORDER BY NAME)
          WHERE ROWNUM <= (2 + 3 - 1)
          ORDER BY ROWNUM ASC)
  WHERE RECNO BETWEEN 2 AND (2 + 3 - 1)


9������һ����Ŀ��Ҫ���ǲ�ѯ��A�д���ID�ظ��������ϵļ�¼,�����Ĳ�ѯ������£�
select * from(select count(ID) as count from table group by ID)T where T.count>3



---------------------------------------------------------------------
create table testtable1
(
id int IDENTITY,
department varchar(12) 
)
select * from testtable1
insert into testtable1 values('���')
insert into testtable1 values('�г�')
insert into testtable1 values('�ۺ�')
/*
���
id department
1   ���
2   �г�
3   �ۺ� 
*/
create table testtable2
(
id int IDENTITY,
dptID int,
name varchar(12)
)
insert into testtable2 values(1,'����')
insert into testtable2 values(1,'����')
insert into testtable2 values(2,'����')
insert into testtable2 values(3,'����')
insert into testtable2 values(4,'����')
/*
��һ��SQL��䣬��ô��ʾ���½��
id dptID department name
1   1      ���        ����
2   1      ���        ����
3   2      �г�        ����
4   3      �ۺ�        ����
5   4      ����        ����
*/


���ǣ�
SELECT testtable2.* , ISNULL(department,'����')
FROM testtable1 right join testtable2 on testtable2.dptID = testtable1.ID

������ӦƸ��SQL Server���ݿ⿪����Աʱ����������һ�ױ�׼�Ļ�׼�������⡣������Щ�������Ҿ����ܹ�������������̭���ϸ�ӦƸ�ߵ����⡣���ǰ��մ��׵��ѵ�˳�����С�
�����ʵ��������������������ʱ����������ⶼʮ�����Ѷȣ���Ϊ�𰸿��ܻ���ѽ��ͺ�˵���������������Ե������¡�

�������Ҽ�Ҫ����һ��SQL Server 2000��ʹ�õ�һЩ���ݿ������? 
��ϣ�������Ĵ𰸰�������һЩ����:�����ͼ���û�����ĺ������Լ��洢����;������ǻ��ܹ��ᵽ�񴥷��������Ķ���͸����ˡ����ӦƸ�߲��ܻش�������������⣬��

ô�ⲻ��һ������ͷ�� 
NULL��ʲô��˼? 
NULL(��)���ֵ�����ݿ�������һ���ǳ��Ѳ��Ķ����������в���ӦƸ�߻�����������ϵ���ͷ��Ҳ��Ҫ�������⡣ 
NULL���ֵ��ʾUNKNOWN(δ֪):������ʾ����(���ַ���)����������SQL Server���ݿ�����ANSI_NULLS����Ȼ��Ĭ������»��У���NULL���ֵ���καȽ϶�������һ��NULLֵ��

�����ܰ��κ�ֵ��һ�� UNKNOWNֵ���бȽϣ������߼���ϣ�����һ���𰸡�������ʹ��IS NULL��������

sql5
ʲô������?SQL Server 2000����ʲô���͵�����? 
�κ��о�������ݿ⿪����Ա��Ӧ���ܹ������׵ػش�������⡣һЩ���鲻̫��Ŀ�����Ա�ܹ��ش�������⣬������Щ�ط���˵������� 
�򵥵�˵��������һ�����ݽṹ���������ٷ������ݿ��������ͼ������ݡ���SQL Server�������������ʽ:�ۼ������ͷǾۼ��������ۼ�������������Ҷ���������ݡ�����

ζ�Ų��۾ۼ��������б����ĸ�(����Щ)�ֶΣ���Щ�ֶζ��ᰴ˳�򱻱����ڱ�����ڴ���������������ÿ�����ֻ����һ���ۼ��������Ǿۼ�������������Ҷ����һ����

��ʶ��������б�ʶ����һ��ָ����������ݵ�ָ�롣������ÿ������ж���Ǿۼ������� 
ʲô������?ʲô�����? 
�����Ǳ�����(һ������)�ֶΣ�ֻ���������������;�������ֵ����Ψһ�ġ������һ�����������������֮���ϵ��Լ�������ֹ�ϵһ�㶼�漰һ�������������ֶ���

����һ�����(���ܿ�����ͬһ�����)���һϵ���������ֶΡ���ô��Щ�������ֶξ�������� 
ʲô�Ǵ�����?SQL Server 2000��ʲô��ͬ���͵Ĵ�����? 
��δ�������ݿ⿪����Ա֪�����õĴ����������Լ����ʵ�������Ƿǳ�����ġ� 
��������һ��ר�����͵Ĵ洢���̣���������SQL Server 2000�ı�������ͼ�ϡ���SQL Server 2000���INSTEAD-OF��AFTER���ִ�������INSTEAD-OF��������������ݲٿ�

����(Data Manipulation Language��DML)���Ա��ִ�����Ĵ洢���̡����磬�������һ������TableA��INSTEAD-OF-UPDATE��������ͬʱ��������ִ��һ��������䣬��

ôINSTEAD-OF-UPDATE��������Ĵ����ִ�У���������ִ�еĸ�������򲻻�ִ�в����� 
AFTER������Ҫ��DML��������ݿ���ʹ��֮���ִ�С���Щ���͵Ĵ��������ڼ��ӷ��������ݿ���������ݱ仯ʮ�� 
�����ȷһ��������ΪFld1�ֶε�TableB�����ֻ����Fld1�ֶ������Щֵ������Щֵͬʱ����ΪTableA�ı���Fld1�ֶ���? 
������ϵ��ص��������������ܵĴ𰸡���һ����(��������ϣ�������Ĵ�)��ʹ��������ơ������������ά�����õ������ԡ���������ȷ���������ֶ�ֻ�������Ѿ���

��ͬ��(������ͬ��)��������һ���ֶ��ﶨ���˵�ֵ������ֶξ��Ǻ�ѡ��(ͨ��������һ����������)�� 
����һ�ִ��Ǵ����������������Ա�������֤������һ�ַ�ʽʵ����������ͬ�����ã��������ǳ���������ά������������һ�㶼����⡣�������ԭ��΢���鿪����Աʹ

��������ƶ����Ǵ�������ά�����õ������ԡ� 
��һ��Ͷ��ʹ�õ��������������й���������Ҫ��ʲô�������ܿ���? 
������Ѱ�ҽ��������ݲٿ��йص�ӦƸ��Ա����һ����������Խ�࣬���ݿ������������¡��������ɾ����������Ҫ��ʱ���Խ�࣬��Ϊ�����ݲٿط�����ʱ������Ҳ����Ҫά

���� 
�������ʲô��ȷ���������ֶ�ֻ�����ض���Χ���ֵ? 
�����������ö��ַ�ʽ���ش𣬵���ֻ��һ�����ǡ��á��𰸡���ϣ�������Ļش���Check���ƣ��������ݿ����ﱻ���壬��������������е�ֵ�� 
������Ҳ���Ա������������ݿ�������ֶ��ܹ����ܵ�ֵ���������ְ취Ҫ�󴥷����ڱ���ﱻ���壬����ܻ���ĳЩ�����Ӱ�쵽���ܡ���ˣ�΢����ʹ��Check���ƶ�����

�����ķ�ʽ��������������ԡ� 
���ӦƸ���ܹ���ȷ�ػش�������⣬��ô���Ļ���ͷǳ����ˣ���Ϊ��������Ǿ���ʹ�ô洢���̵ľ��顣 
���ز��������ɴ洢���̷��أ���������ʾ�洢�����ǳɹ�����ʧ�ܡ����ز�������INT�������͡� 
OUTPUT������ȷҪ���ɿ�����Ա��ָ���������Է����������͵����ݣ������ַ��ͺ���ֵ�͵�ֵ��(�����������������������������һЩ���Ƶġ�)��������һ���洢������ʹ��

���OUTPUT����������ֻ�ܹ�ʹ��һ�����ز����� 
ʲô������Ӳ�ѯ?���ʹ����Щ��ѯ? 
������ӷḻ�Ŀ�����Ա���ܹ�׼ȷ�������������͵Ĳ�ѯ�� 
����Ӳ�ѯ��һ�ְ����Ӳ�ѯ���������͵Ĳ�ѯ����ѯ��������Ӳ�ѯ�����������ⲿ��ѯ��ֵ���Ӷ��γ�һ��������ѭ����״����
-------------------------------------------------------------------------------------------------------------------
Ϊ�����λҵ����ѵ��Ϣ������3����:

S (S#,SN,SD,SA) S#,SN,SD,SA �ֱ����ѧ�š�ѧԱ������������λ��ѧԱ����

C (C#,CN ) C#,CN �ֱ����γ̱�š��γ�����

SC ( S#,C#,G ) S#,C#,G �ֱ����ѧ�š���ѡ�޵Ŀγ̱�š�ѧϰ�ɼ�

1. ʹ�ñ�׼SQLǶ������ѯѡ�޿γ�����Ϊ��˰�ջ�������ѧԱѧ�ź�����

--ʵ�ִ���:

SELECT SN,SD FROM S

WHERE [S#] IN(

SELECT [S#] FROM C,SC

WHERE C.[C#]=SC.[C#]

AND CN=N'˰�ջ���')

2. ʹ�ñ�׼SQLǶ������ѯѡ�޿γ̱��Ϊ��C2����ѧԱ������������λ

--ʵ�ִ���:

SELECT S.SN,S.SD FROM S,SC

WHERE S.[S#]=SC.[S#]

AND SC.[C#]='C2'

3. ʹ�ñ�׼SQLǶ������ѯ��ѡ�޿γ̱��Ϊ��C5����ѧԱ������������λ

--ʵ�ִ���:

SELECT SN,SD FROM S

WHERE [S#] NOT IN(

SELECT [S#] FROM SC

WHERE [C#]='C5')

4. ʹ�ñ�׼SQLǶ������ѯѡ��ȫ���γ̵�ѧԱ������������λ����
--ʵ�ִ���:
����SELECT SN,SD FROM S
����WHERE [S#] IN(
����SELECT [S#] FROM SC
����RIGHT JOIN
����C ON SC.[C#]=C.[C#] GROUP BY [S#]
����HAVING COUNT(*)=COUNT([S#]))
����
5. ��ѯѡ���˿γ̵�ѧԱ����
����--ʵ�ִ���:
����SELECT ѧԱ����=COUNT(DISTINCT [S#]) FROM SC
����
6. ��ѯѡ�޿γ̳���5�ŵ�ѧԱѧ�ź�������λ
����--ʵ�ִ���:
����SELECT SN,SD FROM S
����WHERE [S#] IN(
����SELECT [S#] FROM SC
����GROUP BY [S#]
����HAVING COUNT(DISTINCT [C#])>5)


----------��Ŀ2--------------------------------------------------------------------------

��������:

��֪��ϵģʽ:

S (SNO,SNAME) ѧ����ϵ��SNO Ϊѧ�ţ�SNAME Ϊ����

C (CNO,CNAME,CTEACHER) �γ̹�ϵ��CNO Ϊ�γ̺ţ�CNAME Ϊ�γ�����CTEACHER Ϊ�ον�ʦ

SC(SNO,CNO,SCGRADE) ѡ�ι�ϵ��SCGRADE Ϊ�ɼ�

1. �ҳ�û��ѡ�޹�����������ʦ���ڿγ̵�����ѧ������(NOT IN  �� NOT exists������)

--ʵ�ִ���:

SELECT SNAME FROM S

WHERE NOT EXISTS(

SELECT * FROM SC,C

WHERE SC.CNO=C.CNO

AND CNAME='����'

AND SC.SNO=S.SNO)

2. �г��ж�������(������)������γ̵�ѧ����������ƽ���ɼ�

--ʵ�ִ���:

SELECT S.SNO,S.SNAME,AVG_SCGRADE=AVG(SC.SCGRADE)

FROM S,SC,(

SELECT SNO

FROM SC

WHERE SCGRADE<60

GROUP BY SNO

HAVING COUNT(DISTINCT CNO)>=2

)A WHERE S.SNO=A.SNO AND SC.SNO=A.SNO

GROUP BY S.SNO,S.SNAME

3. �г���ѧ����1���ſγ̣���ѧ����2���ſγ̵�����ѧ������

--ʵ�ִ���:

SELECT S.SNO,S.SNAME

FROM S,(

SELECT SC.SNO

FROM SC,C

WHERE SC.CNO=C.CNO

AND C.CNAME IN('1','2')

GROUP BY SNO

HAVING COUNT(DISTINCT CNO)=2

)SC WHERE S.SNO=SC.SNO

4. �г���1���ſγɼ��ȡ�2����ͬѧ���ſγɼ��ߵ�����ѧ����ѧ��

--ʵ�ִ���:

SELECT S.SNO,S.SNAME

FROM S,(

SELECT SC1.SNO

FROM SC SC1,C C1,SC SC2,C C2

WHERE SC1.CNO=C1.CNO AND C1.NAME='1'

AND SC2.CNO=C2.CNO AND C2.NAME='2'

AND SC1.SCGRADE>SC2.SCGRADE

)SC WHERE S.SNO=SC.SNO

5. �г���1���ſγɼ��ȡ�2���ſγɼ��ߵ�����ѧ����ѧ�ż��䡰1���ſκ͡�2���ſεĳɼ�

--ʵ�ִ���:

SELECT S.SNO,S.SNAME,SC.[1�ſγɼ�],SC.[2�ſγɼ�]

FROM S,(

SELECT SC1.SNO,[1�ſγɼ�]=SC1.SCGRADE,[2�ſγɼ�]=SC2.SCGRADE

FROM SC SC1,C C1,SC SC2,C C2

WHERE SC1.CNO=C1.CNO AND C1.NAME='1'

AND SC2.CNO=C2.CNO AND C2.NAME='2'

AND SC1.SCGRADE>SC2.SCGRADE

)SC WHERE S.SNO=SC.SNO

----------------------------------
drop table dept;
drop table emp;
create table dept--���ű�
(
deptno varchar(10) primary key,
dname varchar(10)
);
create table emp--Ա����
(
empno varchar(10) primary key,
ename varchar(10),
job varchar(10),--ְ��  clerk:ӪҵԱ
mgr varchar(10),--������
sal varchar(10),--����
deptno varchar(10) references dept(deptno)
);

insert into dept values ('1','��ҵ��');
insert into dept values ('2','���۲�');
insert into dept values ('3','������');
insert into emp values ('01','jacky','clerk','tom','1000','1');
insert into emp values ('02','tom','clerk','','2000','1');
insert into emp values ('07','biddy','clerk','','2000','1');
insert into emp values ('03','jenny','sales','pretty','600','2');
insert into emp values ('04','pretty','sales','','800','2');
insert into emp values ('05','buddy','jishu','canndy','1000','3');
insert into emp values ('06','canndy','jishu','','1500','3');
select * from dept;
select * from emp;

--1�г�emp���и����ŵĲ��źţ���߹��ʣ���͹���
select deptno as ���ź�,max(sal) as ��߹���,min(sal) as ��͹��� from
emp group by deptno;

--2 �г�emp���и�����jobΪ'CLERK'(ӪҵԱ)��Ա������͹��ʣ���߹���
select max(sal) as ��߹���,min(sal) as ��͹���,deptno as ���ź� from emp where
job='clerk' group by deptno;

--3 ����emp����͹���С��2000�Ĳ��ţ��г�jobΪ'CLERK'��Ա���Ĳ��źţ���͹��ʣ���߹���
select b.deptno as ���ź�,max(sal) as ��߹���,min(sal) as ��͹��� from emp as b
where job='clerk' and (select min(sal)from emp as a where a.deptno=b.deptno)<2000 group by
b.deptno;

--4 ���ݲ��ź��ɸ߶��ͣ������еͶ����г�ÿ��Ա�������������źţ�����
select ename as ����,deptno as ���ź�,sal as ���� from emp order by deptno desc,sal asc;

--5 �г�'buddy'���ڲ�����ÿ��Ա���������벿�ź�
select b.ename as ����,b.deptno as ���ź� from emp as b where b.deptno=
(select a.deptno from emp as a where a.ename='buddy');

--6 �г�ÿ��Ա�������������������źţ�������
select ename as ����,job as ����,dept.deptno as ���ź�,dept.dname as ������ from emp,dept
where emp.deptno=dept.deptno;

--7�г�emp�й���Ϊ'CLERK'��Ա�������������������źţ�������
select ename as ����,job as ����,dept.deptno as ���ź�,dept.dname as ������ from emp,dept
where emp.deptno=dept.deptno and job='clerk';

--8����emp���й����ߵ�Ա�����г����������������������������Ϊmgr��
select a.deptno as ���ź�,a.ename as Ա��,b.ename as ������ from emp as a,emp as b where a.mgr is not null and a.mgr=b.ename;

--9 ����dept���У��г����в����������źţ�ͬʱ�г������Ź���Ϊ'CLERK'��Ա�����빤��
select a.deptno as ���ź�,a.dname as ������,b.ename as Ա����,b.job as ���� from dept as a,
emp as b where a.deptno=b.deptno and b.job='clerk';

--10 ���ڹ��ʸ��ڱ�����ƽ��ˮƽ��Ա�����г����źţ����������ʣ������ź�����
select b.deptno as ���ź�,b.ename as ����,b.sal as ���� from emp as b
where b.sal>(select avg(a.sal) from emp as a where a.deptno=b.deptno) order by b.deptno;

--11����emp���г����������й��ʸ��ڱ�����ƽ�����ʵ�Ա�����Ͳ��źţ������ź�����
select a.deptno as ���ź�,count(a.sal) as Ա���� from emp as a
where a.sal>(select avg(b.sal) from emp as b where a.deptno=b.deptno) group by a.deptno order
by a.deptno;
--12����emp�й��ʸ��ڱ�����ƽ��ˮƽ����������1�˵ģ��г����źţ�������ƽ�����ʣ������ź�����
select count(a.empno) as Ա����,a.deptno as ���ź�,avg(sal) as ƽ������
from emp as a where (select count(c.empno) from emp as c where c.deptno=a.deptno and
c.sal>(select avg(sal) from emp as b where c.deptno=b.deptno))>1
group by a.deptno order by a.deptno;
--13����emp�е����Լ���������5�˵�Ա�����г��䲿�źţ����������ʣ��Լ����������Լ�������
select a.deptno as ���ź�,a.ename as ����,a.sal as ����,(select count(b.ename) from emp as b
where b.sal<a.sal) as ���� from emp as a
where (select count(b.ename) from emp as b where b.sal<a.sal)>=5


