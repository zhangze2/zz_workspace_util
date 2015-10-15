CREATE OR REPLACE PROCEDURE �洢������
(

--�������
 is_ym  IN CHAR(6) ,

the_count OUT NUMBER,
) 
AS 
--������� 
vs_msg   VARCHAR2(4000);   --������Ϣ����
vs_ym_beg  CHAR(6);      --��ʼ�·�
vs_ym_end  CHAR(6);      --��ֹ�·�
vs_ym_sn_beg CHAR(6);     --ͬ����ʼ�·�
vs_ym_sn_end CHAR(6);     --ͬ����ֹ�·�

--�����α�(�򵥵�˵����һ�����Ա����Ľ����) 


CURSOR cur_1 IS 
  SELECT ������ 
  FROM ������ 
    WHERE ������
   GROUP BY ������; 

BEGIN 


--�������������������ֵ���õ���Oralce��SUBSTR TO_CHAR ADD_MONTHS 

 

TO_DATE �Ⱥܳ��õĺ����� 
vs_ym_beg := SUBSTR(is_ym,1,6); 
vs_ym_end := SUBSTR(is_ym,7,6); 
vs_ym_sn_beg := TO_CHAR(ADD_MONTHS(TO_DATE(vs_ym_beg,'yyyymm'), -12),'yyyymm'); 
vs_ym_sn_end := TO_CHAR(ADD_MONTHS(TO_DATE(vs_ym_end,'yyyymm'), -12),'yyyymm'); 


--��ɾ�������ض����������ݡ� 


DELETE FROM ���� WHERE ym = is_ym; 


  --Ȼ�������õ�DBMS_OUTPUT�����put_line������ӡ��Ӱ��ļ�¼�����������õ�һ��ϵͳ����SQL%rowcount 


DBMS_OUTPUT.put_line('del���¼�¼='||SQL%rowcount||'��'); 

INSERT INTO����(area_code,ym,CMCODE,rmb_amt,usd_amt) 
SELECT area_code,is_ym,CMCODE,SUM(rmb_amt)/10000,SUM(usd_amt)/10000 
FROM BGD_AREA_CM_M_BASE_T 
  WHERE ym >= vs_ym_beg 
  AND ym <= vs_ym_end 
GROUP BY area_code,CMCODE; 

DBMS_OUTPUT.put_line('ins���¼�¼='||SQL%rowcount||'��'); 
--�����α괦�����µ��������α��м��ַ�������for��������бȽ�ֱ�۵�һ�֡�

 
FOR rec IN cur_1 LOOP 
  UPDATE ����
  SET rmb_amt_sn = rec.rmb_amt_sn,usd_amt_sn = rec.usd_amt_sn 
   WHERE area_code = rec.area_code 
   AND CMCODE = rec.CMCODE 
   AND ym = is_ym; 
END LOOP; 

COMMIT; 


--�������֡�OTHERS��ʾ������������������SQLERRM��ϵͳ���ñ��������˵�ǰ�������ϸ��Ϣ�� 


EXCEPTION 


   WHEN OTHERS THEN 
      vs_msg := 'ERROR IN xxxxxxxxxxx_p('||is_ym||'):'||SUBSTR(SQLERRM,1,500);

 
   ROLLBACK; 


   --�ѵ�ǰ�����¼����־�� 


   INSERT INTO LOG_INFO(proc_name,error_info,op_date) 
   VALUES('xxxxxxxxxxx_p',vs_msg,SYSDATE); 
   COMMIT; 
   RETURN; 


END;
