--//2017-02-23 用户报表权限管理
CREATE TABLE "USER_REPORT" AT "TMR"
(
"ID" BIGINT IDENTITY(1, 1),
"USER_ID" BIGINT,
"REPORT_ID" BIGINT,
"READ_ONLY" INTEGER,
"LICENSOR_ID" BIGINT,
"ACCREDIT_TIME" TIMESTAMP(6),
PRIMARY KEY("ID")) STORAGE( INITIAL 1 , NEXT 1 , MINEXTENTS 1 , on "PRIMARY", FILLFACTOR 0 ) ;

select * from "TMR"."TMR"."SUBSYSTEM" where system_id =0; 

select id from ems.subcontrolarea where id in(select mrid from "TMR"."TMR"."SUBSYSTEM" where system_id =0);

select * from "TMR"."TMRHISDATA"."ACQUIRE_SUCCESS_RATE" where subsystem_id=0;

select * from ems.substation where subarea_id in (select id from ems.subcontrolarea where id in(select mrid from "TMR"."TMR"."SUBSYSTEM" where system_id =0));


select area.name name1 ,meter.meter_name,--station.name name2,
reading.class2_time_tag,reading.class6_time_tag from 
tmr.ems.subcontrolarea area,--tmr.ems.substation station,
tmr.tmr.meters meter,tmr.tmr.reading_time_tag reading,tmr.tmr.acquireds acq,
TMRHISDATA.ACQUIRE_FAIL_METER  ac where --area.id=station.subarea_id and station.id=acq.parent_id and 
acq.acquired_id =meter.acquired_id and meter.meter_id = reading.meter_id 
and area.id in (113715890591105037) and ac.meter_id=meter.meter_id and ac.occur_date='2016-12-28' 
and ac.status='3';

select "SUBSYSTEM_ID" from "TMR"."TMRHISDATA"."ACQUIRE_SUCCESS_RATE";



select * from (select sum(meter_count) total,sum(success_count) success 
from TMR.TMRHISDATA.ACQUIRE_SUCCESS_RATE 
where  subsystem_id>0   and occur_date='2017-03-20') t