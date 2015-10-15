create or replace trigger oa_bpm_user_sync
after INSERT OR UPDATE OR DELETE  --insert update delete 触发(注意：不能直接delete,否则:new.USER_KEY不能获取报错)
ON wp_udb_user
FOR EACH ROW
DECLARE
mobilePhone VARCHAR2(25);
workPhone VARCHAR2(30);
deptKey varchar2(50);
deptName varchar2(1000);
sex number;
operateBPMFlag varchar2(2);   --工作流
personalStatus varchar(4);
personalSortNum number;
BEGIN
    --与kdb_teacher表进行连接，取得所需数据
    --SELECT MOBILE_PHONE INTO mobilePhone,WORK_PHONE into workPhone,DEPARTMENT_KEY into deptKey,DEPARTMENT_NAME into deptName,SEX into sex,PERSONNEL_STATUS into personalStatus  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT MOBILE_PHONE INTO mobilePhone  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;

    SELECT WORK_PHONE into workPhone  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT DEPARTMENT_KEY into deptKey FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT DEPARTMENT_NAME into deptName FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT SEX into sex  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT PERSONNEL_STATUS into personalStatus  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;
    SELECT SORT_NUM into personalSortNum  FROM wp_kdb_teacher where TEACHER_KEY=:new.USER_KEY and DELETE_FLAG=0;


    IF inserting THEN
        operateBPMFlag:='1';
    ELSIF updating THEN
        --STATUS_:0代表未激活，1代表激活
        if (:new.delete_flag='1' or (personalStatus<>'18' and personalStatus<>'04' and personalStatus<>'19' and personalStatus is not null)) or (:new.STATUS_=0 and :old.STATUS_=1) then
          --INSERT INTO SYNC_TEST  VALUES('我是wp_udb_user删除用户'||personalStatus,sysdate);
          operateBPMFlag:='3';
        elsif (:new.delete_flag='0' and :old.delete_flag='1') or (:new.STATUS_=1 and :old.STATUS_=0) then
          --INSERT INTO SYNC_TEST  VALUES('我是wp_udb_user新增用户'||personalStatus,sysdate);
          operateBPMFlag:='1';
        else
          --INSERT INTO SYNC_TEST  VALUES('我是wp_udb_user更新用户'||personalStatus,sysdate);
          operateBPMFlag:='2';
        end if;
    ELSE
        operateBPMFlag:='3';
    END IF;

    ----------------------------BPM同步开始------------------------
     insert into OA_BMP_SYNC(ID,TEACHER_KEY,TEACHER_NAME,MOBILE_PHONE,DEPT_KEY,WORK_PHONE,OPERATE,STATE,SORT_NUM,INSERTTIME) values(
        seq_oa_teacher_up_im.nextval ,
        :new.USER_KEY,
        :new.USER_NAME,
        mobilePhone,
        deptKey,
        workPhone,
        operateBPMFlag,
        '0',
        replace(lpad(to_char(personalSortNum),50),' ','0'),
        sysdate
    );
    ----------------------------BPM同步结束------------------------
END;
--*************************E 用户同步存储过程*****************************--
