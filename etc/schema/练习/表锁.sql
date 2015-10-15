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
   
   
alter system kill session '509,34751'  ;  
alter system kill session '463,42441'  ; 