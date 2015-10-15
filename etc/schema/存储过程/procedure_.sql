--oracle存储过程语法

--1 、判断语句: 

if 比较式 then begin end; end if; 

create or replace procedure test(x in out number) is 

begin 

        if x >0 then 

         begin 

        x := 0 - x; 

        end; 

    end if; 

    if x = 0 then 

       begin 

        x: = 1; 

    end; 

    end if; 

end test; 

--2 、For 循环 

For ... in ... LOOP 

-- 执行语句 

end LOOP; 

--(1) 循环遍历游标 

create or replace procedure test() as 

Cursor cursor is select name from student; name varchar(20); 

begin 

for name in cursor LOOP 

begin 

 dbms_output.putline(name);  

end; 

end LOOP; 

end test; 

--(2) 循环遍历数组 

 create or replace procedure test(varArray in myPackage.TestArray) as 

--( 输入参数varArray 是自定义的数组类型，定义方式见标题6) 

i number; 

begin 

i := 1;  -- 存储过程数组是起始位置是从1 开始的，与java 、C 、C++ 等语言不同。因为在Oracle 中本是没有数组的概念的，数组其实就是一张 

-- 表(Table), 每个数组元素就是表中的一个记录，所以遍历数组时就相当于从表中的第一条记录开始遍历 

for i in 1..varArray.count LOOP      

dbms_output.putline('The No.'|| i || 'record in varArray is:'||varArray(i));    

 end LOOP; 

end test; 

--3 、While 循环 

while 条件语句 LOOP 

begin 

end; 

end LOOP; 

E.g 

create or replace procedure test(i in number) as 

begin 

while i < 10 LOOP 

begin     

 i:= i + 1; 

end; 

end LOOP; 

 end test; 

--4 、数组 

首先明确一个概念：Oracle 中本是没有数组的概念的，数组其实就是一张表(Table), 每个数组元素就是表中的一个记录。 

使用数组时，用户可以使用Oracle 已经定义好的数组类型，或可根据自己的需要定义数组类型。 

(1) 使用Oracle 自带的数组类型 

x array; -- 使用时需要需要进行初始化 

e.g: 

create or replace procedure test(y out array) is 

 x array;   

 begin 

x := new array(); 

y := x; 

end test; 

--(2) 自定义的数组类型 ( 自定义数据类型时，建议通过创建Package 的方式实现，以便于管理) 

create or replace package myPackage is 

   Public type declarations   type info is record(     name varchar(20),     y number); 

  type TestArray is table of info index by binary_integer;   

-- 此处声明了一个TestArray 的类型数据，其实其为一张存储Info 数据类型的Table 而已，及TestArray 就是一张表，有两个字段，一个是name ，一个是y 。需要注意的是此处使用了Index by binary_integer 编制该Table 的索引项，也可以不写，直接写成：type TestArray is 

table of info ，如果不写的话使用数组时就需要进行初始化：varArray myPackage.TestArray; varArray := new myPackage.TestArray(); 

end TestArray; 

--5. 游标的使用 Oracle 中Cursor 是非常有用的，用于遍历临时表中的查询结果。其相关方法和属性也很多，现仅就常用的用法做一二介绍： 

--(1)Cursor 型游标( 不能用于参数传递) 

create or replace procedure test() is   

cusor_1 Cursor is select std_name from student where  ...;  --Cursor 的使用方式1   cursor_2 Cursor; 

begin 

select class_name into cursor_2 from class where ...;  --Cursor 的使用方式2 

--可使用For x in cursor LOOP .... end LOOP; 来实现对Cursor 的遍历 

end test; 

--(2)SYS_REFCURSOR 型游标，该游标是Oracle 以预先定义的游标，可作出参数进行传递 

create or replace procedure test(rsCursor out SYS_REFCURSOR) is 

cursor SYS_REFCURSOR; 

name varhcar(20); 

begin 

OPEN cursor FOR select name from student where ... --SYS_REFCURSOR 只能通过OPEN 方法来打开和赋值 

LOOP 

 fetch cursor into name   --SYS_REFCURSOR 只能通过fetch into 来打开和遍历 exit when cursor%NOTFOUND;              --SYS_REFCURSOR 中可使用三个状态属性：                                         ---%NOTFOUND( 未找到记录信息) %FOUND( 找到记录信息)                                         ---%ROWCOUNT( 然后当前游标所指向的行位置) 

 dbms_output.putline(name); 

end LOOP; 

rsCursor := cursor; 

end test; 

 

 

 

/*实例

下面写一个简单的例子来对以上所说的存储过程的用法做一个应用： 

现假设存在两张表，一张是学生成绩表(studnet) ，字段为：stdId,math,article,language,music,sport,total,average,step               

一张是学生课外成绩表(out_school), 字段为:stdId,parctice,comment 

通过存储过程自动计算出每位学生的总成绩和平均成绩，同时，如果学生在课外课程中获得的评价为A ，就在总成绩上加20 分。 */

create or replace procedure autocomputer(step in number) is 

rsCursor SYS_REFCURSOR; 

commentArray myPackage.myArray; 

math number; 

article number; 

language number; 

music number; 

sport number; 

total number; 

average number; 

stdId varchar(30); 

record myPackage.stdInfo; 

i number; 

begin 

i := 1; 

get_comment(commentArray); -- 调用名为get_comment() 的存储过程获取学生课外评分信息 

OPEN rsCursor for select stdId,math,article,language,music,sport from student t where t.step = step; 

LOOP 

fetch rsCursor into stdId,math,article,language,music,sport; exit when rsCursor%NOTFOUND; 

total := math + article + language + music + sport; 

for i in 1..commentArray.count LOOP  

 record := commentArray(i);     

if stdId = record.stdId then   

 begin      

 if record.comment = 'A' then      

  begin          

 total := total + 20;    

   go to next; -- 使用go to 跳出for 循环        

  end;     

end if;   

end;   

end if; 

end LOOP; 

<<continue>>  average := total / 5; 

 update student t set t.total=total and t.average = average where t.stdId = stdId; 

end LOOP; 

end; 

end autocomputer; 

-- 取得学生评论信息的存储过程 

create or replace procedure get_comment(commentArray out myPackage.myArray) is 

rs SYS_REFCURSOR ； 

record myPackage.stdInfo; 

stdId varchar(30); 

comment varchar(1); 

i number; 

begin 

open rs for select stdId,comment from out_school 

i := 1; 

LOOP 

 fetch rs into stdId,comment; exit when rs%NOTFOUND; 

record.stdId := stdId; 

 record.comment := comment; 

recommentArray(i) := record; 

i:=i + 1; 

end LOOP; 

end get_comment; 

-- 定义数组类型myArray 

create or replace package myPackage is begin 

type stdInfo is record(stdId varchar(30),comment varchar(1)); 

type myArray is table of stdInfo index by binary_integer; 

end myPackage;

 

