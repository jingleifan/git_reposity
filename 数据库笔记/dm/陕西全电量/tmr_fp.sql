select * from "TMR"."TMRHISDATA"."STATIS_DAY_TARIFF_ENERGY";

select * from tmr.tmr.meters where meter_id in ('');
select * from "TMR"."TMRHISDATA"."DAY_TARIFF_VIEW";
--正向有功
select me.meter_id,meter_name,pt1,ct1,pt2,ct2, da.pap1_value,st.pap1_value,st.pap3_value,st.pap5_value,st.pap4_value from TMR.METERS me,TMRHISDATA.STATIS_DAY_TARIFF_ENERGY st,TMRHISDATA.DAY_TARIFF_VIEW da
where me.meter_id==st.meter_id and me.meter_id=da.meter_id and st.occur_time==da.occur_time and
st.occur_time='2017-01-01 00:00:00' and me.meter_id ='20206001256'    ;

select pap1_value from "TMR"."TMRHISDATA"."DAY_TARIFF_VIEW" where occur_time='2017-01-24' and meter_id=20206001259;

[20206001259, 1125白中主表, 110000.0, 600.0, 100.0, 5.0, 132000.0, 0, 132000.0, 0, null, null, null, null, null, null]
--正向无功
select me.meter_id,meter_name,pt1,ct1,pt2,ct2, da.prp1_value,st.prp1_value,st.pap3_value,st.pap5_value,st.pap4_value from TMR.METERS me,TMRHISDATA.STATIS_DAY_TARIFF_ENERGY st,TMRHISDATA.DAY_TARIFF_VIEW da
where me.meter_id==st.meter_id and me.meter_id=da.meter_id and st.occur_time==da.occur_time and
st.occur_time='2016-11-22' and me.meter_id ='20200000033'    ;

--反向有功
select me.meter_id,meter_name,pt1,ct1,pt2,ct2, da.rap1_value,st.rap1_value,st.pap3_value,st.pap5_value,st.pap4_value from TMR.METERS me,TMRHISDATA.STATIS_DAY_TARIFF_ENERGY st,TMRHISDATA.DAY_TARIFF_VIEW da
where me.meter_id==st.meter_id and me.meter_id=da.meter_id and st.occur_time==da.occur_time and
st.occur_time='2016-11-22' and me.meter_id ='20200000033'    ;
--反向无功
select me.meter_id,meter_name,pt1,ct1,pt2,ct2, da.rrp1_value,st.rrp1_value,st.pap3_value,st.pap5_value,st.pap4_value from TMR.METERS me,TMRHISDATA.STATIS_DAY_TARIFF_ENERGY st,TMRHISDATA.DAY_TARIFF_VIEW da
where me.meter_id==st.meter_id and me.meter_id=da.meter_id and st.occur_time==da.occur_time and
st.occur_time='2016-11-22' and me.meter_id ='20200000033'    ;


	


select * from tmr.Meters where  meter_Id in (20206001282,20206001281,20206001280,20206001279,20206001278,20206001277,20206001276,20206001275,20206001274,20206001273,20206001272,20206001271,20206001270,20206001269,20206001268,20206001267,20206001266,20206001265,20206001264,20206001263,20206001262,20206001261,20206001260,20206001259,20206001258,20206001257,20206001256)  and meter_Serial in (0,1,2)  order by meter_id
select * from tmrhisdata.day_tariff_view where  meter_Id in (20206001282,20206001281,20206001280,20206001279,20206001278,20206001277,20206001276,20206001275,20206001274,20206001273,20206001272,20206001271,20206001270,20206001269,20206001268,20206001267,20206001266,20206001265,20206001264,20206001263,20206001262,20206001261,20206001260,20206001259,20206001258,20206001257,20206001256)  and occur_time='2017-01-11' order by meter_id
--初冻结
select pap1_value from tmrhisdata.Day_Tariff_View where occur_Time='2017-01-01' and meter_Id  in (20206001282,20206001281,20206001280,20206001279,20206001278,20206001277,20206001276,20206001275,20206001274,20206001273,20206001272,20206001271,20206001270,20206001269,20206001268,20206001267,20206001266,20206001265,20206001264,20206001263,20206001262,20206001261,20206001260,20206001259,20206001258,20206001257,20206001256)
--总加电量
select pap1_value from tmrhisdata.Statis_Month_Tariff_Energy where occur_Time='2016-12-01' and meter_Id in(20206001282,20206001281,20206001280,20206001279,20206001278,20206001277,20206001276,20206001275,20206001274,20206001273,20206001272,20206001271,20206001270,20206001269,20206001268,20206001267,20206001266,20206001265,20206001264,20206001263,20206001262,20206001261,20206001260,20206001259,20206001258,20206001257,20206001256)



