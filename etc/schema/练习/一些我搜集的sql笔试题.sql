--1．触发器的作用？ 
答：触发器是一中特殊的存储过程，主要是通过事件来触发而被执行的。它可以强化约束，来维护数据的完整性和一致性，可以跟踪数据库内的操作从而不允许未经许可的更新和
变化。可以联级运算。如，某表上的触发器上包含对另一个表的数据操作，而该操作又会导致该表触发器被触发。 

--2。什么是存储过程？用什么来调用？ 
答：存储过程是一个预编译的SQL语句，优点是允许模块化的设计，就是说只需创建一次，以后在该程序中就可以调用多次。如果某次操作需要执行多次SQL，使用存储过程比单纯
SQL语句执行要快。可以用一个命令对象来调用存储过程。 

--3。索引的作用？和它的优点缺点是什么？ 

答：索引就一种特殊的查询表，数据库的搜索引擎可以利用它加速对数据的检索。它很类似与现实生活中书的目录，不需要查询整本书内容就可以找到想要的数据。索引可以是唯
一的，创建索引允许指定单个列或者是多个列。缺点是它减慢了数据录入的速度，同时也增加了数据库的尺寸大小。 

3。什么是内存泄漏？ 
答：一般我们所说的内存泄漏指的是堆内存的泄漏。堆内存是程序从堆中为其分配的，大小任意的，使用完后要显示释放内存。当应用程序用关键字new等创建对象时，就从堆中为
它分配一块内存，使用完后程序调用free或者delete释放该内存，否则就说该内存就不能被使用，我们就说该内存被泄漏了。 

4。维护数据库的完整性和一致性，你喜欢用触发器还是自写业务逻辑？为什么？ 
答：我是这样做的
1）、尽可能使用约束，如check,主键，外键，非空字段等来约束，这样做效率最高，也最方便。
2）、其次是使用触发器，这种方法可以保证，无论什么业务系统访问数据库都可以保证数据的完整新和一致性。
3）、最后考虑的是自写业务逻辑，但这样做麻烦，编程复杂，效率低下。

5。什么是事务？什么是锁？ 
答：事务就是被绑定在一起作为一个逻辑工作单元的SQL语句分组，如果任何一个语句操作失败那么整个操作就被失败，以后操作就会回滚到操作前状态，或者是上有个节点。为了

确保要么执行，要么不执行，就可以使用事务。要将有组语句作为事务考虑，就需要通过ACID测试，即原子性，一致性，隔离性和持久性。 
锁：在所以的DBMS中，锁是实现事务的关键，锁可以保证事务的完整性和并发性。与现实生活中锁一样，它可以使某些数据的拥有者，在某段时间内不能使用某些数据或数据结构

。当然锁还分级别的。 
6。什么叫视图？游标是什么？
答：视图是一种虚拟的表，具有和物理表相同的功能。可以对视图进行增，改，查，操作，试图通常是有一个表或者多个表的行或列的子集。对视图的修改不影响基本表。它使得
我们获取数据更容易，相比多表查询。
游标：是对查询出来的结果集作为一个单元来有效的处理。游标可以定在该单元中的特定行，从结果集的当前行检索一行或多行。可以对结果集当前行做修改。一般不使用游标，
但是需要逐条处理数据的时候，游标显得十分重要。

