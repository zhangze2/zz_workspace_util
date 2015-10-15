--需要登录kdb账号

--查看锁表进程SQL语句1：
select sess.sid,
    sess.serial#,
    lo.oracle_username,
    lo.os_user_name,
    ao.object_name,
    lo.locked_mode
    from v$locked_object lo,
    dba_objects ao,
    v$session sess
where ao.object_id = lo.object_id and lo.session_id = sess.sid;

--查看锁表进程SQL语句2：
select * from v$session t1, v$locked_object t2 where t1.sid = t2.SESSION_ID;

--杀掉锁表进程：
--如有記錄則表示有lock，記錄下SID和serial# ，將記錄的ID替換下面的738,1429，即可解除LOCK
alter system kill session '738,1429'; 