select   r.*  from Report as r, User_Report u where 
r.report_Id=u.report_Id and report_Content is not null  and r.report_Type=1 and u.user_Id=8000400008
select * from "TMR"."TMR"."USER_MODELS";
select * from   tmr.meters  where  meter_id in(select  model_id from user_models where user_id=8000400018);
	
--根据区域拿电表
select  model_id from user_models where MODEL_ID in(
select meter_id from "TMR"."TMR"."METERS" where ACQUIRED_ID in(
select ACQUIRED_ID from "TMR"."TMR"."ACQUIREDS" where  PARENT_ID in(
select id from ems.SUBSTATION where  SUBAREA_ID in(
select id from ems.SUBCONTROLAREA where  id in(  ) )))); 

select count(*)  from user_models where 



select count(*)  from TMR.TMR.USER_MODELS where user_id='' and Model_id=''


select count(*)  from tmr.meters

String mq = "from Substation where id in (select id.modelId from  UserModels  where id.userId ="
				+ newUser.getUserId() + "))";

String hql = "from Subcontrolarea where id in (select id.modelId from UserModels where id.userId="
				+ newUser.getUserId() + ")";


CREATE TABLE "USER_MODELS" AT "TMR"
(
"USER_ID" BIGINT,
"MODEL_ID" BIGINT,
"MODEL_TYPE" INTEGER,    --123 区域厂站，电表
"SELECT_TYPE" INTEGER,   -- 01  全   半
"LICENSOR_ID" BIGINT,    --  授权者id
"ACCREDIT_TIME" TIMESTAMP(6),
PRIMARY KEY("USER_ID","MODEL_ID")) ;


CREATE TABLE "USER_MODELS" AT "TMR"
(
"ID" BIGINT identity(1,1),
"USER_ID" BIGINT,
"MODEL_ID" BIGINT,
"READ_ONLY" INTEGER,
"LICENSOR_ID" BIGINT,
"ACCREDIT_TIME" TIMESTAMP(6),
 PRIMARY KEY("ID"))
 
 
 
 @SuppressWarnings("unchecked")
	private void initModel1() {
		if (FacesUtils.getFlash().get(TQB + "areaList") == null
				|| FacesUtils.getFlash().get(TQB + "acquiredList") == null
				|| FacesUtils.getFlash().get(TQB + "substationList") == null
				|| FacesUtils.getFlash().get(TQB + "metersList") == null
				|| FacesUtils.getFlash().get(TQB+"stIdMeterMap")==null
				|| FacesUtils.getFlash().get("MODEL_RELOAD") == null
				|| FacesUtils.getFlash().get("MODEL_RELOAD").equals("YES")
		) {
		long  usersId=	UsersResource.getNewUser().getUserId().longValue();
			GetTreePermission g=new GetTreePermission();
			g.getTreeRightData(usersId);
			stIdMeterMap=g.getStIdMeterMap();
			substationList=g.getSublist();
			areaList=g.getArealist();
			metersList=g.getMeterlist();
			acquiredList=g.getAcquiredlist();
			FacesUtils.getFlash().put(TQB + "areaList", areaList);
			FacesUtils.getFlash().put(TQB + "substationList", substationList);
			FacesUtils.getFlash().put(TQB+"stIdMeterMap", stIdMeterMap);
			FacesUtils.getFlash().put(TQB + "acquiredList", acquiredList);
			FacesUtils.getFlash().put(TQB + "metersList", metersList);
			FacesUtils.getFlash().put("MODEL_RELOAD", "NO");
		} else {
			areaList = (List<Subcontrolarea>) FacesUtils.getFlash().get(
					TQB + "areaList");
			substationList = FacesUtils.getFlash().get(TQB + "substationList") == null ? null
					: (List<Substation>) FacesUtils.getFlash().get(
							TQB + "substationList");
			acquiredList = FacesUtils.getFlash().get(TQB + "acquiredList") == null ? null
					: (List<Acquireds>) FacesUtils.getFlash().get(
							TQB + "acquiredList");
			metersList = FacesUtils.getFlash().get(TQB + "metersList") == null ? null
					: (List<Meters>) FacesUtils.getFlash().get(
							TQB + "metersList");
			stIdMeterMap	=(HashMap<Long, List<Meters>>) FacesUtils.getFlash().get(TQB+"stIdMeterMap");

		}
	}
 
 

 private static String TQB = "query.pulseQuery.queryBean";
 
 
 initAcquiredMeterMap();

