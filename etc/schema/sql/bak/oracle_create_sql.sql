-------------------------------------------------
-- Export file for user LYHR                   --
-- Created by mingkong on 2012-10-18, 10:39:28 --
-------------------------------------------------

spool my.log

prompt
prompt Creating table APPLICANTS
prompt =========================
prompt
create table APPLICANTS
(
  APPLICANTS_KEY  VARCHAR2(40) not null,
  USER_NAME       VARCHAR2(100),
  USER_SEX        NUMBER(2),
  USER_EMAIL      VARCHAR2(100),
  BATCH_KEY       VARCHAR2(100),
  BATCH_NAME      VARCHAR2(100),
  PLAN_KEY        VARCHAR2(100),
  PLAN_NAME       VARCHAR2(100),
  DEPARTMENT_KEY  VARCHAR2(100),
  DEPARTMENT_NAME VARCHAR2(100),
  POSITION_KEY    VARCHAR2(100),
  POSITION_NAME   VARCHAR2(100),
  SOURCE_         NUMBER(2),
  STATUS_         NUMBER(2),
  CREATE_TIME     TIMESTAMP(6)
)
;
alter table APPLICANTS
  add primary key (APPLICANTS_KEY);

prompt
prompt Creating table APPLICANTS_APPROVE
prompt =================================
prompt
create table APPLICANTS_APPROVE
(
  APPLICANTS_APPROVE_KEY VARCHAR2(40) not null,
  APPLICANTS_KEY         VARCHAR2(40),
  APPLICANT_STATUS       NUMBER(2),
  SCORE_                 VARCHAR2(100),
  RESULT_                NUMBER(2),
  OPINION_               CLOB,
  CREATE_TIME            TIMESTAMP(6)
)
;
alter table APPLICANTS_APPROVE
  add primary key (APPLICANTS_APPROVE_KEY);

prompt
prompt Creating table ARCHIVES
prompt =======================
prompt
create table ARCHIVES
(
  X__STAFF_ID           VARCHAR2(50) not null,
  X__NAME               VARCHAR2(50),
  ARCHIVES_ID           VARCHAR2(50),
  ARCHIVES_NAME         VARCHAR2(50),
  ARCHIVES_STATUS       CHAR(1),
  RECEIVE_DEPT          VARCHAR2(100),
  RECEIVE_TIME          VARCHAR2(50),
  RECEIVE_ATTN          VARCHAR2(50),
  RECEIVE_REASON        VARCHAR2(50),
  RECEIVE_NOTICE_NUMBER VARCHAR2(50),
  RECEIPT_PROCESS       VARCHAR2(50),
  TRANSFER_PERSON       VARCHAR2(50),
  SOURCE_               VARCHAR2(50),
  LOCATION              VARCHAR2(200),
  REMARK                VARCHAR2(200),
  CREATE_TIME           VARCHAR2(50)
)
;
comment on column ARCHIVES.X__STAFF_ID
  is '职工号';
comment on column ARCHIVES.X__NAME
  is '员工姓名';
comment on column ARCHIVES.ARCHIVES_ID
  is '档案编号';
comment on column ARCHIVES.ARCHIVES_NAME
  is '档案名称';
comment on column ARCHIVES.ARCHIVES_STATUS
  is '档案状态';
comment on column ARCHIVES.RECEIVE_DEPT
  is '接收部门';
comment on column ARCHIVES.RECEIVE_TIME
  is '接收时间';
comment on column ARCHIVES.RECEIVE_ATTN
  is '接收经办人';
comment on column ARCHIVES.RECEIVE_REASON
  is '接收原因';
comment on column ARCHIVES.RECEIVE_NOTICE_NUMBER
  is '接收通知单编号';
comment on column ARCHIVES.RECEIPT_PROCESS
  is '回执处理';
comment on column ARCHIVES.TRANSFER_PERSON
  is '移交人';
comment on column ARCHIVES.SOURCE_
  is '来源';
comment on column ARCHIVES.LOCATION
  is '保管地点';
comment on column ARCHIVES.REMARK
  is '备注';
comment on column ARCHIVES.CREATE_TIME
  is '创建时间';
alter table ARCHIVES
  add primary key (X__STAFF_ID);

prompt
prompt Creating table ARCHIVES_OPERATING_RECORDS
prompt =========================================
prompt
create table ARCHIVES_OPERATING_RECORDS
(
  ARCHIVES_OPERATING_RECORDS_ID VARCHAR2(50) not null,
  X__STAFF_ID                   VARCHAR2(50) not null,
  ARCHIVES_STATUS               CHAR(1),
  OPERATING_TIME                VARCHAR2(50),
  OPERATOR                      VARCHAR2(50),
  TRANSACTION                   VARCHAR2(50),
  VIEW_DETAIL                   CLOB
)
;
comment on column ARCHIVES_OPERATING_RECORDS.ARCHIVES_OPERATING_RECORDS_ID
  is '主键';
comment on column ARCHIVES_OPERATING_RECORDS.X__STAFF_ID
  is '职工号';
comment on column ARCHIVES_OPERATING_RECORDS.ARCHIVES_STATUS
  is '档案状态';
comment on column ARCHIVES_OPERATING_RECORDS.OPERATING_TIME
  is '操作时间';
comment on column ARCHIVES_OPERATING_RECORDS.OPERATOR
  is '操作者';
comment on column ARCHIVES_OPERATING_RECORDS.TRANSACTION
  is '事务';
comment on column ARCHIVES_OPERATING_RECORDS.VIEW_DETAIL
  is '操作记录详情（Json结构）';
alter table ARCHIVES_OPERATING_RECORDS
  add primary key (ARCHIVES_OPERATING_RECORDS_ID);

prompt
prompt Creating table AUDIT_LOGGING
prompt ============================
prompt
create table AUDIT_LOGGING
(
  LOGGING_ID          VARCHAR2(40) not null,
  AUDIT_TIME          DATE,
  AUDIT_DEPARTMENT_ID VARCHAR2(40),
  AUDIT_USER_ID       VARCHAR2(40),
  CURRENT_STEP_KEY    VARCHAR2(40),
  PLAN_ID             VARCHAR2(40),
  STATUS              NUMBER(5),
  CURRENT_STEP_NAME   VARCHAR2(50),
  AUDIT_VIEW          VARCHAR2(1000)
)
;
comment on column AUDIT_LOGGING.LOGGING_ID
  is '主键';
comment on column AUDIT_LOGGING.AUDIT_TIME
  is '审批时间';
comment on column AUDIT_LOGGING.AUDIT_DEPARTMENT_ID
  is '审批部门ID';
comment on column AUDIT_LOGGING.AUDIT_USER_ID
  is '审批人ID';
comment on column AUDIT_LOGGING.CURRENT_STEP_KEY
  is '当前步骤';
comment on column AUDIT_LOGGING.PLAN_ID
  is '计划id';
comment on column AUDIT_LOGGING.STATUS
  is '审批状态';
alter table AUDIT_LOGGING
  add primary key (LOGGING_ID);

prompt
prompt Creating table BANZHURENXINXIGUANLI
prompt ===================================
prompt
create table BANZHURENXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  CLASS_NAME     VARCHAR2(200),
  BEGIN_DATE     TIMESTAMP(6),
  END_DATE       TIMESTAMP(6),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table BANZHURENXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table CAMPUS_NOTICE
prompt ============================
prompt
create table CAMPUS_NOTICE
(
  ID         VARCHAR2(40) not null,
  TITLE      VARCHAR2(50),
  USERNAME   VARCHAR2(30),
  BEGIN_TIME VARCHAR2(30),
  ACCESSORY  VARCHAR2(200),
  OVER_TIME  VARCHAR2(30),
  TYPE       VARCHAR2(2),
  CONTENT    CLOB,
  REMARK     VARCHAR2(4000)
)
;
alter table CAMPUS_NOTICE
  add primary key (ID);

prompt
prompt Creating table CHENGCHU
prompt =======================
prompt
create table CHENGCHU
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  NAME              VARCHAR2(90),
  REASON            VARCHAR2(200),
  CONTENT           VARCHAR2(160),
  UNIT              VARCHAR2(120),
  FILENUMBER        VARCHAR2(50),
  WITHDAWDATE       TIMESTAMP(6),
  WITHDAWFILENUMBER VARCHAR2(50),
  WITHDRAWREASON    VARCHAR2(200),
  X__GLOBAL_ID      VARCHAR2(64),
  PUNISH_DATE       TIMESTAMP(6)
)
;
alter table CHENGCHU
  add primary key (GLOBALID);

prompt
prompt Creating table CHUGUOJINXIU
prompt ===========================
prompt
create table CHUGUOJINXIU
(
  GLOBALID              VARCHAR2(64) not null,
  STAFFID               VARCHAR2(30),
  REMARK                VARCHAR2(500),
  LASTMODIFYTIME        VARCHAR2(25),
  DATE_                 TIMESTAMP(6),
  PURPOSE               VARCHAR2(80),
  COUNTRY               VARCHAR2(80),
  TARGETUNITENGLISHNAME VARCHAR2(360),
  TARGETUNITCHINESENAME VARCHAR2(240),
  INSTRUCTOR            VARCHAR2(120),
  INSTRUCTOREMAIL       VARCHAR2(240),
  DISPATCHUNIT          VARCHAR2(120),
  CHANNEL               VARCHAR2(120),
  OUTLAYSOURCE          VARCHAR2(80),
  CHECKUNIT             VARCHAR2(120),
  CHECKDATE             TIMESTAMP(6),
  CHECKFILENUMBER       VARCHAR2(50),
  APPROVALTERM          VARCHAR2(10),
  EXTENSIONTERM         VARCHAR2(10),
  WORKCONTENT           VARCHAR2(160),
  WORKACHIEVEMENT       VARCHAR2(2400),
  MODE_MODE             VARCHAR2(80),
  RETURNDATE            TIMESTAMP(6),
  ABROADSTATE           VARCHAR2(80),
  REFDATE               TIMESTAMP(6),
  RELATION              NUMBER(1),
  WORRIEDDATE           TIMESTAMP(6),
  RESTOREDATE           TIMESTAMP(6),
  GUARANTOR             VARCHAR2(120),
  GUARANTORORG          VARCHAR2(300),
  REPATRIATEDATE        TIMESTAMP(6),
  X__GLOBAL_ID          VARCHAR2(64),
  KK                    VARCHAR2(80)
)
;
alter table CHUGUOJINXIU
  add primary key (GLOBALID);

