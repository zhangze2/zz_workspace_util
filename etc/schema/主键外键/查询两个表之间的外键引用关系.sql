select *
  from user_constraints c
 where c.constraint_type = 'R'
 
   and c.table_name = 'LYGWF_SYS_SUB_GROUP'
   

--5 查看外键信息
select table_name as 表名, constraint_name as 键名称, constraint_type as 键类型, r_constraint_name as 外键名称
from user_constraints where CONSTRAINT_NAME ='FK_GROUP_GRADE_UUID'  -- table_name = 'EMPLOYEENEW';


--查找表的外键引用关系(用户键关系--用户键--表关系)
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
      --and t1.owner = upper('programmer');  注：如果是在当前用户下，条件t1.owner = upper('programmer')可以不写。
      
      
      
--删除所有外键约束
    select 'alter table '||table_name||' drop constraint '||constraint_name||';' from user_constraints where constraint_type='R'   

--禁用所有外键约束
    select 'alter table '||table_name||' disable constraint '||constraint_name||';' from user_constraints where constraint_type='R'   

--启用所有外键约束
    select 'alter table '||table_name||' enable constraint '||constraint_name||';' from user_constraints where constraint_type='R'         