@Bind(id = "subcontrolareaTree")
@SaveState
private TreeDataProvider3 treeData = new FrontTreeModel("陕西");




select * from view_define where view_name like '%工具%';

update  view_define set file_path='/homepage/provinceManage/mainShanDong.jsf' where view_id ='8000700533';



FacesUtils.getFlash().get(TQB + "areaList") == null
				|| FacesUtils.getFlash().get(TQB + "acquiredList") == null
				|| FacesUtils.getFlash().get(TQB + "substationList") == null
				|| FacesUtils.getFlash().get(TQB + "metersList") == null
				|| FacesUtils.getFlash().get(TQB+"stIdMeterMap")==null
				|| FacesUtils.getFlash().get("MODEL_RELOAD") == null
				|| FacesUtils.getFlash().get("MODEL_RELOAD").equals("YES")
				
				
				
				
if (node instanceof Subcontrolarea) {
				if (((Subcontrolarea) node).getFatherId() == null) {
					return "../../images/areas.gif";
				} else {
					return "../../images/area.gif";
				}
			}
			if (node instanceof Substation) {
				return "../../images/factory.gif";
			}

			if (node instanceof Meters) {
				if (((Meters) node).getMeterSerial() == 0) {
					return "../../images/meter.gif";
				} else {
					return "../../images/metervice.gif";
				}
			}
			if (node instanceof Acquireds) {
				return "../../images/meters.gif";
			}
			return null;
			
			
	CREATE USER "EMS" AT "TMR";		


select to_char(add_months(to_date('20171009','yyyy.mm.dd'),2),'yyyy.mm.dd') from dual


select to_char(sysdate,'yyyy.mm.dd'),to_char((sysdate)+31,'yyyy.mm.dd') ,last_day(sysdate) from dual;


select months_between('1993/05/01','1993/01/01') mon_between from dual;


select months_between(to_date('2000.05.20','yyyy.mm.dd'),to_date('2005.05.20','yyyy.mm.dd')) mon_betw from dual;

 select next_day('2017-03-09','mon')  from dual;
select userenv('language') from dual

