-----------------------------------------------------------
----------2013-11-25后 广外艺人事版本脚本更新-------------------
-----------------------------------------------------------

update DM_DEF_ASSESS_CONCLUSION dd set dd.name = '待定' ,dd.remark = '待定' where dd.codeid = '8';

-----------------------------------------------------------
----------2014-04-01后 民航人事版本脚本更新-------------------
-----------------------------------------------------------

--------------------------组织机构－－编制管理---------------------------------
create table ORG_AUTHSORT
(
   guuid 				VARCHAR2(50),
	authsort_key        VARCHAR2(50),
   AUTHSORT_NAME     	VARCHAR2(50),
   DEPARTMENT_KEY       VARCHAR2(50),
   DEPARTMENT_NAME      VARCHAR2(50),
   IS_EFFECT         CHAR(1),
   AUTHSORT_NUM       INTEGER,
   primary key (guuid)
);
-- Add comments to the columns 
comment on column ORG_AUTHSORT.authsort_key
  is '编制类别id';
comment on column ORG_AUTHSORT.authsort_name
  is '编制类别';
comment on column ORG_AUTHSORT.department_key
  is '部门key';
comment on column ORG_AUTHSORT.department_name
  is '部门';
comment on column ORG_AUTHSORT.is_effect
  is '是否启用';
comment on column ORG_AUTHSORT.authsort_num
  is '编制控制数';
  
--------------------------组织机构－－编制管理---------------------------------
  
  create table org_position_type
(
   	guuid 				VARCHAR2(50),
	position_type_key        VARCHAR2(50),
   	position_type_name     	VARCHAR2(50),
   	department_key       VARCHAR2(50),
   	department_name      VARCHAR2(50),
   	is_effect         CHAR(1),
   	position_num       INTEGER,
  	primary key (guuid)
);
-- Add comments to the columns 
comment on column ORG_POSITION_TYPE.position_type_key
  is '岗位类别';
comment on column ORG_POSITION_TYPE.position_type_name
  is '岗位类别';
comment on column ORG_POSITION_TYPE.department_key
  is '所属部门Id';
comment on column ORG_POSITION_TYPE.department_name
  is '所属部门名称';
comment on column ORG_POSITION_TYPE.is_effect
  is '是否现有岗位（是否启用）';
comment on column ORG_POSITION_TYPE.position_num
  is '岗位控制数';

---------------------------------------------
-----岗位表添加字段 2014---------------------------   
alter table  POSITION add AUTHSORT_KEY varchar2(50); 
alter table  POSITION add AUTHSORT_NAME varchar2(100); 

-----------------------------------------------------------
----------2013-12-19-校内调动表增加字段-------------------
-----------------------------------------------------------
alter table staff_campus_deployment add CURRENT_DEPT_KEY varchar2(50);
 comment on column staff_campus_deployment.current_dept_key is '调动前部门key';
 
alter table  staff_campus_deployment add STATUS varchar2(10); 


------------------------------------------------
		---- 社保表（失业方面）
-----------------------------------------------
-- Create table
create table S_IMP_SOCIAL_UNEMPLOY_MEDICAL
(
  imp_id    VARCHAR2(40) not null,
  STAFF_NAME             VARCHAR2(40),
  IDENTIFY_CARD          VARCHAR2(40),
  SOCIAL_NUMBER          VARCHAR2(40),
  SALARY_WAGE            NUMBER(38,3),
  BILLING_SALARY         NUMBER(38,3),
  UNIT_UNEMPLOYMENT      NUMBER(38,3),
  PERSONAL_UNEMPLOYMENT  NUMBER(38,3),
  UNIT_UNEMP_WORKER      NUMBER(38,3),
  UNIT_BASIC_MEDICAL     NUMBER(38,3),
  PERSONAL_BASIC_MEDICAL NUMBER(38,3),
  UNIT_SICK              NUMBER(38,3),
  UNIT_TRANSIT_MEDICAL   NUMBER(38,3),
  PERSONAL_PAY_TOTAL     NUMBER(38,3),
  UNIT_PAY_TOTAL         NUMBER(38,3),
  SHOULD_PAY             NUMBER(38,3),
  YEAR                   VARCHAR2(10),
  MONTH                  VARCHAR2(10),
  primary key (imp_id)
);
-- Add comments to the columns 
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.imp_id
  is '表ID';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.IDENTIFY_CARD
  is '身份证号';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.SOCIAL_NUMBER
  is '个人社保号';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.SALARY_WAGE
  is '工资薪金';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.BILLING_SALARY
  is '计费工资';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_UNEMPLOYMENT
  is '失业保险  单位';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.PERSONAL_UNEMPLOYMENT
  is '失业保险  个人';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_UNEMP_WORKER
  is '失业保险(农民工)  单位';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_BASIC_MEDICAL
  is '基本医疗保险 单位';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.PERSONAL_BASIC_MEDICAL
  is '基本医疗保险 个人';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_SICK
  is '重大疾病医疗补助  单位';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_TRANSIT_MEDICAL
  is '过渡性基本医疗保险金 单位';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.PERSONAL_PAY_TOTAL
  is '个人合计';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.UNIT_PAY_TOTAL
  is '单位合计';
