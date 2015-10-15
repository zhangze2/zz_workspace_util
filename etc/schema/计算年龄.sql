--算法一：
SELECT TRUNC(months_between(sysdate, birthday)/12) AS "Age"
FROM    my_user_table;

--算法二：
select trunc(to_number(to_char(sysdate,'yyyymmdd'))/10000
-to_number(to_char(to_date('1982-8-28','yyyy-mm-dd'),'yyyymmdd'))/10000)
from dual

--假设这个人是1982年8月28号的。。现在就是22周岁。。呵呵。。


--算法三：
SELECT (sysdate - TO_DATE('dd-mm-yyyy')) / 365

--算法四：（误差最小的算法）
select to_char(sysdate,'yyyy')-to_char(mb_birth,'yyyy')+
decode(sign(to_char(sysdate,'mmdd')-to_char(mb_birth,'mmdd')),-1,-1,0,0,1,0)
from ly_oa_groupmembers