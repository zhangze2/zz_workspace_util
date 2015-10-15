--建立 四川行政区表
CREATE TABLE SC_DISTRICT
(
  ID         NUMBER(10)                  NOT NULL,
  PARENT_ID  NUMBER(10),
  NAME       VARCHAR2(255 BYTE)          NOT NULL
);
--增加主键和外键
ALTER TABLE SC_DISTRICT ADD (  CONSTRAINT SC_DISTRICT_PK PRIMARY KEY (ID));

ALTER TABLE SC_DISTRICT ADD (  CONSTRAINT SC_DISTRICT_R01  FOREIGN KEY (PARENT_ID)  REFERENCES SC_DISTRICT (ID));
 
--插入数据
INSERT INTO SC_DISTRICT(ID,NAME) VALUES(1,'四川省');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(2,1,'巴中市');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(3,1,'达州市'); 

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(4,2,'巴州区');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(5,2,'通江县');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(6,2,'平昌县');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(7,3,'通川区');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(8,3,'宣汉县');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(9,8,'塔河乡');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(10,8,'三河乡');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(11,8,'胡家镇');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(12,8,'南坝镇');
 
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(13,6,'大寨乡');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(14,6,'响滩镇');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(15,6,'龙岗镇');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(16,6,'白衣镇');


--1.查询某节点的所有子孙节点: 
--查询巴中市下面的所有行政组织(结果包含当前节点):
SELECT *
FROM SC_DISTRICT
START WITH NAME='巴中市'
CONNECT BY PRIOR ID=PARENT_ID

--查询结果:
ID    PARENT_ID      NAME
2    1            巴中市
4    2            巴州区
5    2            通江县
6    2            平昌县
13    6            大寨乡
14    6            响滩镇
15    6            龙岗镇
16    6            白衣镇



--2.查询指定节点的递归根节点  
--eg:查询响滩镇镇所属的市：
SELECT ID,   PARENT_ID,      NAME,     
       CONNECT_BY_ROOT(ID)   CITY_ID,
       CONNECT_BY_ROOT(NAME) CITY_NAME
FROM   SC_DISTRICT
WHERE  NAME='响滩镇' 
       START WITH PARENT_ID=1
       CONNECT BY PRIOR ID=PARENT_ID
--查询结果：
ID        PARENT_ID    NAME    CITY_ID    CITY_NAME
14        6            响滩镇  2          巴中市

--3.CONNECT BY子句伪列的应用
--LEVEL:查询节点层次，从1开始。
--CONNECT_BY_ISLEAF：查询节点是否是叶子节点，是则为1，不是则为0
SELECT   ID,   NAME,   PARENT_ID,   LEVEL,   CONNECT_BY_ISLEAF
FROM     SC_DISTRICT
   START WITH NAME='巴中市'
   CONNECT BY PRIOR ID=PARENT_ID 
   ORDER BY ID;

--查询结果：
ID    NAME    PARENT_ID    LEVEL    CONNECT_BY_ISLEAF
2    巴中市    1    1    0
4    巴州区    2    2    1
5    通江县    2    2    1
6    平昌县    2    2    0
13    大寨乡    6    3    1
14    响滩镇    6    3    1
15    龙岗镇    6    3    1
16    白衣镇    6    3    1


--4.查询递归路径--树形式 SYS_CONNECT_BY_PATH('形成树形式的字段', '递归分隔符')
--查询巴中市下行政组织递归路径
SELECT  ID,     NAME,   PARENT_ID,
        SYS_CONNECT_BY_PATH(NAME,'->') as NAME_PATH
FROM    SC_DISTRICT
        START   WITH NAME='巴中市'
        CONNECT BY PRIOR ID=PARENT_ID
        
--查询结果：
ID    NAME    PARENT_ID    NAME_PATH
2    巴中市    1    巴中市
4    巴州区    2    巴中市->巴州区
5    通江县    2    巴中市->通江县
6    平昌县    2    巴中市->平昌县
13    大寨乡    6    巴中市->平昌县->大寨乡
14    响滩镇    6    巴中市->平昌县->响滩镇
15    龙岗镇    6    巴中市->平昌县->龙岗镇
16    白衣镇    6    巴中市->平昌县->白衣镇
