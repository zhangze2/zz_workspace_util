--�洢����
����1  CREATE OR REPLACE PROCEDURE �洢������

����2  IS

����3  BEGIN

����4  NULL;

����5  END;

--��1:

����CREATE OR REPLACE PROCEDURE ��һ��SQL���֪ͨOracle���ݿ�ȥ����һ������skeleton�洢����, ������ھ͸�����;

--��2:

����IS�ؼ��ʱ������潫����һ��PL/SQL�塣

--��3:

����BEGIN�ؼ��ʱ���PL/SQL��Ŀ�ʼ��

--��4:

����NULL PL/SQL������ʲô�¶���������䲻��ɾȥ����ΪPL/SQL����������Ҫ��һ��;

--��5:

����END�ؼ��ʱ���PL/SQL��Ľ���

--�洢���̴����﷨��
 create or replace procedure �洢��������param1 in type��param2 out type�� 

as 

����1 ���ͣ�ֵ��Χ��; --vs_msg   VARCHAR2(4000); 

����2 ���ͣ�ֵ��Χ��;

Begin

Select count(*) into ����1 from ��A where ����=param1��

 

    If (�ж�����) then

       Select ���� into ����2 from ��A where����=param1��

       Dbms_output��Put_line(����ӡ��Ϣ��);

    Elsif (�ж�����) then

       Dbms_output��Put_line(����ӡ��Ϣ��);

    Else

       Raise �쳣����NO_DATA_FOUND��;

    End if;

Exception

    When others then

       Rollback;

End;

 
/*ע�����

1�� �洢���̲�������ȡֵ��Χ��in��ʾ���룬out��ʾ���;  ���Ϳ���ʹ������Oracle�еĺϷ����͡�

2��  ������ȡֵ��Χ������ӷֺ�

3��  ���ж����ǰ�������count��*�������ж��Ƿ���ڸ���������¼

4��  ��select ������into��������������ֵ

5��  �ڴ��������쳣�� raise+�쳣��*/
