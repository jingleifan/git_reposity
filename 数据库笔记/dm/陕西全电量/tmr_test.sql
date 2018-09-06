select * from "TMR"."TMRHISDATA"."BUSBAR_IMBALANCE_RATE";
select * from "TMR"."EMS"."BASEVOLTAGE";
select * from "TMR"."TMR"."SUBSYSTEM";

select * from v$sessions where trx_id in(select trx_id from v$lock);

select   dm_close_connect ('0x00007F048824C2F0');


--delete from "TMR"."TMR"."SERVICE_RUNNING_STATUS";




-- �����ֶ���ĳ���ֶ��滻
--UPDATE his_bay SET `NAME`=REPLACE(`NAME`,'10k','22w') WHERE CHANGE_ID=1

--�����п��Բ���
SET IDENTITY_INSERT tmr.tmr.INTERFACE_TRANSFER on;   ֮���Ϊoff



--  ����ҳ

select * from "TMR"."TMR"."CHANNEL_VIEW";
select * from tmr.ems.Basevoltage  b where exists
(select bv_id from  tmr.tmrhisdata.Busbar_Imbalance_Rate bu where bu.bv_id=b.id)
--����� ��������  ����
--update  tmr.tmrhisdata.Busbar_Imbalance_Rate  set BALANCE_COUNT=ROUND(rand()*1000)

select  ROUND(ra  nd()*1000) as jj

sum
--1��2���е���Ϊ�����е�ֵ
--update tmr.tmrhisdata.Busbar_Imbalance_Rate set BUSBAR_COUNT=(BALANCE_COUNT+IMBALACE_COUNT)
select sum(BUSBAR_COUNT) from TMR.TMRHISDATA.BUSBAR_IMBALANCE_RATE 
where occur_date like '2016-08-05%' and bv_id='112871465660973072'

--��վ
select * from "TMR"."EMS"."SUBSTATION"k where subarea_id in

(select mrid from "TMR"."TMR"."SUBSYSTEM" where system_id='0')
	
--ĸ��	���ݳ�վid
select NAME from "TMR"."EMS"."BUSBARSECTION" where ST_ID  IN('113997365567815724') 

--��ʼ
--��ѹ�ȼ� bv_id 
--�õ����� id
select  * FROM tmr.ems.substation  --TMR.TMR.SUBSYSTEM WHERE  SYSTEM_ID='0'

--�õ� ��ս���� ĸ������ ĸ�ߵ����룬������� 
select   chang.NAME ,mu.name ,de.imp_energy,de.exp_energy
from tmr.ems.substation  AS chang ,tmr.ems.busbarsection as  mu,tmr.tmrhisdata.busbar_imbalance_detail as de
WHERE   mu.st_id=chang.id and mu.id=de.busbar_id and   chang.subarea_id in('113715890591105037') and de.occur_date like '2016-08-01%'
	
--ͨ������ʱ�	
select * from "TMR"."TMRHISDATA"."COMM_SUCCESS_RATE" 
where  occur_date between  '2016-09-02' and  '2016-09-15' and subsystem_id='2';
--ͨ������ʵ���ҳ��ͼ
select * from "TMR"."TMR"."CHANNEL_VIEW" where channel_type='1';
--ͨ����ϸҳsql
select s.system_id, s.system_name as area,sum(acquire_count) as collectPoints,sum(success_count) as connectSuccess,
sum(fail_count) as connectFail, (sum(success_count)/(sum(success_count)+sum(fail_count)))*100 as succRat
from TMRHISDATA.COMM_SUCCESS_RATE r left join SUBSYSTEM s on r.subsystem_id=s.SYSTEM_ID where subsystem_id in 
( select system_id from  subsystem )  
and occur_date between '2016-09-04'  and '2016-09-14'  group by s.system_name ,s.system_id  

--
select r.channel_type,m.display_value as area,sum(acquire_count) as collectPoints,sum(success_count) as connectSuccess,sum(fail_count) as connectFail, (sum(success_count)/(sum(success_count)+sum(fail_count)))*100 as succRat 
from TMRHISDATA.COMM_SUCCESS_RATE r   left join menu m on r.channel_type=m.actual_value 
where channel_type in ( select actual_value from menu where menu_name='CHANNEL_TYPE' ) and occur_date  
between '2016-09-04'  and '2016-09-14'  and m.menu_name='CHANNEL_TYPE' group by  m.display_value,r.channel_type 
--ͨ��������òɼ���
select
select mrid from "TMR"."TMR"."SUBSYSTEM" where  system_id='2';

select area.name ,station.name,meter.meter_name,reading.class1_time_tag,reading.class2_time_tag
from ems.subcontrolarea area,ems.substation station,meters meter,reading_time_tag reading,acquireds acq
where area.id=station.subarea_id and station.id=acq.parent_id and acq.acquired_id =meter.acquired_id
and meter.meter_id = reading.meter_id and area.id in (113715890591105026,113715890591105044);

