--1、create function---------------------------------------------------
create or replace  function f_get_double_val(af_qty number)
return number
is
  lf_ret number(20,4);
begin
  lf_ret := af_qty * 2;
  return lf_ret;
end;
--2、exec functions --------------------------------------------------------------
select f_get_double_val(23.3) from dual
---3、procedure---------------------------------------------------------------
create or replace procedure p_cal_double_val
(
  as_unit_id varchar2,
  af_delta number,
  adt_beg date,
  af_ret out number
)
is
 lf_qty number(20,4);
 lf_ret number(20,4);
begin
  select nvl(sum(nvl(ts.qty,0)),0) into lf_qty
   from test_table ts
  where ts.sbs_unit_id=as_unit_id
  and ts.beg_date>=adt_beg;
  lf_ret := lf_qty + af_delta;
  af_ret := lf_ret;
end;
---------------------------------------------------------------------
declare
  lf_ret number(20,4);
begin
  p_cal_double_val('018096750EBB76B5E0539C2A9E0A983E',
  -8,
  to_date('2015-01-01','yyyy-mm-dd'),
  lf_ret
  );
  dbms_output.put_line('ret:'||lf_ret);
end;
--4、procedure by cursor---------------------------------------------------------
create or replace procedure p_cal_double_val2
(
  as_unit_id varchar2,
  af_delta number,
  adt_beg date,
  af_ret out number
)
is
 lf_qty number(20,4);
  cursor cur_sum(as_tmp_unit_id varchar2,
                 adt_tmp_beg date
                 )
                 is
  select ts.beg_date,nvl(ts.qty,0) qty
   from test_table ts
  where ts.sbs_unit_id=as_unit_id
  and ts.beg_date>=adt_beg;
   row_sum cur_sum%rowtype;
begin
  lf_qty := 0;
  open cur_sum(as_unit_id,adt_beg);
    loop
      fetch cur_sum
        into row_sum;
      exit when cur_sum%notfound;
        lf_qty := lf_qty + row_sum.qty;
    end loop;
    close cur_sum;
   lf_qty := lf_qty + af_delta;
   af_ret := lf_qty;
end;

----------------------------------------------------------------------

declare
  lf_ret number(20,4);
begin
  p_cal_double_val2('018096750EBB76B5E0539C2A9E0A983E',
  -8,
  to_date('2015-01-01','yyyy-mm-dd'),
  lf_ret
  );
  dbms_output.put_line('ret:'||lf_ret);
end;
---5、procedure by dymantic sql--------------------------------------------------------
create or replace procedure p_cal_exec_val
(
  as_unit_id varchar2,
  af_delta number,
  adt_beg date,
  af_ret out number
)
is
 lf_qty number(20,4);
 ls_sql varchar2(30000);
begin
  ls_sql := 'select nvl(sum(ts.qty),0) from test_table ts where ts.sbs_unit_id='''
  ||as_unit_id||''' and ts.beg_date>=to_date('''||
  to_char(adt_beg,'yyyy-mm-dd') ||
  ''',''yyyy-mm-dd'')';
  execute immediate ls_sql into lf_qty;
  af_ret := lf_qty + af_delta;
end;
---------------------------------------------------------------------------------------------
declare
  lf_ret number(20,4);
begin
  p_cal_exec_val('018096750EBB76B5E0539C2A9E0A983E',
  -8,
  to_date('2015-01-01','yyyy-mm-dd'),
  lf_ret
  );
  dbms_output.put_line('ret:'||lf_ret);
end;
---6、procedure save info------------------------------------------------------------------------------------------
create or replace procedure p_test_save
(
  as_unit_id varchar2,
  adt_beg date,
  af_qty number,
  ai_ret out number
)
is
 lf_qty number(20,4);
 li_c number(4);
 ls_type_code varchar2(36);
begin
  lf_qty := 0;
  ls_type_code := 'YEAR_BASE_CONTRACT';
  ai_ret := 1;
  begin
    select count(1)
    into li_c
     from test_table ts
    where ts.sbs_unit_id=as_unit_id
      and ts.beg_date=adt_beg
      and ts.type_code=ls_type_code;
    if(li_c>0)then
       update test_table ts
       set ts.qty=af_qty
       where ts.sbs_unit_id=as_unit_id
      and ts.beg_date=adt_beg
      and ts.type_code=ls_type_code;
    else
      insert into  test_table(rec_id,sbs_guid,sbs_unit_id,beg_date,end_date,qty,type_code,update_time)
       values(seq_sbs_id.nextval,sys_guid(),as_unit_id,
       adt_beg,add_months(adt_beg,1),
       af_qty,ls_type_code,sysdate
       );
    end if;
  exception
     when others then
     rollback;
     ai_ret := 1;
  end;
  commit;
end;
----------------------------------------------------------------------------------
declare
  li_ret number(4);
begin
  p_test_save('test_unit_id2',
  to_date('2015-01-01','yyyy-mm-dd'),
  88,
   li_ret
  );
  dbms_output.put_line('ret:'||li_ret);
end;
select  * from test_table ts
where ts.sbs_unit_id='test_unit_id2'