--创建用户
/**
CREATE LOGIN "TMR" IDENTIFIED BY "tmr" DEFAULT DATABASE "TMR"; --用户名 密码  数据库名
CREATE USER "TMR" RELATED BY "TMR" AT "TMRTMR";--角色名 ，用户名 数据库名
SET CURRENT DATABASE TMR; --游标名（数据库名）
GRANT DBA TO TMR; --角色名
GRANT RESOURCE TO TMR;--角色名

CREATE SCHEMA TMR AT "TMRTMR" AUTHORIZATION "TMR" ;
CREATE SCHEMA EMS AT "TMRTMR" AUTHORIZATION "TMR" ;
CREATE SCHEMA TMRHISDATA AT "TMRTMR" AUTHORIZATION "TMR" ;
CREATE SCHEMA TMRLOG AT "TMRTMR" AUTHORIZATION "TMR" ;
CREATE SCHEMA ASSESS AT "TMRTMR" AUTHORIZATION "TMR" 
CREATE SCHEMA SWAP AT "TMRTMR" AUTHORIZATION "TMR" 
CREATE SCHEMA LOSS AT "TMRTMR" AUTHORIZATION "TMR" 




CREATE DATABASE TMR DATAFILE 'D:\dmdbms\data\TMR1.dbf' SIZE 560;
CREATE LOGIN "TMR" IDENTIFIED BY "tmr" DEFAULT DATABASE "TMR";
CREATE USER "EMS" AT "TMR";
CREATE USER "TMR" RELATED BY "TMR" AT "TMR";
CREATE USER "TMRHISDATA" AT "TMR";
CREATE USER "TMRLOG" AT "TMR";
CREATE USER "LOSS" AT "TMR";
SET CURRENT DATABASE TMR;
GRANT DBA TO EMS;
GRANT RESOURCE TO EMS;
GRANT DBA TO TMR;
GRANT RESOURCE TO TMR;
GRANT DBA TO TMRHISDATA;
GRANT RESOURCE TO TMRHISDATA;
GRANT DBA TO TMRLOG;
GRANT RESOURCE TO TMRLOG;
GRANT DBA TO LOSS;
GRANT RESOURCE TO LOSS;


--7


CREATE TABLESPACE TMR DATAFILE 'TMR.dbf' size 128;
CREATE TABLESPACE TMRHISDATA DATAFILE 'TMRHISDATA.dbf' size 128;
CREATE TABLESPACE TMRLOG DATAFILE 'TMRLOG.dbf' size 128;
CREATE TABLESPACE EMS DATAFILE 'EMS_TMR.dbf' size 128;
CREATE TABLESPACE LOSS DATAFILE 'LOSS.dbf' size 128;
CREATE USER TMR IDENTIFIED BY "tmr" DEFAULT TABLESPACE TMR;
CREATE USER TMRHISDATA IDENTIFIED BY "tmrhisdata" DEFAULT TABLESPACE TMRHISDATA;
CREATE USER TMRLOG IDENTIFIED BY "tmrlog" DEFAULT TABLESPACE TMRLOG;
CREATE USER EMS IDENTIFIED BY "ems" DEFAULT TABLESPACE EMS;
CREATE USER LOSS IDENTIFIED BY "loss" DEFAULT TABLESPACE LOSS;
GRANT DBA TO TMR;
GRANT DBA TO TMRHISDATA;
GRANT DBA TO TMRLOG;
GRANT DBA TO EMS;
GRANT DBA TO LOSS;








*/
SYSDICT_BASICPROPERTY  域名表

select * from "TMR"."TMR"."SYSDICT_BASICPROPERTY";

select * from "TMR"."TMRHISDATA"."DAYDATA_TRANSFER_STATIS" where occur_time >'2017-03-01' and occur_time<'2017-03-09' and data_type=2 and interface_id in
(select interface_id from Interface_Transfer where subsystem_Id='7' and interface_Code like '%SDIS_SLAVE%');

--主标题
select * from  system_param where "PARAM_NAME" = 'SYSTEM_TITLE';

UPDATE "TMR"."TMR"."SYSTEM_PARAM" SET PARAM_VALUE ='山东省电力公司并网电厂全电量采集系统'  
where  "PARAM_NAME" = 'SYSTEM_TITLE';

---------------小标题
select * from "TMR"."TMR"."MENU" where menu_name='SYSTEM_INFORMATION' and menu_no=0 and actual_value='0' ;

insert into   "TMR"."TMR"."MENU" (display_value,menu_name,menu_no,actual_value) values('电量采集系统','SYSTEM_INFORMATION',0,0) ;


update "TMR"."TMR"."MENU" set display_value='电量采集系统' where menu_name='SYSTEM_INFORMATION' and menu_no=0 and actual_value='0'

--采集成功率弹出页


