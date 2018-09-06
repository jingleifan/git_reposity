--1¡¢when do we use view?----------------------------------------

--2¡¢create or replace view---------------------------------------------------------------
--ºáÏò£¬×ÝÏò
create view v_test_table as 
select ts.sbs_guid,ts.sbs_unit_id,ts.beg_date,ts.end_date,ts.qty,ts.type_code as code,'hello' hello
 from test_table ts
where ts.type_code='YEAR_BASE_CONTRACT'
and ts.beg_date>= to_date('2015-01-01','yyyy-mm-dd');
--3¡¢-drop view-----------------------------------------------------------------
drop view v_test_table;
