--关于 游标 if,for 的例子 
CREATE OR REPLACE PROCEDURE PEACE_IF IS
  CURSOR VAR_C IS
    SELECT * FROM GRADE;
BEGIN
  FOR TEMP IN VAR_C LOOP
    IF TEMP.COURSE_NAME = 'JAVA' THEN
      DBMS_OUTPUT.PUT_LINE('Stu_name = ' || TEMP.STU_NAME);
    ELSIF TEMP.COURSE_NAME = 'DB' THEN
      DBMS_OUTPUT.PUT_LINE('C++');
    ELSE
      DBMS_OUTPUT.PUT_LINE('PHP');
    END IF;
  END LOOP;
END;
---关于游标 for,case 的例子1 
create or replace procedure peace_case1 is
  cursor var_c is
    select * from test_case;
begin
  for temp in var_c loop
    case temp.vol
      when 1 then
        dbms_output.put_line('haha1');
      when 2 then
        dbms_output.put_line('haha2');
      when 3 then
        dbms_output.put_line('haha3');
      when 4 then
        dbms_output.put_line('haha4');
      else
        dbms_output.put_line('qita');
    end case;
  end loop;
end;

---关于游标 for,case 的例子2 
create or replace procedure peace_case2 is
  cursor var_c is
    select * from test_case;
begin
  for temp in var_c loop
    case
      when temp.vol = 1 then
        dbms_output.put_line('haha1');
      when temp.vol = 2 then
        dbms_output.put_line('haha2');
      when temp.vol = 3 then
        dbms_output.put_line('haha3');
      when temp.vol = 4 then
        dbms_output.put_line('haha4');
      else
        dbms_output.put_line('qita');
    end case;
  end loop;
end;

---关于for 循环的例子 
create or replace procedure peace_for is
  sum1 number := 0;
  temp varchar2(500);
begin
  for i in 1 .. 9 loop
    temp := '';
    for j in 1 .. i loop
      sum1 := i * j;
      temp := temp || to_char(i) || ' * ' || to_char(j) || ' = ' ||
              to_char(sum1) || ' ';
    end loop;
    dbms_output.put_line(temp);
  end loop;
end;

---关于 loop循环的例子 
create or replace procedure peace_loop is
  sum1 number := 0;
  temp number := 0;
begin
  loop
    exit when temp >= 10;
    sum1 := sum1 + temp;
    temp := temp + 1;
  end loop;
  dbms_output.put_line(sum1);
end;


---关于游标和loop循环的例子 
create or replace procedure loop_cur is
  stu_name    varchar2(100);
  course_name varchar2(100);
  cursor var_cur is
    select * from grade;
begin
  open var_cur;
  loop
    fetch var_cur
      into stu_name, course_name;
    exit when var_cur%notfound;
    dbms_output.put_line(stu_name || course_name);
  end loop;
  close var_cur;
end;

---关于异常处理的例子 
create or replace procedure peace_exp(in1 in varchar2) is
  c_n varchar2(100);
begin
  select course_name into c_n from grade where stu_name = in1;
  dbms_output.put_line(c_n);
exception
  when no_data_found then
    dbms_output.put_line('try');
  when TOO_MANY_ROWS then
    dbms_output.put_line('more');
end;


---关于异常处理的例子2 
CREATE OR REPLACE PROCEDURE PEACE_INSERT(C_N IN VARCHAR2) IS
  ERROR EXCEPTION;
BEGIN
  IF C_N = 'OK' THEN
    INSERT INTO COURSE (COURSE_NAME) VALUES (C_N);
  ELSIF C_N = 'NG' THEN
    INSERT INTO COURSE (COURSE_NAME) VALUES (C_N);
    RAISE ERROR;
  ELSE
    DBMS_OUTPUT.PUT_LINE('c_n' || C_N);
  END IF;
  COMMIT;
EXCEPTION
  WHEN ERROR THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('ERRO');
END;

---关于包的例子 定义包 
CREATE OR REPLACE PACKAGE PEACE_PKG AS
  FUNCTION TEST1(IN1 IN VARCHAR2) RETURN NUMBER;
  PROCEDURE TEST2(IN2 IN VARCHAR2);
END PEACE_PKG;
---关于包的例子 定义包体 
create or replace package body peace_pkg as
  function test1(in1 in varchar2) return number as
    temp number;
  begin
    temp := 0;
    return temp;
  end;
  procedure test2(in2 in varchar2) is
  begin
    dbms_output.put_line(in2);
  end;
end peace_pkg;