comment on column S_IMP_SOCIAL_UNEMPLOY_MEDICAL.SHOULD_PAY
  is '应缴金额';
-----------------------------------------------------------
----------2014-08-26-查找 岗位占岗及空岗等信息 视图-------------------
-----------------------------------------------------------


CREATE OR REPLACE VIEW LY_VIEW_POSITION_FACT_COUNT AS
SELECT p.position_key,p.pre_person_count,p.position_name,p.is_effect,p.department_key,p.department_name,
(select COUNT(*) from STAFF_ENGAGE_POST t WHERE t.position_key = p.position_key AND t.status='1') fact_count,
(p.pre_person_count - (select COUNT(*) from STAFF_ENGAGE_POST t WHERE t.position_key = p.position_key)) empty_count
FROM  position p
LEFT JOIN STAFF_ENGAGE_POST t ON t.position_key = p.position_key
WHERE t.status = 1 OR t.status IS NULL
GROUP BY p.position_key,p.pre_person_count,p.position_name,p.is_effect,p.department_key,p.department_name;

-----------------------------------------------------------
----------2014-09-02-岗位表-------------------
-----------------------------------------------------------
alter table POSITION add is_effect varchar2(10); 
comment on column POSITION.is_effect
  is '是否现有岗位';
  
----------2014-09-05-聘岗表-------------------  
alter table STAFF_ENGAGE_POST add is_major varchar2(10); 
comment on column STAFF_ENGAGE_POST.is_major
  is '是否主岗'; 
  
alter table STAFF_REHELLORING add is_major varchar2(10); 
comment on column STAFF_REHELLORING.is_major
  is '是否主岗'; 
  
--------------------------------------------2014-09-09
---招聘公告附件字段
-- Add/modify columns 
alter table R_ANNOUNCEMENT add file_id VARCHAR2(1000);
-- Add comments to the columns 
comment on column R_ANNOUNCEMENT.file_id
  is '附件id';
  
----------2014-09-24------人事调配竞岗岗位--拟定人员id、姓名字段修改为clob类型
-- Add/modify columns 
CREATE TABLE table_temp_post AS
SELECT t.compete_post_id,t.judges_build, t.default_staff_id,t.default_staff_name from STAFF_ENGAGE_COMPETE_POST t;
UPDATE STAFF_ENGAGE_COMPETE_POST t SET t.judges_build = NULL, t.default_staff_id = NULL, t.default_staff_name = NULL;
COMMIT;
ALTER TABLE STAFF_ENGAGE_COMPETE_POST DROP (judges_build,default_staff_id,default_staff_name);
ALTER TABLE STAFF_ENGAGE_COMPETE_POST ADD (judges_build CLOB,default_staff_id CLOB,default_staff_name CLOB);
UPDATE STAFF_ENGAGE_COMPETE_POST t 
SET t.judges_build = (SELECT tem.judges_build FROM table_temp_post tem WHERE tem.compete_post_id = t.compete_post_id), 
t.default_staff_id = (SELECT tem.default_staff_id FROM table_temp_post tem WHERE tem.compete_post_id = t.compete_post_id), 
t.default_staff_name = (SELECT tem.default_staff_name FROM table_temp_post tem WHERE tem.compete_post_id = t.compete_post_id); 
COMMIT;
DROP TABLE table_temp_post;
--------------------------------------------2014-09-30
  -----------人才项目成果信息表
  -- Create table
create table SZ_PROJECT_RESULT
(
  global_id         VARCHAR2(60) not null,
  project_global_id VARCHAR2(60),
  result_name       VARCHAR2(500),
  result_type       VARCHAR2(60),
  result_level      VARCHAR2(60),
  is_secret         NUMBER,
  grant_org         VARCHAR2(1000),
  get_time          DATE,
  file_id           VARCHAR2(1000),
  remark            VARCHAR2(1000)
);
-- Add comments to the table 
comment on table SZ_PROJECT_RESULT
  is '人才项目成果信息表';
