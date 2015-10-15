create or replace trigger OA_bpm_dept_sync
after INSERT OR UPDATE OR DELETE  --insert update delete 触发
ON wp_kdb_department
FOR EACH ROW
DECLARE
parentid varchar2(20);

operateBPMFlag varchar2(2);   --工作流
BEGIN
    IF inserting THEN
        operateBPMFlag:='1';
    ELSIF updating THEN
        if :NEW.DELETE_FLAG='0' and :OLD.DELETE_FLAG='1' then
          operateBPMFlag:='1';
        elsif :NEW.DELETE_FLAG='1' and :OLD.DELETE_FLAG='0' then
          operateBPMFlag:='3';
        else
          operateBPMFlag:='2';
        end if;
    ELSE
        operateBPMFlag:='3';
    END IF;

    ----------------------------BPM部门同步开始------------------------
    insert into OA_BMP_SYNC_DEP
        (ID,DEPT_KEY,DEPT_NAME,PARENT_KEY,SORT_NUM,OPERATE,STATE,INSERTTIME) values(
          seq_OA_teacher_up_im.nextval ,
          :new.DEPARTMENT_KEY,
          :new.DEPARTMENT_NAME,
          :new.PARENT_KEY,
          '1'||replace(lpad(to_char(:new.SORT_NUM),5),' ','0'),
          operateBPMFlag,
          '0',
          sysdate
      );
    ----------------------------BPM同步结束------------------------
END;

--*************************E 部门同步存储过程*****************************--
