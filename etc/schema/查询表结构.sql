select tab.TABLE_NAME, --����
       tab.COLUMN_NAME, --�ֶ���
       tab.DATA_TYPE, --�ֶ�����
       tab.DATA_LENGTH, --�ֶγ���
       col.comments, --�ֶ�ע��
       comm.comments --��ע��
  from user_tab_columns tab, user_col_comments col, user_tab_comments comm
 where tab.TABLE_NAME = col.table_name
   and tab.COLUMN_NAME = col.column_name
   and tab.TABLE_NAME = comm.table_name
   and tab.TABLE_NAME = 'R_APPLY'
 order by tab.TABLE_NAME, tab.COLUMN_ID
  
 -----------��ԃ�Y��------------ 
    TABLE_NAME	COLUMN_NAME	DATA_TYPE	DATA_LENGTH	COMMENTS	COMMENTS
    
1	R_APPLY	    APPLY_GLOBAL_ID	VARCHAR2	50	����ȫ��id	ӦƸ��Ա������
2	R_APPLY	POST_GLOBAL_ID	VARCHAR2	50	��λȫ��id	ӦƸ��Ա������
3	R_APPLY	STAFF_GLOBAL_ID	VARCHAR2	50	��Աȫ��id	ӦƸ��Ա������
4	R_APPLY	NAME	VARCHAR2	80	����	ӦƸ��Ա������
5	R_APPLY	SEX	VARCHAR2	80	�Ա�	ӦƸ��Ա������
6	R_APPLY	STAFF_TYPE	VARCHAR2	80	��Ա����	ӦƸ��Ա������
7	R_APPLY	ID_CARD	VARCHAR2	25	���֤����	ӦƸ��Ա������



--*ע�����Ҫ��д���Ժ����ɱ�����д��ϰ�ߣ�
select * from user_tab_columns where table_name = 'SZ_PROJECT_STAFF' ;

--��ȡ���ֶΣ�
select *
from user_tab_columns
where Table_Name='�û���'
order by column_name

--��ȡ��ע�ͣ�

select *
from user_tab_comments
where Table_Name='�û���'

order by Table_Name

--��ȡ�ֶ�ע�ͣ�

select *
from user_col_comments
where Table_Name='�û���'

order by column_name

/* ��ȡ��*/

select table_name from user_tables; //��ǰ�û��ı�      

select table_name from all_tables; //�����û��ı�  

select table_name from dba_tables; //����ϵͳ��

select table_name from dba_tables where owner='zfxfzb'

/*
user_tables��

table_name,tablespace_name,last_analyzed��

dba_tables��

ower,table_name,tablespace_name,last_analyzed��

all_tables��

ower,table_name,tablespace_name,last_analyzed��

all_objects��

ower,object_name,subobject_name,object_id,created,last_ddl_time,timestamp,status��
*/

/*  ��ȡ���ֶΣ�*/

select * from user_tab_columns where Table_Name='�û���';

select * from all_tab_columns where Table_Name='�û���';

select * from dba_tab_columns where Table_Name='�û���';

/* user_tab_columns��

table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id��

all_tab_columns ��

ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id��

dba_tab_columns��

ower,table_name,column_name,data_type,data_length,data_precision,data_scale,nullable,column_id��
*/

/*  ��ȡ��ע�ͣ�*/

select * from user_tab_comments

/*
user_tab_comments��table_name,table_type,comments

��Ӧ�Ļ���dba_tab_comments��all_tab_comments����������user_tab_comments����ower�С�
*/

/* ��ȡ�ֶ�ע�ͣ�*/

select * from user_col_comments

/*

user_col_comments��table_name,column_name,comments

��Ӧ�Ļ���dba_col_comments��all_col_comments����������user_col_comments����ower�С�
*/