-- Add comments to the columns 
comment on column SZ_PROJECT_RESULT.global_id
  is '成果id';
comment on column SZ_PROJECT_RESULT.project_global_id
  is '人才项目id';
comment on column SZ_PROJECT_RESULT.result_name
  is '成果名称';
comment on column SZ_PROJECT_RESULT.result_type
  is '成果类别';
comment on column SZ_PROJECT_RESULT.result_level
  is '成果级别';
comment on column SZ_PROJECT_RESULT.is_secret
  is '是否保密';
comment on column SZ_PROJECT_RESULT.grant_org
  is '成果授予单位';
comment on column SZ_PROJECT_RESULT.get_time
  is '获取时间';
comment on column SZ_PROJECT_RESULT.file_id
  is '附件id';
comment on column SZ_PROJECT_RESULT.remark
  is '备注';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SZ_PROJECT_RESULT
  add constraint PK_SZ_PROJECT_RESULT primary key (GLOBAL_ID);
  
-----------------招聘公告类别名称字段长度设置--------1014-10-15-----------------------  
-- Add/modify columns 
alter table R_ANNOUNCEMENT_TYPE modify name VARCHAR2(500);

-----------招聘系统--应聘历史人员信息表字段添加置顶和操作时间字段----2014-10-15---------
-- Add/modify columns 
alter table R_HISTORY_RESUME add top_flag VARCHAR2(2) default 0;
alter table R_HISTORY_RESUME add operate_time DATE;
-- Add comments to the columns 
comment on column R_HISTORY_RESUME.top_flag
  is '是否置顶';
comment on column R_HISTORY_RESUME.operate_time
  is '操作时间';
  
  
  
  -------------------------------------------------------  
-------将人员信息学习经历管理改成通用模式（20141204）--  
--------------------------------------------------------  
update data_dictionary_defination dd set dd.dictionaryid = '21' where dd.tablename = 'dd_education_experience' ;  
   
update recruit_resume_definition rr set rr.dictionary_defination_id = '21' where rr.resume_definition_table_name = 'dd_education_experience';  
   
update task_definition td set td.dictionary_defination_id = '21' where td.task_definition_table_name = 'dd_education_experience';  
   
update mine_info_definition md set md.data_dictionary_id = '21' where md.data_dictionary_id = '2';  


-----------招聘管理系统---招聘岗位需求----增加字段--2014-12-16---------
-- Add/modify columns 
alter table R_POST add telephone VARCHAR2(60) ;
alter table R_POST add applicant VARCHAR2(60) ;
alter table R_POST add exam_type VARCHAR2(60) ;
alter table R_POST add score_calc_method VARCHAR2(60) ;
-- Add comments to the columns 
comment on column R_POST.telephone
  is '联系电话';
comment on column R_POST.applicant
  is ' 申请人';
comment on column R_POST.exam_type
  is '考试方式';
comment on column R_POST.score_calc_method
  is ' 成绩计算办法';
  
  
  alter table r_history_resume add telephone VARCHAR2(60) ;
alter table r_history_resume add applicant VARCHAR2(60) ;
alter table r_history_resume add exam_type VARCHAR2(60) ;
alter table r_history_resume add score_calc_method VARCHAR2(60) ;
-- Add comments to the columns 
comment on column r_history_resume.telephone
  is '联系电话';
comment on column r_history_resume.applicant
  is ' 申请人';
  comment on column r_history_resume.exam_type
  is '考试方式';
comment on column r_history_resume.score_calc_method
  is ' 成绩计算办法';

  alter table R_APPLY add telephone VARCHAR2(60) ;
alter table R_APPLY add applicant VARCHAR2(60) ;
alter table R_APPLY add exam_type VARCHAR2(60) ;
alter table R_APPLY add score_calc_method VARCHAR2(60) ;
-- Add comments to the columns 
comment on column R_APPLY.telephone
  is '联系电话';
comment on column R_APPLY.applicant
  is ' 申请人';
  comment on column R_APPLY.exam_type
  is '考试方式';
comment on column R_APPLY.score_calc_method
  is ' 成绩计算办法';
 -----------招聘管理系统---公告岗位表----增加表--2014-12-24---------
 
  
  create table r_announcement_post
(
  global_id         VARCHAR2(60) not null,
  announcement_global_id VARCHAR2(60),
  post_global_id       VARCHAR2(60)
);
-- Add comments to the table 
comment on table r_announcement_post
  is '公告岗位中间表';
