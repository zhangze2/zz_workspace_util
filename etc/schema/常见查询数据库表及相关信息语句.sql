select * from all_tab_comments
-- ��ѯ�����û��ı�,��ͼ��

select * from user_tab_comments  
-- ��ѯ���û��ı�,��ͼ��

select * from all_col_comments 

--��ѯ�����û��ı��������ע��.

select * from user_col_comments
-- ��ѯ���û��ı��������ע��

select * from all_tab_columns
--��ѯ�����û��ı����������Ϣ(��ϸ����û�б�ע).

select * from user_tab_columns
--��ѯ���û��ı����������Ϣ(��ϸ����û�б�ע).

--һ��ʹ��1:
select t.table_name,t.comments from user_tab_comments t

--һ��ʹ��2:
select r1, r2, r3, r5
from (select a.table_name r1, a.column_name r2, a.comments r3
          from user_col_comments a),
       (select t.table_name r4, t.comments r5 from user_tab_comments t)
where r4 = r1

���Ͼ���oracle��ѯ�û����б�������ܡ�


1.
select table_name from all_tables;

�������еı���

����1.select table_name from user_all_tables;


����Oracle��ѯ������û������еı�

����һ����ת����sql��������.

����select * from user_objects; //��ѯ���еı�

����select * from dba_tables; //��ѯ���еı�

����select * from all_tables; //��ѯ���еı�

����select * from user_users //���һ���û�

����select * from all_users //��ѯ�����û�

����select * from dba_users //��ѯ�����û�

����select name,dbid from v$database; //��ѯ���ݿ���������ID

����select * from sys.user_tab_columns; //��ѯ���� ������ʾ����

����describe ���� //��ѯ��ṹ

����select * from sys.user_tab_columns where table_name=����

������ѯָ���������ֶ�

����2: ��ѯ���ݿ����

��1.show parameter db;

����3��Oracle��ѯ����ѯ���ݿ��ʵ����

����1.select instance_name from v$instance;

����4: ���ݿ�����

�������ݿⰲװ���������Ҫ֪���������ж����ݿ��Ƿ��������Լ����ݿ��������ƿ�����

����1.select value from v$parameter where name='db_domain'

����2.show parameter domain

����5:���ݿ������

����������ݿ��������������ݿ����������ȫ�����ݿ�������������ݿ�û�ж��������������ݿ�����������ݿ�����ͬ

����1.show parameter service_name

����6:��ʾ��ǰ�û�

��  ��1.show user

����7:ֱ�ӵ�½

����  1.sqlplus "/as sysdba"

����8:��ǰOOracleϵͳʱ��

����   1.select sysdate from dual;

����9:��ѯ���ݿ��ֵ�v$nls_parameter�����ַ�����ز���

����  1.select * from v$nls_parameters;