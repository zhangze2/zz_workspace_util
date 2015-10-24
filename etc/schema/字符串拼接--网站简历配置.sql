--民航招聘网站简历配置及sql语句
select 'create table r_r_' || tablename || ' as select * from ' || tablename || ' where 1<>1;' from data_dictionary_defination;    
select 'drop table r_r_dd_' || tablename || ';' from data_dictionary_defination;  

SELECT t.x__work_position_name, t.x__name, t.x__id_card, t.x__college, t.x__photo,
       t.x__nativeplace, t.x__email, (SELECT dm.name FROM GB_T2261 dm WHERE dm.codeid = t.x__sex) AS x__sex,  
       to_char(t.x__birthday, 'yyyy-MM-dd') AS x__birthday, 
       to_char(t.x__worktime, 'yyyy-MM-dd') AS x__worktime, 
       (SELECT dm.name FROM GB_T12407 dm WHERE dm.codeid = t.post_level_key) AS post_level, 
       (SELECT dm.name FROM GB_T8561_2001 dm WHERE dm.codeid = t.x__skill_seniority) AS skill_seniority,
       (SELECT dm.name FROM GB_T4762 dm WHERE t.x__politics = dm.codeid) AS x__politics, decode(x__ismarried, 1,'已婚',0,'未婚','') as x__ismarried,x__telephone
       ,x__original_unit, X__HEIGHT, 	
       (SELECT dm.name FROM GB_T4762 dm WHERE dm.codeid = t.x__politics) AS x__politics, x__MAILING_ADDRESS,
        nvl(t.x__business_experience,'空')as x__business_experience
        FROM r_r_ds_overall t 
WHERE t.x__global_id='1b6944ee-838a-4e75-b331-0c7f780470b1'
--应聘岗位
SELECT post.NAME, (SELECT dm.name FROM DM_ORGANIZATION_TYPE dm WHERE dm.codeid = post.authsort) authsort
FROM r_post post, r_apply app WHERE app.post_global_id = post.POST_GLOBAL_ID AND app.apply_global_id ='2c4a5a2b-730d-4f45-a346-ed4a46888fc9'
--学习经历
--判断是否有学习经历
select count(1) FROM r_r_dd_education_experience e WHERE e.x__global_id = 'f8d2fcb1-39d5-4f46-9392-2ee2570c82cb'
SELECT to_char(e.enrolltime, 'yyyyMMdd') || '-' || to_char(e.graduatetime, 'yyyyMMdd') AS setime, e.ddc_university,
       (SELECT dm.name FROM DM_DEF_SUBJECT dm WHERE dm.codeid = e.specialty) AS specialty, 
       (SELECT dm.name FROM DM_XL dm WHERE dm.codeid = e.educationlevel) AS educationlevel,
       (SELECT dm.name FROM GB_T6864 dm WHERE dm.codeid = e.degree) AS DEGREE, 
       (SELECT dm.name FROM DM_STUDY_FORM dm WHERE dm.codeid = e.study_form) AS study_form
FROM r_r_dd_education_experience e
WHERE e.x__global_id = 'f8d2fcb1-39d5-4f46-9392-2ee2570c82cb'


--工作经历
SELECT to_char(gz.starttime, 'yyyyMMdd') || '-' || to_char(gz.endtime, 'yyyyMMdd') AS setime,
       gz.unitname, gz.workcontent
FROM r_r_dd_work_history gz
WHERE gz.x__global_id = ?

--电脑技能、外语水平
select  t.ddc_pc_level, to_char(t.ddc_pc_level_date, 'yyyy-MM-dd') ddc_pc_level_date,
t.ddc_language_level,to_char(t.ddc_language_level_date, 'yyyy-MM-dd') ddc_language_level_date  from R_R_DD_PC_LANGUAGE t where t.x__global_id = 'e3aa9828-c760-4f38-ad82-89c3ebbbf6a2'


--行政职务变动情况
select t.x__global_id, t.ddc_name, t.ddc_level, to_char(t.ddc_start_date, 'yyyy-MM-dd') ddc_start_date,to_char(t.ddc_end_date , 'yyyy-MM-dd') ddc_end_date
 from R_R_DD_XZZWBD t where t.x__global_id = 'e3aa9828-c760-4f38-ad82-89c3ebbbf6a2'
 --专业技术资格变动情况
