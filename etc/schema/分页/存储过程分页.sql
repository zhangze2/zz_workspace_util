--1������һ����
create or replace package testpackage as
--����һ�������ڸð��У�����������test_cursor ����һ���α�
type test_cursor is ref cursor;
end testpackage;

--2����д�洢����
create or replace procedure splitPages
( DD_MZ in varchar2, --����
pageSizes in number, --һҳ��ʾ�ļ�¼��
pageNow in number, --��ǰ�ڼ�ҳ
pageRows out number, --�ܼ�¼��
pageCount out number, --��ҳ��
pageCursor out testpackage.test_cursor --���ؼ�¼��
) is
--���岿��
--����sql��䣬 �ַ���
v_sql varchar2(1000);
--������������
v_begin number:= (pageNow-1)*pageSizes + 1;
v_end number:= pageNow*pageSizes;
begin
--ִ�в���
v_sql:= 'select * from
(select t.*, rownum rn from (select * from '||DD_MZ||') t) tt
where tt.rn between '||v_begin||' and '||v_end;
--���α��sql����
open pageCursor for v_sql;
--����myrows
--��֯һ��sql
v_sql:='select count(*) from '||DD_MZ;
--ִ��sql ���ѷ��ص�ֵ ��ֵ��pageRows
execute immediate v_sql into pageRows;
--����pageCount
pageCount:=(pageRows-1)/pageSizes + 1;
--�ر��α� ע�����ﲻ�ܹر��α�
--close pageCursor;
end;



/
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "LYHR", "LYHR");
//���ô洢����
CallableStatement proc = conn.prepareCall("{call splitPages(?, ?, ?, ?, ?, ?)}");
//�����������ֵ
proc.setString(1, "emp"); //����
proc.setInt(2, 3); //һҳ��ʾ�ļ�¼��
proc.setInt(3, 1); //��ǰ�ڼ�ҳ
//�������������ʲô����
proc.registerOutParameter(4, oracle.jdbc.OracleTypes.INTEGER); //�ܼ�¼��
proc.registerOutParameter(5, oracle.jdbc.OracleTypes.INTEGER); //��ҳ��
proc.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR); //���ؼ�¼��
//ִ��
proc.execute();
int pageRows = proc.getInt(4);
int pageCount = proc.getInt(5);
System.out.println("������="+pageRows);
System.out.println("��ҳ��="+pageCount);
ResultSet rs = (ResultSet)proc.getObject(6);
while(rs.next()){
System.out.println(rs.getInt(1) +" "+rs.getString(2)+" "+rs.getString(3));
} 
