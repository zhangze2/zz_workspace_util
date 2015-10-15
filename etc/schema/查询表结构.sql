select tab.TABLE_NAME, --表名
       tab.COLUMN_NAME, --字段名
       tab.DATA_TYPE, --字段类型
       tab.DATA_LENGTH, --字段长度
       col.comments, --字段注释
       comm.comments --表注释
  from user_tab_columns tab, user_col_comments col, user_tab_comments comm
 where tab.TABLE_NAME = col.table_name
   and tab.COLUMN_NAME = col.column_name
   and tab.TABLE_NAME = comm.table_name
   and tab.TABLE_NAME = 'R_APPLY'
 order by tab.TABLE_NAME, tab.COLUMN_ID
  
 -----------查詢結果------------ 
    TABLE_NAME	COLUMN_NAME	DATA_TYPE	DATA_LENGTH	COMMENTS	COMMENTS
    
1	R_APPLY	    APPLY_GLOBAL_ID	VARCHAR2	50	报名全局id	应聘人员报名表
2	R_APPLY	POST_GLOBAL_ID	VARCHAR2	50	岗位全局id	应聘人员报名表
3	R_APPLY	STAFF_GLOBAL_ID	VARCHAR2	50	人员全局id	应聘人员报名表
4	R_APPLY	NAME	VARCHAR2	80	姓名	应聘人员报名表
5	R_APPLY	SEX	VARCHAR2	80	性别	应聘人员报名表
6	R_APPLY	STAFF_TYPE	VARCHAR2	80	人员类型	应聘人员报名表
7	R_APPLY	ID_CARD	VARCHAR2	25	身份证号码	应聘人员报名表



--*注意表名要大写（以后养成表名大写的习惯）
select * from user_tab_columns where table_name = 'SZ_PROJECT_STAFF' ;

--获取表字段：
select *
from user_tab_columns
where Table_Name='用户表'
order by column_name

--获取表注释：

select *
from user_tab_comments
where Table_Name='用户表'

order by Table_Name

--获取字段注释：

select *
from user_col_comments
where Table_Name='用户表'

order by column_name

/* 获取表：*/

select table_name from user_tables; //当前用户的表      

select table_name from all_tables; //所有用户的表  

select table_name from dba_tables; //包括系统表

select table_name from dba_tables where owner='zfxfzb'

/*
user_tables：

table_name,tablespace_name,last_analyzed等

dba_tables：

ower,table_name,tablespace_name,last_analyzed等

all_tables：

ower,table_name,tablespace_name,last_analyzed等

all_objects：

ower,object_name,subobject_name,object_id,created,last_ddl_time,timestamp,status等
*/

/*  获取表字段：*/

select * from user_tab_columns where Table_Name='用户表';

select * from all_tab_columns where Table_Name='用户表';

select * from dba_tab_columns where Table_Name='用户表';

/* user_tab_columns：

table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等

all_tab_columns ：

ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等

dba_tab_columns：

ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id等
*/

/*  获取表注释：*/

select * from user_tab_comments

/*
user_tab_comments：table_name,table_type,comments

相应的还有dba_tab_comments，all_tab_comments，这两个比user_tab_comments多了ower列。
*/

/* 获取字段注释：*/

select * from user_col_comments

/*

user_col_comments：table_name,column_name,comments

相应的还有dba_col_comments，all_col_comments，这两个比user_col_comments多了ower列。
*/




