create or replace trigger ly_trg_department_to_bpm
after INSERT OR UPDATE OR DELETE  ON wp_kdb_department
FOR EACH ROW
DECLARE
V_COUNT NUMBER;
BEGIN
    IF inserting or updating THEN
       --�жϲ����Ƿ����
       SELECT COUNT(*) INTO V_COUNT FROM BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY;
       IF V_COUNT=0 THEN --������޸Ĳ��ţ��ж�BPM.BPM_ORGDEPTLIST�����Ƿ���ڣ������ڲ����²�������
          INSERT INTO BPM.BPM_ORGDEPTLIST(WF_OrUnid,OrgClass,FolderName,ParentFolderid,Folderid,Deptid,deptFlag,SortNumber,WF_LastModified) 
                 VALUES(:NEW.DEPARTMENT_KEY,'1',:NEW.DEPARTMENT_NAME,DECODE(:NEW.PARENT_KEY,'-1','root',:NEW.PARENT_KEY),:NEW.DEPARTMENT_KEY,
                        :NEW.DEPARTMENT_KEY,'Department',:NEW.SORT_NUM,SYSDATE);
       ELSE
          IF :NEW.DELETE_FLAG=0 THEN --BPM.BPM_ORGDEPTLIST���Ŵ������޸����ݱ�ʾ��Ч��ͬ���޸�BPM.BPM_ORGDEPTLIST����
               UPDATE BPM.BPM_ORGDEPTLIST SET FolderName=:NEW.DEPARTMENT_NAME,
                                              SortNumber=:NEW.SORT_NUM,
                                              WF_LastModified=SYSDATE
                      WHERE  WF_OrUnid=:NEW.DEPARTMENT_KEY;                     
          ELSE  --������Ч��ͬ��ɾ��BPM.BPM_ORGDEPTLIST����
               DELETE BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY;      
          END IF;
       END IF;  
    ELSE --����ɾ����ͬ��ɾ��BPM.BPM_ORGDEPTLIST����
       DELETE BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY; 
    END IF;
    
END;
