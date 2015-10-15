--删除所有人员信息表数据
--1.获取所有需要删除的人员信息表delete语句
select 'delete ' || tablename || ';' from data_dictionary_defination where tablename !='ds_overall';

--2.执行第一步所产生的所有SQL语句

--删除所有业务办理相关数据
delete task_record;

--删除登陆验证表
delete recruit_account;

--删除招聘网站相关数据
delete from APPLICANTS;
delete from APPLICANTS_APPROVE;

--删除综合信息表相关数据
delete ds_overall where x__staff_id!='admin';
update DS_OVERALL t set t.x__create_time=sysdate,t.x__last_modify_time=sysdate   --同步信息用到的时间

--删除档案信息表相关数据
delete from ARCHIVES_OPERATING_RECORDS; 
delete from ARCHIVES; 
---删除考核信息相关数据
delete from ASSESS_DETAIL;
delete from ASSESS_YEAR_DETAIL;
delete from YEAR_ASSESS_SET;
---删除考勤信息相关数据
delete from ATTENDANCE_MANAGER;
delete from ATTENDANCE_MEETING_DETAIL;
delete from ATTENDANCE_MEETING_INFO;
delete from ATTENDANCE_MEETING_RECORD;
delete from ATTENDANCE_MONTH_STATEMENT;
delete from ATTENDANCE_OVERTIME;
--删除招聘相关信息
delete from RECRUIT_ACCOUNT;
delete from RECRUIT_AUDIT_STEP_DETAIL;
delete from RECRUIT_AUDIT_STEP_SETTING;
delete from RECRUIT_BATCH_SETTING;
delete from RECRUIT_NOTICE;
delete from RECRUIT_PLAN;

--删除岗位相关数据
delete from POSITION;
--删除人事调配
delete from STAFF_CAMPUS_DEPLOYMENT;
delete from STAFF_DEATH;
delete from STAFF_ENGAGE_POST;
delete from STAFF_ENTRY;
delete from STAFF_HISTORY;
delete from STAFF_POSITIVE;
delete from STAFF_POST_CHANGE;
delete from STAFF_REHELLORING;
delete from STAFF_RESIGNATION;
delete from STAFF_RETIREMENT;
--删除职称评审
delete from DUTY_REVIEW_APPLY;
delete from DUTY_REVIEW_CONTENT;

--删除部门信息
delete departments;



-----------------删除kdb数据--------------------


