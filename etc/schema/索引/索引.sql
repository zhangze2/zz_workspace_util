 --Oracle�쳣ORA-01502: ���������������ķ������ڲ�����״̬
alter index index_name rebuild

--ԭ�� ����������⣬��������move��������disable ��������
--1. 
alter table xxxxxx move tablespace xxxxxxx ����������ͻ�ʧЧ��
--2. 
alter index index_name  unusable������ʹ����ʧЧ��

--����취��
--1. �ؽ��������ǽ�������������ȫ�ķ�����
     alter index index_name rebuild (online);

     --����
     alter index index_name rebuild;
--2. ����Ƿ�������ֻ��Ҫ�ؽ��Ǹ�ʧЧ�ķ��� ��
     alter index index_name rebuild partition partition_name (online);

    -- ����
    alter index index_name rebuild partition partition_name ;

--3. ���߸ı䵱ǰ���������֡�

--˵����
--1. 
alter session set skip_unusable_indexes=true;
--�Ϳ�����session����������Ч��������ѯ��
--2. ��������Ӧ����user_ind_partitions��
--3. ״̬��4�֣�
    N/A˵������Ƿ���������Ҫ��user_ind_partitions����user_ind_subpartitions��ȷ��ÿ�������Ƿ���ã�
    VAILD˵������������ã�
    UNUSABLE˵��������������ã�
    USABLE ˵����������ķ����ǿ��õġ�

--4. ��ѯ��ǰ������״̬��
select distinct status, INDEX_NAME, TABLE_NAME from user_indexes where index_name = 'PK_RECRUIT_NOTICE';

--5. ��ѯ�Ǹ�������Ч��
select index_name from  user_indexes where status <> 'valid';


select distinct status from user_indexes;

alter index PK_RECRUIT_NOTICE rebuild;
