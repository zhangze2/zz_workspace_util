---------------------------------------------
               --2013-4-15后脚本文件--
---------------------------------------------
------2013-4-19
alter table LZ_TEACHER_SALARY_RECORD modify(PERSONNEL_SORT varchar2(100));  --扩展字段长度 
alter table LZ_FLOW_POST_MAINTENANCE add CHANGE_POST_TIME DATE; --变岗时间

delete lz_other_maintenance lz where lz.other_maintenance_id = 'OCFG0018';
insert into lz_other_maintenance (OTHER_MAINTENANCE_ID, PARENT_ITEM_NAME, PARENT_ITEM_ID, ITEM_NAME, ITEM_ID, ITEM_VALUE)
values ('OCFG0018', '流动人员', 'salary_config_2', '生活补贴(元)', 'live_allowance', 400);--流动生活补贴设定值

--------------------------------------------
----------删除综合表测试字段-------------------
--------------------------------------------
alter table DS_OVERALL drop column brith;
alter table DS_OVERALL drop column temp1; 
alter table DS_OVERALL drop column temp;



-------------------------------------------
-----------修改部门名称长度------------------
-------------------------------------------
alter table business_apply  modify (department_name varchar2(255)); 
alter table business_audit_history  modify (audit_opinion varchar2(255));
alter table business_audit_record modify (department_name varchar2(255));  
alter table contract modify (department_name varchar2(255));
alter table recruit_audit_step_detail modify(audit_department_name varchar2(255));
alter table recruit_plan modify(recruit_department_name varchar2(255));


--------------------------------------------
--------就高就低设置中间表----------2013-05-28
--------------------------------------------
create table LZ_CHOOSE_CHANGE_SETTING
(
  CHOOSE_SETTING_ID   VARCHAR2(50) not null,
  STAFF_ID            VARCHAR2(50),
  SALARY_SCORE        NUMBER(20,2),
  DUTY_ALLOWANCE      NUMBER(20,2),
  COMMUNICATION_COSTS NUMBER(20,2),
  PAYMENT             CHAR(1),
  DUTY_RANK           VARCHAR2(40),
  DUTY_RANK_ID        VARCHAR2(40),
  DUTY_CALL           VARCHAR2(40),
  DUTY_CALL_ID        VARCHAR2(40),
  DUTY_RANK_SCORE     NUMBER,
  DUTY_CALL_SCORE     NUMBER,
  RANK_ALLOWANCE      NUMBER,
  CALL_ALLOWANCE      NUMBER,
  RANK_COSTS          NUMBER,
  CALL_COSTS          NUMBER,
  POST_NAME           VARCHAR2(100),
  POST_KEY            VARCHAR2(40)
);
-- Add comments to the table 
comment on table LZ_CHOOSE_CHANGE_SETTING
  is '就高就低设置表';
-- Add comments to the columns 
comment on column LZ_CHOOSE_CHANGE_SETTING.CHOOSE_SETTING_ID
  is '主键';
comment on column LZ_CHOOSE_CHANGE_SETTING.STAFF_ID
  is '职工号';
comment on column LZ_CHOOSE_CHANGE_SETTING.SALARY_SCORE
  is '工资分值';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_ALLOWANCE
  is '工资责任津贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.COMMUNICATION_COSTS
  is '通讯补贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.PAYMENT
  is '是否福利分房';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_RANK
  is '职级';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_RANK_ID
  is '职级id';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_CALL
  is '职称';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_CALL_ID
  is '职称id';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_RANK_SCORE
  is '职级分值';
comment on column LZ_CHOOSE_CHANGE_SETTING.DUTY_CALL_SCORE
  is '职称分值';
comment on column LZ_CHOOSE_CHANGE_SETTING.RANK_ALLOWANCE
  is '职级责任津贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.CALL_ALLOWANCE
  is '职称责任津贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.RANK_COSTS
  is '职级通讯补贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.CALL_COSTS
  is '职称通讯补贴';
comment on column LZ_CHOOSE_CHANGE_SETTING.POST_NAME
  is '职务名称';
