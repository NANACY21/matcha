select *
from bill_base
where tenant_id = ?
  and cBillNo = '';
# 为所有租户的这个页面添加元素
INSERT INTO `billitem_base`(`cSubId`, `iBillId`, `cFieldName`, `cName`, `cCaption`, `cShowCaption`, `iBillEntityId`,
                            `iBillTplGroupId`, `iTplId`, `iOrder`, `iMaxLength`, `iFieldType`, `bEnum`, `cEnumString`,
                            `pubts`, `isDeleted`, `bMustSelect`, `bHidden`, `cRefType`, `cRefId`, `cRefRetId`,
                            `cDataRule`, `iFunctionType`, `bSplit`, `bExtend`, `iNumPoint`, `bCanModify`, `cSourceType`,
                            `iMaxShowLen`, `cMemo`, `iColWidth`, `cSumType`, `iAlign`, `bNeedSum`, `bShowIt`, `bFixed`,
                            `bFilter`, `cDefaultValue`, `cFormatData`, `cUserId`, `iTabIndex`, `bIsNull`,
                            `bPrintCaption`, `bJointQuery`, `bPrintUpCase`, `bSelfDefine`, `cSelfDefineType`,
                            `cDataSourceName`, `cOrder`, `bCheck`, `cControlType`, `cEnumType`, `refReturn`,
                            `bShowInRowAuth`, `iRowAuthBillId`, `cStyle`, `isMasterOrg`, `bVmExclude`, `bRowAuthDim`,
                            `sysid`, `tenant_id`, `isprint`, `multiple`, `isshoprelated`, `depends`, `iSystem`,
                            `auth_level`, `cDefineName`, `enterDirection`, `isExport`, `makeField`, `cSensFieldName`,
                            `uncopyable`)
select a.`cSubId`,
       `iBillId`,
       'isEnabled',
       'isEnabled',
       '启用状态',
       '启用状态',
       `iBillEntityId`,
       `iBillTplGroupId`,
       `iTplId`,
       a.`iOrder`,
       `iMaxLength`,
       `iFieldType`,
       `bEnum`,
       `cEnumString`,
       now(),
       a.`isDeleted`,
       `bMustSelect`,
       `bHidden`,
       `cRefType`,
       `cRefId`,
       `cRefRetId`,
       `cDataRule`,
       `iFunctionType`,
       `bSplit`,
       `bExtend`,
       `iNumPoint`,
       `bCanModify`,
       `cSourceType`,
       `iMaxShowLen`,
       `cMemo`,
       `iColWidth`,
       `cSumType`,
       `iAlign`,
       `bNeedSum`,
       `bShowIt`,
       `bFixed`,
       `bFilter`,
       `cDefaultValue`,
       `cFormatData`,
       `cUserId`,
       `iTabIndex`,
       `bIsNull`,
       `bPrintCaption`,
       `bJointQuery`,
       `bPrintUpCase`,
       `bSelfDefine`,
       `cSelfDefineType`,
       `cDataSourceName`,
       `cOrder`,
       `bCheck`,
       `cControlType`,
       `cEnumType`,
       `refReturn`,
       `bShowInRowAuth`,
       `iRowAuthBillId`,
       `cStyle`,
       `isMasterOrg`,
       `bVmExclude`,
       `bRowAuthDim`,
       a.`sysid`,
       a.`tenant_id`,
       `isprint`,
       `multiple`,
       `isshoprelated`,
       `depends`,
       a.`iSystem`,
       `auth_level`,
       `cDefineName`,
       `enterDirection`,
       `isExport`,
       `makeField`,
       `cSensFieldName`,
       `uncopyable`
from billitem_base a
         left join bill_base b on a.ibillid = b.id and a.tenant_id = b.tenant_id
where a.cname = 'name'
  and b.cbillno = 'pc_spepro'
  and not EXISTS(select 1
                 from billitem_base a
                          left join bill_base b on a.ibillid = b.id and a.tenant_id = b.tenant_id  inner join billentity_base entity on entity.iBillId=b.id and a.iBillEntityId=entity.id
                 where a.cname = 'isEnabled'
                   and b.cbillno = 'pc_spepro' and entity.cCode='pc_speproSub');

# 再update一下组件元素类型 cControlType
# 给所有租户的pc_spepro页面的isEnabled元素修改cControlType
update billitem_base a inner join bill_base b on a.iBillId = b.id and a.tenant_id=b.tenant_id  inner join billentity_base entity on entity.iBillId=b.id and a.iBillEntityId=entity.id
set a.cControlType='Switch'
,a.iOrder=21
where a.cName='isEnabled' and b.cBillNo='pc_spepro' and entity.cCode='pc_speproSub';


# 规格档案 规格值启用状态默认开启！！！20200727
update billitem_base a inner join bill_base b on a.iBillId = b.id and a.tenant_id=b.tenant_id  inner join billentity_base entity on entity.iBillId=b.id and a.iBillEntityId=entity.id
set a.cDefaultValue='true'
where a.cName='isEnabled' and b.cBillNo='pc_spepro' and entity.cCode='pc_speproSub';

# 20200728
update billitem_base a inner join bill_base b on a.iBillId = b.id and a.tenant_id=b.tenant_id  inner join billentity_base entity on entity.iBillId=b.id and a.iBillEntityId=entity.id
set a.cStyle='{"examples":"上市","examples_resid":"##P_YS_PF_PC-UI_0001071184##","explains":"填写规格值的编码，必填！","explains_resid":"##P_YS_PF_PC-UI_0001064855##"}'
where a.cName='code' and b.cBillNo='pc_spepro' and entity.cCode='pc_speproSub';

update billitem_base a inner join bill_base b on a.iBillId = b.id and a.tenant_id=b.tenant_id  inner join billentity_base entity on entity.iBillId=b.id and a.iBillEntityId=entity.id
set a.cStyle='{"examples":"Y","examples_resid":"##P_YS_PF_PC-UI_0001071184##","explains":"","explains_resid":"##P_YS_PF_PC-UI_0001064855##"}'
where a.cName='isEnabled' and b.cBillNo='pc_spepro' and entity.cCode='pc_speproSub';






# SELECT a.cControlType
#                   from billitem_base a
#                            left join bill_base b on a.iBillId = b.id and a.tenant_id = b.tenant_id
#     where a.cname = 'isEnabled'
#     and b.cbillno = 'pc_spepro' and a.iBillEntityId = 944628 and a.tenant_id=0


# 需要执行 已执行过
# 该语句是否已执行 不影响提交
# https://blog.csdn.net/sweetgirl520/article/details/80249252
call p_aa_updatecolumn('userdefine', 'isEnabled',
                       "ALTER TABLE `userdefine` ADD COLUMN `isEnabled` bit NULL DEFAULT 1 COMMENT '启用状态' AFTER `ordernum`;",
                       'add');

desc userdefine;




select *
                 from billitem_base a
                          left join bill_base b on a.ibillid = b.id and a.tenant_id = b.tenant_id
                 where a.cname = 'isEnabled'
                   and b.cbillno = 'pc_spepro'

select *
from bill_base where cBillNo='pc_spepro';