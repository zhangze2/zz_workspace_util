/*��Ϊ�Ĳ� */

/*��1����������ʱ��ռ�  */

create temporary tablespace BPM_TEMP  

tempfile 'E:\BPM_TEMP.dbf' 

size 50m  

autoextend on  

next 50m maxsize 20480m  

extent management local;  

 

/*��2�����������ݱ�ռ�  */

create tablespace BPM  

logging  

datafile 'D:\oracle_server\product\10.2.0\oradata\orcl\BPM.dbf' 

size 50m  

autoextend on      

next 50m maxsize 20480m  

extent management local;  

 

/*��3���������û���ָ����ռ�  */

create user BPM identified by password  

default tablespace BPM  

temporary tablespace BPM_TEMP;  

 

/*��4�������û�����Ȩ��  */

grant connect,resource to BPM;  


5��ɾ���û�

drop user xytzb cascade;

6����������־�������У�
exp bpm/bpm@192.168.2.176/orcl file=d:/bpm_10-12.dmp log=d:\bpm_10-12.log

7���������־�������У�
imp bpm/bpm@192.168.2.185:1521/orcl file=d:/bpm_table_10_12.dmp full=y ignore=y log=E:\bpm_table_10_12.dmp.log
 
 

 
 
 
 
 

