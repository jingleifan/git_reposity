--1��create function --------------------------------------------
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

--2��drop function --------------------------------------------
drop function f_get_double_val;



--�����û���lock/unlock   �Ƿ�Ϊ����״̬��
	create  user  �û���   identified  by     ����	account     lock/unock     
--Ȩ��
	--ϵͳȨ��
		create session
		all  privileges
		grant create  session  to  public   --�������ݿ������û�ִ�и�Ȩ��  
		revoke  delete   any  table from   �û���          --����ϵͳȨ��

	--����Ȩ��
		
--���ݿ��ɫ
	connect
	resource
	dba









   