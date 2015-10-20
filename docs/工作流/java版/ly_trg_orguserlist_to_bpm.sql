create or replace trigger ly_trg_orguserlist_to_bpm
after INSERT OR UPDATE OR DELETE  ON WP_KDB_TEACHER
FOR EACH ROW
DECLARE
V_COUNT_USER NUMBER;
V_COUNT_USERDEPART NUMBER;
BEGIN
    IF inserting or updating THEN 
        BEGIN
             --�ж��û��Ƿ����
             SELECT COUNT(*) INTO V_COUNT_USER FROM BPM.BPM_ORGUSERLIST WHERE WF_ORUNID=:NEW.TEACHER_KEY;
             IF V_COUNT_USER=0 THEN --������޸��û����ж�BPM.BPM_ORGDEPTLIST�û��Ƿ���ڣ������ڲ������û�����
                INSERT INTO BPM.BPM_ORGUSERLIST(WF_ORUNID,Userid,CnName,Password,PhoneNumber,QQ,LANG,Status,WF_DocCreated,WF_LastModified) 
                       VALUES(:NEW.TEACHER_KEY,:NEW.TEACHER_KEY,:NEW.TEACHER_NAME,
                              (SELECT PASSWORD_ FROM WP_UDB_USER WHERE USER_KEY=:NEW.TEACHER_KEY),
                              :NEW.MOBILE_PHONE,:NEW.QQ_,'zh,CN',DECODE(:NEW.PERSONNEL_STATUS,'18','1','07','0'),SYSDATE,SYSDATE
                       );
             ELSE
                IF :NEW.DELETE_FLAG=0 THEN --BPM.BPM_ORGDEPTLIST�û��������޸����ݱ�ʾ��Ч��ͬ���޸�BPM.BPM_ORGDEPTLIST����
                     UPDATE BPM.BPM_ORGUSERLIST SET CnName=:NEW.TEACHER_NAME,
                                                    Password=(SELECT PASSWORD_ FROM WP_UDB_USER WHERE USER_KEY=:NEW.TEACHER_KEY),
                                                    PhoneNumber= :NEW.MOBILE_PHONE,
                                                    QQ=:NEW.QQ_,
                                                    Status=DECODE(:NEW.PERSONNEL_STATUS,'18','1','07','0'),
                                                    WF_LastModified=SYSDATE
                            WHERE  WF_OrUnid=:NEW.TEACHER_KEY;                     
                ELSE  --�û���Ч��ͬ��ɾ��BPM.BPM_ORGDEPTLIST����
                     DELETE BPM.BPM_ORGUSERLIST WHERE WF_OrUnid=:NEW.TEACHER_KEY; 
                     DELETE BPM.BPM_ORGUSERDEPTMAP WHERE WF_OrUnid=:NEW.TEACHER_KEY; 
                END IF;
             END IF;   
            
             --�ж��û����Ź�ϵ�������Ƿ����
             SELECT COUNT(*) INTO V_COUNT_USERDEPART FROM BPM.BPM_ORGUSERDEPTMAP WHERE WF_ORUNID=:NEW.TEACHER_KEY;
             IF V_COUNT_USERDEPART=0 THEN
                INSERT INTO BPM.BPM_ORGUSERDEPTMAP(WF_ORUNID,ORGCLASS,USERID,FOLDERID,DEPTID,CURRENTFLAG,MAINDEPT)
                       VALUES(:NEW.TEACHER_KEY,'1',:NEW.TEACHER_KEY,:NEW.DEPARTMENT_KEY,:NEW.DEPARTMENT_KEY,'1','1');
             ELSE
                UPDATE BPM.BPM_ORGUSERDEPTMAP SET FOLDERID=:NEW.DEPARTMENT_KEY,
                                                  DEPTID=:NEW.DEPARTMENT_KEY
                      WHERE WF_ORUNID=:NEW.TEACHER_KEY;
             END IF;
        END;
    ELSE --����ɾ����ͬ��ɾ��BPM.BPM_ORGDEPTLIST����
         BEGIN
             DELETE BPM.BPM_ORGUSERLIST WHERE WF_OrUnid=:NEW.TEACHER_KEY; 
             DELETE BPM.BPM_ORGUSERDEPTMAP WHERE WF_OrUnid=:NEW.TEACHER_KEY; 
         END;
    END IF;

END;