prompt
prompt Creating table CHUGUOLIUXUEXINXIGUANLI
prompt ======================================
prompt
create table CHUGUOLIUXUEXINXIGUANLI
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  RECOMMEND_DATE    TIMESTAMP(6),
  WRITE_RESULT      VARCHAR2(20),
  INTERVIEW_RESULT  VARCHAR2(20),
  SECOND_RESULT     VARCHAR2(20),
  STUDY_SCHOOL      VARCHAR2(200),
  STUDY_AREA        VARCHAR2(200),
  STUDY_SPECIALITY  VARCHAR2(200),
  STUDY_NAME        VARCHAR2(200),
  STUDY_CONTENT     VARCHAR2(500),
  ABROAD_DATE       TIMESTAMP(6),
  RETURN_DATE       TIMESTAMP(6),
  PASS_DAYS         VARCHAR2(20),
  DELAY_DAYS        VARCHAR2(20),
  OVERDUE_DAYS      VARCHAR2(20),
  CONTRACT_ID       VARCHAR2(50),
  CONTRACT_DATE     TIMESTAMP(6),
  CAUTIONER         VARCHAR2(200),
  SUPPORT_MONEY     NUMBER(10,2),
  CAUTION_MONEY     NUMBER(10,2),
  BREAK_MONEY       NUMBER(10,2),
  TRAIN_FREE        NUMBER(10,2),
  STUDY_FREE        NUMBER(10,2),
  FREE_DATE         TIMESTAMP(6),
  RETURN_MONEY      NUMBER(10,2),
  RETURN_MONEY_DATE TIMESTAMP(6),
  X__GLOBAL_ID      VARCHAR2(64),
  SEX               VARCHAR2(20),
  DUTY              VARCHAR2(20),
  TECHNIC           VARCHAR2(20),
  EDUCATION         VARCHAR2(20),
  DEGREE            VARCHAR2(20),
  SPECIALITY        VARCHAR2(200),
  DEPT_NAME         VARCHAR2(200),
  ENGLISH_LEVEL     VARCHAR2(80),
  SEND_YEAR         VARCHAR2(80),
  SEND_SCHOOLDATE   VARCHAR2(80),
  TRAIN_TYPE        VARCHAR2(80),
  VERIFY_STATUS     VARCHAR2(80),
  SEND_MODE         VARCHAR2(80),
  SEND_IDENTITY     VARCHAR2(80),
  FUND_FROM         VARCHAR2(80),
  EXAM_RESULT       VARCHAR2(80)
)
;
alter table CHUGUOLIUXUEXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table CODE_CATALOG
prompt ===========================
prompt
create table CODE_CATALOG
(
  CATALOG_ID VARCHAR2(64) not null,
  NAME       VARCHAR2(64),
  COPY_      VARCHAR2(64),
  DEFAULT_   INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table CODE_CATALOG
  add primary key (CATALOG_ID);

prompt
prompt Creating table CONTRACT
prompt =======================
prompt
create table CONTRACT
(
  CONTRACT_KEY    VARCHAR2(40) not null,
  CONTRACT_ID     VARCHAR2(40),
  PERSONNEL_ID    VARCHAR2(40),
  DEPARTMENT_NAME VARCHAR2(30),
  DEPARTMENT_ID   VARCHAR2(40),
  NAME            VARCHAR2(20),
  IDENTITY_CARD   VARCHAR2(20),
  SEX             NUMBER(2),
  POSITION_SORT   VARCHAR2(20),
  DUTY            VARCHAR2(20),
  TECH_TITLE      VARCHAR2(20),
  TYPE            NUMBER(2),
  STATUS          NUMBER(2),
  SIGN_TIME       TIMESTAMP(6),
  START_TIME      TIMESTAMP(6),
  END_TIME        TIMESTAMP(6),
  CHANGE_CAUSE    VARCHAR2(200),
  UPDATE_TIME     TIMESTAMP(6),
  WORK_FORM       VARCHAR2(30),
  REMARK          VARCHAR2(200),
  CONTRACT_PATH   VARCHAR2(50)
)
;
comment on column CONTRACT.CONTRACT_KEY
  is '主键';
comment on column CONTRACT.CONTRACT_ID
  is '合同编号';
comment on column CONTRACT.PERSONNEL_ID
  is '人员编号';
comment on column CONTRACT.DEPARTMENT_NAME
  is '部门名称';
comment on column CONTRACT.DEPARTMENT_ID
  is '部门ID';
comment on column CONTRACT.NAME
  is '姓名';
comment on column CONTRACT.IDENTITY_CARD
  is '身份证';
comment on column CONTRACT.SEX
  is '性别';
comment on column CONTRACT.POSITION_SORT
  is '职位类别';
comment on column CONTRACT.DUTY
  is '职责';
comment on column CONTRACT.TECH_TITLE
  is '职称';
comment on column CONTRACT.TYPE
  is '合同类型';
comment on column CONTRACT.STATUS
  is '合同状态';
comment on column CONTRACT.SIGN_TIME
  is '签订时间';
comment on column CONTRACT.START_TIME
  is '开始时间';
comment on column CONTRACT.END_TIME
  is '结束时间';
comment on column CONTRACT.CHANGE_CAUSE
  is '变更原因';
comment on column CONTRACT.UPDATE_TIME
  is '变更时间';
comment on column CONTRACT.WORK_FORM
  is '工作形式';
comment on column CONTRACT.REMARK
  is '备注';
comment on column CONTRACT.CONTRACT_PATH
  is '合同路径';
alter table CONTRACT
  add primary key (CONTRACT_KEY);

prompt
prompt Creating table COOKIE
prompt =====================
prompt
create table COOKIE
(
  COOKIE_NAME     VARCHAR2(255) not null,
  COOKIE_VALUE    VARCHAR2(4000),
  COOKIE_STAFF_ID VARCHAR2(50) not null
)
;
alter table COOKIE
  add constraint PK_COOKIE_NAME_AND_STAFF_ID primary key (COOKIE_NAME, COOKIE_STAFF_ID);

prompt
prompt Creating table DANWEIBIANDONG
prompt =============================
prompt
create table DANWEIBIANDONG
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  E_FILE_ID      VARCHAR2(50),
  DEPT           VARCHAR2(50),
  CHANGE_DATE    NUMBER(30),
  CHANGE_REASON  VARCHAR2(200),
  APPOINT_NUM_ID VARCHAR2(20),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table DANWEIBIANDONG
  add primary key (GLOBALID);

prompt
prompt Creating table DANWEIRENZHIXINXI
prompt ================================
prompt
create table DANWEIRENZHIXINXI
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  EMPLOYEE_ID     VARCHAR2(20),
  DEPT            VARCHAR2(50),
  DUTY            VARCHAR2(20),
  DUTY_SORT       VARCHAR2(20),
  DUTY_LEVEL      VARCHAR2(20),
  DUTY_NAME       VARCHAR2(200),
  END_DATE        TIMESTAMP(6),
  START_DATE      TIMESTAMP(6),
  POST_MODE       VARCHAR2(20),
  MIDDLE_LEVEL    NUMBER(30),
  STAFF_TYPE      VARCHAR2(20),
  DUTY_TYPE       VARCHAR2(20),
  TAG_CURRENT     NUMBER(30),
  FILE_ID         VARCHAR2(50),
  APPOINT_REASON  VARCHAR2(500),
  REMOVAL_DATE    TIMESTAMP(6),
  REMOVAL_FILE_ID VARCHAR2(50),
  REMOVAL_REASON  CLOB,
  DUTY_STATUS     VARCHAR2(20),
  FIELD4          TIMESTAMP(6),
  FIELD5          TIMESTAMP(6),
  IS_LEAD         NUMBER(30),
  X__GLOBAL_ID    VARCHAR2(64)
)
;
alter table DANWEIRENZHIXINXI
  add primary key (GLOBALID);

prompt
prompt Creating table DAOSHIXINXIGUANLI
prompt ================================
prompt
create table DAOSHIXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  MASTER_DATE    TIMESTAMP(6),
  DOCTOR_DATE    TIMESTAMP(6),
  DEGREE_DEPT1   VARCHAR2(200),
  DEGREE_DEPT2   VARCHAR2(200),
  DOCTOR_BACTH   VARCHAR2(20),
  X__GLOBAL_ID   VARCHAR2(64),
  STATUS         NUMBER(1),
  TEACHER_SORT   VARCHAR2(80),
  STUDY_SORT     VARCHAR2(80),
  DEPARTMENT     VARCHAR2(50)
)
;
alter table DAOSHIXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table DATA_DICTIONARY_CATEGORY
prompt =======================================
prompt
create table DATA_DICTIONARY_CATEGORY
(
  CATEGORYID VARCHAR2(50) not null,
  NAME       VARCHAR2(50),
  REMARK     VARCHAR2(255)
)
;
alter table DATA_DICTIONARY_CATEGORY
  add constraint CATEGORY_CATEGORYID_PK primary key (CATEGORYID);

prompt
prompt Creating table DATA_DICTIONARY_DEFINATION
prompt =========================================
prompt
create table DATA_DICTIONARY_DEFINATION
(
  DICTIONARYID VARCHAR2(50) not null,
  NAME         VARCHAR2(50),
  TABLENAME    VARCHAR2(50),
  CATEGORYID   VARCHAR2(50),
  COLUMNS      CLOB,
  REMARK       VARCHAR2(255),
  ATLESTRECORD VARCHAR2(10),
  ATMOSTRECORD VARCHAR2(10),
  SYNCHOVERALL VARCHAR2(10)
)
;
alter table DATA_DICTIONARY_DEFINATION
  add constraint PK_DEFINATIONID primary key (DICTIONARYID);
create index INDEX_DICTIONARY_DEFINATION on DATA_DICTIONARY_DEFINATION (NAME, TABLENAME);

prompt
prompt Creating table DATA_DICTIONARY_DEFINATION1
prompt ==========================================
prompt
create table DATA_DICTIONARY_DEFINATION1
(
  DICTIONARYID VARCHAR2(50) not null,
  NAME         VARCHAR2(50),
  TABLENAME    VARCHAR2(50),
  CATEGORYID   VARCHAR2(50),
  COLUMNS      VARCHAR2(4000),
  REMARK       VARCHAR2(255),
  ATLESTRECORD VARCHAR2(10),
  ATMOSTRECORD VARCHAR2(10),
  SYNCHOVERALL VARCHAR2(10)
)
;
alter table DATA_DICTIONARY_DEFINATION1
  add constraint DEFINATION_DICTIONARYID_PK primary key (DICTIONARYID);

prompt
prompt Creating table DEPARTMENTS
prompt ==========================
prompt
create table DEPARTMENTS
(
  DEPARTMENT_KEY    VARCHAR2(100) not null,
  DEPARTMENT_NAME   VARCHAR2(255),
  PARENT_KEY        VARCHAR2(100),
  SORT_NUM          INTEGER,
  PHONE             VARCHAR2(255),
  FAX               VARCHAR2(255),
  CREATE_DATE       TIMESTAMP(6),
  LAST_UPDATE_DATE  TIMESTAMP(6),
  DESCRIPTION       VARCHAR2(3000),
  DEPARTMENT_NUM    VARCHAR2(255 CHAR),
  SHORT_NAME        VARCHAR2(255 CHAR),
  ENGLISH_NAME      VARCHAR2(255 CHAR),
  LEADER_KEYS       VARCHAR2(255 CHAR),
  LEADER_NAMES      VARCHAR2(255 CHAR),
  ADDRESS           VARCHAR2(512 CHAR),
  DIVISION_KEY      VARCHAR2(255 CHAR),
  DIVISION_NAME     VARCHAR2(255 CHAR),
  LEVEL_KEY         VARCHAR2(255 CHAR),
  LEVEL_NAME        VARCHAR2(255 CHAR),
  FUNCTION_KEY      VARCHAR2(255 CHAR),
  FUNCTION_NAME     VARCHAR2(255 CHAR),
  PARENT_NAME       VARCHAR2(255 CHAR),
  FOUND_NUM         VARCHAR2(255 CHAR),
  CLOSE_NUM         VARCHAR2(255 CHAR),
  FOUND_DATE        TIMESTAMP(6),
  CLOSE_DATE        TIMESTAMP(6),
  PRE_PERSON_COUNT  INTEGER,
  FACT_PERSON_COUNT INTEGER
)
;
alter table DEPARTMENTS
  add primary key (DEPARTMENT_KEY);

prompt
prompt Creating table DICTIONARY_DEFINATION_COPY
prompt =========================================
prompt
create table DICTIONARY_DEFINATION_COPY
(
  DICTIONARYID VARCHAR2(50) not null,
  NAME         VARCHAR2(50),
  TABLENAME    VARCHAR2(50),
  CATEGORYID   VARCHAR2(50),
  COLUMNS      CLOB,
  REMARK       VARCHAR2(255),
  ATLESTRECORD VARCHAR2(10),
  ATMOSTRECORD VARCHAR2(10),
  SYNCHOVERALL VARCHAR2(10),
  TEST         CLOB
)
;
alter table DICTIONARY_DEFINATION_COPY
  add constraint A_DICTIONARYID_PK primary key (DICTIONARYID);

prompt
prompt Creating table DM_ACCOMPLISH_FORM
prompt =================================
prompt
create table DM_ACCOMPLISH_FORM
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_APPELLATION
prompt =============================
prompt
create table DM_APPELLATION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_APPELLATION
  add primary key (CODEID);

prompt
prompt Creating table DM_APPOINT_SITUATION
prompt ===================================
prompt
create table DM_APPOINT_SITUATION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_APPOINT_TYPE
prompt ==============================
prompt
create table DM_APPOINT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_APPOINT_TYPE_CHANGE
prompt =====================================
prompt
create table DM_APPOINT_TYPE_CHANGE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_APPOINT_TYPE_CHANGE
  add primary key (CODEID);

prompt
prompt Creating table DM_APPROVE_FORM
prompt ==============================
prompt
create table DM_APPROVE_FORM
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_APPROVE_FORM
  add primary key (CODEID);

prompt
prompt Creating table DM_BLOODTYPE
prompt ===========================
prompt
create table DM_BLOODTYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_BOOK_CENCERN_LEVEL
prompt ====================================
prompt
create table DM_BOOK_CENCERN_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_BOOK_CENCERN_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_BUILDING_STRUCT
prompt =================================
prompt
create table DM_BUILDING_STRUCT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_BUILDING_STRUCT
  add primary key (CODEID);

prompt
prompt Creating table DM_COLLEGE_BACHELOR_SUBJECT
prompt ==========================================
prompt
create table DM_COLLEGE_BACHELOR_SUBJECT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COLLEGE_BACHELOR_SUBJECT
  add primary key (CODEID);

prompt
prompt Creating table DM_COLLEGE_COMPOSING_TYPE
prompt ========================================
prompt
create table DM_COLLEGE_COMPOSING_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COLLEGE_COMPOSING_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_COLLEGE_ENCOURAGE_TYPE
prompt ========================================
prompt
create table DM_COLLEGE_ENCOURAGE_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COLLEGE_ENCOURAGE_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_COLLEGE_PAPER_LEVEL
prompt =====================================
prompt
create table DM_COLLEGE_PAPER_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COLLEGE_PAPER_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_COLLEGE_PATENT_TYPE
prompt =====================================
prompt
create table DM_COLLEGE_PATENT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_COLLEGE_PROJECT_SOURCE
prompt ========================================
prompt
create table DM_COLLEGE_PROJECT_SOURCE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_COLLEGE_UNIT
prompt ==============================
prompt
create table DM_COLLEGE_UNIT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COLLEGE_UNIT
  add primary key (CODEID);

prompt
prompt Creating table DM_COOPERATION_TYPE
prompt ==================================
prompt
create table DM_COOPERATION_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_COURSE_COLLECTION
prompt ===================================
prompt
create table DM_COURSE_COLLECTION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COURSE_COLLECTION
  add primary key (CODEID);

prompt
prompt Creating table DM_COURSE_FORM
prompt =============================
prompt
create table DM_COURSE_FORM
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COURSE_FORM
  add primary key (CODEID);

prompt
prompt Creating table DM_COURSE_PROPERTY
prompt =================================
prompt
create table DM_COURSE_PROPERTY
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COURSE_PROPERTY
  add primary key (CODEID);

prompt
prompt Creating table DM_COURSE_SORT
prompt =============================
prompt
create table DM_COURSE_SORT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_COURSE_SORT
  add primary key (CODEID);

