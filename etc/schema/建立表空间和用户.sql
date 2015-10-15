/*分为四步 */

/*第1步：创建临时表空间  */

create temporary tablespace BPM_TEMP  

tempfile 'E:\BPM_TEMP.dbf' 

size 50m  

autoextend on  

next 50m maxsize 20480m  

extent management local;  

 

/*第2步：创建数据表空间  */

create tablespace BPM  

logging  

datafile 'D:\oracle_server\product\10.2.0\oradata\orcl\BPM.dbf' 

size 50m  

autoextend on      

next 50m maxsize 20480m  

extent management local;  

 

/*第3步：创建用户并指定表空间  */

create user BPM identified by password  

default tablespace BPM  

temporary tablespace BPM_TEMP;  

 

/*第4步：给用户授予权限  */

grant connect,resource to BPM;  


5、删除用户

drop user xytzb cascade;

6、导出带日志（命令行）
exp bpm/bpm@192.168.2.176/orcl file=d:/bpm_10-12.dmp log=d:\bpm_10-12.log

7、导入带日志（命令行）
imp bpm/bpm@192.168.2.185:1521/orcl file=d:/bpm_table_10_12.dmp full=y ignore=y log=E:\bpm_table_10_12.dmp.log
 
 

 
 
 
 
 

