--Oracle使用外键来限制子表中参考的字段值，要求子表中的数据必须在主表中存在。当主表的记录发生变化时导致外键参考唯一约束值发生了变化时，Oracle指定了三种动作：默认值（类似于restrict）、delete cascade和delete set null。
--实际体验一下他们对删除操作的不同效果。

1.创建主表及子表并简单初始化几条数据
1）创建主表t_parent，并初始化三条记录
sec@ora10g> create table t_parent (parent_id int primary key, name varchar2(10));
sec@ora10g> insert into t_parent values (1,'record1');
sec@ora10g> insert into t_parent values (2,'record2');
sec@ora10g> insert into t_parent values (3,'record3');
sec@ora10g> commit;

2）创建三种类型的子表t_child1、t_child2和t_child3
（1）no action类型
sec@ora10g> create table t_child1 (child1_id int primary key, parent_id int);
sec@ora10g> alter table t_child1 add constraint FK_t_child1 foreign key (parent_id) references t_parent (parent_id);
sec@ora10g> insert into t_child1 values (1,1);
sec@ora10g> commit;
（1）cascade类型
sec@ora10g> create table t_child2 (child2_id int primary key, parent_id int);
sec@ora10g> alter table t_child2 add constraint FK_t_child2 foreign key (parent_id) references t_parent (parent_id) on delete cascade;
sec@ora10g> insert into t_child2 values (2,2);
sec@ora10g> commit;
（1）set null类型
sec@ora10g> create table t_child3 (child2_id int primary key, parent_id int);
sec@ora10g> alter table t_child3 add constraint FK_t_child3 foreign key (parent_id) references t_parent (parent_id) on delete set null;
sec@ora10g> insert into t_child3 values (3,3);
sec@ora10g> commit;

2.确认主表和子表中的数据
sec@ora10g> select * from T_PARENT;

 PARENT_ID NAME
---------- ------------------------------
         1 record1
         2 record2
         3 record3

sec@ora10g> select * from T_CHILD1;

 CHILD1_ID  PARENT_ID
---------- ----------
         1          1

sec@ora10g> select * from T_CHILD2;

 CHILD2_ID  PARENT_ID
---------- ----------
         2          2

sec@ora10g> select * from T_CHILD3;

 CHILD2_ID  PARENT_ID
---------- ----------
         3          3

3.尝试对具有默认类型外键参照的主表记录进行删除
sec@ora10g> delete from T_PARENT where parent_id = 1;
delete from T_PARENT where parent_id = 1
*
ERROR at line 1:
ORA-02292: integrity constraint (SEC.FK_T_CHILD1) violated - child record found

sec@ora10g> select * from T_CHILD1;

 CHILD1_ID  PARENT_ID
---------- ----------
         1          1

在此类型下，不允许删除。

4.尝试对具有delete cascade类型外键参照的主表记录进行删除
sec@ora10g> delete from T_PARENT where parent_id = 2;

1 row deleted.

sec@ora10g> select * from T_CHILD2;

no rows selected

成功，级联删除成功。

5.尝试对具有delete set null类型外键参照的主表记录进行删除
sec@ora10g> delete from T_PARENT where parent_id = 3;

1 row deleted.

sec@ora10g> select * from T_CHILD3;

 CHILD2_ID  PARENT_ID
---------- ----------
         3

主表记录可以完成删除，子表中对应的内容被设置为NULL。

6.小结
以上就是在Oracle数据库，当主表信息删除后对应的子表中记录的三种不同的处理方式，针对具体的应用场合请选择合适类型。

Good luck.

secooler
10.03.21

-- The End --
