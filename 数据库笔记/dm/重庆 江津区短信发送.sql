-- tmr. tmr.service_running_alarm  修补网损率后的数据存入的表
-- tmrhisdata.statis_day_tariff_compute  市调转发的数据存入表


--主要


--创建修补后的数据存入表
CREATE TABLE "TMR"."SERVICE_RUNNING_ALARM"
(
	"ID"		 	 bigint  			IDENTITY(1,1)	Not   NULL,
	"time"     		 TIMESTAMP(6) 		DEFAULT			NULL  NULL,
	"ACQUIRED_ID" 	 BIGINT  			DEFAULT			NULL  NULL,
	"CONTENT"        VARCHAR(256)   	DEFAULT			NULL  NULL,
	"STATUS"	 	 BIGINT             DEFAULT			NULL  NULL,
	"IS_DISPOSED"	 SMALLINT			DEFAULT			0     NULL,
	"time2"     	 TIMESTAMP(6) 		DEFAULT			NULL  NULL,
	PRIMARY KEY("ID")
)
STORAGE(INITIAL 1,NEXT 1,MINEXTENTS 1,on "PRIMARY",FILLFACTOR 0);

--发送短信的电话号码更新
update  tmr.users  set phone = '15715329276'  where  user_id=8000400007

----查询各自的的电量或网损值
--转发市调电量 compute_id =50001000210
--关口馈出电量 compute_id =50001000209
--全局攻入电量 compute_id =50001000212
--中压网损     compute_id =50001000213
select  value1 from  tmrhisdata.statis_day_tariff_compute 
where compute_id=50001000212  and  occur_time='2016-07-10';



--查询修改过后的电量信息 包括： 市调馈出电量  关口馈出电量  供入电量   网损率
select  value1 from  tmrhisdata.statis_day_tariff_compute 
where compute_id=50001000213  and  time='2016-6-10' 
order by  time2 desc;

--插入数据到 修改后的表中
insert  into  tmr.service_running_alarm(time,content)
values('2010-01-02','123');

--查询数据从 修改后的表中获取
select time,content  from tmr.service_running_alarm  
where  time<='2010-1-2' and time>='2010-1-1'
order by time2

select time,content  from tmr.service_running_alarm 
where  time  like '%2016-08-17%' order by time  desc

