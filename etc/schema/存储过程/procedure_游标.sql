CREATE OR REPLACE PROCEDURE 存储过程名
(

--定义参数
 is_ym  IN CHAR(6) ,

the_count OUT NUMBER,
) 
AS 
--定义变量 
vs_msg   VARCHAR2(4000);   --错误信息变量
vs_ym_beg  CHAR(6);      --起始月份
vs_ym_end  CHAR(6);      --终止月份
vs_ym_sn_beg CHAR(6);     --同期起始月份
vs_ym_sn_end CHAR(6);     --同期终止月份

--定义游标(简单的说就是一个可以遍历的结果集) 


CURSOR cur_1 IS 
  SELECT 。。。 
  FROM 。。。 
    WHERE 。。。
   GROUP BY 。。。; 

BEGIN 


--用输入参数给变量赋初值，用到了Oralce的SUBSTR TO_CHAR ADD_MONTHS 

 

TO_DATE 等很常用的函数。 
vs_ym_beg := SUBSTR(is_ym,1,6); 
vs_ym_end := SUBSTR(is_ym,7,6); 
vs_ym_sn_beg := TO_CHAR(ADD_MONTHS(TO_DATE(vs_ym_beg,'yyyymm'), -12),'yyyymm'); 
vs_ym_sn_end := TO_CHAR(ADD_MONTHS(TO_DATE(vs_ym_end,'yyyymm'), -12),'yyyymm'); 


--先删除表中特定条件的数据。 


DELETE FROM 表名 WHERE ym = is_ym; 


  --然后用内置的DBMS_OUTPUT对象的put_line方法打印出影响的记录行数，其中用到一个系统变量SQL%rowcount 


DBMS_OUTPUT.put_line('del上月记录='||SQL%rowcount||'条'); 

INSERT INTO表名(area_code,ym,CMCODE,rmb_amt,usd_amt) 
SELECT area_code,is_ym,CMCODE,SUM(rmb_amt)/10000,SUM(usd_amt)/10000 
FROM BGD_AREA_CM_M_BASE_T 
  WHERE ym >= vs_ym_beg 
  AND ym <= vs_ym_end 
GROUP BY area_code,CMCODE; 

DBMS_OUTPUT.put_line('ins当月记录='||SQL%rowcount||'条'); 
--遍历游标处理后更新到表。遍历游标有几种方法，用for语句是其中比较直观的一种。

 
FOR rec IN cur_1 LOOP 
  UPDATE 表名
  SET rmb_amt_sn = rec.rmb_amt_sn,usd_amt_sn = rec.usd_amt_sn 
   WHERE area_code = rec.area_code 
   AND CMCODE = rec.CMCODE 
   AND ym = is_ym; 
END LOOP; 

COMMIT; 


--错误处理部分。OTHERS表示除了声明外的任意错误。SQLERRM是系统内置变量保存了当前错误的详细信息。 


EXCEPTION 


   WHEN OTHERS THEN 
      vs_msg := 'ERROR IN xxxxxxxxxxx_p('||is_ym||'):'||SUBSTR(SQLERRM,1,500);

 
   ROLLBACK; 


   --把当前错误记录进日志表。 


   INSERT INTO LOG_INFO(proc_name,error_info,op_date) 
   VALUES('xxxxxxxxxxx_p',vs_msg,SYSDATE); 
   COMMIT; 
   RETURN; 


END;