prompt
prompt Creating table DM_COURSE_TYPE
prompt =============================
prompt
create table DM_COURSE_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_ABROADSTATE
prompt =================================
prompt
create table DM_DEF_ABROADSTATE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ABROADSTATE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ASSESS_CONCLUSION
prompt =======================================
prompt
create table DM_DEF_ASSESS_CONCLUSION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_ASSESS_GRADE
prompt ==================================
prompt
create table DM_DEF_ASSESS_GRADE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ASSESS_GRADE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ASSESS_SORT
prompt =================================
prompt
create table DM_DEF_ASSESS_SORT
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_AUDIT_TABLE
prompt =================================
prompt
create table DM_DEF_AUDIT_TABLE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_AUDIT_TABLE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_BUSINESS_TYPE
prompt ===================================
prompt
create table DM_DEF_BUSINESS_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_BUSINESS_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_CONTRACTTYPE
prompt ==================================
prompt
create table DM_DEF_CONTRACTTYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_CONTRACTTYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_DTLEVEL
prompt =============================
prompt
create table DM_DEF_DTLEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_DTLEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_DUTYLEVEL
prompt ===============================
prompt
create table DM_DEF_DUTYLEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_DUTYLEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_DUTYSER
prompt =============================
prompt
create table DM_DEF_DUTYSER
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_DUTYSER
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ELITETYPE
prompt ===============================
prompt
create table DM_DEF_ELITETYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ELITETYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ELITIST_LEVEL
prompt ===================================
prompt
create table DM_DEF_ELITIST_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ELITIST_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ELITIST_TYPE
prompt ==================================
prompt
create table DM_DEF_ELITIST_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ELITIST_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_EMPLOYEE
prompt ==============================
prompt
create table DM_DEF_EMPLOYEE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_FLOW_NAME
prompt ===============================
prompt
create table DM_DEF_FLOW_NAME
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_FLOW_NAME
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_LANGUAGEDEGREE
prompt ====================================
prompt
create table DM_DEF_LANGUAGEDEGREE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_LANGUAGEDEGREE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_ORG
prompt =========================
prompt
create table DM_DEF_ORG
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_ORG
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_OWNERSHIP
prompt ===============================
prompt
create table DM_DEF_OWNERSHIP
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_OWNERSHIP
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_PERSONS
prompt =============================
prompt
create table DM_DEF_PERSONS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_PERSONS
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_POSTDOCTORAL_TYPE
prompt =======================================
prompt
create table DM_DEF_POSTDOCTORAL_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_POSTDOCTORAL_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_REC_ST
prompt ============================
prompt
create table DM_DEF_REC_ST
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_REC_ST
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_SALARYSOURCE
prompt ==================================
prompt
create table DM_DEF_SALARYSOURCE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_SALARYSOURCE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_STATSORT
prompt ==============================
prompt
create table DM_DEF_STATSORT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_STATSORT
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_STUDY_METHOD
prompt ==================================
prompt
create table DM_DEF_STUDY_METHOD
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_STUDY_METHOD
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_STUDY_TYPE
prompt ================================
prompt
create table DM_DEF_STUDY_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_STUDY_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_SUBJECT
prompt =============================
prompt
create table DM_DEF_SUBJECT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_SUBJECT
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_TEACHERQUALIFICATION
prompt ==========================================
prompt
create table DM_DEF_TEACHERQUALIFICATION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_TEACHERQUALIFICATION
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_WORKSITE
prompt ==============================
prompt
create table DM_DEF_WORKSITE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_WORKSTATE
prompt ===============================
prompt
create table DM_DEF_WORKSTATE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_DEF_XB
prompt ========================
prompt
create table DM_DEF_XB
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_XB
  add primary key (CODEID);

prompt
prompt Creating table DM_DEF_XK
prompt ========================
prompt
create table DM_DEF_XK
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEF_XK
  add primary key (CODEID);

prompt
prompt Creating table DM_DEPOSITION_FASHION
prompt ====================================
prompt
create table DM_DEPOSITION_FASHION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEPOSITION_FASHION
  add primary key (CODEID);

prompt
prompt Creating table DM_DEPOSITION_REASON
prompt ===================================
prompt
create table DM_DEPOSITION_REASON
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DEPOSITION_REASON
  add primary key (CODEID);

prompt
prompt Creating table DM_DIRECT_TYPE
prompt =============================
prompt
create table DM_DIRECT_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_DIRECT_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_ECONOMY_BENEFITION
prompt ====================================
prompt
create table DM_ECONOMY_BENEFITION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_EDUCATION_RESULT
prompt ==================================
prompt
create table DM_EDUCATION_RESULT
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_EDU_CHINESE_LANG_LEVEL
prompt ========================================
prompt
create table DM_EDU_CHINESE_LANG_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_EDU_CHINESE_LANG_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_EDU_FOREIGN_LANG_LEVEL
prompt ========================================
prompt
create table DM_EDU_FOREIGN_LANG_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_EDU_FOREIGN_LANG_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_EMIGRATION
prompt ============================
prompt
create table DM_EMIGRATION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_EMIGRATION
  add primary key (CODEID);

prompt
prompt Creating table DM_EMPLOYEE_SOURCE
prompt =================================
prompt
create table DM_EMPLOYEE_SOURCE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_EMPLOYEE_SOURCE
  add primary key (CODEID);

prompt
prompt Creating table DM_EMPLOYEE_STATUS
prompt =================================
prompt
create table DM_EMPLOYEE_STATUS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_EMPLOYEE_STATUS
  add primary key (CODEID);

prompt
prompt Creating table DM_EMPLOYMENT_TYPE
prompt =================================
prompt
create table DM_EMPLOYMENT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_ENCOURAGE_LEVEL
prompt =================================
prompt
create table DM_ENCOURAGE_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_ENCOURAGE_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_EXAMINE_SITUATION
prompt ===================================
prompt
create table DM_EXAMINE_SITUATION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_GOABROAD_OUTLAY_SOURCE
prompt ========================================
prompt
create table DM_GOABROAD_OUTLAY_SOURCE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_GOABROAD_OUTLAY_SOURCE
  add primary key (CODEID);

prompt
prompt Creating table DM_HEADSHIP_TYPE
prompt ===============================
prompt
create table DM_HEADSHIP_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_HEADSHIP_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_HOUSE_PLACE
prompt =============================
prompt
create table DM_HOUSE_PLACE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_HOUSE_PLACE
  add primary key (CODEID);

prompt
prompt Creating table DM_HOUSE_PROPERTY_RIGHT
prompt ======================================
prompt
create table DM_HOUSE_PROPERTY_RIGHT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_HOUSE_PROPERTY_RIGHT
  add primary key (CODEID);

prompt
prompt Creating table DM_HOUSE_TYPE
prompt ============================
prompt
create table DM_HOUSE_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_HOUSE_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_IDENTIFY_CONCLUSION
prompt =====================================
prompt
create table DM_IDENTIFY_CONCLUSION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_IDENTIFY_CONCLUSION_KZ
prompt ========================================
prompt
create table DM_IDENTIFY_CONCLUSION_KZ
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_IDENTIFY_CONCLUSION_KZ
  add primary key (CODEID);

prompt
prompt Creating table DM_LAW_STATE
prompt ===========================
prompt
create table DM_LAW_STATE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_LEARNING_INFO
prompt ===============================
prompt
create table DM_LEARNING_INFO
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_LEARNING_INFO
  add primary key (CODEID);

prompt
prompt Creating table DM_OPERATION
prompt ===========================
prompt
create table DM_OPERATION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_OPERATION
  add primary key (CODEID);

prompt
prompt Creating table DM_ORGANIZATION_CHANGE
prompt =====================================
prompt
create table DM_ORGANIZATION_CHANGE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_ORGANIZATION_TYPE
prompt ===================================
prompt
create table DM_ORGANIZATION_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_OUTCOME_TYPE
prompt ==============================
prompt
create table DM_OUTCOME_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_PAPER_REPORT_FORM
prompt ===================================
prompt
create table DM_PAPER_REPORT_FORM
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_PERSONNAL_STATUS
prompt ==================================
prompt
create table DM_PERSONNAL_STATUS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_PERSONNAL_STATUS
  add primary key (CODEID);

prompt
prompt Creating table DM_PERSON_TYPE
prompt =============================
prompt
create table DM_PERSON_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_PERSON_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_PLAN_SITUATION
prompt ================================
prompt
create table DM_PLAN_SITUATION
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_POLITICAL_STATUS_SPECIAL
prompt ==========================================
prompt
create table DM_POLITICAL_STATUS_SPECIAL
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_POSITION_TYPE
prompt ===============================
prompt
create table DM_POSITION_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_POSITION_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_PRIZE_LEVEL
prompt =============================
prompt
create table DM_PRIZE_LEVEL
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_PROJECT_OUTLAY_SOURCE
prompt =======================================
prompt
create table DM_PROJECT_OUTLAY_SOURCE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_PROJECT_TYPE
prompt ==============================
prompt
create table DM_PROJECT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_PUBLIC_MOTHOD
prompt ===============================
prompt
create table DM_PUBLIC_MOTHOD
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_PUBLIC_MOTHOD
  add primary key (CODEID);

prompt
prompt Creating table DM_RECRUITMENT_TYPE
prompt ==================================
prompt
create table DM_RECRUITMENT_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_RECRUITMENT_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_RETIRD_REASON
prompt ===============================
prompt
create table DM_RETIRD_REASON
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_RETIRD_REASON
  add primary key (CODEID);

prompt
prompt Creating table DM_RETIRD_TYPE
prompt =============================
prompt
create table DM_RETIRD_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_RETIRD_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_REWARD_TYPE
prompt =============================
prompt
create table DM_REWARD_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_ROLE
prompt ======================
prompt
create table DM_ROLE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_ROLE
  add primary key (CODEID);

prompt
prompt Creating table DM_SDM_SCIENCE_PLURALITY_LEVEL
prompt =============================================
prompt
create table DM_SDM_SCIENCE_PLURALITY_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_SDM_SCIENCE_PLURALITY_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_SDM_SCIENCE_PLURALITY_SORT
prompt ============================================
prompt
create table DM_SDM_SCIENCE_PLURALITY_SORT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_SDM_SCIENCE_PLURALITY_SORT
  add primary key (CODEID);

prompt
prompt Creating table DM_SDM_TUTOR_SORT
prompt ================================
prompt
create table DM_SDM_TUTOR_SORT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_SDM_TUTOR_SORT
  add primary key (CODEID);

prompt
prompt Creating table DM_SECRET_LEVEL
prompt ==============================
prompt
create table DM_SECRET_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_SECRET_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_STATUS_GET_WAY
prompt ================================
prompt
create table DM_STATUS_GET_WAY
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_STUDENT_TYPE
prompt ==============================
prompt
create table DM_STUDENT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_STUDYING_UNIT_TYPE
prompt ====================================
prompt
create table DM_STUDYING_UNIT_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_STUDY_FASHION
prompt ===============================
prompt
create table DM_STUDY_FASHION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_STUDY_FASHION
  add primary key (CODEID);

prompt
prompt Creating table DM_STUDY_FORM
prompt ============================
prompt
create table DM_STUDY_FORM
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_STUDY_FORM
  add primary key (CODEID);

prompt
prompt Creating table DM_STUDY_QUALITY
prompt ===============================
prompt
create table DM_STUDY_QUALITY
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_STUDY_QUALITY
  add primary key (CODEID);

prompt
prompt Creating table DM_ST_TECHNIC_EXAM_MODE
prompt ======================================
prompt
create table DM_ST_TECHNIC_EXAM_MODE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_ST_TECHNIC_EXAM_MODE
  add primary key (CODEID);

prompt
prompt Creating table DM_SUBJECT_SCIENCE
prompt =================================
prompt
create table DM_SUBJECT_SCIENCE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_TC_EXAM_RESULT
prompt ================================
prompt
create table DM_TC_EXAM_RESULT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_EXAM_RESULT
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_PRESS_LEVEL
prompt ================================
prompt
create table DM_TC_PRESS_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_PRESS_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_STUDY_AB_IDENTITY
prompt ======================================
prompt
create table DM_TC_STUDY_AB_IDENTITY
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_STUDY_AB_IDENTITY
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_STUDY_AB_MODE
prompt ==================================
prompt
create table DM_TC_STUDY_AB_MODE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_STUDY_AB_MODE
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_STUDY_AB_SCHOOLDATE
prompt ========================================
prompt
create table DM_TC_STUDY_AB_SCHOOLDATE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_STUDY_AB_SCHOOLDATE
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_STUDY_AB_YEAR
prompt ==================================
prompt
create table DM_TC_STUDY_AB_YEAR
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_STUDY_AB_YEAR
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_STUDY_IN_TYPE
prompt ==================================
prompt
create table DM_TC_STUDY_IN_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_STUDY_IN_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_TECHNIC_EXAM_LEVEL
prompt =======================================
prompt
create table DM_TC_TECHNIC_EXAM_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_TECHNIC_EXAM_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_TC_TECHNIC_EXAM_SUBJECT
prompt =========================================
prompt
create table DM_TC_TECHNIC_EXAM_SUBJECT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TC_TECHNIC_EXAM_SUBJECT
  add primary key (CODEID);

prompt
prompt Creating table DM_TEACHER_ENCOURAGE_TYPE
prompt ========================================
prompt
create table DM_TEACHER_ENCOURAGE_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TEACHER_ENCOURAGE_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_TEACHER_PROJ
prompt ==============================
prompt
create table DM_TEACHER_PROJ
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TEACHER_PROJ
  add primary key (CODEID);

prompt
prompt Creating table DM_TEACHING_TYPE
prompt ===============================
prompt
create table DM_TEACHING_TYPE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_TEACH_ROLE
prompt ============================
prompt
create table DM_TEACH_ROLE
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_TECH_LEVEL
prompt ============================
prompt
create table DM_TECH_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TECH_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_TRAIN_LEVEL
prompt =============================
prompt
create table DM_TRAIN_LEVEL
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TRAIN_LEVEL
  add primary key (CODEID);

prompt
prompt Creating table DM_TRAIN_TYPE
prompt ============================
prompt
create table DM_TRAIN_TYPE
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_TRAIN_TYPE
  add primary key (CODEID);

prompt
prompt Creating table DM_UNEMPLOYED_REASON
prompt ===================================
prompt
create table DM_UNEMPLOYED_REASON
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table DM_UNIT_PROPERTY
prompt ===============================
prompt
create table DM_UNIT_PROPERTY
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_UNIT_PROPERTY
  add primary key (CODEID);

prompt
prompt Creating table DM_VERIFY_STATUS
prompt ===============================
prompt
create table DM_VERIFY_STATUS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_VERIFY_STATUS
  add primary key (CODEID);

prompt
prompt Creating table DM_WA_TIME_UNIT
prompt ==============================
prompt
create table DM_WA_TIME_UNIT
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_WA_TIME_UNIT
  add primary key (CODEID);

