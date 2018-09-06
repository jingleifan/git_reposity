--1、查询某一结算单元指定日期最接近的基数电数量
select * from test_table s
where s.sbs_unit_id='018096750AEA76B5E0539C2A9E0A983E'
  and s.type_code='MONTH_QUOTA_CONTRACT'
  and s.beg_date in
  (
    select max(s.beg_date)
    from test_table s
    where s.sbs_unit_id='018096750AEA76B5E0539C2A9E0A983E'
      and s.type_code='MONTH_QUOTA_CONTRACT'
      and s.beg_date<=to_date('2016-04-19','yyyy-mm-dd')
  );
--数据分组

分组函数max, min, avg, sum, count

select ts.type_code,sum(ts.qty)
 from test_table ts
where ts.beg_date<=to_date('2015-12-31','yyyy-mm-dd')
  and ts.end_date>=to_date('2015-01-01','yyyy-mm-dd')
  group by ts.type_code
  having sum(ts.qty)>0


grout by 和 having 字句

groupt by用于对查询结果分组统计

having子句用于限制分组结果显示



总结：

分组函数(max，min，avg，count)只能出现在选择列表(select后)，having和order by子句中
如果select语句中同时包含group by，having和order by，他们的顺序必须是group by，having和order by
（先分组→再抑制结果显示→最后分组）
在选择列中如果有列，表达式和分组函数，那么这些列和表达式必须有一个出现在group by子句中，否则就会报错。如deptno