select station.name,meter.meter_name,reading.class2_time_tag,reading.class6_time_tag
 from tmr.ems.subcontrolarea area,tmr.ems.substation station,tmr.tmr.meters meter,tmr.tmr.reading_time_tag reading,
 tmr.tmr.acquireds acq,TMRHISDATA.ACQUIRE_FAIL_METER  ac , measurements  , device_view 
 where area.id=station.subarea_id and station.id=acq.parent_id and acq.acquired_id =meter.acquired_id 
 and meter.meter_id = reading.meter_id and area.id in (209000002)  
 and ac.meter_id=meter.meter_id and ac.occur_date='2017-03-16' and ac.status='3'
 and measurements.meas_id = meter.meas_id and measurements.dev_id = device_view.id and device_view.bv_id = 200000003
 
 
 
 
 
 select * from "TMR"."TMR"."SYSTEM_FUNCTION" where SYSFUNC_NAME like '%电网模型%';
select * from "TMR"."TMR"."VIEW_DEFINE" where view_id =8000700048 ;
 
 select * from "TMR"."TMR"."VIEW_DEFINE" where file_path like '%acquiredManager%'  ;
 
 --参数配置
 select  *  from  menu    where     menu_name like '%8000700507%'
select "NAME" from "EMS"."ACLINESEGMENT";

select * from "EMS"."ACLINESEGMENT"  where  NAME  like '%jingfan5%' ;

 select * from "EMS"."ACLINEEND" where name   like  '%jingfan5%' ;

select * from "EMS"."ACLINE" where  name   like  '%jingfan%' ;



-- 113152940637683768






 
 --分区网损 -- loss-type  1 分区，2分压；io_type 0输入 1输出；  

 select * from "TMR"."COMPUTE_GATEWAY_CONFIG";
select "COMPUTE_ID" from "TMR"."COMPUTE_GATEWAY_CONFIG";

 
 select g.type,COMPUTE_ID from TMR.GATEWAY_TYPE_DEFINE g,tmr.COMPUTE_GATEWAY_CONFIG  c where 
 loss_type=2  and subsystem_id=1 and g.GATEWAY_ID=c.GATEWAY_ID and  io_type=1 and bv_id='112871465660973057' order by io_type;


select "COMPUTE_ID" from "TMRHISDATA"."STATIS_DAY_COMPUTE";

 select s.occur_time, g.type ,s.value,io_type
 from TMR.GATEWAY_TYPE_DEFINE g,tmr.COMPUTE_GATEWAY_CONFIG  c ,tmrhisdata.STATIS_DAY_COMPUTE s
 where loss_type=2   and subsystem_id=1 and g.GATEWAY_ID=c.GATEWAY_ID and s.COMPUTE_ID=c.COMPUTE_ID --and io_type=0
 and   s.occur_time=  '2017-04-14' ;


 
 select s.occur_time, g.type ,s.value,io_type 
 from TMR.GATEWAY_TYPE_DEFINE g,tmr.COMPUTE_GATEWAY_CONFIG  c ,tmrhisdata.STATIS_DAY_COMPUTE s
 where loss_type=2   and g.GATEWAY_ID=c.GATEWAY_ID and s.COMPUTE_ID=c.COMPUTE_ID --,and io_type=0
 and   s.occur_time between  '2017-04-14'  and '2017-04-18'  and subsystem_id=1 and   g.bv_id='112871465660973057' order by occur_time ;


select * from ems.basevoltage  where   id='112871465660973057';



--采集工矿    断电sql
select ac.acquired_id ,ac.acquired_name ,t.task_name ,ac.acquire_interval ,m.meter_name ,me.class1_time_tag as last_time,re.class1_time_tag,re.class2_time_tag,re.class6_time_tag,re.class7_time_tag 
from  acquireds ac,acquire_tasks t,meters m ,reading_time_tag re ,meter_time_tag me  
where t.task_id=ac.task_id and m.acquired_id =ac.acquired_id  and ac.acquire_interval >0 and m.meter_id = re.meter_id and m.meter_id = me.meter_id and is_in_use=1 and me.class1_time_tag<='2017-04-20' 



