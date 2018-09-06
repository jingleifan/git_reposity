--1、create table------------------------------------------------------------

create table test_table
(
   rec_id number(20),
   sbs_guid varchar2(255),
   sbs_unit_id varchar2(255),
   cls_id   number(20),
   beg_date date,
   end_date date,
   qty  number(20,4),
   type_code varchar2(36),
   update_time date,
   constraint pk_test_tab1 primary key(rec_id)
);

create table test_large
(
  large_id varchar2(36),
  large_name varchar2(255),
  large_text clob,
  large_image blob,
  update_time date,
  constraint pk_test_large primary key(large_id)
);

create table test_cls
(
  cls_id number(20),
  cls_name varchar2(300),
  cls_code varchar2(255),
  constraint pk_test_cls primary key(cls_id)  
);

--表创建时，必须有主键。
--2、data inserts --------------------------------------------------------------------

--style 1:
insert into test_table(rec_id,sbs_guid,sbs_unit_id,cls_id,beg_date,end_date,qty,type_code,update_time)
values(seq_sbs_id.nextval,'rec_name','rec_code',0,
to_date('2015-01-01','yyyy-mm-dd'),
to_date('2015-12-31','yyyy-mm-dd'),
80.2,
'type_code',
sysdate
)
;
--style 2:
insert into test_table(rec_id,sbs_guid,sbs_unit_id,
cls_id,beg_date,end_date,qty,type_code,update_time)
select seq_sbs_id.nextval,n.guid,n.sbs_unit_id,
0,n.start_date,n.end_date,n.energy_t,
de.sbs_type_code,sysdate   
from se_result_n_m n
left join se_sbstype_def de on n.sbstype_id=de.related_type_id and n.market_id=de.market_id
where n.mkt_month>=to_date('2015-01-01','yyyy-mm-dd');
--3、data update--------------------------------------------------------------------------
--style 1:
update test_table ts 
set ts.qty=ts.qty+8,
ts.update_time=sysdate
where ts.type_code='YEAR_BASE_CONTRACT';

--style 2:
merge into test_table l
using 
(
    select n.guid,n.sbs_unit_id,
0,n.start_date,n.end_date,n.energy_t,
de.sbs_type_code,sysdate   
from se_result_n_m n
left join se_sbstype_def de on n.sbstype_id=de.related_type_id and n.market_id=de.market_id
where n.mkt_month>=to_date('2015-01-01','yyyy-mm-dd')
) cp
 on (l.sbs_guid=cp.guid)
      when matched then
        update set 
          l.qty=cp.energy_t,
          l.update_time=sysdate ;
--4、data delete-------------------------------------------------------------------------------
delete from test_table ts where ts.type_code='YEAR_BASE_CONTRACT';

--5、table truncate----------------------------------------------------------------------------
truncate table test_table;
--6、table drop--------------------------------------------------------------------------------
drop table test_table;
select * from test_table