-- Create/Recreate primary, unique and foreign key constraints 
alter table LZ_CHOOSE_CHANGE_SETTING
  add constraint LZ_CHOOSE_CHANGE_SETTING primary key (CHOOSE_SETTING_ID);
  
 alter table LZ_CHOOSE_CHANGE_SETTING add  ENGAGE_POST_KEY VARCHAR2(50); --标识聘岗字段
 alter table LZ_CHOOSE_HIGH_LOW add  ENGAGE_POST_KEY VARCHAR2(50); --标识聘岗字段

 --------------------------------------------
--------增加消息记录表字段----------2013-07-10
--------------------------------------------
 alter table MESSAGE_REMIND_RECORD add  RELATED_PERSON_ID VARCHAR2(100); --关联人ID
 alter table MESSAGE_REMIND_RECORD add  RELATED_PERSON VARCHAR2(100); --关联人
 
 -- Add comments to the columns 
comment on column MESSAGE_REMIND_RECORD.RELATED_PERSON_ID
  is '关联人ID';
comment on column MESSAGE_REMIND_RECORD.RELATED_PERSON
  is '关联人';
  
 --------------------------------------------
--------增加校园通知表字段----------2013-07-10
--------------------------------------------
 alter table CAMPUS_NOTICE add  FILE_KEY VARCHAR2(100);  --文件KEY
 alter table CAMPUS_NOTICE add  FILE_NAME VARCHAR2(255); --文件名
 alter table CAMPUS_NOTICE add  FILE_PATH VARCHAR2(255); --文件路径
 
 -- Add comments to the columns 
comment on column CAMPUS_NOTICE.FILE_KEY
  is '文件KEY';
comment on column CAMPUS_NOTICE.FILE_NAME
  is '文件名';
comment on column CAMPUS_NOTICE.FILE_PATH
  is '文件路径';
  
  
--------------------------------------------
--------增加消息配置表字段----------2013-8-22 
--------------------------------------------
alter table MESSAGE_REMIND_CONFIG add  EFFECT_STATUS CHAR(1); 
-- Add comments to the columns 
comment on column MESSAGE_REMIND_CONFIG.EFFECT_STATUS
  is '失效状态（0：失效，1：有效）';
  
--------------------------------------------
--------增加消息记录表字段----------2013-8-27 
--------------------------------------------
alter table MESSAGE_REMIND_RECORD add  BUSINESS_KEY VARCHAR2(100); 
-- Add comments to the columns 
comment on column MESSAGE_REMIND_RECORD.BUSINESS_KEY
  is '业务关键Key';
  
--------------------------------------------
--------增加发送表----------2013-8-28 
--------------------------------------------
  
