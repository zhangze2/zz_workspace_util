--------------------------------------------------------
--  文件已创建 - 星期四-十一月-22-2012   
--------------------------------------------------------

SET DEFINE OFF;
declare
v_clob clob :='<?xml version="1.0" encoding="utf-8"?>
<columns>
  <column>
    <title>全局编号</title>
    <describe>全局编号</describe>
    <name>x__global_id</name>
    <type>varchar2</type>
    <validationRule />
    <display>0</display>
    <edit />
    <required />
    <length>50</length>
    <digits>0</digits>
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>职工号</title>
    <describe>职工号</describe>
    <name>x__staff_id</name>
    <type>varchar2</type>
    <validationRule />
    <display>1</display>
    <edit />
    <required />
    <length>50</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>姓名</title>
    <describe>本人的现在的姓名</describe>
    <name>x__name</name>
    <type>varchar2</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>60</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>性别</title>
    <describe>参见GB_T2261《人的性别代码》</describe>
    <name>x__sex</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits />
    <codeTable>GB_T2261</codeTable>
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>出生日期</title>
    <describe>出生日期</describe>
    <name>x__birthday</name>
    <type>timestamp(6)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>6</length>
    <digits />
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>所属部门</title>
    <describe>所在单位编号</describe>
    <name>x__department_key</name>
    <type>varchar2(90)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>90</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>岗位编号</title>
    <describe>所在岗位编号</describe>
    <name>x__work_position_key</name>
    <type>varchar2</type>
    <validationRule />
    <display>0</display>
    <edit />
    <required />
    <length>50</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>民族</title>
    <describe>参见GB_T3304《中国各民族名称罗马字母拼写法和代码》</describe>
    <name>x__nation</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits />
    <codeTable>GB_T3304</codeTable>
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>籍贯</title>
    <describe>参见GB_T2260《中华人民共和国行政区划代码》</describe>
    <name>x__nativeplace</name>
    <type>varchar2</type>
    <validationRule>
    </validationRule>
    <display>1</display>
    <edit>1</edit>
    <required>
    </required>
    <length>85</length>
    <digits>0</digits>
    <codeTable></codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert>
    </minCodeAlert>
    <primary>
    </primary>
    <synchronous>
    </synchronous>
    <overallPropertyName>
    </overallPropertyName>
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource>
    </valueSource>
  </column>
  <column>
    <title>编制类别</title>
    <describe>参见DM_ORGANIZATION_TYPE《编制类别代码》</describe>
    <name>x__authsort</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits />
    <codeTable>DM_ORGANIZATION_TYPE</codeTable>
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>证件号码</title>
    <describe>身份证号码</describe>
    <name>x__id_card</name>
    <type>varchar2</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>25</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>参加工作年月</title>
    <describe>格式：CCYYMM</describe>
    <name>x__worktime</name>
    <type>timestamp(6)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>6</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>部门名称(temp)</title>
    <describe>所在单位名称</describe>
    <name>x__department_name</name>
    <type>varchar2(90)</type>
    <validationRule />
    <display>1</display>
    <edit>0</edit>
    <required />
    <length>90</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>所属岗位</title>
    <describe>所在岗位名称</describe>
    <name>x__work_position_name</name>
    <type>varchar2</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length>50</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>入职状态</title>
    <describe>入职状态</describe>
    <name>x__entry_status</name>
    <type>varchar2(80)</type>
    <validationRule>
    </validationRule>
    <display>1</display>
    <edit>1</edit>
    <required>
    </required>
    <length>80</length>
    <digits>0</digits>
    <codeTable>DM_ENTRY_STATUS</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert>
    </minCodeAlert>
    <primary>
    </primary>
    <synchronous>
    </synchronous>
    <overallPropertyName>
    </overallPropertyName>
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource>
    </valueSource>
  </column>
  <column>
    <title>创建时间</title>
    <describe>创建时间</describe>
    <name>x__create_time</name>
    <type>timestamp(6)</type>
    <validationRule />
    <display>0</display>
    <edit />
    <required />
    <length>6</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>最后修改时间</title>
    <describe>最后修改时间</describe>
    <name>x__last_modify_time</name>
    <type>timestamp(6)</type>
    <validationRule />
    <display>0</display>
    <edit />
    <required />
    <length>6</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>0</fixed>
    <valueSource />
  </column>
  <column>
    <title>人员状态</title>
    <describe>人员状态</describe>
    <name>x__personnel_status</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>0</edit>
    <required />
    <length>80</length>
    <digits />
    <codeTable>DM_PERSONNAL_STATUS</codeTable>
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>教工身份</title>
    <describe>教职工身份</describe>
    <name>x__emp_identifition</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits />
    <codeTable>DM_JZGSF_ZB</codeTable>
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>兼职部门</title>
    <describe>兼职部门</describe>
    <name>x__parttime_department_key</name>
    <type>varchar2(90)</type>
    <validationRule>
    </validationRule>
    <display>1</display>
    <edit>1</edit>
    <required>
    </required>
    <length>90</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert>
    </minCodeAlert>
    <primary>
    </primary>
    <synchronous>
    </synchronous>
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>年龄</title>
    <describe>年龄</describe>
    <name>x__age</name>
    <type>number(30)</type>
    <validationRule>
    </validationRule>
    <display>1</display>
    <edit>0</edit>
    <required>
    </required>
    <length>30</length>
    <digits>0</digits>
    <codeTable></codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert>
    </minCodeAlert>
    <primary>
    </primary>
    <synchronous>
    </synchronous>
    <overallPropertyName>
    </overallPropertyName>
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource>
    </valueSource>
  </column>
  <column>
    <title>政治面貌</title>
    <describe>政治面貌</describe>
    <name>x__politics</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit />
    <required />
    <length>80</length>
    <digits>0</digits>
    <codeTable>GB_T4762</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>是否辅导员</title>
    <describe>*是否辅导员</describe>
    <name>x__instructor</name>
    <type>number(1)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>1</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>是否双肩挑</title>
    <describe>*是否双肩挑</describe>
    <name>x__both_duty</name>
    <type>number(1)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>1</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>邮件</title>
    <describe>邮件(临时)</describe>
    <name>x__email</name>
    <type>varchar2</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length>50</length>
    <digits>0</digits>
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>最后学历</title>
    <describe>最后学历(临时)</describe>
    <name>x__educationlevel</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits>0</digits>
    <codeTable>GB_T4658</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>最高学位</title>
    <describe>最高学位(临时)</describe>
    <name>x__degree</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits>0</digits>
    <codeTable>GB_T6864</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>现专业技术职务级别</title>
    <describe>现专业技术职务级别(临时)</describe>
    <name>x__techtitlelevel</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits>0</digits>
    <codeTable>DM_TECH_LEVEL</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>党政职务</title>
    <describe>包含所有在任的党政职务(临时)</describe>
    <name>x__duty</name>
    <type>clob</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length />
    <digits>0</digits>
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>职务级别</title>
    <describe />
    <name>POST_LEVEL_KEY</name>
    <type>varchar2(80)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>80</length>
    <digits>0</digits>
    <codeTable>GB_T12407</codeTable>
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>*在岗状态</title>
    <describe>在岗状态</describe>
    <name>x__work_status</name>
    <type>number(30)</type>
    <validationRule />
    <display>1</display>
    <edit>1</edit>
    <required />
    <length>30</length>
    <digits>0</digits>
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>所在院级单位</title>
    <describe>所在部门</describe>
    <name>x__college</name>
    <type>varchar2</type>
    <validationRule />
    <display>0</display>
    <edit>1</edit>
    <required />
    <length>90</length>
    <digits>0</digits>
    <codeTable />
    <minCodeLength>0</minCodeLength>
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>0</fixed>
    <valueSource />
  </column>
  <column>
    <title>兼职部门名称</title>
    <describe>兼职部门名称</describe>
    <name>X__PARTTIME_DEPARTMENT</name>
    <type>varchar2(90)</type>
    <validationRule>
    </validationRule>
    <display>1</display>
    <edit>1</edit>
    <required>
    </required>
    <length>90</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert>
    </minCodeAlert>
    <primary>
    </primary>
    <synchronous>
    </synchronous>
    <overallPropertyName />
    <personal>1</personal>
    <fixed>1</fixed>
    <valueSource />
  </column>
  <column>
    <title>调入时间</title>
    <describe>调入时间</describe>
    <name>X__JOINCOLLEGETIME</name>
    <type>timestamp(6)</type>
    <validationRule />
    <display>0</display>
    <edit />
    <required />
    <length>6</length>
    <digits />
    <codeTable />
    <minCodeLength />
    <minCodeAlert />
    <primary />
    <synchronous />
    <overallPropertyName />
    <personal>0</personal>
    <fixed>0</fixed>
    <valueSource />
  </column>