prompt
prompt Creating table DM_WORKER_TECHLV_BUSINESS
prompt ========================================
prompt
create table DM_WORKER_TECHLV_BUSINESS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_WORKER_TECHLV_BUSINESS
  add primary key (CODEID);

prompt
prompt Creating table DM_XRUNT_APPLY
prompt =============================
prompt
create table DM_XRUNT_APPLY
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_XRUNT_APPLY
  add primary key (CODEID);

prompt
prompt Creating table DM_XRUNT_FORMS
prompt =============================
prompt
create table DM_XRUNT_FORMS
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table DM_XRUNT_FORMS
  add primary key (CODEID);

prompt
prompt Creating table DOCUMENT_
prompt ========================
prompt
create table DOCUMENT_
(
  DOCUMENT_KEY       VARCHAR2(100) not null,
  DOCUMENT_NAME      VARCHAR2(255),
  DOCUMENT_REMARK    VARCHAR2(3000),
  DOCUMENT_TYPE_KEY  VARCHAR2(255),
  DOCUMENT_TYPE_NAME VARCHAR2(255),
  DOCUMENT_ICON      VARCHAR2(255),
  FILE_NAME          VARCHAR2(255),
  FILE_PATH          VARCHAR2(255),
  STATUS_            INTEGER,
  SORT_NUM           INTEGER,
  CREATE_TIME        TIMESTAMP(6),
  CREATOR_KEY        VARCHAR2(255),
  CREATOR_NAME       VARCHAR2(255)
)
;
alter table DOCUMENT_
  add primary key (DOCUMENT_KEY);

prompt
prompt Creating table DOCUMENT_TYPE
prompt ============================
prompt
create table DOCUMENT_TYPE
(
  DOCUMENT_TYPE_KEY    VARCHAR2(100) not null,
  DOCUMENT_TYPE_NAME   VARCHAR2(255),
  DOCUMENT_TYPE_REMARK VARCHAR2(3000),
  SORT_NUM             INTEGER,
  CREATE_TIME          TIMESTAMP(6),
  CREATOR_KEY          VARCHAR2(255),
  CREATOR_NAME         VARCHAR2(255)
)
;
alter table DOCUMENT_TYPE
  add primary key (DOCUMENT_TYPE_KEY);

prompt
prompt Creating table DS_COMMUNICATION
prompt ===============================
prompt
create table DS_COMMUNICATION
(
  GLOBALID           VARCHAR2(64) not null,
  STAFFID            VARCHAR2(30),
  REMARK             VARCHAR2(500),
  LASTMODIFYTIME     VARCHAR2(25),
  OFFICEPHONE        VARCHAR2(50),
  MOBILEPHONE        VARCHAR2(50),
  FAXHONE            VARCHAR2(50),
  HOMEPHONE          VARCHAR2(50),
  EMAIL              VARCHAR2(50),
  HOMEPAGE           VARCHAR2(240),
  FAMILYADDRESS      VARCHAR2(50),
  POSTALCODE         VARCHAR2(12),
  COMMUNICATEADDRESS VARCHAR2(240),
  X__GLOBAL_ID       VARCHAR2(64)
)
;
alter table DS_COMMUNICATION
  add primary key (GLOBALID);

prompt
prompt Creating table DS_DUTY
prompt ======================
prompt
create table DS_DUTY
(
  GLOBALID           VARCHAR2(30) not null,
  STAFFID            VARCHAR2(30),
  REMARK             VARCHAR2(500),
  LASTMODIFYTIME     VARCHAR2(25),
  DUTYKIND           VARCHAR2(80),
  DUTYNAME           VARCHAR2(80),
  APOINTDATE         TIMESTAMP(6),
  DUTYUNIT           VARCHAR2(100),
  DUTYMODE           VARCHAR2(80),
  APOINTREASON       VARCHAR2(160),
  DUTYLEVEL          VARCHAR2(80),
  DUTYSORT           VARCHAR2(80),
  APPROVALUNIT       VARCHAR2(150),
  CHANGEKIND         VARCHAR2(80),
  DUTYSTATE          VARCHAR2(80),
  SEQUENCE           VARCHAR2(5),
  WORKCONTENT        VARCHAR2(80),
  DEPOSEDATE         TIMESTAMP(6),
  DEPOSEMODE         VARCHAR2(80),
  DEPOSEREASON       VARCHAR2(80),
  DEPOSEFILENUMBER   VARCHAR2(50),
  DEPOSEAPPROVALUNIT VARCHAR2(120),
  APOINTFILENUMBER   VARCHAR2(50),
  X__GLOBAL_ID       VARCHAR2(64)
)
;
alter table DS_DUTY
  add primary key (GLOBALID);

prompt
prompt Creating table DS_HOUSING
prompt =========================
prompt
create table DS_HOUSING
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  HOUSEID        VARCHAR2(50),
  BUILTDATE      TIMESTAMP(6),
  HOUSINGDATE    TIMESTAMP(6),
  BUILDAREA      NUMBER(8,2),
  USEAREA        NUMBER(8,2),
  BUILDINGSTRUCT VARCHAR2(80),
  HOUSESTRUCT    VARCHAR2(60),
  HOUSETYPE      VARCHAR2(80),
  ADDRESS        VARCHAR2(120),
  PLACESTATE     VARCHAR2(80),
  PROPERTYRIGHT  VARCHAR2(80),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table DS_HOUSING
  add primary key (GLOBALID);

prompt
prompt Creating table DS_MAJOR
prompt =======================
prompt
create table DS_MAJOR
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  PRIMARY        NUMBER(1),
  DIRECTION      VARCHAR2(200),
  MAJOR          VARCHAR2(80),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table DS_MAJOR
  add primary key (GLOBALID);

prompt
prompt Creating table DS_MATE
prompt ======================
prompt
create table DS_MATE
(
  GLOBALID           VARCHAR2(64) not null,
  STAFFID            VARCHAR2(30),
  REMARK             VARCHAR2(500),
  LASTMODIFYTIME     VARCHAR2(25),
  NAME               VARCHAR2(50),
  BIRTHDAY           TIMESTAMP(6),
  SEX                VARCHAR2(80),
  NATION             VARCHAR2(80),
  RESIDENCE          VARCHAR2(120),
  EDUCATIONDEGREE    VARCHAR2(80),
  DEGREE             VARCHAR2(80),
  COLONY             VARCHAR2(80),
  WORKUNIT           VARCHAR2(120),
  WORKPLACE          VARCHAR2(80),
  WORKTIME           TIMESTAMP(6),
  PHONE              VARCHAR2(60),
  POSTALCODE         VARCHAR2(12),
  MAJORQUALIFICATION VARCHAR2(80),
  DUTYLEVEL          VARCHAR2(80),
  PARTTIMEJOB        VARCHAR2(80),
  SALARY             NUMBER(10,2),
  POLITICS           VARCHAR2(80),
  X__GLOBAL_ID       VARCHAR2(64)
)
;
alter table DS_MATE
  add primary key (GLOBALID);

prompt
prompt Creating table DS_OVERALL
prompt =========================
prompt
create table DS_OVERALL
(
  X__NAME               VARCHAR2(60),
  X__OLDNAME            VARCHAR2(20),
  X__BIRTHDAY           VARCHAR2(20),
  X__AGE                NUMBER(30),
  X__SEX                VARCHAR2(80),
  X__NATIONALITY        VARCHAR2(80),
  X__NATION             VARCHAR2(80),
  X__NATIVEPLACE        VARCHAR2(80),
  X__BORNPLACE          VARCHAR2(80),
  X__PHOTO              VARCHAR2(110),
  X__WORKTIME           TIMESTAMP(6),
  X__HEALTHSTATE        VARCHAR2(80),
  X__BLOODTYPE          VARCHAR2(80),
  X__COLONY             VARCHAR2(80),
  X__MARRIAGESTATE      VARCHAR2(80),
  X__ORIGIN             VARCHAR2(80),
  X__PERSONSTATION      VARCHAR2(80),
  X__RESIDENCE          VARCHAR2(250),
  X__CADRETIME          TIMESTAMP(6),
  X__GRANTCADRETIME     TIMESTAMP(6),
  X__DOCTORMENTORTIME   TIMESTAMP(6),
  X__BACHELORMENTORTIME TIMESTAMP(6),
  X__INNERID            VARCHAR2(50),
  X__RESV               VARCHAR2(300),
  X__REMARK             CLOB,
  X__MAJOR              VARCHAR2(80),
  X__JOINCOLLEGETIME    TIMESTAMP(6),
  X__HRINTIME           TIMESTAMP(6),
  X__OLDUNITNAME        VARCHAR2(120),
  X__LANGUAGE           VARCHAR2(80),
  X__MASTERDEGREE       VARCHAR2(80),
  X__COLLEGE            VARCHAR2(80),
  X__UNITNAME           VARCHAR2(120),
  X__POLITICS           VARCHAR2(80),
  X__JOINDATE           TIMESTAMP(6),
  X__DEGREE             VARCHAR2(80),
  X__DEGREEAWARDDATE    TIMESTAMP(6),
  X__EDUCATIONLEVEL     VARCHAR2(80),
  X__EDUCATIONSCHOOL    VARCHAR2(360),
  X__GRADUATETIME       TIMESTAMP(6),
  X__MAJORQUALIFICATION VARCHAR2(80),
  X__TECHTITLELEVEL     VARCHAR2(80),
  X__ACCESSDATE         TIMESTAMP(6),
  X__APPOINTDUTY        VARCHAR2(80),
  X__APPOINTDUTYLEVEL   VARCHAR2(80),
  X__APPOINTDATE        TIMESTAMP(6),
  X__DUTYLEVEL          VARCHAR2(80),
  X__DUTYLEVELDATE      TIMESTAMP(6),
  X__AUTHSORT           VARCHAR2(80),
  X__STAFFSORT          VARCHAR2(80),
  X__SALARYSOURCE       VARCHAR2(80),
  X__OWNERSHIP          VARCHAR2(80),
  X__STATSORT           VARCHAR2(80),
  X__TECHLEVEL          VARCHAR2(80),
  X__TECHLEVELDATE      TIMESTAMP(6),
  X__TECHLEVELTITLE     VARCHAR2(80),
  X__TECHLEVELTITLEDATE TIMESTAMP(6),
  X__DUTY               CLOB,
  X__PARTYDUTYLEVEL     VARCHAR2(80),
  X__RESV1              VARCHAR2(300),
  X__RESV2              VARCHAR2(300),
  X__RESV3              VARCHAR2(300),
  X__RESV4              VARCHAR2(300),
  X__RESV5              VARCHAR2(300),
  X__ENTRY_STATE        NUMBER(1),
  X__SOURCE             NUMBER(2),
  X__GLOBAL_ID          VARCHAR2(64) not null,
  X__STAFF_ID           VARCHAR2(50),
  X__NAME_SPELL         VARCHAR2(50),
  X__ID_CARD            VARCHAR2(25),
  X__FILE_NO            VARCHAR2(100),
  X__DEPARTMENT_KEY     VARCHAR2(50),
  X__DEPARTMENT_NAME    VARCHAR2(100),
  X__WORK_POSITION_KEY  VARCHAR2(50),
  X__WORK_POSITION_NAME VARCHAR2(50),
  X__ENTRY_STATUS       NUMBER(30),
  X__WORK_STATUS        VARCHAR2(50),
  X__CREATE_TIME        TIMESTAMP(6),
  X__LAST_MODIFY_TIME   TIMESTAMP(6),
  X__EMAIL              VARCHAR2(50)
)
;
comment on column DS_OVERALL.X__SOURCE
  is '??(?????????)';
comment on column DS_OVERALL.X__ENTRY_STATUS
  is '0:待入职,1:已入职';
alter table DS_OVERALL
  add primary key (X__GLOBAL_ID);
create unique index SYS_COO5242 on DS_OVERALL (X__STAFF_ID);

prompt
prompt Creating table DS_TEACHERQUALIFICATION
prompt ======================================
prompt
create table DS_TEACHERQUALIFICATION
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  SORT             VARCHAR2(80),
  CERTIFICATEID    VARCHAR2(100),
  GRANTUNIT        VARCHAR2(200),
  GRANTDATE        TIMESTAMP(6),
  PERIODOFVALIDITY VARCHAR2(60),
  X__GLOBAL_ID     VARCHAR2(64)
)
;
alter table DS_TEACHERQUALIFICATION
  add primary key (GLOBALID);

prompt
prompt Creating table DS_TECHNICAL_TITLE
prompt =================================
prompt
create table DS_TECHNICAL_TITLE
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  PRIMARY          NUMBER(1),
  TITLENAME        VARCHAR2(80),
  TITLENAMELEVEL   VARCHAR2(80),
  ACHIEVEWAY       VARCHAR2(80),
  CHECKUNIT        VARCHAR2(120),
  CHECKDATE        TIMESTAMP(6),
  APPOINTDUTY      VARCHAR2(80),
  APPOINTDUTYLEVEL VARCHAR2(80),
  APPOINTUNIT      VARCHAR2(120),
  APPOINTDATE      TIMESTAMP(6),
  APPOINTSTATE     VARCHAR2(80),
  DISMISSDATE      TIMESTAMP(6),
  DISMISSREASON    VARCHAR2(160),
  X__GLOBAL_ID     VARCHAR2(64)
)
;
alter table DS_TECHNICAL_TITLE
  add primary key (GLOBALID);

prompt
prompt Creating table DS_UNITS
prompt =======================
prompt
create table DS_UNITS
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  PRIMARY         NUMBER(1),
  TIME            TIMESTAMP(6),
  ORG             VARCHAR2(80),
  UNITNAME        VARCHAR2(50),
  DIAODONGYUANYIN CLOB,
  LICENSE         VARCHAR2(50),
  APPLY_DATE      TIMESTAMP(6),
  TECHNIC         VARCHAR2(20),
  X__GLOBAL_ID    VARCHAR2(64)
)
;
alter table DS_UNITS
  add primary key (GLOBALID);

prompt
prompt Creating table FANGWENXUEZHEGUANLI
prompt ==================================
prompt
create table FANGWENXUEZHEGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  X__GLOBAL_ID   VARCHAR2(64),
  NAME           VARCHAR2(50),
  CAMPUS_CARD    VARCHAR2(50),
  DEPT_NAME      VARCHAR2(200),
  NATIVE_PLACE   VARCHAR2(200),
  BIRTHDAY       TIMESTAMP(6),
  POLITY_DATE    TIMESTAMP(6),
  FAMILY_ADDRESS VARCHAR2(200),
  C_ADDRESS      VARCHAR2(200),
  POSTALCODE     VARCHAR2(20),
  PHONE          VARCHAR2(20),
  EMAIL          VARCHAR2(200),
  VISIT_BDATE    TIMESTAMP(6),
  VISIT_EDATE    TIMESTAMP(6),
  TUTOR_NAME     VARCHAR2(50),
  TUTOR_OUTLAY   VARCHAR2(20),
  OUTLAY_CARD    VARCHAR2(20),
  RECOM_SCHOOL   VARCHAR2(200),
  TASK_NAME      VARCHAR2(200),
  ISSNED_CERTIF  NUMBER(1),
  SEX_CODE       VARCHAR2(80),
  NATION_CODE    VARCHAR2(80),
  POLITY_CODE    VARCHAR2(80),
  MARRIAGE_CODE  VARCHAR2(80),
  HEALTH_CODE    VARCHAR2(80),
  EDU_CODE       VARCHAR2(80),
  DEGREE_CODE    VARCHAR2(80),
  TECHNIC_CODE   VARCHAR2(80),
  DUTY_CODE      VARCHAR2(80)
)
;
alter table FANGWENXUEZHEGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table GANGQIANPEIXUNGUANLI
prompt ===================================
prompt
create table GANGQIANPEIXUNGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  BDATE          TIMESTAMP(6),
  EDATE          TIMESTAMP(6),
  GRADE1         VARCHAR2(20),
  GRADE2         VARCHAR2(20),
  GRADE3         VARCHAR2(20),
  GRADE4         VARCHAR2(20),
  GRADE5         VARCHAR2(20),
  SUBJ1_GRADE    VARCHAR2(20),
  SUBJ2_GRADE    VARCHAR2(20),
  SUBJ3_GRADE    VARCHAR2(20),
  SUBJ1          VARCHAR2(50),
  SUBJ2          VARCHAR2(50),
  SUBJ3          VARCHAR2(50),
  X__GLOBAL_ID   VARCHAR2(64),
  DEPT_NAME      VARCHAR2(50)
)
;
alter table GANGQIANPEIXUNGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table GB_T10301
prompt ========================
prompt
create table GB_T10301
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T10301
  add primary key (CODEID);

prompt
prompt Creating table GB_T10303
prompt ========================
prompt
create table GB_T10303
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T10303
  add primary key (CODEID);

prompt
prompt Creating table GB_T12403
prompt ========================
prompt
create table GB_T12403
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T12403
  add primary key (CODEID);

prompt
prompt Creating table GB_T12407
prompt ========================
prompt
create table GB_T12407
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T12407
  add primary key (CODEID);

prompt
prompt Creating table GB_T12408
prompt ========================
prompt
create table GB_T12408
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T12408
  add primary key (CODEID);

prompt
prompt Creating table GB_T2260
prompt =======================
prompt
create table GB_T2260
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T2260
  add primary key (CODEID);

prompt
prompt Creating table GB_T2261
prompt =======================
prompt
create table GB_T2261
(
  CODEID     VARCHAR2(125),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table GB_T2659
prompt =======================
prompt
create table GB_T2659
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T2659
  add primary key (CODEID);

prompt
prompt Creating table GB_T3304
prompt =======================
prompt
create table GB_T3304
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T3304
  add primary key (CODEID);

prompt
prompt Creating table GB_T4658
prompt =======================
prompt
create table GB_T4658
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T4658
  add primary key (CODEID);

prompt
prompt Creating table GB_T4762
prompt =======================
prompt
create table GB_T4762
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T4762
  add primary key (CODEID);

prompt
prompt Creating table GB_T4764
prompt =======================
prompt
create table GB_T4764
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T4764
  add primary key (CODEID);

prompt
prompt Creating table GB_T4765
prompt =======================
prompt
create table GB_T4765
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T4765
  add primary key (CODEID);

prompt
prompt Creating table GB_T4766
prompt =======================
prompt
create table GB_T4766
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table GB_T4767
prompt =======================
prompt
create table GB_T4767
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
comment on column GB_T4767.CODEID
  is '??ID';

prompt
prompt Creating table GB_T4880
prompt =======================
prompt
create table GB_T4880
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T4880
  add primary key (CODEID);

prompt
prompt Creating table GB_T4881
prompt =======================
prompt
create table GB_T4881
(
  CODEID     VARCHAR2(64),
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;

prompt
prompt Creating table GB_T6864
prompt =======================
prompt
create table GB_T6864
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T6864
  add primary key (CODEID);

prompt
prompt Creating table GB_T8560
prompt =======================
prompt
create table GB_T8560
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T8560
  add primary key (CODEID);

prompt
prompt Creating table GB_T8561_2001
prompt ============================
prompt
create table GB_T8561_2001
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T8561_2001
  add primary key (CODEID);

prompt
prompt Creating table GB_T8563
prompt =======================
prompt
create table GB_T8563
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table GB_T8563
  add primary key (CODEID);

prompt
prompt Creating table GONGRENJISHUDENGJI
prompt =================================
prompt
create table GONGRENJISHUDENGJI
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  PRIMARY         NUMBER(1),
  LEVEL_          VARCHAR2(80),
  LEVELDATE       TIMESTAMP(6),
  ACHIEVEWAY      VARCHAR2(80),
  CHECKUNIT       VARCHAR2(150),
  TITLE           VARCHAR2(80),
  TITLEDATE       TIMESTAMP(6),
  TITLEUNIT       VARCHAR2(150),
  TITLESTATE      VARCHAR2(80),
  DISMISSDATE     TIMESTAMP(6),
  DISMISSREASON   VARCHAR2(180),
  KIND            VARCHAR2(80),
  EMPLOYEE_ID     VARCHAR2(20),
  LEVEL_CERTIF_ID VARCHAR2(50),
  WORK_TYPE       VARCHAR2(50),
  WORK_TYPE_TIME  TIMESTAMP(6),
  WORK_TYPE_UNIT  VARCHAR2(20),
  WORK_TYPE_LEVEL VARCHAR2(20),
  THEORY_SCORE    VARCHAR2(20),
  OPERATE_SCORE   VARCHAR2(20),
  CERTIF_DATE     TIMESTAMP(6),
  X__GLOBAL_ID    VARCHAR2(64)
)
;
alter table GONGRENJISHUDENGJI
  add primary key (GLOBALID);

prompt
prompt Creating table GONGRENJISHUDENGJIKAOSHIGUANLI
prompt =============================================
prompt
create table GONGRENJISHUDENGJIKAOSHIGUANLI
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  X__GLOBAL_ID    VARCHAR2(64),
  LEVEL_CERTIF_ID VARCHAR2(50),
  WORK_TYPE_TIME  NUMBER(30),
  THEORY_SCORE    VARCHAR2(20),
  OPERATE_SCORE   VARCHAR2(20),
  CERTIF_DATE     TIMESTAMP(6),
  WORK_TYPE       VARCHAR2(80),
  WORK_TYPE_LEVEL VARCHAR2(80),
  WORK_TYPE_UNIT  VARCHAR2(80)
)
;
alter table GONGRENJISHUDENGJIKAOSHIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table GONGZUOJINGLI
prompt ============================
prompt
create table GONGZUOJINGLI
(
  GLOBALID           VARCHAR2(64) not null,
  STAFFID            VARCHAR2(30),
  REMARK             VARCHAR2(500),
  LASTMODIFYTIME     VARCHAR2(25),
  X__GLOBAL_ID       VARCHAR2(64),
  STARTTIME          TIMESTAMP(6),
  ENDTIME            TIMESTAMP(6),
  UNITNAME           VARCHAR2(120),
  WORKCONTENT        VARCHAR2(120),
  DUTY               VARCHAR2(80),
  MAJORQUALIFICATION VARCHAR2(80),
  WITNESS            VARCHAR2(60)
)
;
alter table GONGZUOJINGLI
  add primary key (GLOBALID);

prompt
prompt Creating table GUONEIJINXIU
prompt ===========================
prompt
create table GUONEIJINXIU
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  KIND              VARCHAR2(80),
  MODE_MODE         VARCHAR2(80),
  STARTTIME         TIMESTAMP(6),
  ENDTIME           TIMESTAMP(6),
  STUDYTIME         NUMBER(30),
  STUDYCONTENT      VARCHAR2(160),
  CLASSNAME         VARCHAR2(80),
  FRONTUNIT         VARCHAR2(120),
  FRONTUNITPROPERTY VARCHAR2(80),
  UNDERTAKEUNIT     VARCHAR2(120),
  UNDERTAKEUNITSORT VARCHAR2(80),
  RESULT            VARCHAR2(80),
  X__GLOBAL_ID      VARCHAR2(64)
)
;
alter table GUONEIJINXIU
  add primary key (GLOBALID);

prompt
prompt Creating table GUONEIJINXIUXINXIGUANLI
prompt ======================================
prompt
create table GUONEIJINXIUXINXIGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  DEPT_ID          VARCHAR2(20),
  DUTY             VARCHAR2(20),
  TECHNIC          VARCHAR2(20),
  EDUCATION        VARCHAR2(20),
  DEGREE           VARCHAR2(20),
  SPECIALITY       VARCHAR2(200),
  CONTRACT_ID      VARCHAR2(50),
  STUDY_SCHOOL     VARCHAR2(200),
  STUDY_SPECIALITY VARCHAR2(200),
  STUDY_START_DATE TIMESTAMP(6),
  STUDY_END_DATE   TIMESTAMP(6),
  TEACHER          VARCHAR2(50),
  FREE_MONEY       NUMBER(10,2),
  FREE_DATE        TIMESTAMP(6),
  RETURN_MONEY     NUMBER(10,2),
  RETURN_DATE      TIMESTAMP(6),
  EXAM             CLOB,
  X__GLOBAL_ID     VARCHAR2(64),
  LEARNING_INFO    VARCHAR2(80),
  STUDY_TYPE       VARCHAR2(80),
  STUDY_MODE       VARCHAR2(80)
)
;
alter table GUONEIJINXIUXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table JIAOSHIZIGEZHENGGUANLI
prompt =====================================
prompt
create table JIAOSHIZIGEZHENGGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  CERT_NO          VARCHAR2(50),
  CERT_DATE        TIMESTAMP(6),
  APPLY_DATE       TIMESTAMP(6),
  REGISTERED_PLACE VARCHAR2(200),
  MOBILE_PHONE     VARCHAR2(20),
  SUBJECT          VARCHAR2(50),
  X__GLOBAL_ID     VARCHAR2(64),
  IS_TCHR_TRAIN    NUMBER(1),
  MANDARIN         VARCHAR2(80),
  IS_DOCTOR        NUMBER(1),
  PASS_EXAM        NUMBER(1)
)
;
alter table JIAOSHIZIGEZHENGGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table JIAOZHIGONGPEIXUNGUANLI
prompt ======================================
prompt
create table JIAOZHIGONGPEIXUNGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  TRAIN_NAME       VARCHAR2(50),
  TRAIN_CONTENT    VARCHAR2(500),
  TRAIN_PLACE      VARCHAR2(20),
  TRAIN_ORG        VARCHAR2(50),
  TRAIN_START_DATE TIMESTAMP(6),
  TRAIN_END_DATE   TIMESTAMP(6),
  STATUS_APPLY     VARCHAR2(1),
  AUDITING_DATE    TIMESTAMP(6),
  AUDITING_IDEA    VARCHAR2(200),
  AUDITING_NAME    VARCHAR2(20),
  STATUS_VERIFY    VARCHAR2(1),
  SQDATE           TIMESTAMP(6),
  TAG_DELETE_USER  VARCHAR2(20),
  TAG_UPDATE_USER  VARCHAR2(20),
  TAG_UPDATE_DATE  TIMESTAMP(6),
  TAG_DELETE       VARCHAR2(1),
  TAG_INSERT_DATE  TIMESTAMP(6),
  TAG_DELETE_DATE  TIMESTAMP(6),
  TAG_INSERT_USER  VARCHAR2(20),
  X__GLOBAL_ID     VARCHAR2(64),
  DEPT_NAME        VARCHAR2(50),
  TRAIN_LEVEL      VARCHAR2(80),
  TRAIN_TYPE       VARCHAR2(80),
  TRAIN_MOTHOD     VARCHAR2(80)
)
;
alter table JIAOZHIGONGPEIXUNGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table JIATINGCHENGYUAN
prompt ===============================
prompt
create table JIATINGCHENGYUAN
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  TITLE          VARCHAR2(80),
  BIRTHDAY       TIMESTAMP(6),
  XINGMING       VARCHAR2(50),
  XINGBIE        VARCHAR2(80),
  GONGZUODANWEI  VARCHAR2(100),
  ZHIWU          VARCHAR2(100),
  NATION         VARCHAR2(200),
  X__GLOBAL_ID   VARCHAR2(64),
  MEMBER_POLITY  VARCHAR2(80)
)
;
alter table JIATINGCHENGYUAN
  add primary key (GLOBALID);

prompt
prompt Creating table JIXUJIAOYUXINXIGUANLI
prompt ====================================
prompt
create table JIXUJIAOYUXINXIGUANLI
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  EDUCATION_TYPE    VARCHAR2(200),
  EDUCATION_CHANNEL VARCHAR2(200),
  EDUCATION_MSG     VARCHAR2(200),
  EDUCATION_DEPT    VARCHAR2(200),
  EDUCATION_ADS     VARCHAR2(200),
  START_TIME        TIMESTAMP(6),
  END_TIME          TIMESTAMP(6),
  EDUCATION_DATE    VARCHAR2(200),
  X__GLOBAL_ID      VARCHAR2(64)
)
;
alter table JIXUJIAOYUXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table KDJ
prompt ==================
prompt
create table KDJ
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table KDJ
  add primary key (CODEID);

