--1.plsql中学习job   
select * from attendance_month_statement;
/***************************************************
    版    本: v0.0.1
    功    能: 把所有考勤部门的月度数据上报（未销假数据要进行销假）
    前置条件：月上报日期（默认为3日凌晨1点）、考勤部门 且 该考勤部门未有月报表
    源    表：attendance_dept_setting,  attendance_month_statement
    结果  表：attendance_month_statement
    逻辑描述: (描述程序实现逻辑)
    参数说明：
    运行频率：每月27日凌晨1点
    创建信息：(zhangze 2015-12-02)
    修改日志:
    日   志1:
*****************************************************/
--------建立存贮过程 (把每个部门的上个月度考勤数据上报)  
create or replace procedure attendence_report_job_proce(var_report_month in varchar2) as
  --定义变量
  vs_report_count number;
  vs_report_date  varchar2(20);
  --1、查询参与考勤部门
  CURSOR var_department_keys IS
    select ads.department_key from attendance_dept_setting ads;
begin
  --select to_char(START_TIME,'dd') into vs_report_date from attendance_report_time ;
  FOR var_dept in var_department_keys LOOP
    --2、循环遍历判断该考勤部门是否已有月报表（attendance_flag为‘1’，上报月,部门key）
    dbms_output.put_line(var_dept.department_key);
  
    select nvl(count(*), 0)
      INTO vs_report_count
      from attendance_month_statement ams, attendance_dept_setting t
     where ams.department_key = t.department_key
       and t.attendance_flag = '1'
       and to_char(ams.report_month, 'yyyy-mm') = var_report_month
       and ams.department_key = var_dept.department_key;
  
    dbms_output.put_line(vs_report_count);
    --3、如果没有则添加()，否则不添加
    if vs_report_count = 0 then
      insert into attendance_month_statement
        (ATTENDANCE_KEY,
         DEPARTMENT_KEY,
         report_month,
         REPORT_TIME,
         REPORT_STATUS,
         FILING_STATUS,
         MONTH_BATCH,
         DEPT_APPROVAL_OPINION,
         COLLEGE_APPROVAL_OPINION)
      values
        (seq_attendance_uuid.nextval,
         var_dept.department_key,
         to_date(var_report_month, 'yyyy-mm'),
         sysdate,
         1,
         0,
         var_report_month || '_' || var_dept.department_key,
         '',
         '');
    
    end if;
  END LOOP;

end attendence_report_job_proce;

----------存储过程创建结束
 
--建立job  （每个月3号凌晨1点执行存储过程）TRUNC(LAST_DAY(SYSDATE))+23+(15×60+15)/(24×60)
--建立job后默认是执行的   
declare attendence_report_job number;  
begin
dbms_job.submit(attendence_report_job,'attendence_report_job_proce(2015-10);',sysdate,'TRUNC(LAST_DAY(SYSDATE))+3+1/24');  
commit;  
end;  
  
---停止job 361是建立的job attendence_report_job_really 工作号， true表示此工作将标记为破 
begin dbms_job.broken(361,true);  
commit;  
end;  

--启动job  
begin dbms_job.run(361);  
commit;  
end;  
 
--删除job  
begin dbms_job.remove(25);  
commit;  
end;  
 
--查看执行结果  
select  * from attendance_month_statement;   
--查看job  
select * from sys.user_jobs   
--使用下面的SQL查询是否JOB还在Running，前提是需要job执行时间不能过短  
select * from dba_jobs_running  

--除了submit参数外，其余的几个参数有：  
--运行job 
dbms_job.run(v_job);  
      
--停止一个job,里面参数true也可是false，next_date（某一时刻停止）也可是sysdate（立刻停止）。  
dbms_job.broke(v_job,true,next_date); 
       
--删除某个job  
dbms_job.remove(v_job);  
dbms_job.what(v_job,'sp_fact_charge_code;'); 
      
--修改某个job名 修改下一次运行时间  
 dbms_job.next_date(v_job,sysdate);
 
--修改job的执行时间要修改下面两个事项。
--1.要修改下次执行时间，
--如
    exec dbms_job.change(job_number,null,trunc(sysdate+1)+(7*60)/(24*60),null);
--2.要修改interval，也就是用于计算下一运行时间的表达式
--如
    interval exec dbms_job.interval(job_id,null,null,interval);