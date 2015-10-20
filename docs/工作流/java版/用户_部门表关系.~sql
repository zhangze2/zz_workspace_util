-------------------kdb库---------------------------

select t.*, t.rowid from wp_kdb_department t; 
select t.*, t.rowid from wp_kdb_teacher t; 

--更新数据触发同步
update wp_kdb_department set last_update_date = sysdate; 
update wp_kdb_teacher set last_update_date = sysdate;

---------------------------------------------------
delete from BPM_ORGUSERLIST; -- 删除所有用户
delete from BPM_ORGDEPTLIST;-- 删除所有部门
delete from BPM_ORGUSERDEPTMAP;-- 删除所有用户--部门关系



--插入顶级部门
insert into BPM_ORGDEPTLIST d (WF_OrUnid,OrgClass,FolderName,ParentFolderid,Folderid,Deptid,
deptFlag, SortNumber, WF_LastModified) 
values('000', '1', '佛山职院', 'root', '000', '000',
'Department', '0', sysdate );

--更新二级部门顶级结点为 000
update bpm_orgdeptlist d set d.parentfolderid = '000' where wf_orunid != '000'


select * from BPM_ORGDEPTLIST for update ;--部门列表 BPM_OrgDeptList
select * from BPM_ORGUSERLIST;--所有用户数据表 BPM_OrgUserList
select * from BPM_ORGUSERDEPTMAP where userid = 'admin';--用户与部门的关系映谢表 BPM_OrgUserDeptMap




/*delete BPM_ORGUSERDEPTMAP ud
 where ud.deptid in
       (select d.wf_orunid
          from BPM_ORGDEPTLIST d
         start with d.parentfolderid = '002'
        CONNECT BY PRIOR d.wf_orunid = d.parentfolderid)*/
