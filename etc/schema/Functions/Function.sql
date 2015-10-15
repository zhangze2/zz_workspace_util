CREATE OR REPLACE FUNCTION FUN_GET_REMAINING_BUDGET(IN_YEAR IN VARCHAR2)
--函数：根据年份计算剩余预算
  RETURN NUMBER AS
	  USED      NUMBER;
	  REMAINING NUMBER;
BEGIN
  SELECT NVL(SUM(P.APPROVAL_OUTLAY_BUDGET), 0)
    INTO USED
    FROM SZ_CTEC_PLAN P
   WHERE (P.WF_DOCSTATUS IS NULL OR P.WF_DOCSTATUS = 'End')
     AND P.YEAR = IN_YEAR;
     
  SELECT TOTAL_BUDGET - SCHOOL_BUDGET - USED
    INTO REMAINING
    FROM SZ_CTEC_BUDGET
   WHERE GLOBAL_ID = IN_YEAR;
  RETURN REMAINING;
END FUN_GET_REMAINING_BUDGET;


create or replace function FUN_EMPTY_POSITON_COUNT(in_position_key in VARCHAR2)
--查找某岗位的空岗数
RETURN INTEGER AS
  out_pre_count      INTEGER;
  out_fact_count INTEGER;
  out_empty_count INTEGER;
BEGIN
  SELECT p.pre_person_count INTO out_pre_count FROM position p
  WHERE position_key = in_position_key;

  SELECT COUNT(p.position_key) INTO out_fact_count FROM STAFF_ENGAGE_POST t, position p
  WHERE t.position_key = p.position_key AND t.status = '1' AND t.position_key = in_position_key;

  SELECT out_pre_count - out_fact_count INTO out_empty_count  FROM dual;

  RETURN(out_empty_count);
end FUN_EMPTY_POSITON_COUNT;
----------------------------------------

CREATE OR REPLACE PACKAGE BODY AAA_DELETE_F is
 
PROCEDURE MAIN
IS
--检索用户'DWP00001'的所有外键
   CURSOR getFkList
IS
    SELECT
      T.table_name,
      T.constraint_name
    FROM
      USER_CONSTRAINTS T 
    WHERE 
      T.CONSTRAINT_TYPE='R' 
    AND 
      T.OWNER = 'DWP00001'
    AND
      T.r_owner = 'DWP00001';
BEGIN
   FOR recFk IN getFkList LOOP
 
   --删除外键
     EXECUTE IMMEDIATE 'alter table ' || recFk.table_name 
       || ' drop constraint ' || recFk.constraint_name;
   END LOOP;
 
EXCEPTION
WHEN OTHERS THEN
    dbms_output.put_line(SQLERRM);
END;
END AAA_DELETE_F;


create or replace procedure clear_data_by_batch(batchid in varchar2, out_msg out varchar2) as
begin

 ----删除 kpi_mix_detail 数据
	   delete  from kpi_mix_detail d where d.parent_key in
	   (select aa.kpi_mix_key  from (
	   select k.kpi_mix_key,k.parent_key  from pc_contract_basic_setting t  left join kpi_mix k on t.contract_id=k.contract_id where t.batch_id=batchid )aa 
	   where aa.kpi_mix_key not in (select distinct k.parent_key  from pc_contract_basic_setting t  
	   left join kpi_mix k on t.contract_id=k.contract_id where t.batch_id=batchid ) );

commit;
exception
 when others then
  out_msg := '删除出错：'||sqlerrm;
  rollback;
end;

