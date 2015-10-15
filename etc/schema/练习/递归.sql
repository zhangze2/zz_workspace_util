--���� �Ĵ���������
CREATE TABLE SC_DISTRICT
(
  ID         NUMBER(10)                  NOT NULL,
  PARENT_ID  NUMBER(10),
  NAME       VARCHAR2(255 BYTE)          NOT NULL
);
--�������������
ALTER TABLE SC_DISTRICT ADD (  CONSTRAINT SC_DISTRICT_PK PRIMARY KEY (ID));

ALTER TABLE SC_DISTRICT ADD (  CONSTRAINT SC_DISTRICT_R01  FOREIGN KEY (PARENT_ID)  REFERENCES SC_DISTRICT (ID));
 
--��������
INSERT INTO SC_DISTRICT(ID,NAME) VALUES(1,'�Ĵ�ʡ');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(2,1,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(3,1,'������'); 

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(4,2,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(5,2,'ͨ����');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(6,2,'ƽ����');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(7,3,'ͨ����');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(8,3,'������');

INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(9,8,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(10,8,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(11,8,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(12,8,'�ϰ���');
 
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(13,6,'��կ��');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(14,6,'��̲��');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(15,6,'������');
INSERT INTO SC_DISTRICT(ID,PARENT_ID,NAME) VALUES(16,6,'������');


--1.��ѯĳ�ڵ����������ڵ�: 
--��ѯ���������������������֯(���������ǰ�ڵ�):
SELECT *
FROM SC_DISTRICT
START WITH NAME='������'
CONNECT BY PRIOR ID=PARENT_ID

--��ѯ���:
ID    PARENT_ID      NAME
2    1            ������
4    2            ������
5    2            ͨ����
6    2            ƽ����
13    6            ��կ��
14    6            ��̲��
15    6            ������
16    6            ������



--2.��ѯָ���ڵ�ĵݹ���ڵ�  
--eg:��ѯ��̲�����������У�
SELECT ID,   PARENT_ID,      NAME,     
       CONNECT_BY_ROOT(ID)   CITY_ID,
       CONNECT_BY_ROOT(NAME) CITY_NAME
FROM   SC_DISTRICT
WHERE  NAME='��̲��' 
       START WITH PARENT_ID=1
       CONNECT BY PRIOR ID=PARENT_ID
--��ѯ�����
ID        PARENT_ID    NAME    CITY_ID    CITY_NAME
14        6            ��̲��  2          ������

--3.CONNECT BY�Ӿ�α�е�Ӧ��
--LEVEL:��ѯ�ڵ��Σ���1��ʼ��
--CONNECT_BY_ISLEAF����ѯ�ڵ��Ƿ���Ҷ�ӽڵ㣬����Ϊ1��������Ϊ0
SELECT   ID,   NAME,   PARENT_ID,   LEVEL,   CONNECT_BY_ISLEAF
FROM     SC_DISTRICT
   START WITH NAME='������'
   CONNECT BY PRIOR ID=PARENT_ID 
   ORDER BY ID;

--��ѯ�����
ID    NAME    PARENT_ID    LEVEL    CONNECT_BY_ISLEAF
2    ������    1    1    0
4    ������    2    2    1
5    ͨ����    2    2    1
6    ƽ����    2    2    0
13    ��կ��    6    3    1
14    ��̲��    6    3    1
15    ������    6    3    1
16    ������    6    3    1


--4.��ѯ�ݹ�·��--����ʽ SYS_CONNECT_BY_PATH('�γ�����ʽ���ֶ�', '�ݹ�ָ���')
--��ѯ��������������֯�ݹ�·��
SELECT  ID,     NAME,   PARENT_ID,
        SYS_CONNECT_BY_PATH(NAME,'->') as NAME_PATH
FROM    SC_DISTRICT
        START   WITH NAME='������'
        CONNECT BY PRIOR ID=PARENT_ID
        
--��ѯ�����
ID    NAME    PARENT_ID    NAME_PATH
2    ������    1    ������
4    ������    2    ������->������
5    ͨ����    2    ������->ͨ����
6    ƽ����    2    ������->ƽ����
13    ��կ��    6    ������->ƽ����->��կ��
14    ��̲��    6    ������->ƽ����->��̲��
15    ������    6    ������->ƽ����->������
16    ������    6    ������->ƽ����->������
