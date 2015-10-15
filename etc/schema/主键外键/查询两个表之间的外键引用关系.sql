select *
  from user_constraints c
 where c.constraint_type = 'R'
 
   and c.table_name = 'LYGWF_SYS_SUB_GROUP'
   

--5 �鿴�����Ϣ
select table_name as ����, constraint_name as ������, constraint_type as ������, r_constraint_name as �������
from user_constraints where CONSTRAINT_NAME ='FK_GROUP_GRADE_UUID'  -- table_name = 'EMPLOYEENEW';


--���ұ��������ù�ϵ(�û�����ϵ--�û���--���ϵ)
select t1.table_name,
       t2.table_name as "TABLE_NAME(R)",
       t1.constraint_name,
       t1.r_constraint_name as "CONSTRAINT_NAME(R)",
       a1.column_name,
       a2.column_name as "COLUMN_NAME(R)"
from user_constraints t1, user_constraints t2, user_cons_columns a1, user_cons_columns a2
where t1.r_constraint_name = t2.constraint_name and
      t1.constraint_name = a1.constraint_name and
      t1.r_constraint_name = a2.constraint_name
      --and t1.owner = upper('programmer');  ע��������ڵ�ǰ�û��£�����t1.owner = upper('programmer')���Բ�д��
      
      
      
--ɾ���������Լ��
    select 'alter table '||table_name||' drop constraint '||constraint_name||';' from user_constraints where constraint_type='R'   

--�����������Լ��
    select 'alter table '||table_name||' disable constraint '||constraint_name||';' from user_constraints where constraint_type='R'   

--�����������Լ��
    select 'alter table '||table_name||' enable constraint '||constraint_name||';' from user_constraints where constraint_type='R'         