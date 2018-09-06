--1、create function --------------------------------------------
--must return a value.
create or replace  function f_get_double_val(af_qty number)
return number
is
  lf_ret number(20,4);
begin
  lf_ret := af_qty * 2;
  return lf_ret;
end;
--e.g.
select f_get_double_val(23.3) from dual;

--2、drop function --------------------------------------------
drop function f_get_double_val;



--创建用户（lock/unlock   是否为锁定状态）
	create  user  用户名   identified  by     口令	account     lock/unock     
--权限
	--系统权限
		create session
		all  privileges
		grant create  session  to  public   --授予数据库所有用户执行该权限  
		revoke  delete   any  table from   用户名          --撤销系统权限

	--对象权限
		
--数据库角色
	connect
	resource
	dba









   