--ͨ������ҳsql
select chaview.channel_id,acquired_name,chaview.channel_type,channel_name,comm_time_tag,chaview.status
from  tmr.tmr.acquireds acq,tmr.ems.substation sta,tmr.tmr.channel_view chaview,tmr.tmr.comm_flow flow
where sta.id=acq.parent_id and chaview.acquired_id=acq.acquired_id  
and flow.channel_id=chaview.channel_id  and sta.subarea_id in('113715890591105026','113715890591105044')  and occur_time like '2016-09-14%' 

--ר��ͨ������
select channel_id,comm_param_name 
from tmr.tmr.ddns ddns,tmr.tmr.comm_params pa 
where pa.comm_param_id=ddns.comm_param_id and ddns.channel_id in ('1');



--����  ʡ�ر�
--select * from "TMR"."TMR"."INTERFACE_CONFIG";
--select * from "TMR"."TMRLOG"."DATABASE_SPACE_EVENT_ALARM";

select * from "TMR"."TMR"."INTERFACE_TRANSFER";
select * from "TMR"."TMRHISDATA"."DAYDATA_TRANSFER_STATIS";



 select * from Interface_Transfer where subsystem_Id='0' and interface_Code like '%SDIS_SLAVE%'
select * from Interface_Transfer where subsystem_Id='0' and interface_Code  like  '%LINELOSS_%'
  from DaydataTransferStatis  where  id.dataType=6 and id.interfaceId in (10000022) and  id.occurTime between '2016-12-05' and '2016-12-23' order by id.subsystemId
--update  TMR.TMRHISDATA.DAYDATA_TRANSFER_STATIS  set fail_nums=ROUND(rand()*1000)

--update  TMR.TMRHISDATA.DAYDATA_TRANSFER_STATIS  set success_nums=(BALANCE_COUNT+IMBALACE_COUNT)
select * from tmrhisdata.daydata_transfer_statis where interface_Id  in(10000014) and  
 occur_Time between '2016-12-17' and '2016-12-23' and data_Type=6  order by subsystem_Id

--������ʡ�ص�interface_id
select INTERFACE_ID from TMR.TMR.INTERFACE_TRANSFER where subsystem_id='0' and interface_code='SHENGDI' 
--������ʡ�صĳɹ���ʧ�ܣ�����
select * from "TMR"."TMRHISDATA"."DAYDATA_TRANSFER_STATIS" where  occur_time like '2016-08-01%' and interface_id in (10000,10001,10002,10003)

--update   tmr.TMRHISDATA.DAYDATA_TRANSFER_STATIS set  interface_id='20000' where subsystem_id='0' and interface_id='1400000002'

select * from "TMR"."TMRHISDATA"."DAYDATA_TRANSFER_STATIS" 
where interface_id in (10000,10001,10002,10003,10004,10005,10006,10007,10008,10009) 
and occur_time like'2016-08-07%' order by subsystem_id


--35kV��������ͳ�ƣ�ʡ��������ͼ�� 
select * from "TMR"."TMRHISDATA"."DAY_LINE_LOSS_RATE";

select  *  from TMR"."TMRHISDATA"."DAY_LINE_LOSS_RATE  where
select "LOSS_ENERGY" from "TMR"."TMRHISDATA"."DAY_LINE_LOSS_RATE";

select occur_date,sum(ONGRID_ENERGY+IMP_OTHER_ENERGY+IMP_KV10_ENERGY),sum(EMP_OTHER_ENERGY+EMP_KV10_ENERGY+SALES_ENERGY ) ,sum(LOSS_ENERGY)   from  TMR.TMRHISDATA.DAY_LINE_LOSS_RATE
where occur_date between  '2016-09-19' and '2016-09-21'
group by   occur_date order by occur_date


select occur_date,sum(ONGRID_ENERGY+IMP_OTHER_ENERGY+IMP_KV10_ENERGY),sum(EMP_OTHER_ENERGY+EMP_KV10_ENERGY+SALES_ENERGY ) ,sum(LOSS_ENERGY) 
from  TMR.TMRHISDATA.DAY_LINE_LOSS_RATE where occur_date between  ? and ? group by occur_date order by occur_date


--���վĸ�߲�ƽ��ͳ�ƣ�ʡ��������ͼ��
 
 select * from "TMR"."EMS"."BASEVOLTAGE";
 select * from "TMR"."EMS"."SUBSTATION";


 select * from "TMR"."TMR"."SUBSTATION_BALANCE" where occur_time like '2016-08-03%' and  st_id in (
 select id from TMR.EMS.SUBSTATION   where   bv_id in( select   id from TMR.EMS.BASEVOLTAGE where name='10kV'));
 
 
 --�����ٻ�
 select  * from  tmr.ems.substation where   SUBAREA_ID in 
 (select id from  tmr.ems.subcontrolarea where id in (113715890591105027,113715890591105047) )
 
 select s.subarea_id, s.name,a.acquired_name,m.meter_name 