prompt
prompt Creating table KEYANXIANGMUGUANLI
prompt =================================
prompt
create table KEYANXIANGMUGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  RESEARCH_ID    VARCHAR2(50),
  RESEARCH_NAME  CLOB,
  SELF_FUNC      VARCHAR2(20),
  REACHED_MONEY  VARCHAR2(20),
  PROCEED_STATE  CLOB,
  ITEM_SOURCE    CLOB,
  RESEARCH_LVL   VARCHAR2(20),
  BYEARM         TIMESTAMP(6),
  EYEARM         TIMESTAMP(6),
  X__GLOBAL_ID   VARCHAR2(64),
  FILE_PATH      VARCHAR2(100)
)
;
alter table KEYANXIANGMUGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table KK
prompt =================
prompt
create table KK
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table KK
  add primary key (CODEID);

prompt
prompt Creating table LINKS
prompt ====================
prompt
create table LINKS
(
  INDEX_LINKS   VARCHAR2(50) not null,
  NAME_LINKS    VARCHAR2(100),
  ADDR_LINKS    VARCHAR2(100),
  SEQUENCE_CODE NUMBER(7),
  REMARK_LINKS  VARCHAR2(200)
)
;
alter table LINKS
  add primary key (INDEX_LINKS);

prompt
prompt Creating table LUNWENZHUZUOGUANLI
prompt =================================
prompt
create table LUNWENZHUZUOGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(10),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  TITLE            VARCHAR2(100),
  AUTHOR_POSITION  VARCHAR2(20),
  ISSN             VARCHAR2(20),
  PUBLICATION_NAME VARCHAR2(20),
  PUBLISH_YEAR     VARCHAR2(20),
  AFFECT_FACTOR    VARCHAR2(50),
  BOOK_NUM         VARCHAR2(20),
  WORD_COUNT       VARCHAR2(10),
  QUOTE_NUM        NUMBER(30),
  AWARD            VARCHAR2(100),
  X__GLOBAL_ID     VARCHAR2(50),
  PRESS            VARCHAR2(100),
  FILE_PATH        VARCHAR2(100),
  PUBLICATION_LVL  VARCHAR2(80),
  PUBLIC_FORM_ID   VARCHAR2(80)
)
;
alter table LUNWENZHUZUOGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table PERSONAL
prompt =======================
prompt
create table PERSONAL
(
  GLOBALID           VARCHAR2(64) not null,
  STAFFID            VARCHAR2(30),
  REMARK             VARCHAR2(500),
  LASTMODIFYTIME     VARCHAR2(25),
  CHUSHENGRIQI       TIMESTAMP(6),
  CENGYONGMING       VARCHAR2(50),
  NATIONALITY        VARCHAR2(80),
  NAMESPELL          VARCHAR2(50),
  NATION             VARCHAR2(80),
  NATIVEPLACE        VARCHAR2(80),
  BORNPLACE          VARCHAR2(80),
  PHOTO              VARCHAR2(110),
  WORKTIME           TIMESTAMP(6),
  HEALTHSTATE        VARCHAR2(80),
  BLOODTYPE          VARCHAR2(80),
  COLONY             VARCHAR2(80),
  MARRIAGESTATE      VARCHAR2(80),
  ORIGIN             VARCHAR2(80),
  PERSONSTATION      VARCHAR2(80),
  RESIDENCE          VARCHAR2(240),
  CADRETIME          TIMESTAMP(6),
  GRANTCADRETIME     TIMESTAMP(6),
  DOCTORMENTORTIME   TIMESTAMP(6),
  BACHELORMENTORTIME TIMESTAMP(6),
  INNERID            VARCHAR2(64),
  HRINTIME           TIMESTAMP(6),
  X__GLOBAL_ID       VARCHAR2(64),
  SEX                VARCHAR2(80),
  HOT                VARCHAR2(80)
)
;
alter table PERSONAL
  add primary key (GLOBALID);

prompt
prompt Creating table PINGANGXINXI
prompt ===========================
prompt
create table PINGANGXINXI
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  PINRENBUMEN     VARCHAR2(90),
  EMPLOYEE_ID     VARCHAR2(20),
  DEPT_ID         VARCHAR2(50),
  START_DATE      TIMESTAMP(6),
  END_DATE        TIMESTAMP(6),
  FILE_ID         VARCHAR2(200),
  POST            VARCHAR2(200),
  TEACHER_PROP    VARCHAR2(20),
  EMPLOYEE_SORT   VARCHAR2(20),
  FLAG_CHANGE     NUMBER(30),
  UNCHANGE_REASON VARCHAR2(500),
  X__GLOBAL_ID    VARCHAR2(64),
  POST_SORT       VARCHAR2(80),
  POST_LEVEL      VARCHAR2(80)
)
;
alter table PINGANGXINXI
  add primary key (GLOBALID);

prompt
prompt Creating table POSITION
prompt =======================
prompt
create table POSITION
(
  POSITION_KEY      VARCHAR2(50) not null,
  POSITION_NAME     VARCHAR2(30),
  POSITION_HNO      VARCHAR2(50),
  DEPARTMENT_KEY    VARCHAR2(50),
  DEPARTMENT_NAME   VARCHAR2(255 CHAR),
  SORT_NUM          VARCHAR2(255 CHAR),
  LEADER_KEYS       VARCHAR2(255 CHAR),
  LEADER_NAMES      VARCHAR2(255 CHAR),
  DIVISION_KEY      VARCHAR2(255 CHAR),
  DIVISION_NAME     VARCHAR2(255 CHAR),
  LEVEL_KEY         VARCHAR2(255 CHAR),
  LEVEL_NAME        VARCHAR2(255 CHAR),
  FOUND_NUM         VARCHAR2(255 CHAR),
  CLOSE_NUM         VARCHAR2(255 CHAR),
  FOUND_DATE        TIMESTAMP(6),
  CLOSE_DATE        TIMESTAMP(6),
  DESCRIPTION       VARCHAR2(3000 CHAR),
  PRE_PERSON_COUNT  INTEGER,
  FACT_PERSON_COUNT INTEGER,
  CREATE_DATE       TIMESTAMP(6),
  LAST_UPDATE_DATE  TIMESTAMP(6)
)
;
alter table POSITION
  add constraint POSITION_PK_POSITION_KEY primary key (POSITION_KEY);

prompt
prompt Creating table QINGNIANLAOSHIDAIJIAOXINXI
prompt =========================================
prompt
create table QINGNIANLAOSHIDAIJIAOXINXI
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  TEACH_NAME        VARCHAR2(20),
  TEACH_TECHNIC     VARCHAR2(20),
  BYMT_EMPLOYEE_ID  VARCHAR2(20),
  BYMT_NAME         VARCHAR2(20),
  START_DATE        TIMESTAMP(6),
  END_DATE          TIMESTAMP(6),
  AGREEMENT_NUM     VARCHAR2(20),
  AGREEMENT_DATE    TIMESTAMP(6),
  EXAM              VARCHAR2(20),
  X__GLOBAL_ID      VARCHAR2(64),
  TEACH_EMPLOYEE_ID VARCHAR2(50),
  EDUCATION         VARCHAR2(50)
)
;
alter table QINGNIANLAOSHIDAIJIAOXINXI
  add primary key (GLOBALID);

prompt
prompt Creating table RECRUIT_ACCOUNT
prompt ==============================
prompt
create table RECRUIT_ACCOUNT
(
  ID            VARCHAR2(30) not null,
  EMAIL         VARCHAR2(40),
  USERNAME      VARCHAR2(30),
  PASSWORD      VARCHAR2(30),
  LASTLOGINDATE TIMESTAMP(6),
  CREATEDATE    TIMESTAMP(6)
)
;
alter table RECRUIT_ACCOUNT
  add constraint PK_ID primary key (ID);

prompt
prompt Creating table RECRUIT_ARCHIVE
prompt ==============================
prompt
create table RECRUIT_ARCHIVE
(
  ARCHIVE_ID    VARCHAR2(32) not null,
  ARCHIVE_NO    VARCHAR2(32),
  ARCHIVE_NAME  VARCHAR2(32),
  TAKEIN_DATE   DATE,
  RECEIVER      VARCHAR2(32),
  COME_DEPT     VARCHAR2(32),
  POSITION      VARCHAR2(32),
  TRANSFOR      VARCHAR2(32),
  TRAN_RECEIVER VARCHAR2(32),
  TRAN_DEPT     VARCHAR2(32),
  TRAN_DATE     DATE,
  STATUS        CHAR(1)
)
;
comment on column RECRUIT_ARCHIVE.ARCHIVE_ID
  is '??ID';
comment on column RECRUIT_ARCHIVE.ARCHIVE_NO
  is '????';
comment on column RECRUIT_ARCHIVE.ARCHIVE_NAME
  is '????';
comment on column RECRUIT_ARCHIVE.TAKEIN_DATE
  is '????';
comment on column RECRUIT_ARCHIVE.RECEIVER
  is '???';
comment on column RECRUIT_ARCHIVE.COME_DEPT
  is '????';
comment on column RECRUIT_ARCHIVE.POSITION
  is '????';
comment on column RECRUIT_ARCHIVE.TRANSFOR
  is '???';
comment on column RECRUIT_ARCHIVE.TRAN_RECEIVER
  is '?????';
comment on column RECRUIT_ARCHIVE.TRAN_DEPT
  is '??????';
comment on column RECRUIT_ARCHIVE.TRAN_DATE
  is '????';
comment on column RECRUIT_ARCHIVE.STATUS
  is '????(1:??? 2:??? 3:???)';
alter table RECRUIT_ARCHIVE
  add primary key (ARCHIVE_ID);

prompt
prompt Creating table RECRUIT_ARCHIVE_RECORD
prompt =====================================
prompt
create table RECRUIT_ARCHIVE_RECORD
(
  RECORD_ID       VARCHAR2(23) not null,
  ARCHIVE_ID      VARCHAR2(32),
  BORROWOR        VARCHAR2(32),
  BORROW_OPERATOR VARCHAR2(32),
  BORROW_DATE     DATE,
  BORROW_DAY      INTEGER,
  REBACKOR        VARCHAR2(32),
  REBACK_OPERATOR VARCHAR2(32),
  REBACK_DATE     DATE,
  REMARK          VARCHAR2(100)
)
;
comment on column RECRUIT_ARCHIVE_RECORD.RECORD_ID
  is '??ID';
comment on column RECRUIT_ARCHIVE_RECORD.ARCHIVE_ID
  is '??ID';
comment on column RECRUIT_ARCHIVE_RECORD.BORROWOR
  is '???';
comment on column RECRUIT_ARCHIVE_RECORD.BORROW_OPERATOR
  is '?????';
comment on column RECRUIT_ARCHIVE_RECORD.BORROW_DATE
  is '????';
comment on column RECRUIT_ARCHIVE_RECORD.BORROW_DAY
  is '????';
comment on column RECRUIT_ARCHIVE_RECORD.REBACKOR
  is '???';
comment on column RECRUIT_ARCHIVE_RECORD.REBACK_OPERATOR
  is '?????';
comment on column RECRUIT_ARCHIVE_RECORD.REBACK_DATE
  is '????';
comment on column RECRUIT_ARCHIVE_RECORD.REMARK
  is '??';
alter table RECRUIT_ARCHIVE_RECORD
  add primary key (RECORD_ID);
alter table RECRUIT_ARCHIVE_RECORD
  add constraint FK_RECRUIT_RECORD foreign key (ARCHIVE_ID)
  references RECRUIT_ARCHIVE (ARCHIVE_ID) on delete cascade;

prompt
prompt Creating table RECRUIT_AUDIT_STEP_DETAIL
prompt ========================================
prompt
create table RECRUIT_AUDIT_STEP_DETAIL
(
  RECRUITMENT_CATEGORY_NUMBER NUMBER(7) not null,
  AUDIT_DEPARTMENT_ID         VARCHAR2(50) not null,
  AUDIT_DEPARTMENT_NAME       VARCHAR2(50) not null,
  SORT_NUMBER                 NUMBER(5) not null,
  PRE_STEP_KEY                VARCHAR2(50),
  POST_STEP_KEY               VARCHAR2(50),
  CURRENT_STEP_KEY            VARCHAR2(50) not null
)
;
comment on column RECRUIT_AUDIT_STEP_DETAIL.RECRUITMENT_CATEGORY_NUMBER
  is '?????Id';
comment on column RECRUIT_AUDIT_STEP_DETAIL.AUDIT_DEPARTMENT_ID
  is '??????';
comment on column RECRUIT_AUDIT_STEP_DETAIL.AUDIT_DEPARTMENT_NAME
  is '??????';
comment on column RECRUIT_AUDIT_STEP_DETAIL.SORT_NUMBER
  is '???';
comment on column RECRUIT_AUDIT_STEP_DETAIL.PRE_STEP_KEY
  is '????';
comment on column RECRUIT_AUDIT_STEP_DETAIL.POST_STEP_KEY
  is '????';
comment on column RECRUIT_AUDIT_STEP_DETAIL.CURRENT_STEP_KEY
  is '??,????????';
alter table RECRUIT_AUDIT_STEP_DETAIL
  add constraint CURRENT_STEP_KEY primary key (CURRENT_STEP_KEY);

