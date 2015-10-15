 --Oracle异常ORA-01502: 索引或这类索引的分区处于不可用状态
alter index index_name rebuild

--原因： 出现这个问题，可能有人move过表，或者disable 过索引。
--1. 
alter table xxxxxx move tablespace xxxxxxx 命令后，索引就会失效。
--2. 
alter index index_name  unusable，命令使索引失效。

--解决办法：
--1. 重建索引才是解决这类问题的完全的方法。
     alter index index_name rebuild (online);

     --或者
     alter index index_name rebuild;
--2. 如果是分区索引只需要重建那个失效的分区 。
     alter index index_name rebuild partition partition_name (online);

    -- 或者
    alter index index_name rebuild partition partition_name ;

--3. 或者改变当前索引的名字。

--说明：
--1. 
alter session set skip_unusable_indexes=true;
--就可以在session级别跳过无效索引作查询。
--2. 分区索引应适用user_ind_partitions。
--3. 状态分4种：
    N/A说明这个是分区索引需要查user_ind_partitions或者user_ind_subpartitions来确定每个分区是否可用；
    VAILD说明这个索引可用；
    UNUSABLE说明这个索引不可用；
    USABLE 说明这个索引的分区是可用的。

--4. 查询当前索引的状态：
select distinct status, INDEX_NAME, TABLE_NAME from user_indexes where index_name = 'PK_RECRUIT_NOTICE';

--5. 查询那个索引无效：
select index_name from  user_indexes where status <> 'valid';


select distinct status from user_indexes;

alter index PK_RECRUIT_NOTICE rebuild;
