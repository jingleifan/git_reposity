/*  oracle in exists 
   1.子查询结果集小，用IN
   2.外表小，子查询表大，用EXISTS
*/  
-- 简单说明：

--a表的数据小，b表数据大时用exists。a为外表（也为主表）
select * from se_sbstype_def de
where exists
(
  select 1 from test_table l
  where de.sbs_type_code = l.type_code
);

--b表数据量小（子表）时，用in。

 SELECT sum(a.qty) FROM test_table a WHERE a.type_code IN 
 (
   select de.sbs_type_code from se_sbstype_def de
 where de.is_quota<>1
 );
 
 --a表、b表都比较大时，用in
 select ts.sbs_unit_id,ts.type_code,sum(ts.qty) from test_table ts
 where ts.sbs_guid in
 (
     select n.guid from se_result_n_m n
     where n.sbstype_id in 
     (
       select de.related_type_id from se_sbstype_def de
       where de.sbs_type_code='YEAR_BASE_CONTRACT'
     ) 
 )--
 group by ts.sbs_unit_id,ts.type_code;
 

 