7。为管理业务培训信息，建立3个表：
     S(S#,SN,SD,SA)S#,SN,SD,SA分别代表学号，学员姓名，所属单位，学员年龄
     C(C#,CN)C#,CN分别代表课程编号，课程名称
      SC(S#,C#,G) S#,C#,G分别代表学号，所选的课程编号，学习成绩
（1）使用标准SQL嵌套语句查询选修课程名称为’税收基础’的学员学号和姓名?
          答案：select s# ,sn from s where S# in(select S# from c,sc where c.c#=sc.c# and cn=’税收基础’)
(2) 使用标准SQL嵌套语句查询选修课程编号为’C2’的学员姓名和所属单位?
答：select sn,sd from s,sc where s.s#=sc.s# and sc.c#=’c2’
      (3) 使用标准SQL嵌套语句查询不选修课程编号为’C5’的学员姓名和所属单位?
答：select sn,sd from s where s# not in(select s# from sc where c#=’c5’)
       (4)查询选修了课程的学员人数
答：select 学员人数=count(distinct s#) from sc
       (5) 查询选修课程超过5门的学员学号和所属单位?
答：select sn,sd from s where s# in(select s# from sc group by s# having count(distinct c#)>5)
8、在面试过程中多次碰到两道SQL查询的题目，一是查询A(ID,Name)表中第31至40条记录，ID作为主键可能是不是连续增长的列，完整的查询语句如下：

select top 10 * from A where ID >(select max(ID) from (select top 30 ID from A order by A ) T) order by A

因为oracle 不支持Top，则抽取NAME的字母顺的第2条记录开始的3条记录的SQL语句为：
   SELECT post_global_id, NAME
   FROM (SELECT ROWNUM RECNO, post_global_id, NAME
           FROM (SELECT * FROM R_APPLY ORDER BY NAME)
          WHERE ROWNUM <= (2 + 3 - 1)
          ORDER BY ROWNUM ASC)
  WHERE RECNO BETWEEN 2 AND (2 + 3 - 1)


9、另外一道题目的要求是查询表A中存在ID重复三次以上的记录,完整的查询语句如下：
select * from(select count(ID) as count from table group by ID)T where T.count>3



---------------------------------------------------------------------
create table testtable1
(
id int IDENTITY,
department varchar(12) 
)
select * from testtable1
insert into testtable1 values('设计')
insert into testtable1 values('市场')
insert into testtable1 values('售后')
/*
结果
id department
1   设计
2   市场
3   售后 
*/
create table testtable2
(
id int IDENTITY,
dptID int,
name varchar(12)
)
insert into testtable2 values(1,'张三')
insert into testtable2 values(1,'李四')
insert into testtable2 values(2,'王五')
insert into testtable2 values(3,'彭六')
insert into testtable2 values(4,'陈七')
/*
用一条SQL语句，怎么显示如下结果
id dptID department name
1   1      设计        张三
2   1      设计        李四
3   2      市场        王五
4   3      售后        彭六
5   4      黑人        陈七
*/


答案是：
SELECT testtable2.* , ISNULL(department,'黑人')
FROM testtable1 right join testtable2 on testtable2.dptID = testtable1.ID

在面试应聘的SQL Server数据库开发人员时，我运用了一套标准的基准技术问题。下面这些问题是我觉得能够真正有助于淘汰不合格应聘者的问题。它们按照从易到难的顺序排列。
当你问到关于主键和外键的问题时，后面的问题都十分有难度，因为答案可能会更难解释和说明，尤其是在面试的情形下。

你能向我简要叙述一下SQL Server 2000中使用的一些数据库对象吗? 
你希望听到的答案包括这样一些对象:表格、视图、用户定义的函数，以及存储过程;如果他们还能够提到像触发器这样的对象就更好了。如果应聘者不能回答这个基本的问题，那

么这不是一个好兆头。 
NULL是什么意思? 
NULL(空)这个值是数据库世界里一个非常难缠的东西，所以有不少应聘者会在这个问题上跌跟头您也不要觉得意外。 
NULL这个值表示UNKNOWN(未知):它不表示“”(空字符串)。假设您的SQL Server数据库里有ANSI_NULLS，当然在默认情况下会有，对NULL这个值的任何比较都会生产一个NULL值。

您不能把任何值与一个 UNKNOWN值进行比较，并在逻辑上希望获得一个答案。您必须使用IS NULL操作符。

sql5
什么是索引?SQL Server 2000里有什么类型的索引? 
任何有经验的数据库开发人员都应该能够很轻易地回答这个问题。一些经验不太多的开发人员能够回答这个问题，但是有些地方会说不清楚。 
简单地说，索引是一个数据结构，用来快速访问数据库表格或者视图里的数据。在SQL Server里，它们有两种形式:聚集索引和非聚集索引。聚集索引在索引的叶级保存数据。这意

味着不论聚集索引里有表格的哪个(或哪些)字段，这些字段都会按顺序被保存在表格。由于存在这种排序，所以每个表格只会有一个聚集索引。非聚集索引在索引的叶级有一个行

标识符。这个行标识符是一个指向磁盘上数据的指针。它允许每个表格有多个非聚集索引。 
什么是主键?什么是外键? 
主键是表格里的(一个或多个)字段，只用来定义表格里的行;主键里的值总是唯一的。外键是一个用来建立两个表格之间关系的约束。这种关系一般都涉及一个表格里的主键字段与

另外一个表格(尽管可能是同一个表格)里的一系列相连的字段。那么这些相连的字段就是外键。 
什么是触发器?SQL Server 2000有什么不同类型的触发器? 
让未来的数据库开发人员知道可用的触发器类型以及如何实现它们是非常有益的。 
触发器是一种专用类型的存储过程，它被捆绑到SQL Server 2000的表格或者视图上。在SQL Server 2000里，有INSTEAD-OF和AFTER两种触发器。INSTEAD-OF触发器是替代数据操控

语言(Data Manipulation Language，DML)语句对表格执行语句的存储过程。例如，如果我有一个用于TableA的INSTEAD-OF-UPDATE触发器，同时对这个表格执行一个更新语句，那

么INSTEAD-OF-UPDATE触发器里的代码会执行，而不是我执行的更新语句则不会执行操作。 
AFTER触发器要在DML语句在数据库里使用之后才执行。这些类型的触发器对于监视发生在数据库表格里的数据变化十分 
您如何确一个带有名为Fld1字段的TableB表格里只具有Fld1字段里的那些值，而这些值同时在名为TableA的表格的Fld1字段里? 
这个与关系相关的问题有两个可能的答案。第一个答案(而且是您希望听到的答案)是使用外键限制。外键限制用来维护引用的完整性。它被用来确保表格里的字段只保存有已经在

不同的(或者相同的)表格里的另一个字段里定义了的值。这个字段就是候选键(通常是另外一个表格的主键)。 
另外一种答案是触发器。触发器可以被用来保证以另外一种方式实现与限制相同的作用，但是它非常难设置与维护，而且性能一般都很糟糕。由于这个原因，微软建议开发人员使

用外键限制而不是触发器来维护引用的完整性。 
对一个投入使用的在线事务处理表格有过多索引需要有什么样的性能考虑? 
你正在寻找进行与数据操控有关的应聘人员。对一个表格的索引越多，数据库引擎用来更新、插入或者删除数据所需要的时间就越多，因为在数据操控发生的时候索引也必须要维

护。 
你可以用什么来确保表格里的字段只接受特定范围里的值? 
这个问题可以用多种方式来回答，但是只有一个答案是“好”答案。您希望听到的回答是Check限制，它在数据库表格里被定义，用来限制输入该列的值。 
触发器也可以被用来限制数据库表格里的字段能够接受的值，但是这种办法要求触发器在表格里被定义，这可能会在某些情况下影响到性能。因此，微软建议使用Check限制而不是

其他的方式来限制域的完整性。 
如果应聘者能够正确地回答这个问题，那么他的机会就非常大了，因为这表明他们具有使用存储过程的经验。 
返回参数总是由存储过程返回，它用来表示存储过程是成功还是失败。返回参数总是INT数据类型。 
OUTPUT参数明确要求由开发人员来指定，它可以返回其他类型的数据，例如字符型和数值型的值。(可以用作输出参数的数据类型是有一些限制的。)您可以在一个存储过程里使用

多个OUTPUT参数，而您只能够使用一个返回参数。 
什么是相关子查询?如何使用这些查询? 
经验更加丰富的开发人员将能够准确地描述这种类型的查询。 
相关子查询是一种包含子查询的特殊类型的查询。查询里包含的子查询会真正请求外部查询的值，从而形成一个类似于循环的状况。
-------------------------------------------------------------------------------------------------------------------
为管理岗位业务培训信息，建立3个表:

S (S#,SN,SD,SA) S#,SN,SD,SA 分别代表学号、学员姓名、所属单位、学员年龄

C (C#,CN ) C#,CN 分别代表课程编号、课程名称

SC ( S#,C#,G ) S#,C#,G 分别代表学号、所选修的课程编号、学习成绩

1. 使用标准SQL嵌套语句查询选修课程名称为’税收基础’的学员学号和姓名

--实现代码:

SELECT SN,SD FROM S

WHERE [S#] IN(

SELECT [S#] FROM C,SC

WHERE C.[C#]=SC.[C#]

AND CN=N'税收基础')

2. 使用标准SQL嵌套语句查询选修课程编号为’C2’的学员姓名和所属单位

--实现代码:

SELECT S.SN,S.SD FROM S,SC

WHERE S.[S#]=SC.[S#]

AND SC.[C#]='C2'

3. 使用标准SQL嵌套语句查询不选修课程编号为’C5’的学员姓名和所属单位

--实现代码:

SELECT SN,SD FROM S

WHERE [S#] NOT IN(

SELECT [S#] FROM SC

WHERE [C#]='C5')

4. 使用标准SQL嵌套语句查询选修全部课程的学员姓名和所属单位　　
--实现代码:
　　SELECT SN,SD FROM S
　　WHERE [S#] IN(
　　SELECT [S#] FROM SC
　　RIGHT JOIN
　　C ON SC.[C#]=C.[C#] GROUP BY [S#]
　　HAVING COUNT(*)=COUNT([S#]))
　　
5. 查询选修了课程的学员人数
　　--实现代码:
　　SELECT 学员人数=COUNT(DISTINCT [S#]) FROM SC
　　
6. 查询选修课程超过5门的学员学号和所属单位
　　--实现代码:
　　SELECT SN,SD FROM S
　　WHERE [S#] IN(
　　SELECT [S#] FROM SC
　　GROUP BY [S#]
　　HAVING COUNT(DISTINCT [C#])>5)


----------题目2--------------------------------------------------------------------------

问题描述:

已知关系模式:

S (SNO,SNAME) 学生关系。SNO 为学号，SNAME 为姓名

C (CNO,CNAME,CTEACHER) 课程关系。CNO 为课程号，CNAME 为课程名，CTEACHER 为任课教师

SC(SNO,CNO,SCGRADE) 选课关系。SCGRADE 为成绩

1. 找出没有选修过“李明”老师讲授课程的所有学生姓名(NOT IN  和 NOT exists的区别)

--实现代码:

SELECT SNAME FROM S

WHERE NOT EXISTS(

SELECT * FROM SC,C

WHERE SC.CNO=C.CNO

AND CNAME='李明'

AND SC.SNO=S.SNO)

2. 列出有二门以上(含两门)不及格课程的学生姓名及其平均成绩

--实现代码:

SELECT S.SNO,S.SNAME,AVG_SCGRADE=AVG(SC.SCGRADE)

FROM S,SC,(

SELECT SNO

FROM SC

WHERE SCGRADE<60

GROUP BY SNO

HAVING COUNT(DISTINCT CNO)>=2

)A WHERE S.SNO=A.SNO AND SC.SNO=A.SNO

GROUP BY S.SNO,S.SNAME

3. 列出既学过“1”号课程，又学过“2”号课程的所有学生姓名

--实现代码:

SELECT S.SNO,S.SNAME

FROM S,(

SELECT SC.SNO

FROM SC,C

WHERE SC.CNO=C.CNO

AND C.CNAME IN('1','2')

GROUP BY SNO

HAVING COUNT(DISTINCT CNO)=2

)SC WHERE S.SNO=SC.SNO

4. 列出“1”号课成绩比“2”号同学该门课成绩高的所有学生的学号

--实现代码:

SELECT S.SNO,S.SNAME

FROM S,(

SELECT SC1.SNO

FROM SC SC1,C C1,SC SC2,C C2

WHERE SC1.CNO=C1.CNO AND C1.NAME='1'

AND SC2.CNO=C2.CNO AND C2.NAME='2'

AND SC1.SCGRADE>SC2.SCGRADE

)SC WHERE S.SNO=SC.SNO

5. 列出“1”号课成绩比“2”号课成绩高的所有学生的学号及其“1”号课和“2”号课的成绩

--实现代码:

SELECT S.SNO,S.SNAME,SC.[1号课成绩],SC.[2号课成绩]

FROM S,(

SELECT SC1.SNO,[1号课成绩]=SC1.SCGRADE,[2号课成绩]=SC2.SCGRADE

FROM SC SC1,C C1,SC SC2,C C2

WHERE SC1.CNO=C1.CNO AND C1.NAME='1'

AND SC2.CNO=C2.CNO AND C2.NAME='2'

AND SC1.SCGRADE>SC2.SCGRADE

)SC WHERE S.SNO=SC.SNO

----------------------------------
drop table dept;
drop table emp;
create table dept--部门表
(
deptno varchar(10) primary key,
dname varchar(10)
);
create table emp--员工表
(
empno varchar(10) primary key,
ename varchar(10),
job varchar(10),--职务  clerk:营业员
mgr varchar(10),--管理者
sal varchar(10),--工资
deptno varchar(10) references dept(deptno)
);

insert into dept values ('1','事业部');
insert into dept values ('2','销售部');
insert into dept values ('3','技术部');
insert into emp values ('01','jacky','clerk','tom','1000','1');
insert into emp values ('02','tom','clerk','','2000','1');
insert into emp values ('07','biddy','clerk','','2000','1');
insert into emp values ('03','jenny','sales','pretty','600','2');
insert into emp values ('04','pretty','sales','','800','2');
insert into emp values ('05','buddy','jishu','canndy','1000','3');
insert into emp values ('06','canndy','jishu','','1500','3');
select * from dept;
select * from emp;

--1列出emp表中各部门的部门号，最高工资，最低工资
select deptno as 部门号,max(sal) as 最高工资,min(sal) as 最低工资 from
emp group by deptno;

--2 列出emp表中各部门job为'CLERK'(营业员)的员工的最低工资，最高工资
select max(sal) as 最高工资,min(sal) as 最低工资,deptno as 部门号 from emp where
job='clerk' group by deptno;

--3 对于emp中最低工资小于2000的部门，列出job为'CLERK'的员工的部门号，最低工资，最高工资
select b.deptno as 部门号,max(sal) as 最高工资,min(sal) as 最低工资 from emp as b
where job='clerk' and (select min(sal)from emp as a where a.deptno=b.deptno)<2000 group by
b.deptno;

--4 根据部门号由高而低，工资有低而高列出每个员工的姓名，部门号，工资
select ename as 姓名,deptno as 部门号,sal as 工资 from emp order by deptno desc,sal asc;

--5 列出'buddy'所在部门中每个员工的姓名与部门号
select b.ename as 姓名,b.deptno as 部门号 from emp as b where b.deptno=
(select a.deptno from emp as a where a.ename='buddy');

--6 列出每个员工的姓名，工作，部门号，部门名
select ename as 姓名,job as 工作,dept.deptno as 部门号,dept.dname as 部门名 from emp,dept
where emp.deptno=dept.deptno;

--7列出emp中工作为'CLERK'的员工的姓名，工作，部门号，部门名
select ename as 姓名,job as 工作,dept.deptno as 部门号,dept.dname as 部门名 from emp,dept
where emp.deptno=dept.deptno and job='clerk';

--8对于emp中有管理者的员工，列出姓名，管理者姓名（管理者外键为mgr）
select a.deptno as 部门号,a.ename as 员工,b.ename as 管理者 from emp as a,emp as b where a.mgr is not null and a.mgr=b.ename;

--9 对于dept表中，列出所有部门名，部门号，同时列出各部门工作为'CLERK'的员工名与工作
select a.deptno as 部门号,a.dname as 部门名,b.ename as 员工名,b.job as 工作 from dept as a,
emp as b where a.deptno=b.deptno and b.job='clerk';

--10 对于工资高于本部门平均水平的员工，列出部门号，姓名，工资，按部门号排序
select b.deptno as 部门号,b.ename as 姓名,b.sal as 工资 from emp as b
where b.sal>(select avg(a.sal) from emp as a where a.deptno=b.deptno) order by b.deptno;

--11对于emp，列出各个部门中工资高于本部门平均工资的员工数和部门号，按部门号排序
select a.deptno as 部门号,count(a.sal) as 员工数 from emp as a
where a.sal>(select avg(b.sal) from emp as b where a.deptno=b.deptno) group by a.deptno order
by a.deptno;
--12对于emp中工资高于本部门平均水平，人数多于1人的，列出部门号，人数，平均工资，按部门号排序
select count(a.empno) as 员工数,a.deptno as 部门号,avg(sal) as 平均工资
from emp as a where (select count(c.empno) from emp as c where c.deptno=a.deptno and
c.sal>(select avg(sal) from emp as b where c.deptno=b.deptno))>1
group by a.deptno order by a.deptno;
--13对于emp中低于自己工资至少5人的员工，列出其部门号，姓名，工资，以及工资少于自己的人数
select a.deptno as 部门号,a.ename as 姓名,a.sal as 工资,(select count(b.ename) from emp as b
where b.sal<a.sal) as 人数 from emp as a
where (select count(b.ename) from emp as b where b.sal<a.sal)>=5


