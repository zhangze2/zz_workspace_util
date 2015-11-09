--�����ǰ�û���ռ�
select username,default_tablespace from user_users
 
/*������ռ�*/
create temporary tablespace zszc_temp
tempfile '/oracle/product/10.2.0/oradata/orcl/zszc_temp.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local;

/*��2�����������ݱ�ռ� */
create tablespace zszc
logging
datafile '/oracle/product/10.2.0/oradata/orcl/zszc_data.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local;

/*��3���������û���ָ����ռ� */
create user xxzszc identified by xxzszc
default tablespace zszc
temporary tablespace zszc_temp;
 
/*��4�������û�����Ȩ�� */
grant connect,resource,dba to xxzszc;

drop tablespace zszc including contents


/*������ɾ����ռ�*/
drop tablespace lyms_tablespace
drop tablespace lyms_tablespace_temp including contents
drop tablespace lyms_tablespace_temp including datafiles

--�鿴ȫ����ռ�
select dbf.tablespace_name,
dbf.totalspace "����(M)",
dbf.totalblocks as �ܿ���,
dfs.freespace "ʣ������(M)",
dfs.freeblocks "ʣ�����",
(dfs.freespace / dbf.totalspace) * 100 "���б���" 
from (select t.tablespace_name,
sum(t.bytes) / 1024 / 1024 totalspace,
sum(t.blocks) totalblocks
from dba_data_files t
group by t.tablespace_name) dbf,
(select tt.tablespace_name,
sum(tt.bytes) / 1024 / 1024 freespace,
sum(tt.blocks) freeblocks
from dba_free_space tt
group by tt.tablespace_name) dfs
where trim(dbf.tablespace_name) = trim(dfs.tablespace_name)
 
--�ر�session
select * from v$session b where b.username='KDB'
select b.sid, b.serial#, b.username, status from v$session b where b.username='KDB'
ALTER SYSTEM KILL SESSION '532, 156';
ALTER SYSTEM KILL SESSION '538, 1';

--�����d
--imp xxzszc/xxzszc@test file=D:\zszc.dmp  log=d:\zszc.dmp.log full=y

--������d
--exp xsgy/xsgy@192.168.2.121/orcl file=d:\xsgy20140415.dmp log=d:\xsgy.log statistics=none 




