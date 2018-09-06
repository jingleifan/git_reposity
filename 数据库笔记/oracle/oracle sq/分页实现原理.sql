--分页实现原理---------------------
--分页包括多个参数，1、row nums in one page 如20
--                  2、page no,  如 2
--                  3、order 字段，order by field1 asc,field2 desc
select * from 
(       
  select t.*,row_number() over(order by t.beg_date asc) row_no
  from
  (             
  select ts.rec_id,ts.sbs_guid,ts.beg_date,ts.end_date,ts.qty,ts.type_code
  from test_table ts
  where ts.type_code='YEAR_BASE_CONTRACT'
  --order by ts.beg_date
  ) t
) tmp
where row_no between 20 and 30
order by tmp.beg_date
-----------------------------------------------------------------------------------------
--1、--排序--
select ts.*,
    row_number() over (order by ts.beg_date) rowIndex
  from  test_table ts
  where ts.type_code='YEAR_BASE_CONTRACT';
--2、--分组排序--
select ts.*,ROW_NUMBER() OVER(partition by ts.sbs_unit_id order by beg_date desc) row_no
from  test_table ts
  where ts.type_code='YEAR_BASE_CONTRACT'
  and ts.beg_date >=to_date('2015-01-01','yyyy-mm-dd')
  and ts.beg_date < to_date('2016-01-01','yyyy-mm-dd')
  and ts.sbs_unit_id<>'-1'
  order by ts.sbs_unit_id,ts.beg_date desc;


             
