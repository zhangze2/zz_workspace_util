-- Create table
--档案基本信息主表
create table ARCHIVES
(
  x__staff_id           VARCHAR2(50) not null,--职工号
  x__name               VARCHAR2(50),--员工姓名
  archives_id           VARCHAR2(50),--档案编号
  archives_name         VARCHAR2(50),--档案名称
  archives_status       CHAR(1),--档案状态
  receive_dept_key      VARCHAR2(100),--接收部门编号
  receive_dept          VARCHAR2(100),--接收部门名称
  receive_time          VARCHAR2(50),--接收时间
  receive_attn          VARCHAR2(50),--接收经办人
  receive_reason        VARCHAR2(50),--接收原因
  receive_notice_number VARCHAR2(50),--接收通知单编号
  receipt_process       VARCHAR2(50),--回执处理
  transfer_person       VARCHAR2(50),--移交人
  source_               VARCHAR2(50),--来源
  location              VARCHAR2(200),--保管地点
  remark                VARCHAR2(200),--备注
  create_time           VARCHAR2(50)--创建时间
)
tablespace LYHR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ARCHIVES
  add primary key (X__STAFF_ID)
  using index 
  tablespace LYHR
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );



-- Create table
--档案操作记录详情表
create table ARCHIVES_OPERATING_RECORDS
(
  archives_operating_records_id VARCHAR2(50) not null,--主键
  x__staff_id                   VARCHAR2(50) not null,--职工号
  archives_status               CHAR(1),--档案状态
  operating_time                VARCHAR2(50),--操作时间
  operator                      VARCHAR2(50),--操作者
  transaction                   VARCHAR2(50),--事务
  view_detail                   CLOB,	     --操作记录详情（Json结构）
  create_time                   VARCHAR2(50) --创建时间
)
tablespace LYHR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ARCHIVES_OPERATING_RECORDS
  add primary key (ARCHIVES_OPERATING_RECORDS_ID)
  using index 
  tablespace LYHR
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );