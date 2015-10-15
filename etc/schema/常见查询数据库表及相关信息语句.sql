select * from all_tab_comments
-- 查询所有用户的表,视图等

select * from user_tab_comments  
-- 查询本用户的表,视图等

select * from all_col_comments 

--查询所有用户的表的列名和注释.

select * from user_col_comments
-- 查询本用户的表的列名和注释

select * from all_tab_columns
--查询所有用户的表的列名等信息(详细但是没有备注).

select * from user_tab_columns
--查询本用户的表的列名等信息(详细但是没有备注).

--一般使用1:
select t.table_name,t.comments from user_tab_comments t

--一般使用2:
select r1, r2, r3, r5
from (select a.table_name r1, a.column_name r2, a.comments r3
          from user_col_comments a),
       (select t.table_name r4, t.comments r5 from user_tab_comments t)
where r4 = r1

以上就是oracle查询用户所有表的语句介绍。


1.
select table_name from all_tables;

　　所有的表明

　　1.select table_name from user_all_tables;


　　Oracle查询语句中用户的所有的表

　　一下是转贴的sql语句的帖子.

　　select * from user_objects; //查询所有的表

　　select * from dba_tables; //查询所有的表

　　select * from all_tables; //查询所有的表

　　select * from user_users //查出一个用户

　　select * from all_users //查询所有用户

　　select * from dba_users //查询所有用户

　　select name,dbid from v$database; //查询数据库名和它的ID

　　select * from sys.user_tab_columns; //查询表名 ，并显示列名

　　describe 表名 //查询表结构

　　select * from sys.user_tab_columns where table_name=表名

　　查询指定表名的字段

　　2: 查询数据库参数

　1.show parameter db;

　　3：Oracle查询语句查询数据库的实例名

　　1.select instance_name from v$instance;

　　4: 数据库域名

　　数据库安装结束后，如果要知道正在运行额数据库是否有域名以及数据库域名名称可以用

　　1.select value from v$parameter where name='db_domain'

　　2.show parameter domain

　　5:数据库服务名

　　如果数据库有域名，则数据库服务名就是全局数据库名，如果该数据库没有定义域名，则数据库服务名与数据库名相同

　　1.show parameter service_name

　　6:显示当前用户

　  　1.show user

　　7:直接登陆

　　  1.sqlplus "/as sysdba"

　　8:当前OOracle系统时间

　　   1.select sysdate from dual;

　　9:查询数据库字典v$nls_parameter产看字符集相关参数

　　  1.select * from v$nls_parameters;