--1����ѯĳһ���㵥Ԫָ��������ӽ��Ļ���������
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
--���ݷ���

���麯��max, min, avg, sum, count

select ts.type_code,sum(ts.qty)
 from test_table ts
where ts.beg_date<=to_date('2015-12-31','yyyy-mm-dd')
  and ts.end_date>=to_date('2015-01-01','yyyy-mm-dd')
  group by ts.type_code
  having sum(ts.qty)>0


grout by �� having �־�

groupt by���ڶԲ�ѯ�������ͳ��

having�Ӿ��������Ʒ�������ʾ



�ܽ᣺

���麯��(max��min��avg��count)ֻ�ܳ�����ѡ���б�(select��)��having��order by�Ӿ���
���select�����ͬʱ����group by��having��order by�����ǵ�˳�������group by��having��order by
���ȷ���������ƽ����ʾ�������飩
��ѡ������������У����ʽ�ͷ��麯������ô��Щ�кͱ��ʽ������һ��������group by�Ӿ��У�����ͻᱨ����deptno
