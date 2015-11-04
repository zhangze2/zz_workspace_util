--1.plsql��ѧϰjob   
select * from attendance_month_statement;
/***************************************************
    ��    ��: v0.0.1
    ��    ��: �����п��ڲ��ŵ��¶������ϱ���δ��������Ҫ�������٣�
    ǰ�����������ϱ����ڣ�Ĭ��Ϊ3���賿1�㣩�����ڲ��� �� �ÿ��ڲ���δ���±���
    Դ    ��attendance_dept_setting,  attendance_month_statement
    ���  ��attendance_month_statement
    �߼�����: (��������ʵ���߼�)
    ����˵����
    ����Ƶ�ʣ�ÿ��27���賿1��
    ������Ϣ��(zhangze 2015-12-02)
    �޸���־:
    ��   ־1:
*****************************************************/
--------������������ (��ÿ�����ŵ��ϸ��¶ȿ��������ϱ�)  
create or replace procedure attendence_report_job_proce(var_report_month in varchar2) as
  --�������
  vs_report_count number;
  vs_report_date  varchar2(20);
  --1����ѯ���뿼�ڲ���
  CURSOR var_department_keys IS
    select ads.department_key from attendance_dept_setting ads;
begin
  --select to_char(START_TIME,'dd') into vs_report_date from attendance_report_time ;
  FOR var_dept in var_department_keys LOOP
    --2��ѭ�������жϸÿ��ڲ����Ƿ������±���attendance_flagΪ��1�����ϱ���,����key��
    dbms_output.put_line(var_dept.department_key);
  
    select nvl(count(*), 0)
      INTO vs_report_count
      from attendance_month_statement ams, attendance_dept_setting t
     where ams.department_key = t.department_key
       and t.attendance_flag = '1'
       and to_char(ams.report_month, 'yyyy-mm') = var_report_month
       and ams.department_key = var_dept.department_key;
  
    dbms_output.put_line(vs_report_count);
    --3�����û�������()���������
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

----------�洢���̴�������
 
--����job  ��ÿ����3���賿1��ִ�д洢���̣�TRUNC(LAST_DAY(SYSDATE))+23+(15��60+15)/(24��60)
--����job��Ĭ����ִ�е�   
declare attendence_report_job number;  
begin
dbms_job.submit(attendence_report_job,'attendence_report_job_proce(2015-10);',sysdate,'TRUNC(LAST_DAY(SYSDATE))+3+1/24');  
commit;  
end;  
  
---ֹͣjob 361�ǽ�����job attendence_report_job_really �����ţ� true��ʾ�˹��������Ϊ�� 
begin dbms_job.broken(361,true);  
commit;  
end;  

--����job  
begin dbms_job.run(361);  
commit;  
end;  
 
--ɾ��job  
begin dbms_job.remove(25);  
commit;  
end;  
 
--�鿴ִ�н��  
select  * from attendance_month_statement;   
--�鿴job  
select * from sys.user_jobs   
--ʹ�������SQL��ѯ�Ƿ�JOB����Running��ǰ������Ҫjobִ��ʱ�䲻�ܹ���  
select * from dba_jobs_running  

--����submit�����⣬����ļ��������У�  
--����job 
dbms_job.run(v_job);  
      
--ֹͣһ��job,�������trueҲ����false��next_date��ĳһʱ��ֹͣ��Ҳ����sysdate������ֹͣ����  
dbms_job.broke(v_job,true,next_date); 
       
--ɾ��ĳ��job  
dbms_job.remove(v_job);  
dbms_job.what(v_job,'sp_fact_charge_code;'); 
      
--�޸�ĳ��job�� �޸���һ������ʱ��  
 dbms_job.next_date(v_job,sysdate);
 
--�޸�job��ִ��ʱ��Ҫ�޸������������
--1.Ҫ�޸��´�ִ��ʱ�䣬
--��
    exec dbms_job.change(job_number,null,trunc(sysdate+1)+(7*60)/(24*60),null);
--2.Ҫ�޸�interval��Ҳ�������ڼ�����һ����ʱ��ı��ʽ
--��
    interval exec dbms_job.interval(job_id,null,null,interval);