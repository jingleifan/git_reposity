-- һ���˵�						
select * from TMR.TMR.SYSTEM_FUNCTION  where PARENT_SYSFUNC_ID=0 and SYSFUNC_ID in 
(select PARENT_SYSFUNC_ID from  TMR.TMR.SYSTEM_FUNCTION where SYSFUNC_ID in 
	(select PARENT_SYSFUNC_ID from  TMR.TMR.SYSTEM_FUNCTION where VIEW_ID in
		(
		select VIEW_ID from TMR.TMR.VIEW_DEFINE
		)
	)
 )

--�����û����һ���˵�
--�����û����һ���˵�
--���ű��Ӧ��ʵ��vo
--RoleUserRelation ��ӦROLE_USER_RELE; 
--RoleFuncRelation��ӦROLE_FUNC_RELE��  
--SystemFunc  ��ӦSYSTEM_FUNCTION
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

 -- �����˵�
select * from TMR.TMR.SYSTEM_FUNCTION 
where PARENT_SYSFUNC_ID in (select SYSFUNC_ID from TMR.TMR.SYSTEM_FUNCTION where PARENT_SYSFUNC_ID=0)
and SYSFUNC_ID in (select PARENT_SYSFUNC_ID from TMR.TMR.SYSTEM_FUNCTION where VIEW_ID in (select VIEW_ID from TMR.TMR.VIEW_DEFINE)
				  )order by sysfunc_no

-- �����˵�
select  * from   TMR.TMR.SYSTEM_FUNCTION   where   view_id in (select view_id from tmr.tmr.view_define) order by sysfunc_no

--users���������
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sjgl','sjgl','ʡ������','1_0');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sjyw','sjyw','ʡ����ά','2_0');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('sdyw','sdyw','ʡ����ά','3_1');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('xayw','xayw','������ά','3_2');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('bjyw','bjyw','������ά','3_3');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('wnyw','wnyw','μ����ά','3_4');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('xyyw','xyyw','������ά','3_5');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('akyw','akyw','������ά','3_6');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('hzyw','hzyw','������ά','3_7');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('yayw','yayw','�Ӱ���ά','3_8');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('slyw','slyw','������ά','3_9');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('ylyw','ylyw','������ά','3_10');
INSERT INTO "TMR"."TMR"."USERS"("PASSWORD","USER_NAME","USER_ALIAS","CODE") 
VALUES('tcyw','tcyw','ͭ����ά','3_11');
 
 --ͼ��
 select * from "TMR"."TMR"."SYSTEM_FUNCTION" where SYSFUNC_NAME='ҳ�����';

--����
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/ico/024/Cardinal_002.png'
where SYSFUNC_NAME='ҳ�����';
--�µ�
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/one.png'
where SYSFUNC_NAME='����Դ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/shujuzidian.png'
where SYSFUNC_NAME='�����ֵ�';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/xitongcaidan.png'
where SYSFUNC_NAME='ϵͳ�˵�';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/gongsidingyi.png'
where SYSFUNC_NAME='��˾����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/bumendingyi.png'
where SYSFUNC_NAME='���Ŷ���';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/yonghudingyi.png'
where SYSFUNC_NAME='�û�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/juesedingyi.png'
where SYSFUNC_NAME='��ɫ����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/quanxiandingyi.png'
where SYSFUNC_NAME='Ȩ�޶���';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/xitonggongneng.png'
where SYSFUNC_NAME='ϵͳ����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/yemianguanli.png'
where SYSFUNC_NAME='ҳ�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jiekoupeizhi.png'
where SYSFUNC_NAME='�ӿ�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/shoudongshujudaochu.png'
where SYSFUNC_NAME='�ֶ����ݵ���';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/chaxun.png'
where SYSFUNC_NAME='�������ݲ�ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/chaxun.png'
where SYSFUNC_NAME='��������ѯ';

UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='��·ƽ�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='��վƽ�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/fenxi.png'
where SYSFUNC_NAME='��ѹ��ƽ�����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/baobiaochaxun.png'
where SYSFUNC_NAME='�����ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/zidingyibaobiaochaxun.png'
where SYSFUNC_NAME='�Զ��屨���ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijibaowenchaxun.png'
where SYSFUNC_NAME='�ɼ����Ĳ�ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijibaowenchaxun.png'
where SYSFUNC_NAME='��̨��־��ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/tongdaotongxunzhuangtai.png'
where SYSFUNC_NAME='ͨ��ͨѶ״̬';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/gaojingxinxichaxun.png'
where SYSFUNC_NAME='�澯��Ϣ��ѯ';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/dianwangmoxingguanli.png'
where SYSFUNC_NAME='����ģ�͹���';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/caijidianguanli.png'
where SYSFUNC_NAME='�ɼ������';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jiliangdianguanli.png'
where SYSFUNC_NAME='���������';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/piliangxiugai.png'
where SYSFUNC_NAME='�����޸�';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/pinghengfenxiguanli.png'
where SYSFUNC_NAME='ƽ���������';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/feilvshiduanguanli.png'
where SYSFUNC_NAME='����ʱ�ι���';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/jisuangongshiguanli.png'
where SYSFUNC_NAME='���㹫ʽ����';
UPDATE "TMR"."TMR"."SYSTEM_FUNCTION" SET  SMALL_ICON='/images/bootstrap/rizhishengmingzhouqiguanli.png'
where SYSFUNC_NAME='��־�������ڹ���';







 
 
 