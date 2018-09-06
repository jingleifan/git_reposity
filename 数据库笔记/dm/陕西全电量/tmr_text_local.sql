-- 一级菜单						
select * from TMR.TMR.SYSTEM_FUNCTION  where PARENT_SYSFUNC_ID=0 and SYSFUNC_ID in 
(select PARENT_SYSFUNC_ID from  TMR.TMR.SYSTEM_FUNCTION where SYSFUNC_ID in 
	(select PARENT_SYSFUNC_ID from  TMR.TMR.SYSTEM_FUNCTION where VIEW_ID in
		(
		select VIEW_ID from TMR.TMR.VIEW_DEFINE
		)
	)
 )

--根据用户获得一级菜单
--根据用户获得一级菜单
--三张表对应的实体vo
--RoleUserRelation 对应ROLE_USER_RELE; 
--RoleFuncRelation对应ROLE_FUNC_RELE，  
--SystemFunc  对应SYSTEM_FUNCTION
from SystemFunc sf , RoleFuncRelation rf ,RoleUserRelation ru where 
sf.sysfuncId=rf.id.sysfuncId and ru.id.roleId=rf.id.roleId  and ru.id.userId='8000400001' and sf.parentSysfuncId=0

select  * from tmr.tmr.SYSTEM_FUNCTION sf where PARENT_SYSFUNC_ID=0 and exists 
(
	select rf.sysfunc_id from  tmr.tmr.ROLE_FUNC_RELE rf  where  sf.sysfunc_id=rf.sysfunc_id and 
	 exists
	(
		select ru.role_id from  tmr.tmr.ROLE_USER_RELE as ru where ru.USER_ID='8000400008' and ru.role_id=rf.role_id  
	)
	
)
--

select "PARENT_SYSFUNC_ID" from "TMR"."TMR"."SYSTEM_FUNCTION";

select  * from SystemFunc sf where sf.parentSysfuncId=0 and sf.sysfuncId in 
(
	select rf.sysfunc_id from  tmr.tmr.ROLE_FUNC_RELE rf  where rf.role_id in
	(
		select ru.role_id from   tmr.tmr.ROLE_USER_RELE ru where  ru.user_id='8000400007'
	)
)
from SystemFunc sf where sf.parentSysfuncId=0 and sf.sysfuncId in 
(
	select rf.sysfuncId from  RoleFuncRelation  where rf.id.roleId in
	(
		select ru.id.roleId from RoleUserRelation ru where  ru.id.userId='8000400007'
	)
)
--

from SystemFunc sf where sf.parentSysfuncId=0 and sf.sysfuncId in 
(select rf.sysfuncId from  RoleFuncRelation  where rf.id.roleId in
(select ru.id.roleId from RoleUserRelation ru where  ru.id.userId='8000400007'))
select  *  from   tmr.tmr.SYSTEM_FUNCTION sf ,tmr.tmr.ROLE_FUNC_RELE rf , tmr.tmr.ROLE_USER_RELE ru
where  sf.sysfunc_id=rf.sysfunc_id and ru.role_id=rf.role_id  and ru.USER_ID='8000400026' and PARENT_SYSFUNC_ID=0;


select * from "TMR"."TMR"."SYSTEM_FUNCTION";
select * from "TMR"."TMR"."ROLE_FUNC_RELE";
select * from "TMR"."TMR"."ROLE_USER_RELE";

 -- 二级菜单
select * from TMR.TMR.SYSTEM_FUNCTION 
where PARENT_SYSFUNC_ID in (select SYSFUNC_ID from TMR.TMR.SYSTEM_FUNCTION where PARENT_SYSFUNC_ID=0)
and SYSFUNC_ID in (select PARENT_SYSFUNC_ID from TMR.TMR.SYSTEM_FUNCTION where VIEW_ID in (select VIEW_ID from TMR.TMR.VIEW_DEFINE)
				  )order by sysfunc_no

-- 三级菜单
select  * from   TMR.TMR.SYSTEM_FUNCTION   where   view_id in (select view_id from tmr.tmr.view_define) order by sysfunc_no

--users表存入数据
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sjgl','sjgl','省级管理','1_0');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sjyw','sjyw','省级运维','2_0');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sdyw','sdyw','省调运维','3_1');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('xayw','xayw','西安运维','3_2');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('bjyw','bjyw','宝鸡运维','3_3');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('wnyw','wnyw','渭南运维','3_4');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('xyyw','xyyw','咸阳运维','3_5');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('akyw','akyw','安康运维','3_6');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('hzyw','hzyw','汉中运维','3_7');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('yayw','yayw','延安运维','3_8');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('slyw','slyw','商洛运维','3_9');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('ylyw','ylyw','榆林运维','3_10');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('tcyw','tcyw','铜川运维','3_11');
 
 --图标
 select * from "TMR"."TMR"."SYSTEM_FUNCTION" where SYSFUNC_NAME='页面管理';

--备份
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/ico/024/Cardinal_002.png'
where SYSFUNC_NAME='页面管理';
--新的
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/one.png'
where SYSFUNC_NAME='数据源';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/shujuzidian.png'
where SYSFUNC_NAME='数据字典';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/xitongcaidan.png'
where SYSFUNC_NAME='系统菜单';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/gongsidingyi.png'
where SYSFUNC_NAME='公司定义';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/bumendingyi.png'
where SYSFUNC_NAME='部门定义';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/yonghudingyi.png'
where SYSFUNC_NAME='用户定义';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/juesedingyi.png'
where SYSFUNC_NAME='角色定义';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/quanxiandingyi.png'
where SYSFUNC_NAME='权限定义';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/xitonggongneng.png'
where SYSFUNC_NAME='系统功能';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/yemianguanli.png'
where SYSFUNC_NAME='页面管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jiekoupeizhi.png'
where SYSFUNC_NAME='接口配置';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/shoudongshujudaochu.png'
where SYSFUNC_NAME='手动数据导出';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/chaxun.png'
where SYSFUNC_NAME='电量数据查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/chaxun.png'
where SYSFUNC_NAME='计算量查询';

UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='线路平衡分析';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='厂站平衡分析';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='变压器平衡分析';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/baobiaochaxun.png'
where SYSFUNC_NAME='报表查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/zidingyibaobiaochaxun.png'
where SYSFUNC_NAME='自定义报表查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijibaowenchaxun.png'
where SYSFUNC_NAME='采集报文查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijibaowenchaxun.png'
where SYSFUNC_NAME='后台日志查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/tongdaotongxunzhuangtai.png'
where SYSFUNC_NAME='通道通讯状态';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/gaojingxinxichaxun.png'
where SYSFUNC_NAME='告警信息查询';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/dianwangmoxingguanli.png'
where SYSFUNC_NAME='电网模型管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijidianguanli.png'
where SYSFUNC_NAME='采集点管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jiliangdianguanli.png'
where SYSFUNC_NAME='计量点管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/piliangxiugai.png'
where SYSFUNC_NAME='批量修改';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/pinghengfenxiguanli.png'
where SYSFUNC_NAME='平衡分析管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/feilvshiduanguanli.png'
where SYSFUNC_NAME='费率时段管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jisuangongshiguanli.png'
where SYSFUNC_NAME='计算公式管理';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/rizhishengmingzhouqiguanli.png'
where SYSFUNC_NAME='日志生命周期管理';







 
 
 