select t.ddc_name,(SELECT dm.name FROM DM_DEF_DTLEVEL dm WHERE dm.codeid = t.ddc_level) AS ddc_level,  to_char(t.ddc_get_date, 'yyyy-MM-dd') ddc_get_date from R_R_DD_ZYJSZGBD t
 where t.x__global_id = 'e3aa9828-c760-4f38-ad82-89c3ebbbf6a2'
 
--培训  if( count_zyywpx.Select(c)>=1,true, false)
select count(1) c FROM r_r_dd_teacher_training WHERE x__global_id = 'f8d2fcb1-39d5-4f46-9392-2ee2570c82cb' 
SELECT to_char(train_start_date, 'yyyy-MM-dd') || '--' || to_char(train_end_date, 'yyyy-MM-dd') AS train_time,
train_org, train_content FROM r_r_dd_teacher_training
WHERE x__global_id = ''
--科研项目
SELECT ky.x__global_id , ky.ddc_content, ky.ddc_direction, ky.ddc_award, ky.ddc_patent,ky.research_name, ky.item_source, ky.reached_money,
       to_char(ky.byearm, 'yyyyMMdd') || '-' || to_char(ky.eyearm, 'yyyyMMdd') AS setime
FROM r_r_dd_scientific_research_pro ky
WHERE ky.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1'
--论文统计
select paper.ddc_paper_total, paper.ddc_sci_count, paper.ddc_istp_count, paper.ddc_ei_count, paper.ddc_articles_total 
from R_R_DD_PAPER_COUNT paper where paper.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1'
--论文详情
select t.title, t.publication_name, t.publish_year, t.ddc_rank from R_R_DD_PAPERLIST t where t.x__global_id = ''
--配偶及子女情况
SELECT fm.x__global_id ,fm.xingming,  to_char(fm.ddc_birthday, 'yyyy-MM-dd') AS birthday,  fm.ddc_accounts as accounts, 
(SELECT dm.name FROM DM_XL dm WHERE dm.codeid = fm.ddc_educationlevel) AS educationlevel, 
(SELECT dm.name FROM GB_T6864 dm WHERE dm.codeid = fm.ddc_degree) AS ddc_degree, 
fm.zhiwu, fm.gongzuodanwei FROM r_r_dd_family_member fm WHERE (fm.title = '11' OR fm.title = '12')
AND  fm.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1' AND ROWNUM = 1
--子女
SELECT fm.x__global_id ,fm.xingming,  to_char(fm.ddc_birthday, 'yyyy-MM-dd') AS birthday,  fm.ddc_accounts as accounts, 
fm.zhiwu, fm.gongzuodanwei FROM r_r_dd_family_member fm WHERE (fm.title = '20' OR fm.title = '30')
AND  fm.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1' AND ROWNUM = 1


--获奖情况
SELECT ry.x__global_id, ry.project, (SELECT dm.name FROM GB_T8560 dm WHERE dm.codeid = ry.honortitle) AS honortitle,
(SELECT dm.name FROM DM_reward_level_ZB dm WHERE dm.codeid = ry.reward_level) AS reward_level, 	
       to_char(ry.honordate, 'yyyyMMdd') AS honordate
FROM r_r_dd_honorable_mention ry 
WHERE ry.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1'
--主要学习课程+任学生干部情况 
select ll.x__global_id,ll.ddc_main_lesson, ll.ddc_leader from R_R_DD_LESSON_LEADER ll where ll.x__global_id = '1b6944ee-838a-4e75-b331-0c7f780470b1' d8448c4a-861a-46da-a61a-f788d6992b6c
--人员类型 选择
SELECT DECODE(X__APPLYSTAFFSORT,'1','■应届毕业生    □暂缓就业人员    □社会人员    □留学归国人员    □其他人员', 
'2','□应届毕业生    ■暂缓就业人员    □社会人员    □留学归国人员    □其他人员', 
'3','□应届毕业生    □暂缓就业人员    ■社会人员    □留学归国人员    □其他人员', 
'4','□应届毕业生    □暂缓就业人员    □社会人员    ■留学归国人员    □其他人员', 
'5','□应届毕业生    □暂缓就业人员    □社会人员    □留学归国人员    ■其他人员', 
'□应届毕业生    □暂缓就业人员    □社会人员    □留学归国人员    □其他人员') AS applyStaffSort FROM r_r_ds_overall WHERE x__global_id=?
