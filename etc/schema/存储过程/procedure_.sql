--oracle�洢�����﷨

--1 ���ж����: 

if �Ƚ�ʽ then begin end; end if; 

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

--2 ��For ѭ�� 

For ... in ... LOOP 

-- ִ����� 

end LOOP; 

--(1) ѭ�������α� 

create or replace procedure test() as 

Cursor cursor is select name from student; name varchar(20); 

begin 

for name in cursor LOOP 

begin 

 dbms_output.putline(name);  

end; 

end LOOP; 

end test; 

--(2) ѭ���������� 

 create or replace procedure test(varArray in myPackage.TestArray) as 

--( �������varArray ���Զ�����������ͣ����巽ʽ������6) 

i number; 

begin 

i := 1;  -- �洢������������ʼλ���Ǵ�1 ��ʼ�ģ���java ��C ��C++ �����Բ�ͬ����Ϊ��Oracle �б���û������ĸ���ģ�������ʵ����һ�� 

-- ��(Table), ÿ������Ԫ�ؾ��Ǳ��е�һ����¼�����Ա�������ʱ���൱�ڴӱ��еĵ�һ����¼��ʼ���� 

for i in 1..varArray.count LOOP      

dbms_output.putline('The No.'|| i || 'record in varArray is:'||varArray(i));    

 end LOOP; 

end test; 

--3 ��While ѭ�� 

while ������� LOOP 

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

--4 ������ 

������ȷһ�����Oracle �б���û������ĸ���ģ�������ʵ����һ�ű�(Table), ÿ������Ԫ�ؾ��Ǳ��е�һ����¼�� 

ʹ������ʱ���û�����ʹ��Oracle �Ѿ�����õ��������ͣ���ɸ����Լ�����Ҫ�����������͡� 

(1) ʹ��Oracle �Դ����������� 

x array; -- ʹ��ʱ��Ҫ��Ҫ���г�ʼ�� 

e.g: 

create or replace procedure test(y out array) is 

 x array;   

 begin 

x := new array(); 

y := x; 

end test; 

--(2) �Զ������������ ( �Զ�����������ʱ������ͨ������Package �ķ�ʽʵ�֣��Ա��ڹ���) 

create or replace package myPackage is 

   Public type declarations   type info is record(     name varchar(20),     y number); 

  type TestArray is table of info index by binary_integer;   

-- �˴�������һ��TestArray ���������ݣ���ʵ��Ϊһ�Ŵ洢Info �������͵�Table ���ѣ���TestArray ����һ�ű��������ֶΣ�һ����name ��һ����y ����Ҫע����Ǵ˴�ʹ����Index by binary_integer ���Ƹ�Table �������Ҳ���Բ�д��ֱ��д�ɣ�type TestArray is 

table of info �������д�Ļ�ʹ������ʱ����Ҫ���г�ʼ����varArray myPackage.TestArray; varArray := new myPackage.TestArray(); 

end TestArray; 

--5. �α��ʹ�� Oracle ��Cursor �Ƿǳ����õģ����ڱ�����ʱ���еĲ�ѯ���������ط���������Ҳ�ܶ࣬�ֽ��ͳ��õ��÷���һ�����ܣ� 

--(1)Cursor ���α�( �������ڲ�������) 

create or replace procedure test() is   

cusor_1 Cursor is select std_name from student where  ...;  --Cursor ��ʹ�÷�ʽ1   cursor_2 Cursor; 

begin 

select class_name into cursor_2 from class where ...;  --Cursor ��ʹ�÷�ʽ2 

--��ʹ��For x in cursor LOOP .... end LOOP; ��ʵ�ֶ�Cursor �ı��� 

end test; 

--(2)SYS_REFCURSOR ���α꣬���α���Oracle ��Ԥ�ȶ�����α꣬�������������д��� 

create or replace procedure test(rsCursor out SYS_REFCURSOR) is 

cursor SYS_REFCURSOR; 

name varhcar(20); 

begin 

OPEN cursor FOR select name from student where ... --SYS_REFCURSOR ֻ��ͨ��OPEN �������򿪺͸�ֵ 

LOOP 

 fetch cursor into name   --SYS_REFCURSOR ֻ��ͨ��fetch into ���򿪺ͱ��� exit when cursor%NOTFOUND;              --SYS_REFCURSOR �п�ʹ������״̬���ԣ�                                         ---%NOTFOUND( δ�ҵ���¼��Ϣ) %FOUND( �ҵ���¼��Ϣ)                                         ---%ROWCOUNT( Ȼ��ǰ�α���ָ�����λ��) 

 dbms_output.putline(name); 

end LOOP; 

rsCursor := cursor; 

end test; 

 

 

 

/*ʵ��

����дһ���򵥵���������������˵�Ĵ洢���̵��÷���һ��Ӧ�ã� 

�ּ���������ű�һ����ѧ���ɼ���(studnet) ���ֶ�Ϊ��stdId,math,article,language,music,sport,total,average,step               

һ����ѧ������ɼ���(out_school), �ֶ�Ϊ:stdId,parctice,comment 

ͨ���洢�����Զ������ÿλѧ�����ܳɼ���ƽ���ɼ���ͬʱ�����ѧ���ڿ���γ��л�õ�����ΪA �������ܳɼ��ϼ�20 �֡� */

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

get_comment(commentArray); -- ������Ϊget_comment() �Ĵ洢���̻�ȡѧ������������Ϣ 

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

   go to next; -- ʹ��go to ����for ѭ��        

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

-- ȡ��ѧ��������Ϣ�Ĵ洢���� 

create or replace procedure get_comment(commentArray out myPackage.myArray) is 

rs SYS_REFCURSOR �� 

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

-- ������������myArray 

create or replace package myPackage is begin 

type stdInfo is record(stdId varchar(30),comment varchar(1)); 

type myArray is table of stdInfo index by binary_integer; 

end myPackage;

 

