create or replace procedure pro_normal_upgrade is
/***************************************************
    版    本: v0.0.1
    功    能: 每年1月1日正常薪级增长
    前置条件：上年度考核结果为通过,且为在发人员
    源    表：
    结果  表：
    逻辑描述: (描述程序实现逻辑)
    参数说明：
    运行频率：每年1月1日凌晨1点
    创建信息：(zkai 2014-12-02)
    修改日志: zkai
    日   志1:
*****************************************************/
BEGIN

  INSERT INTO s_change_grade(change_grade_id, staff_id,before_grade,after_grade)
         SELECT pams.imp_id,pams.staff_id,p.current_pay_level,(p.current_pay_level + 1) FROM s_imp_pams_data pams, s_send_person p
         WHERE pams.staff_id = p.staff_id AND is_pass = '通过' AND import_date = (to_char(SYSDATE,'yyyy') - 1) AND p.send_status = '2';

  INSERT INTO s_change_overall(change_overall_id, change_type_id, staff_id, staff_name, department_key, department_name,
       educationlevel_key, educationlevel,change_before,change_after,change_date,delete_flag,detail_id)
       SELECT s_change_resource_seq.nextval,'02',pams.staff_id,p.staff_name,p.department_id,p.department_name,
       p.education_id,p.education,p.current_pay_level,(p.current_pay_level+1),SYSDATE,'0',pams.imp_id FROM s_imp_pams_data pams, s_send_person p
       WHERE pams.staff_id = p.staff_id AND is_pass = '通过' AND import_date = (to_char(SYSDATE,'yyyy') - 1) AND p.send_status = '2';
end pro_normal_upgrade;
