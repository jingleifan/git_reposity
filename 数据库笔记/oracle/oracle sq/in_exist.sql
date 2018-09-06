/*  oracle in exists 
   1.�Ӳ�ѯ�����С����IN
   2.���С���Ӳ�ѯ�����EXISTS
*/  
-- ��˵����

--a�������С��b�����ݴ�ʱ��exists��aΪ���ҲΪ����
select * from se_sbstype_def de
where exists
(
  select 1 from test_table l
  where de.sbs_type_code = l.type_code
);

--b��������С���ӱ�ʱ����in��

 SELECT sum(a.qty) FROM test_table a WHERE a.type_code IN 
 (
   select de.sbs_type_code from se_sbstype_def de
 where de.is_quota<>1
 );
 
 --a��b���Ƚϴ�ʱ����in
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
 

 