</columns>';
begin
  Insert into DATA_DICTIONARY_DEFINATION
   (DICTIONARYID, NAME, TABLENAME, CATEGORYID, COLUMNS, 
    REMARK, ATLESTRECORD, ATMOSTRECORD, SYNCHOVERALL)
 Values
   ('1', '个人概况', 'ds_overall', '0', v_clob, 
    '个人综合信息', '0', '0', '0');
    commit;
 end;
 
--------------------------------------------------------
--  DDL for Table DS_OVERALL
--------------------------------------------------------

  CREATE TABLE "DS_OVERALL" 
   (	
   	"X__GLOBAL_ID" VARCHAR2(50), 
	"X__STAFF_ID" VARCHAR2(50), 
	"X__NAME" VARCHAR2(60), 
	"X__SEX" VARCHAR2(80), 
	"X__BIRTHDAY" DATE, 
	"X__DEPARTMENT_KEY" VARCHAR2(90),
	"X__WORK_POSITION_KEY" VARCHAR2(50),
	"X__NATION" VARCHAR2(80), 
	"X__NATIVEPLACE" VARCHAR2(85),
	"X__AUTHSORT" VARCHAR2(80),  
	"X__ID_CARD" VARCHAR2(25), 
	"X__WORKTIME" DATE,
	"X__DEPARTMENT_NAME" VARCHAR2(90),
	"X__WORK_POSITION_NAME" VARCHAR2(50), 
	"X__ENTRY_STATUS" NUMBER(30,0), 
	"X__CREATE_TIME" TIMESTAMP (6),
	"X__LAST_MODIFY_TIME" TIMESTAMP (6),
	"X__PERSONNEL_STATUS" VARCHAR2(80), 
	"X__EMP_IDENTIFITION" VARCHAR2(80), 
	"X__PARTTIME_DEPARTMENT_KEY" VARCHAR2(90), 
	"X__AGE" NUMBER(30,0), 
	"X__POLITICS" VARCHAR2(80), 
	"X__INSTRUCTOR" NUMBER(1,0), 
	"X__BOTH_DUTY" NUMBER(1,0),
	"X__EMAIL" VARCHAR2(50), 
	"X__EDUCATIONLEVEL" VARCHAR2(80), 
	"X__DEGREE" VARCHAR2(80), 
	"X__TECHTITLELEVEL" VARCHAR2(80), 
	"X__DUTY" CLOB, 
	"POST_LEVEL_KEY" VARCHAR2(80), 
	"X__WORK_STATUS" NUMBER(30,0), 
	"X__COLLEGE" VARCHAR2(90),
	"X__PARTTIME_DEPARTMENT" VARCHAR2(90),
	"X__JOINCOLLEGETIME" DATE
   ) ;
/
--------------------------------------------------------
--  DDL for Index SYS_C006760
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C006760" ON "DS_OVERALL" ("X__GLOBAL_ID") 
  ;
/
--------------------------------------------------------
--  Constraints for Table DS_OVERALL
--------------------------------------------------------

  ALTER TABLE "DS_OVERALL" ADD PRIMARY KEY ("X__GLOBAL_ID") ENABLE;
/

REM INSERTING into DS_OVERALL
SET DEFINE OFF;
Insert into DS_OVERALL (X__GLOBAL_ID,X__STAFF_ID,X__NAME) values ('01','admin','admin');