-- Add comments to the columns 
comment on column r_announcement_post.global_id
  is '主键';
comment on column r_announcement_post.announcement_global_id
  is '公告ID';
comment on column r_announcement_post.post_global_id
  is '岗位ID';
  
 --增大 
alter table R_APPLY modify (Major varchar2(300)); 


 -----------继续教育类别表-----增加字段--2015-01-20---------
alter table SZ_CTEC_CATEGORY add _year NUMBER;

alter table SZ_CTEC_CATEGORY add category_budget NUMBER;  

alter table SZ_CTEC_CATEGORY add PURVIEW_LEVEL varchar2(60)  ;

comment on column SZ_CTEC_CATEGORY._year  is '年份';
comment on column SZ_CTEC_CATEGORY.category_budget  is '预算';
comment on column SZ_CTEC_CATEGORY.PURVIEW_LEVEL  is '权限级别';


 -----------应聘管理申请表-----增加字段--2015-01-20---------
alter table r_apply add pass_flag varchar2(60)  ;
comment on column r_apply.pass_flag  is '资格审查是否通过标识：（0：不通过，1：通过）';

 -----------继续教育实施表-----增加字段--2015-03-2---------
alter table sz_ctec_comply add apply_person varchar2(50)  ;
comment on column sz_ctec_comply.apply_person  is '申请人';


 -----------项目成果表-----增加字段--2015-03-12---------
alter table  SZ_PROJECT_RESULT add RESULT_GET_TYPE number(1); 
alter table  SZ_PROJECT_RESULT add GET_RESULT_PERSON varchar2(50); 
comment on column SZ_PROJECT_RESULT.RESULT_GET_TYPE  is '成果获得者类型';
comment on column SZ_PROJECT_RESULT.GET_RESULT_PERSON  is '成果获得者';


 -----------继续教育类别表-----增加字段--2015-03-13---------
alter table  SZ_CTEC_CATEGORY add PURVIEW_LEVEL_TYPE number(1); 

comment on column SZ_CTEC_CATEGORY.PURVIEW_LEVEL_TYPE
  is '权限级别类型（0：校级，1：二级机构）';
  
  alter table  SZ_CTEC_CATEGORY add FUNDS number(8); 

comment on column SZ_CTEC_CATEGORY.FUNDS
  is '经费';
  
alter table  SZ_CTEC_CATEGORY add APPLY_YEAR date; 

comment on column SZ_CTEC_CATEGORY.APPLY_YEAR
  is '申请年度';
  
-----------信息采集-流程节点表-----增加字段--2015-03-16---------
alter table info_node_definition add 
DYNAMIC_RULE  clob; 
comment on column info_node_definition.DYNAMIC_RULE
  is '动态规则'; 
  
  
 -----------项目成果表-----增加字段--2015-03-18---------
alter table  SZ_PROJECT_RESULT add GET_RESULT_TEAM varchar2(50); 
comment on column SZ_PROJECT_RESULT.GET_RESULT_TEAM  is '成果获得团队';

 -----------继续教育计划表-----增加字段--2015-03-26---------
 alter table SZ_CTEC_PLAN add address_detail VARCHAR2(100);
comment on column SZ_CTEC_PLAN.address_detail
  is '培训人单位或地点';
  
  
  --增加字段：部门key、项目类别、批准经费 
alter table sz_ctec_budget add department_key varchar2(60);
 comment on column sz_ctec_budget.department_key is '部门key';
 
  alter table sz_ctec_budget add CATEGORY_id varchar2(60);
 comment on column sz_ctec_budget.CATEGORY_id is '项目类别id';
 
 alter table sz_ctec_budget add agree_fund number(20,2);
 comment on column sz_ctec_budget.agree_fund is '批准经费';
  is '培训人单位或地点';
  
  -----------项目成果添加流程字段-----增加字段--2015-03-27---------
 alter table SZ_PROJECT_RESULT add wf_docstatus VARCHAR2(100);
comment on column SZ_PROJECT_RESULT.wf_docstatus
  is '审批状态';
    
alter table SZ_PROJECT_RESULT add wf_currentnodeid VARCHAR2(100);
comment on column SZ_PROJECT_RESULT.wf_currentnodeid
  is '审批节点';
    
alter table SZ_PROJECT_RESULT add wf_docunid VARCHAR2(100);
comment on column SZ_PROJECT_RESULT.wf_docunid
  is '单号';  
 alter table SZ_PROJECT_RESULT add wf_processunid VARCHAR2(100);
comment on column SZ_PROJECT_RESULT.wf_processunid
  is '流程号';