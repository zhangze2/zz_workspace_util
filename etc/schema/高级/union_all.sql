--给下拉框 加上“--请选择--”

select '--请选择--' as BUILDING_NAME,'' as BUILDING_ID 
from dual UNION ALL 
select BUILDING_NAME,BUILDING_ID FROM OA_COLLEGE_CAMPUS_BUILDING