---采集工况  漏点sql
 SELECT AC.ACQUIRED_ID,AC.ACQUIRED_NAME,T.TASK_NAME,AC.ACQUIRE_INTERVAL,	
 (SELECT DISPLAY_VALUE FROM MENU WHERE MENU_NAME='CUR_STATUS' AND ACTUAL_VALUE=AC.CUR_STATUS),
 	AC.LAST_ACQUIRE_TIME,ST.MISS_POINT, SV.PORT AS PORT,	H.COMPUTER_NAME AS HOSTNAME FROM	
 	(SELECT COUNT(M.METER_ID) MISS_POINT,A.ACQUIRED_ID FROM TMRLOG.LOST_DATA_EVENT_ALARM L	
 	LEFT JOIN METERS M ON L.METER_ID= M.METER_ID	LEFT JOIN ACQUIREDS A ON M.ACQUIRED_ID=A.ACQUIRED_ID
 		WHERE L.OCCUR_TIME>=:startDate and  L.OCCUR_TIME<:endDate	GROUP BY A.ACQUIRED_ID	
 		HAVING COUNT(M.METER_ID)>=1) ST,ACQUIREDS AC	LEFT JOIN  ACQUIRE_TASKS T ON T.TASK_ID=AC.TASK_ID	
 		LEFT JOIN SERVICE_RUNNING_STATUS SV ON SV.SERVICE_ID=AC.SERVICE_ID	LEFT JOIN HOSTS H ON H.COMPUTER_ID=SV.COMPUTER_ID	
 WHERE ST.ACQUIRED_ID=AC.ACQUIRED_ID AND ac.acquire_Interval>0


from TMRHISDATA.day_tariff_view daytariffv0_ 
 where daytariffv0_.METER_ID=20200000280 and daytariffv0_.OCCUR_TIME>'2017-04-01 00:00:00' 
 and daytariffv0_.OCCUR_TIME<='2017-04-24 00:00:00' and 
 (daytariffv0_.PAP1_RAW_VALUE is not null 
 or daytariffv0_.RAP1_RAW_VALUE is not null 
 or daytariffv0_.PRP1_RAW_VALUE is not null 
 or daytariffv0_.RRP1_RAW_VALUE is not null);

 select * from tmrhisdata.day_tariff_view where exists(select meter_id from tmrhisdata.day_tariff_view where METER_ID = 20200000280)
 and OCCUR_TIME>'2017-04-18 00:00:00' 
 and OCCUR_TIME<='2017-04-24 00:00:00'

select * from  TMR.GATEWAY_TYPE_DEFINE g

select g.type,COMPUTE_ID 
from TMR.GATEWAY_TYPE_DEFINE g,tmr.COMPUTE_GATEWAY_CONFIG c 
where loss_type=1 and subsystem_id=1 and g.GATEWAY_ID=c.GATEWAY_ID and io_type=0   order by io_type
 
 
 select g.type,COMPUTE_ID 
 from TMR.GATEWAY_TYPE_DEFINE g,tmr.COMPUTE_GATEWAY_CONFIG c 
 where loss_type=2 and subsystem_id=1 and g.GATEWAY_ID=c.GATEWAY_ID and io_type=1 and bv_id=112871465660973057 order by io_type
 
 
 select * from "TMR"."EMS"."POWERTRANSFORMER";
 
 select * from "TMR"."SYSTEM_FUNCTION" where parent_sysfunc_id=0;

select * from  tmr.system_function where  sysfunc_id =8000700032  ;
 select * from tmr.system_function where sysfunc_name like  '%线路平衡%';

select  *  from  tmr.view_define  where   view_id=8000700022  ;
select * from  tmr.view_define where  file_path like '%/action/gateway/gatewayStatyDayCompute%'

select  *  from  tmr.view_define  where  view_name like '%山东%'  ;

select * from "TMR"."EMS"."ACLINESEGMENT";
select *from ems.substation a where   exists(select * from ems.aclinesegment where id=116530642203705514 and
 a.id=ist_id) 
 
 
 
:[{ name:'0kV',type:'bar', stack: 'sum',itemStyle: 
{ normal:
 {color: '#20B2AA',barBorderColor: '#20B2AA ',barBorderWidth: 6, barBorderRadius:0,label :
{show: false,position: 'insideTop', textStyle: 
{ color: '#000000' }}}]
 
 
 