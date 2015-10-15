--存储过程
　　1  CREATE OR REPLACE PROCEDURE 存储过程名

　　2  IS

　　3  BEGIN

　　4  NULL;

　　5  END;

--行1:

　　CREATE OR REPLACE PROCEDURE 是一个SQL语句通知Oracle数据库去创建一个叫做skeleton存储过程, 如果存在就覆盖它;

--行2:

　　IS关键词表明后面将跟随一个PL/SQL体。

--行3:

　　BEGIN关键词表明PL/SQL体的开始。

--行4:

　　NULL PL/SQL语句表明什么事都不做，这句不能删去，因为PL/SQL体中至少需要有一句;

--行5:

　　END关键词表明PL/SQL体的结束

--存储过程创建语法：
 create or replace procedure 存储过程名（param1 in type，param2 out type） 

as 

变量1 类型（值范围）; --vs_msg   VARCHAR2(4000); 

变量2 类型（值范围）;

Begin

Select count(*) into 变量1 from 表A where 列名=param1；

 

    If (判断条件) then

       Select 列名 into 变量2 from 表A where列名=param1；

       Dbms_output。Put_line(‘打印信息’);

    Elsif (判断条件) then

       Dbms_output。Put_line(‘打印信息’);

    Else

       Raise 异常名（NO_DATA_FOUND）;

    End if;

Exception

    When others then

       Rollback;

End;

 
/*注意事项：

1， 存储过程参数不带取值范围，in表示传入，out表示输出;  类型可以使用任意Oracle中的合法类型。

2，  变量带取值范围，后面接分号

3，  在判断语句前最好先用count（*）函数判断是否存在该条操作记录

4，  用select 。。。into。。。给变量赋值

5，  在代码中抛异常用 raise+异常名*/
