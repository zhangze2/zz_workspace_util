create or replace trigger ly_trg_department_to_bpm
after INSERT OR UPDATE OR DELETE  ON wp_kdb_department
FOR EACH ROW
DECLARE
V_COUNT NUMBER;
BEGIN
    IF inserting or updating THEN
       --判断部门是否存在
       SELECT COUNT(*) INTO V_COUNT FROM BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY;
       IF V_COUNT=0 THEN --插入或修改部门，判断BPM.BPM_ORGDEPTLIST部门是否存在，不存在插入新部门数据
          INSERT INTO BPM.BPM_ORGDEPTLIST(WF_OrUnid,OrgClass,FolderName,ParentFolderid,Folderid,Deptid,deptFlag,SortNumber,WF_LastModified) 
                 VALUES(:NEW.DEPARTMENT_KEY,'1',:NEW.DEPARTMENT_NAME,DECODE(:NEW.PARENT_KEY,'-1','root',:NEW.PARENT_KEY),:NEW.DEPARTMENT_KEY,
                        :NEW.DEPARTMENT_KEY,'Department',:NEW.SORT_NUM,SYSDATE);
       ELSE
          IF :NEW.DELETE_FLAG=0 THEN --BPM.BPM_ORGDEPTLIST部门存在且修改数据标示有效，同步修改BPM.BPM_ORGDEPTLIST数据
               UPDATE BPM.BPM_ORGDEPTLIST SET FolderName=:NEW.DEPARTMENT_NAME,
                                              SortNumber=:NEW.SORT_NUM,
                                              WF_LastModified=SYSDATE
                      WHERE  WF_OrUnid=:NEW.DEPARTMENT_KEY;                     
          ELSE  --部门无效，同步删除BPM.BPM_ORGDEPTLIST数据
               DELETE BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY;      
          END IF;
       END IF;  
    ELSE --数据删除后，同步删除BPM.BPM_ORGDEPTLIST数据
       DELETE BPM.BPM_ORGDEPTLIST WHERE WF_OrUnid=:NEW.DEPARTMENT_KEY; 
    END IF;
    
END;
