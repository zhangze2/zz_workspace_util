--��Ҫ��¼kdb�˺�

--�鿴�������SQL���1��
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

--�鿴�������SQL���2��
select * from v$session t1, v$locked_object t2 where t1.sid = t2.SESSION_ID;

--ɱ��������̣�
--����ӛ䛄t��ʾ��lock��ӛ���SID��serial# ����ӛ䛵�ID��Q�����738,1429�����ɽ��LOCK
alter system kill session '738,1429'; 