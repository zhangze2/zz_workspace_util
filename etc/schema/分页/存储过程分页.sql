--1、开发一个包
create or replace package testpackage as
--创建一个包，在该包中，定义了类型test_cursor ，是一个游标
type test_cursor is ref cursor;
end testpackage;

--2、编写存储过程
create or replace procedure splitPages
( DD_MZ in varchar2, --表名
pageSizes in number, --一页显示的记录数
pageNow in number, --当前第几页
pageRows out number, --总记录数
pageCount out number, --总页数
pageCursor out testpackage.test_cursor --返回记录集
) is
--定义部分
--定义sql语句， 字符串
v_sql varchar2(1000);
--定义两个整数
v_begin number:= (pageNow-1)*pageSizes + 1;
v_end number:= pageNow*pageSizes;
begin
--执行部分
v_sql:= 'select * from
(select t.*, rownum rn from (select * from '||DD_MZ||') t) tt
where tt.rn between '||v_begin||' and '||v_end;
--把游标和sql关联
open pageCursor for v_sql;
--计算myrows
--组织一个sql
v_sql:='select count(*) from '||DD_MZ;
--执行sql 并把返回的值 赋值给pageRows
execute immediate v_sql into pageRows;
--计算pageCount
pageCount:=(pageRows-1)/pageSizes + 1;
--关闭游标 注意这里不能关闭游标
--close pageCursor;
end;



/
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "LYHR", "LYHR");
//调用存储过程
CallableStatement proc = conn.prepareCall("{call splitPages(?, ?, ?, ?, ?, ?)}");
//给输入参数传值
proc.setString(1, "emp"); //表名
proc.setInt(2, 3); //一页显示的记录数
proc.setInt(3, 1); //当前第几页
//声明输出参数是什么类型
proc.registerOutParameter(4, oracle.jdbc.OracleTypes.INTEGER); //总记录数
proc.registerOutParameter(5, oracle.jdbc.OracleTypes.INTEGER); //总页数
proc.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); //返回记录集
//执行
proc.execute();
int pageRows = proc.getInt(4);
int pageCount = proc.getInt(5);
System.out.println("总行数="+pageRows);
System.out.println("总页数="+pageCount);
ResultSet rs = (ResultSet)proc.getObject(6);
while(rs.next()){
System.out.println(rs.getInt(1) +" "+rs.getString(2)+" "+rs.getString(3));
} 
