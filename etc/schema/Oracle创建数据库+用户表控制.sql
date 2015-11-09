--查出当前用户表空间
select username,default_tablespace from user_users
 
/*创建表空间*/
create temporary tablespace zszc_temp
tempfile '/oracle/product/10.2.0/oradata/orcl/zszc_temp.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local;

/*第2步：创建数据表空间 */
create tablespace zszc
logging
datafile '/oracle/product/10.2.0/oradata/orcl/zszc_data.dbf'
size 50m
autoextend on
next 50m maxsize 20480m
extent management local;

/*第3步：创建用户并指定表空间 */
create user xxzszc identified by xxzszc
default tablespace zszc
temporary tablespace zszc_temp;
 
/*第4步：给用户授予权限 */
grant connect,resource,dba to xxzszc;

drop tablespace zszc including contents


/*其他：删除表空间*/
drop tablespace lyms_tablespace
drop tablespace lyms_tablespace_temp including contents
drop tablespace lyms_tablespace_temp including datafiles

--查看全部表空间
select dbf.tablespace_name,
dbf.totalspace "总量(M)",
dbf.totalblocks as 总块数,
dfs.freespace "剩余总量(M)",
dfs.freeblocks "剩余块数",
(dfs.freespace / dbf.totalspace) * 100 "空闲比例" 
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
 
--关闭session
select * from v$session b where b.username='KDB'
select b.sid, b.serial#, b.username, status from v$session b where b.username='KDB'
ALTER SYSTEM KILL SESSION '532, 156';
ALTER SYSTEM KILL SESSION '538, 1';

--导入表d
--imp xxzszc/xxzszc@test file=D:\zszc.dmp  log=d:\zszc.dmp.log full=y

--导出表d
--exp xsgy/xsgy@192.168.2.121/orcl file=d:\xsgy20140415.dmp log=d:\xsgy.log statistics=none 