from tmr.ems.substation s,tmr.tmr.acquireds a,meters m 
where s.id=a.parent_id and a.acquired_id=m.acquired_id and s.id in(113997367279091734);
 
 select  * from   acquireds  where   parent_id in (113715890591105037);
 
 
 --һ����ӱ�
 
 
 
 select * from TMR.SYSDBA.SYSTABLES where NAME='SYSDUAL' ;
 
 
 
 --��ѯ�˵�����ҳ��
select * from "TMR"."TMR"."SYSTEM_FUNCTION" where sysfunc_name like '%����%' ; 
 
select * from "TMR"."TMR"."VIEW_DEFINE" where  view_id=8000700504;
 


select occur_time pap1_value ,,rap1_value ,prp1_value ,rrp1_value ,pap1_raw_value ,rap1_raw_value ,prp1_raw_value  ,rrp1_raw_value  from "TMR"."TMRHISDATA"."DAY_TARIFF_VIEW" where  meter_id in(20206001097,20206001096,20206001095,20206001094,20206001093,20206001092,20206001091,20206001090,20206001089)
 and occur_time between '2016-10-10' and '2016-12-22';

 
 
 
 
 
 
 
 from SystemFunc where  sysfuncId in
 (select rf.id.sysfuncId from  RoleFuncRelation rf where rf.id.roleId in 
 (select ru.id.roleId from RoleUserRelation ru where  ru.id.userId='8000400008')
 ) and parentSysfuncId='8000600401')  order by sysfuncNo
 
 
 
 
 select * from Service_Running_Status where service_Name in('dms','trans','dss','ias','web') order by service_Name
 
 
 
 
--������
select  metermveve0_.MEAS_ID as MEAS1_127_, metermveve0_.EVENT_TIME as EVENT2_127_, metermveve0_.VICE_METER_ID as VICE3_127_, metermveve0_.MAIN_PAP_VALUE as MAIN4_127_, metermveve0_.MAIN_RAP_VALUE as MAIN5_127_, 
 metermveve0_.VICE_PAP_VALUE as VICE6_127_, metermveve0_.VICE_RAP_VALUE as VICE7_127_, 
 metermveve0_.VERIFY_RATIO as VERIFY8_127_, metermveve0_.LAST_REFRESH_TIME as LAST9_127_ 
 from TMRLOG.meter_mv_event_alarm metermveve0_ where 1=1 and 
 metermveve0_.EVENT_TIME>='2016-12-01 00:00:00' and metermveve0_.EVENT_TIME<='2016-12-25 23:59:59' 
 and (metermveve0_.MEAS_ID in (select measuremen1_.MEAS_ID from measurements measuremen1_ 
 where measuremen1_.VLLE_ID in (select voltagelev2_.ID from EMS.voltagelevel voltagelev2_ where voltagelev2_.ST_ID in 
 (select substation3_.ID from EMS.substation substation3_ where substation3_.SUBAREA_ID=113715891446743052))))
 
 
 select * from EMS.substation substation3_ where substation3_.SUBAREA_ID=113715891446743052
 --�ҵ� 113997367262314501    ����.������
 
 select * from EMS.voltagelevel voltagelev2_ where voltagelev2_.ST_ID in (113997367262314501);
 
 
 
 
 select * from Menu where menu_Name='CHANNEL_TYPE' order by actual_Value
 
  select * from Menu where DISPLAY_VALUE like  '%����%' 
 
 
 
 
 
 
 select "DISPLAY_VALUE" from "TMR"."TMR"."MENU";
 
 
 

 
 INSERT INTO "TMR"."TMR"."MENU"("MENU_NAME","MENU_NO","ACTUAL_VALUE","DISPLAY_VALUE","ICON_NAME") VALUES('CHANNEL_TYPE',1,'1','����',null);
INSERT INTO "TMR"."TMR"."MENU"("MENU_NAME","MENU_NO","ACTUAL_VALUE","DISPLAY_VALUE","ICON_NAME") VALUES('CHANNEL_TYPE',2,'2','ר��',null);
INSERT INTO "TMR"."TMR"."MENU"("MENU_NAME","MENU_NO","ACTUAL_VALUE","DISPLAY_VALUE","ICON_NAME") VALUES('CHANNEL_TYPE',3,'3','����',null);

 
 select * from "TMR"."EMS"."SUBCONTROLAREA" where id=113715891446743058;
 
select * from "TMR"."EMS"."SUBCONTROLAREA" where father_id=113715891446743058


select * from "TMR"."EMS"."SUBCONTROLAREA" where  father_id is not null;
--�жϲɼ���ģ�������ж����ĸ���վ
 select * from "TMR"."EMS"."SUBSTATION"   where  id in(
select parent_id from "TMR"."TMR"."ACQUIREDS" where acquired_id like '%0000037');
 
 
 