prompt
prompt Creating table RECRUIT_AUDIT_STEP_SETTING
prompt =========================================
prompt
create table RECRUIT_AUDIT_STEP_SETTING
(
  RECRUITMENT_CATEGORY_NUMBER NUMBER(7) not null,
  RECRUITMENT_CATEGORY_NAME   VARCHAR2(25) not null,
  SET_AUDIT_STEP_PATH         VARCHAR2(100) not null,
  RECRUITMENT_CATEGORY_REMARK VARCHAR2(100),
  CURRENT_AUDIT_STATE         NUMBER(1) not null,
  AUDIT_STEP_KEY              VARCHAR2(50),
  FLOW_KEY                    VARCHAR2(50),
  VERSION_                    NUMBER(9),
  IS_USING                    NUMBER(1)
)
;
comment on column RECRUIT_AUDIT_STEP_SETTING.RECRUITMENT_CATEGORY_NUMBER
  is '??';
comment on column RECRUIT_AUDIT_STEP_SETTING.RECRUITMENT_CATEGORY_NAME
  is '??????';
comment on column RECRUIT_AUDIT_STEP_SETTING.SET_AUDIT_STEP_PATH
  is '??????(????)';
comment on column RECRUIT_AUDIT_STEP_SETTING.RECRUITMENT_CATEGORY_REMARK
  is '??';
comment on column RECRUIT_AUDIT_STEP_SETTING.CURRENT_AUDIT_STATE
  is '??(1:??,0:??)';
alter table RECRUIT_AUDIT_STEP_SETTING
  add primary key (RECRUITMENT_CATEGORY_NUMBER);

prompt
prompt Creating table RECRUIT_BATCH_SETTING
prompt ====================================
prompt
create table RECRUIT_BATCH_SETTING
(
  BATCH_NO     VARCHAR2(40) not null,
  BATCH_NAME   VARCHAR2(30),
  YEAR         VARCHAR2(20),
  BATCH_STATUS NUMBER(10),
  CREATE_TIME  VARCHAR2(30),
  CLOSE_TIME   VARCHAR2(30),
  OPEN_TIME    VARCHAR2(30),
  BATCH_NUMBER VARCHAR2(30)
)
;
comment on column RECRUIT_BATCH_SETTING.BATCH_NO
  is '????';
comment on column RECRUIT_BATCH_SETTING.BATCH_NAME
  is '????';
comment on column RECRUIT_BATCH_SETTING.YEAR
  is '??';
comment on column RECRUIT_BATCH_SETTING.BATCH_STATUS
  is '???0.?? 1.?? 2.???';
comment on column RECRUIT_BATCH_SETTING.CREATE_TIME
  is '????';
comment on column RECRUIT_BATCH_SETTING.CLOSE_TIME
  is '????';
comment on column RECRUIT_BATCH_SETTING.OPEN_TIME
  is '????';
comment on column RECRUIT_BATCH_SETTING.BATCH_NUMBER
  is '?????????';
alter table RECRUIT_BATCH_SETTING
  add constraint BATCH_SETTING_PK primary key (BATCH_NO);

prompt
prompt Creating table RECRUIT_NOTICE
prompt =============================
prompt
create table RECRUIT_NOTICE
(
  ID              VARCHAR2(40) not null,
  TITLE           VARCHAR2(50),
  ACCESSORY       VARCHAR2(200),
  USERNAME        VARCHAR2(30),
  RECIPIENT_EMAIL VARCHAR2(30),
  SENDTIME        VARCHAR2(30),
  USER_EMAIL      VARCHAR2(40),
  TYPE            VARCHAR2(15),
  REMARK          VARCHAR2(4000),
  CONTENT         CLOB
)
;
comment on column RECRUIT_NOTICE.ID
  is '??';
comment on column RECRUIT_NOTICE.TITLE
  is '??';
comment on column RECRUIT_NOTICE.ACCESSORY
  is '????';
comment on column RECRUIT_NOTICE.USERNAME
  is '???';
comment on column RECRUIT_NOTICE.RECIPIENT_EMAIL
  is '??????';
comment on column RECRUIT_NOTICE.SENDTIME
  is '????';
alter table RECRUIT_NOTICE
  add primary key (ID);

prompt
prompt Creating table RECRUIT_PLAN
prompt ===========================
prompt
create table RECRUIT_PLAN
(
  PLAN_ID                 VARCHAR2(38) not null,
  YEAR                    VARCHAR2(6),
  RECRUIT_DEPARTMENT_ID   VARCHAR2(50),
  RECRUIT_DEPARTMENT_NAME VARCHAR2(50),
  OPEN_POSITIONS_ID       VARCHAR2(50),
  OPEN_POSITIONS_NAME     VARCHAR2(50),
  SUBJECT_ID              VARCHAR2(50),
  PROFESSIONAL_ID         VARCHAR2(50),
  PROFESSIONAL_FIELD_ID   VARCHAR2(50),
  TALENT_CATEGORY_ID      VARCHAR2(50),
  RECRUIT_METHOD_ID       VARCHAR2(50),
  RECRUIT_CATEGORY_ID     VARCHAR2(30),
  LOWEST_EDUCATION_ID     VARCHAR2(30),
  LOWEST_DEGREE_ID        VARCHAR2(30),
  LOWEST_TITLES_ID        VARCHAR2(30),
  FORMATION_CATEGORY_ID   VARCHAR2(30),
  TOP_TALENTS_ID          VARCHAR2(30),
  STATUS                  NUMBER(4),
  CREATE_TIME             DATE,
  UPDATE_TIME             DATE,
  DEPARTMENT_ID           VARCHAR2(40),
  DEPARTMENT_NAME         VARCHAR2(40),
  LOGGING_ID              VARCHAR2(40),
  PLAN_CREATE_METHOD      VARCHAR2(30),
  CURRENT_STEP_KEY        VARCHAR2(40),
  BATCH_NO                VARCHAR2(40),
  START_RELEASE_TIME      DATE,
  END_RELEASE_TIME        DATE,
  BATCH_NAME              VARCHAR2(30),
  CURRENT_DEPARTMENT_IDS  VARCHAR2(500),
  JOB_DUTY                CLOB,
  JOB_REQUEST             CLOB,
  REMARK                  VARCHAR2(4000),
  RECRUIT_COUNT           VARCHAR2(5)
)
;
comment on column RECRUIT_PLAN.PLAN_ID
  is '??';
comment on column RECRUIT_PLAN.YEAR
  is '??';
comment on column RECRUIT_PLAN.RECRUIT_DEPARTMENT_ID
  is '????Id';
comment on column RECRUIT_PLAN.RECRUIT_DEPARTMENT_NAME
  is '??????';
comment on column RECRUIT_PLAN.OPEN_POSITIONS_ID
  is '????id ';
comment on column RECRUIT_PLAN.OPEN_POSITIONS_NAME
  is '??????';
comment on column RECRUIT_PLAN.SUBJECT_ID
  is '??id';
comment on column RECRUIT_PLAN.PROFESSIONAL_ID
  is '??id';
comment on column RECRUIT_PLAN.PROFESSIONAL_FIELD_ID
  is '????id';
comment on column RECRUIT_PLAN.TALENT_CATEGORY_ID
  is '????id';
comment on column RECRUIT_PLAN.RECRUIT_METHOD_ID
  is '????id';
comment on column RECRUIT_PLAN.RECRUIT_CATEGORY_ID
  is '????';
comment on column RECRUIT_PLAN.LOWEST_EDUCATION_ID
  is '????';
comment on column RECRUIT_PLAN.LOWEST_DEGREE_ID
  is '????';
comment on column RECRUIT_PLAN.LOWEST_TITLES_ID
  is '????';
comment on column RECRUIT_PLAN.FORMATION_CATEGORY_ID
  is '????';
comment on column RECRUIT_PLAN.TOP_TALENTS_ID
  is '????';
comment on column RECRUIT_PLAN.STATUS
  is '???1?????2?????3?????4????5?????5????';
comment on column RECRUIT_PLAN.CREATE_TIME
  is '????';
comment on column RECRUIT_PLAN.UPDATE_TIME
  is '????';
comment on column RECRUIT_PLAN.DEPARTMENT_ID
  is '??????id';
comment on column RECRUIT_PLAN.DEPARTMENT_NAME
  is '????????';
comment on column RECRUIT_PLAN.LOGGING_ID
  is '????id';
comment on column RECRUIT_PLAN.PLAN_CREATE_METHOD
  is '??????';
comment on column RECRUIT_PLAN.CURRENT_STEP_KEY
  is '?????????Id';
comment on column RECRUIT_PLAN.BATCH_NO
  is '??Id';
comment on column RECRUIT_PLAN.START_RELEASE_TIME
  is '????????';
comment on column RECRUIT_PLAN.END_RELEASE_TIME
  is '????????';
comment on column RECRUIT_PLAN.BATCH_NAME
  is '????';
alter table RECRUIT_PLAN
  add primary key (PLAN_ID);

prompt
prompt Creating table RECRUIT_RESUME_DEFINITION
prompt ========================================
prompt
create table RECRUIT_RESUME_DEFINITION
(
  RESUME_DEFINITION_ID          VARCHAR2(50) not null,
  RESUME_DEFINITION_TABLE_NAME  VARCHAR2(25),
  RESUME_DEFINITION_TABLE_TITLE VARCHAR2(25),
  RESUME_DEFINITION_IS_OPEN     VARCHAR2(2),
  RESUME_DEFINITION_IS_REQUIRED VARCHAR2(2),
  RESUME_DEFINITION_COLUMNS     CLOB,
  RESUME_TEMPLATE_KEY           VARCHAR2(10),
  DICTIONARY_DEFINATION_ID      VARCHAR2(50)
)
;
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_ID
  is '?????';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_TABLE_NAME
  is '??';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_TABLE_TITLE
  is '????';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_IS_OPEN
  is '????';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_IS_REQUIRED
  is '?????????';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_DEFINITION_COLUMNS
  is '??';
comment on column RECRUIT_RESUME_DEFINITION.RESUME_TEMPLATE_KEY
  is '?????';
comment on column RECRUIT_RESUME_DEFINITION.DICTIONARY_DEFINATION_ID
  is '???????';
alter table RECRUIT_RESUME_DEFINITION
  add constraint PK_RESUME_DEFINITION_ID primary key (RESUME_DEFINITION_ID);
create index INDEX_RESUME_DEFINITION on RECRUIT_RESUME_DEFINITION (RESUME_DEFINITION_TABLE_NAME, RESUME_DEFINITION_TABLE_TITLE);

prompt
prompt Creating table RECRUIT_RESUME_TEMPLATE
prompt ======================================
prompt
create table RECRUIT_RESUME_TEMPLATE
(
  RESUME_TEMPLATE_ID     VARCHAR2(10) not null,
  RESUME_TEMPLATE_NAME   VARCHAR2(25),
  RESUME_TEMPLATE_STATUS VARCHAR2(2)
)
;
alter table RECRUIT_RESUME_TEMPLATE
  add constraint PK_TEMPLATE_ID primary key (RESUME_TEMPLATE_ID);

prompt
prompt Creating table RENCAIJIRONGYUCHENGHAOGUANLI
prompt ===========================================
prompt
create table RENCAIJIRONGYUCHENGHAOGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  GIVE_DEPT      VARCHAR2(200),
  X__GLOBAL_ID   VARCHAR2(64),
  NAME           VARCHAR2(50),
  DEPT_NAME      VARCHAR2(50),
  EACHER_SORT    VARCHAR2(80),
  COUNTRT        VARCHAR2(80),
  CURENT_STATUS  NUMBER(1),
  AWARD_DATE     TIMESTAMP(6)
)
;
alter table RENCAIJIRONGYUCHENGHAOGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table RENZHIZIGEZHENGSHUDENGJI
prompt =======================================
prompt
create table RENZHIZIGEZHENGSHUDENGJI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  X__GLOBAL_ID   VARCHAR2(64),
  DEPT_NAME      VARCHAR2(50),
  LICENSE        VARCHAR2(50),
  APPLY_DATE     TIMESTAMP(6),
  TECHNIC        VARCHAR2(50)
)
;
alter table RENZHIZIGEZHENGSHUDENGJI
  add primary key (GLOBALID);

prompt
prompt Creating table RONGYUJIANGLI
prompt ============================
prompt
create table RONGYUJIANGLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  PROJECT        VARCHAR2(120),
  REWARD_LEVEL   VARCHAR2(80),
  KIND           VARCHAR2(80),
  MODE_MODE      VARCHAR2(50),
  NAME           VARCHAR2(120),
  NAMECODE       VARCHAR2(80),
  AWARDUNIT      VARCHAR2(120),
  AWARDDATE      TIMESTAMP(6),
  HONORTITLE     VARCHAR2(80),
  HONORDATE      TIMESTAMP(6),
  ROLE           VARCHAR2(80),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table RONGYUJIANGLI
  add primary key (GLOBALID);

prompt
prompt Creating table SHEHUIJIANZHIXINXIGUANLI
prompt =======================================
prompt
create table SHEHUIJIANZHIXINXIGUANLI
(
  GLOBALID                    VARCHAR2(64) not null,
  STAFFID                     VARCHAR2(30),
  REMARK                      VARCHAR2(500),
  LASTMODIFYTIME              VARCHAR2(25),
  PLURALITY_DEPT              VARCHAR2(50),
  SOCIAL_PLURALITY_BEGIN_DATE TIMESTAMP(6),
  SOCIAL_PLURALITY_END_DATE   TIMESTAMP(6),
  X__GLOBAL_ID                VARCHAR2(64),
  FILE_PATH                   VARCHAR2(100),
  SOCIAL_PLURALITY            VARCHAR2(80)
)
;
alter table SHEHUIJIANZHIXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table SHEHUISHIJIANXINXIGUANLI
prompt =======================================
prompt
create table SHEHUISHIJIANXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  PRA_CONTENT    VARCHAR2(500),
  ADDRESS        VARCHAR2(200),
  START_DATE     TIMESTAMP(6),
  END_DATE       TIMESTAMP(6),
  PRA_TYPE       VARCHAR2(20),
  PRA_RESULT     VARCHAR2(500),
  DAYS           VARCHAR2(20),
  X__GLOBAL_ID   VARCHAR2(64),
  FILE_PATH      VARCHAR2(100)
)
;
alter table SHEHUISHIJIANXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table SHUANGSHIXINXIGUANLI
prompt ===================================
prompt
create table SHUANGSHIXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table SHUANGSHIXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table STAFF_RESIGNATION
prompt ================================
prompt
create table STAFF_RESIGNATION
(
  ID                  VARCHAR2(40) not null,
  STAFF_ID            VARCHAR2(40),
  RESIGNATION_DATE    DATE,
  APPOINT_FILE_NUMBER VARCHAR2(100),
  RESIGNATION_REASON  VARCHAR2(500),
  REMARK              CLOB
)
;
alter table STAFF_RESIGNATION
  add primary key (ID);

