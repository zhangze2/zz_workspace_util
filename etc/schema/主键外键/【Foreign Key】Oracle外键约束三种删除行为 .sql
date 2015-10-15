--Oracleʹ������������ӱ��вο����ֶ�ֵ��Ҫ���ӱ��е����ݱ����������д��ڡ�������ļ�¼�����仯ʱ��������ο�ΨһԼ��ֵ�����˱仯ʱ��Oracleָ�������ֶ�����Ĭ��ֵ��������restrict����delete cascade��delete set null��
--ʵ������һ�����Ƕ�ɾ�������Ĳ�ͬЧ����

1.���������ӱ��򵥳�ʼ����������
1����������t_parent������ʼ��������¼
sec@ora10g> create table t_parent (parent_id int primary key, name varchar2(10));
sec@ora10g> insert into t_parent values (1,'record1');
sec@ora10g> insert into t_parent values (2,'record2');
sec@ora10g> insert into t_parent values (3,'record3');
sec@ora10g> commit;

2�������������͵��ӱ�t_child1��t_child2��t_child3
��1��no action����
sec@ora10g> create table t_child1 (child1_id int primary key, parent_id int);
sec@ora10g> alter table t_child1 add constraint FK_t_child1 foreign key (parent_id) references t_parent (parent_id);
sec@ora10g> insert into t_child1 values (1,1);
sec@ora10g> commit;
��1��cascade����
sec@ora10g> create table t_child2 (child2_id int primary key, parent_id int);
sec@ora10g> alter table t_child2 add constraint FK_t_child2 foreign key (parent_id) references t_parent (parent_id) on delete cascade;
sec@ora10g> insert into t_child2 values (2,2);
sec@ora10g> commit;
��1��set null����
sec@ora10g> create table t_child3 (child2_id int primary key, parent_id int);
sec@ora10g> alter table t_child3 add constraint FK_t_child3 foreign key (parent_id) references t_parent (parent_id) on delete set null;
sec@ora10g> insert into t_child3 values (3,3);
sec@ora10g> commit;

2.ȷ��������ӱ��е�����
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

3.���ԶԾ���Ĭ������������յ������¼����ɾ��
sec@ora10g> delete from T_PARENT where parent_id = 1;
delete from T_PARENT where parent_id = 1
*
ERROR at line 1:
ORA-02292: integrity constraint (SEC.FK_T_CHILD1) violated - child record found

sec@ora10g> select * from T_CHILD1;

 CHILD1_ID  PARENT_ID
---------- ----------
         1          1

�ڴ������£�������ɾ����

4.���ԶԾ���delete cascade����������յ������¼����ɾ��
sec@ora10g> delete from T_PARENT where parent_id = 2;

1 row deleted.

sec@ora10g> select * from T_CHILD2;

no rows selected

�ɹ�������ɾ���ɹ���

5.���ԶԾ���delete set null����������յ������¼����ɾ��
sec@ora10g> delete from T_PARENT where parent_id = 3;

1 row deleted.

sec@ora10g> select * from T_CHILD3;

 CHILD2_ID  PARENT_ID
---------- ----------
         3

�����¼�������ɾ�����ӱ��ж�Ӧ�����ݱ�����ΪNULL��

6.С��
���Ͼ�����Oracle���ݿ⣬��������Ϣɾ�����Ӧ���ӱ��м�¼�����ֲ�ͬ�Ĵ���ʽ����Ծ����Ӧ�ó�����ѡ��������͡�

Good luck.

secooler
10.03.21

-- The End --
