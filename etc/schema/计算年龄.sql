--�㷨һ��
SELECT TRUNC(months_between(sysdate, birthday)/12) AS "Age"
FROM    my_user_table;

--�㷨����
select trunc(to_number(to_char(sysdate,'yyyymmdd'))/10000
-to_number(to_char(to_date('1982-8-28','yyyy-mm-dd'),'yyyymmdd'))/10000)
from dual

--�����������1982��8��28�ŵġ������ھ���22���ꡣ���Ǻǡ���


--�㷨����
SELECT (sysdate - TO_DATE('dd-mm-yyyy')) / 365

--�㷨�ģ��������С���㷨��
select to_char(sysdate,'yyyy')-to_char(mb_birth,'yyyy')+
decode(sign(to_char(sysdate,'mmdd')-to_char(mb_birth,'mmdd')),-1,-1,0,0,1,0)
from ly_oa_groupmembers