-- Create table
create table MESSAGE_REMIND_SEND
(
  send_id          VARCHAR2(50) not null,
  message_id       VARCHAR2(50) not null,
  accept_person    VARCHAR2(100),
  accept_person_id VARCHAR2(100),
  isread           CHAR(1),
  remind_items_id  VARCHAR2(50),
  remind_items     VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column MESSAGE_REMIND_SEND.send_id
  is '主键';
comment on column MESSAGE_REMIND_SEND.message_id
  is '消息提醒主键';
comment on column MESSAGE_REMIND_SEND.accept_person
  is '接收人';
comment on column MESSAGE_REMIND_SEND.accept_person_id
  is '接收人Id';
comment on column MESSAGE_REMIND_SEND.isread
  is '是否阅读(0:否，1：是)';
comment on column MESSAGE_REMIND_SEND.remind_items_id
  is '提醒项';
comment on column MESSAGE_REMIND_SEND.remind_items
  is '提醒项'; 
  -- Create/Recreate primary, unique and foreign key constraints 
alter table MESSAGE_REMIND_SEND
  add primary key (SEND_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
  
  
  
  
----------------------------------------------------------------------
--------------2013-09-12考核模块考核结果代码集修改------------------------------
delete DM_DEF_ASSESS_CONCLUSION;

insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('1','优秀','1','-1','1','0','1','优秀');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('2','合格','2','-1','1','0','1','合格');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('3','基本合格','3','-1','1','0','1','基本合格');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('4','不合格','4','-1','1','0','1','不合格');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('5','不定等次','5','-1','1','0','1','不定等次');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('6','不参加考核','6','-1','1','0','1','不参加考核');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('7','优秀(候选)','7','-1','1','0','1','优秀(候选)');
insert into DM_DEF_ASSESS_CONCLUSION (CODEID,NAME,ORDERID,PARENTID,DISPLAY,DEPRECATED,SELECTABLE,REMARK)
values('8','优秀(待定)','8','-1','1','0','1','优秀(待定)');
--------------------------------------------
--------校内通知表.title字段长度修改----------2013-9-16 
--------------------------------------------  
alter table CAMPUS_NOTICE modify  TITLE VARCHAR2(100); 


--------------------------------------------
--------增加招聘网站 －账户表字段----------2013-9-17 
--------------------------------------------
  alter table RECRUIT_ACCOUNT add ID_CARD VARCHAR2(25);
-- Add comments to the columns 
comment on column RECRUIT_ACCOUNT.ID_CARD
  is '身份证号';
--------------------------------------------
--------增加招聘网站 －申请人表字段----------2013-9-17 
--------------------------------------------
  alter table APPLICANTS add ID_CARD VARCHAR2(25);
-- Add comments to the columns 
comment on column APPLICANTS.ID_CARD
  is '身份证号';
  
--------------------------------------------
--------系统配置表－－插入招聘网站注册页配置语句-----2013-9-17 
--------------------------------------------
INSERT INTO sys_config (KEY, VALUE) 
VALUES ('register_config', '{"phoneEnable":false,"emailEnable":true,"idCardEnable":true}')

--------------------------------------------
--------招聘通知表.title字段长度修改----------2013-11-19 
--------------------------------------------  
alter table RECRUIT_NOTICE modify  TITLE VARCHAR2(100); 


-----------------------------------------------------------
----------2013-11-07 人事版本jira上脚本更新-------------------
-----------------------------------------------------------

-----人事调配--------
alter table STAFF_HISTORY modify(CHANGE_REASON varchar2(200)); 
alter table STAFF_HISTORY modify(CHANGE_DESC varchar2(500)); 

----简历模板定义------
alter table RECRUIT_RESUME_DEFINITION modify(RESUME_DEFINITION_TABLE_NAME varchar2(50));
alter table RECRUIT_RESUME_DEFINITION modify(RESUME_DEFINITION_TABLE_TITLE varchar2(100));

--人事招聘----
alter table RECRUIT_BATCH_SETTING modify(BATCH_NAME varchar2(100));

--------------------------------------------
--------人才招聘－审核－部门字段、步骤名长度修改----------2013-11-19 
-------------------------------------------- 

alter table AUDIT_LOGGING modify AUDIT_DEPARTMENT_ID VARCHAR2(200);
alter table AUDIT_LOGGING modify CURRENT_STEP_NAME VARCHAR2(200);

--------------------------------------------
--------招聘通知表.title字段长度修改----------2013-11-19 
--------------------------------------------  
alter table RECRUIT_NOTICE modify  TITLE VARCHAR2(100); 
--------------------------------------------
--------人员变动历史表.CHANGE_DESC字段长度修改----------2013-11-20 
--------------------------------------------  
alter table STAFF_HISTORY modify  CHANGE_DESC VARCHAR2(500); 

----待办事项审批意见字段长度修改--------
alter table BUSINESS_AUDIT_HISTORY modify(AUDIT_OPINION varchar2(100));
alter table BUSINESS_AUDIT_RECORD modify(AUDIT_OPINION varchar2(100));

--------人事调配：入职表、职务调动、校内调动表字段长度修改----------
alter table STAFF_ENTRY modify  REMARK VARCHAR2(500); 
alter table STAFF_POST_CHANGE modify  DISMISSAL_REASON VARCHAR2(500); 
alter table STAFF_REHELLORING modify  REMARK VARCHAR2(500); 

------国内进修字段长度修改-------------
alter table guoneijinxiu modify (LASTMODIFYTIME varchar2(100)) ; 

----------------------------------------------------------------------------------
--------删除消息记录表 接收人和接收人ID 字段（冗余）----------2013-11-21
----------------------------------------------------------------------------------
alter table MESSAGE_REMIND_RECORD drop column  accept_person_id;
alter table MESSAGE_REMIND_RECORD drop column  accept_person;




