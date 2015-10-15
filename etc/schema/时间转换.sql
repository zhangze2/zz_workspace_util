--timestamp类型
select TO_TIMESTAMP('2014-08-01 00:00:00','yyyy-mm-dd HH24:MI:SS') from dual;


--时间区间
if(!(params.get("beginTime") == null || params.get("beginTime").toString().equals(""))){
	Date beginTime=(Date) params.get("beginTime");
	DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	sql=sql+"and ama.begin_time >= to_date('"+df.format(beginTime)+"','yyyy-MM-dd')";
}
if(!(params.get("endTime") == null || params.get("endTime").toString().equals(""))){
	Date endTime=(Date) params.get("endTime");
	DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	sql=sql+"and ama.end_time <= to_date('"+df.format(endTime)+"','yyyy-MM-dd')";
}


--系统时间：
SELECT * FROM CAMPUS_NOTICE 
where (TYPE='2' or TYPE='0') 
and to_date(OVER_TIME,'yyyy-MM-dd')>= to_date(to_char(sysdate,'yyyy-MM-dd'),'yyyy-MM-dd') 
ORDER BY BEGIN_TIME DESC;