prompt
prompt Creating table SYS_CONFIG
prompt =========================
prompt
create table SYS_CONFIG
(
  KEY   VARCHAR2(50) not null,
  VALUE CLOB
)
;
alter table SYS_CONFIG
  add primary key (KEY);

prompt
prompt Creating table TASK
prompt ===================
prompt
create table TASK
(
  TASK_KEY        VARCHAR2(40) not null,
  TASK_NAME       VARCHAR2(50),
  TASK_STATUS     NUMBER(1),
  TASK_SCOPE      VARCHAR2(50),
  TASK_START_TIME DATE,
  TASK_END_TIME   DATE,
  CREATOR         VARCHAR2(20),
  CREATE_TIME     TIMESTAMP(6)
)
;
comment on column TASK.TASK_STATUS
  is '0:??,1:??';
alter table TASK
  add constraint TASK_KEY_PK primary key (TASK_KEY);

prompt
prompt Creating table TASK_DEFINITION
prompt ==============================
prompt
create table TASK_DEFINITION
(
  TASK_DEFINITION_KEY         VARCHAR2(40) not null,
  TASK_DEFINITION_TABLE_NAME  VARCHAR2(25),
  TASK_DEFINITION_TABLE_TITLE VARCHAR2(25),
  TASK_DEFINITION_IS_OPEN     NUMBER(1),
  TASK_KEY                    VARCHAR2(40),
  TASK_DEFINITION_COLUMNS     CLOB,
  DICTIONARY_DEFINATION_ID    VARCHAR2(40),
  CREATOR                     VARCHAR2(20),
  CREATE_TIME                 TIMESTAMP(6)
)
;
comment on column TASK_DEFINITION.TASK_DEFINITION_IS_OPEN
  is '0:???,1:??';
alter table TASK_DEFINITION
  add constraint TASK_DEFINITION_KEY_PK primary key (TASK_DEFINITION_KEY);

prompt
prompt Creating table TASK_RECORD
prompt ==========================
prompt
create table TASK_RECORD
(
  TASK_RECORD_KEY                VARCHAR2(40) not null,
  TASK_RECORD_DATA               CLOB,
  TASK_RECORD_APPLICANT          VARCHAR2(25),
  TASK_RECORD_APPLICANT_STAFF_ID VARCHAR2(40),
  TASK_RECORD_APPLICATION_TIME   TIMESTAMP(6),
  TASK_RECORD_AUDITOR            VARCHAR2(25),
  TASK_RECORD_AUDIT_TIME         TIMESTAMP(6),
  TASK_RECORD_AUDIT_ADVISE       VARCHAR2(50),
  TASK_RECORD_AUDITOR_STAFF_ID   VARCHAR2(40),
  REMARK                         VARCHAR2(50),
  TASK_KEY                       VARCHAR2(40),
  CREATOR                        VARCHAR2(20),
  CREATE_TIME                    TIMESTAMP(6),
  TASK_RECORD_STATUS             NUMBER(1)
)
;
alter table TASK_RECORD
  add constraint TASK_RECORD_KEY_PK primary key (TASK_RECORD_KEY);



prompt
prompt Creating table T_EDU_DIRECTION
prompt ==============================
prompt
create table T_EDU_DIRECTION
(
  CODEID     VARCHAR2(64) not null,
  NAME       VARCHAR2(125),
  ORDERID    INTEGER,
  PARENTID   VARCHAR2(255),
  DISPLAY    INTEGER,
  DEPRECATED INTEGER,
  SELECTABLE INTEGER,
  REMARK     VARCHAR2(255)
)
;
alter table T_EDU_DIRECTION
  add primary key (CODEID);

prompt
prompt Creating table VALIDATION_RULE
prompt ==============================
prompt
create table VALIDATION_RULE
(
  VALIDATION_RULE_ID        VARCHAR2(20) not null,
  VALIDATION_RULE_NAME      VARCHAR2(20),
  VALIDATION_RULE_VALUE     VARCHAR2(4000),
  VALIDATION_RULE_FAIL_INFO VARCHAR2(4000),
  VALIDATION_RULE_REMARK    VARCHAR2(4000)
)
;
alter table VALIDATION_RULE
  add constraint VALIDATION_RULE_PK primary key (VALIDATION_RULE_ID);

prompt
prompt Creating table XUELIXUEWEI
prompt ==========================
prompt
create table XUELIXUEWEI
(
  GLOBALID            VARCHAR2(64) not null,
  STAFFID             VARCHAR2(30),
  REMARK              VARCHAR2(500),
  LASTMODIFYTIME      VARCHAR2(25),
  EDUCATIONLEVEL      VARCHAR2(80),
  ENROLLTIME          TIMESTAMP(6),
  FORM                VARCHAR2(80),
  EDUCATIONALSYSTEM   NUMBER(30),
  MODE_MODE           VARCHAR2(80),
  GRADUATETIME        TIMESTAMP(6),
  UNIVERSITY          VARCHAR2(360),
  HIGNESTDEGREE       NUMBER(1),
  DEGREE              VARCHAR2(80),
  GRANTDATE           TIMESTAMP(6),
  GRANTCOUNTRY        VARCHAR2(80),
  SUBJECT             VARCHAR2(20),
  SPECIALITY          VARCHAR2(200),
  DEGREE_DEPT_NAME    VARCHAR2(200),
  START_DATE          TIMESTAMP(6),
  CHIEF               NUMBER(30),
  EDU_FORM_ID         VARCHAR2(20),
  DGREE_SUBJECT       VARCHAR2(100),
  SPECIALTY_DIRECTION VARCHAR2(50),
  SUBJECT_ONE         VARCHAR2(20),
  SUBJECT_TWO         VARCHAR2(20),
  IS_JOB              NUMBER(30),
  MARGIN              VARCHAR2(20),
  X__GLOBAL_ID        VARCHAR2(64)
)
;
alter table XUELIXUEWEI
  add primary key (GLOBALID);

prompt
prompt Creating table XUESHUJIANZHIXINXIGUANLI
prompt =======================================
prompt
create table XUESHUJIANZHIXINXIGUANLI
(
  GLOBALID                     VARCHAR2(64) not null,
  STAFFID                      VARCHAR2(30),
  REMARK                       VARCHAR2(500),
  LASTMODIFYTIME               VARCHAR2(25),
  SCIENCE_PLURALITY_BEGIN_DATE TIMESTAMP(6),
  SCIENCE_PLURALITY_END_DATE   TIMESTAMP(6),
  X__GLOBAL_ID                 VARCHAR2(64),
  SCIENCE_PLURALITY            VARCHAR2(80),
  FILE_PATH                    VARCHAR2(100),
  SCIENCE_PLURALITY_LEVEL      VARCHAR2(80)
)
;
alter table XUESHUJIANZHIXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table XUESHUPINGDINGXINXIGUANLI
prompt ========================================
prompt
create table XUESHUPINGDINGXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table XUESHUPINGDINGXINXIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table YUANDANWEI
prompt =========================
prompt
create table YUANDANWEI
(
  GLOBALID          VARCHAR2(64) not null,
  STAFFID           VARCHAR2(30),
  REMARK            VARCHAR2(500),
  LASTMODIFYTIME    VARCHAR2(25),
  LASTJOINCOLLEGE   NUMBER(1),
  JOINCOLLEGETIME   TIMESTAMP(6),
  ORIGIN            VARCHAR2(80),
  ORIGINAREA        VARCHAR2(80),
  REASON            VARCHAR2(160),
  OLDUNITNAME       VARCHAR2(120),
  OLDPARTYDUTY      VARCHAR2(80),
  OLDTECHNOLOGYDUTY VARCHAR2(80),
  OLDSUBJECT        VARCHAR2(80),
  X__GLOBAL_ID      VARCHAR2(64)
)
;
alter table YUANDANWEI
  add primary key (GLOBALID);

prompt
prompt Creating table YUYANNENGLI
prompt ==========================
prompt
create table YUYANNENGLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  X__GLOBAL_ID   VARCHAR2(64)
)
;
alter table YUYANNENGLI
  add primary key (GLOBALID);

prompt
prompt Creating table ZHENGZHIMIANMAO
prompt ==============================
prompt
create table ZHENGZHIMIANMAO
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  POLITICS       VARCHAR2(80),
  JOINDATE       TIMESTAMP(6),
  UNIT           VARCHAR2(120),
  INTRODUCER     VARCHAR2(60),
  TITLEDATE      TIMESTAMP(6),
  ABNORMAL       VARCHAR2(80),
  X__GLOBAL_ID   VARCHAR2(64),
  WWWWWWWWW      VARCHAR2(80)
)
;
alter table ZHENGZHIMIANMAO
  add primary key (GLOBALID);

prompt
prompt Creating table ZHICHENGKAOSHIGUANLI
prompt ===================================
prompt
create table ZHICHENGKAOSHIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  EXAMINEE_ID    VARCHAR2(20),
  EXAM_DEPT      VARCHAR2(20),
  EXAM_LANG      VARCHAR2(20),
  GRADE          VARCHAR2(20),
  EFFECT_DATE    TIMESTAMP(6),
  EXAM_DATE      TIMESTAMP(6),
  X__GLOBAL_ID   VARCHAR2(64),
  SUBJECT        VARCHAR2(80),
  EXAM_LEVEL     VARCHAR2(80),
  INIT_TECHNIC   VARCHAR2(80),
  APPLY_TECHNIC  VARCHAR2(80)
)
;
alter table ZHICHENGKAOSHIGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table ZHONGDIANRENCAIPEIYANGGUANLI
prompt ===========================================
prompt
create table ZHONGDIANRENCAIPEIYANGGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  PATH             VARCHAR2(200),
  BDATE            TIMESTAMP(6),
  EDATE            TIMESTAMP(6),
  TAG_STATUS       NUMBER(30),
  TRAIN_OUTLAY     NUMBER(10,2),
  ASSISTANT_OUTLAY NUMBER(10,2),
  X__GLOBAL_ID     VARCHAR2(64),
  NAME             VARCHAR2(50),
  DEPARTMENT       VARCHAR2(50),
  YIJIXUEKE        VARCHAR2(50),
  ERJIXUEKE        VARCHAR2(50),
  YANJIUFANGXIANG  VARCHAR2(50),
  XIANGMUNIANDU    VARCHAR2(50),
  PRO_PROFILE      VARCHAR2(500),
  TEST_RESULTS     VARCHAR2(20),
  TEST_DATE        TIMESTAMP(6),
  PROJ             VARCHAR2(80),
  JIBIE            VARCHAR2(80)
)
;
alter table ZHONGDIANRENCAIPEIYANGGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table ZHUANJIZHIWUPINRENGUANLI
prompt =======================================
prompt
create table ZHUANJIZHIWUPINRENGUANLI
(
  GLOBALID         VARCHAR2(64) not null,
  STAFFID          VARCHAR2(30),
  REMARK           VARCHAR2(500),
  LASTMODIFYTIME   VARCHAR2(25),
  ENGAGE_EDATE     TIMESTAMP(6),
  ENGAGE_BDATE     TIMESTAMP(6),
  ENGAGE_TECHNIC   VARCHAR2(20),
  ENGAGE_FILECODE  VARCHAR2(20),
  ENGAGE_DEPT_CODE VARCHAR2(20),
  X__GLOBAL_ID     VARCHAR2(64),
  DD               VARCHAR2(80)
)
;
alter table ZHUANJIZHIWUPINRENGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table ZHUANJIZHIWURENDINGGUANLI
prompt ========================================
prompt
create table ZHUANJIZHIWURENDINGGUANLI
(
  GLOBALID        VARCHAR2(64) not null,
  STAFFID         VARCHAR2(30),
  REMARK          VARCHAR2(500),
  LASTMODIFYTIME  VARCHAR2(25),
  CERTIFICATE_ID  VARCHAR2(50),
  ASSESS_DATE     TIMESTAMP(6),
  ASSESS_FILECODE VARCHAR2(50),
  ASSESS_DEPT     VARCHAR2(200),
  X__GLOBAL_ID    VARCHAR2(64),
  DEPT_NAME       VARCHAR2(50),
  ASSESS_TECHNIC  VARCHAR2(80),
  ASSESS_MODE     VARCHAR2(80),
  PROFESSIONAL    VARCHAR2(200),
  DISCIPLINES     VARCHAR2(200),
  TT              VARCHAR2(80)
)
;
alter table ZHUANJIZHIWURENDINGGUANLI
  add primary key (GLOBALID);

prompt
prompt Creating table ZIGEZHENGXINXIGUANLI
prompt ===================================
prompt
create table ZIGEZHENGXINXIGUANLI
(
  GLOBALID       VARCHAR2(64) not null,
  STAFFID        VARCHAR2(30),
  REMARK         VARCHAR2(500),
  LASTMODIFYTIME VARCHAR2(25),
  T_SORT         VARCHAR2(200),
  C_SORT         VARCHAR2(200),
  C_ID           VARCHAR2(20),
  SEND_DATE      TIMESTAMP(6),
  SEND_DEPT      VARCHAR2(200),
  C_NAME         VARCHAR2(200),
  TRAIN_DATE     TIMESTAMP(6),
  TRAIN_ADS      VARCHAR2(200),
  X__GLOBAL_ID   VARCHAR2(64),
  FILE_PATH      VARCHAR2(100)
)
;
alter table ZIGEZHENGXINXIGUANLI
  add primary key (GLOBALID);


spool off
