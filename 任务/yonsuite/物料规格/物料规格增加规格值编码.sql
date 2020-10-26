# 先熟悉熟悉，再解决问题！！！
# userdef_base userdefine
# 每个租户 - billitem_base表增一行 参考规格值名称增行

# 增加规格值编码：更新上传xml，MySQL insert 所有租户的！！！
# 规格值编码默认和规格值名称一样 可以修改 修改如下查询到的rule
select *
from billruleregister
where billnum = 'pc_speproitem'
  and action = 'save'
  and tenant_id = 0
order by iorder;



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
       a.`iBillId`,
       'code',
       'code',
       '规格值编码',
       '规格值编码',
       a.`iBillEntityId`,
       a.`iBillTplGroupId`,
       a.`iTplId`,
       a.`iOrder` + 1,
       a.`iMaxLength`,
       a.`iFieldType`,
       a.`bEnum`,
       a.`cEnumString`,
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
                          left join bill_base b on a.ibillid = b.id and a.tenant_id = b.tenant_id
                 where a.cname = 'code'
                   and b.cbillno = 'pc_spepro');


# 没用
-- 物料分类列表添加管理组织
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
       a.`iBillId`,
       'code',
       'code',
       '规格值编码',
       '规格值编码',
       a.`iBillEntityId`,
       a.`iBillTplGroupId`,
       a.`iTplId`,
       a.iOrder + 1,
       a.`iMaxLength`,
       a.`iFieldType`,
       a.`bEnum`,
       a.`cEnumString`,
       now(),
       a.`isDeleted`,
       a.`bMustSelect`,
       a.`bHidden`,
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
       1,
       `bPrintCaption`,
       `bJointQuery`,
       `bPrintUpCase`,
       `bSelfDefine`,
       `cSelfDefineType`,
       'pc.cls.ManagementClass',
       `cOrder`,
       `bCheck`,
       'Input',
       `cEnumType`,
       `refReturn`,
       `bShowInRowAuth`,
       `iRowAuthBillId`,
       a.`cStyle`,
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
         left join bill_base b on a.iBillId = b.id
where b.cbillno = 'pc_managementclasslist'
  and a.cFieldName = 'id'
  and a.cDataSourceName = 'pc.cls.ManagementClass'
  and not EXISTS(
        select *
        from billitem_base d
                 left join bill_base e on d.iBillId = e.id
        where d.cFieldName = 'orgId.name'
          and d.cDataSourceName = 'pc.cls.ManagementClass'
          and e.cbillno = 'pc_managementclasslist'
    );
# 没用

# 执行的Rule
select *
from billruleregister
where billnum = 'pc_spepro'
  and action = 'save'
  and tenant_id = 0 order by iorder;


# doc文档中 动态规格值


# 某一个前端元素
select a.*
from billitem_base a
         left join bill_base b on a.ibillid = b.id and a.tenant_id = b.tenant_id
where a.cname = 'name'
  and b.cbillno = 'pc_spepro'
  and a.tenant_id = 0;


# 不需要删除MySQL code字段
# call p_aa_updatecolumn('userdefine', 'code',
#                        "ALTER TABLE `userdefine` drop COLUMN `code`;",
#                        'ALTER');


select *
from billruleregister where billnum='aa_merchant' and action='save' and tenant_id=0;

# 物料规格 规格值编码全赋成规格值名称
# 编辑原来的规格值 原来的规格值编码赋值为规格值名称
update userdefine
set code=name
where defineId like 'free%'
  and code is null;

# ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
# 总共提交：后端Java代码 sql脚本 xml元数据！！！规格值编码/启停用状态 俩功能!!!
UserDefineItemSave.java
UserdefineEditFilter.java
D:\allproject\yonyou\u8cdev\UStock\scripts\mysql\userdef目录 sql脚本
D:\allproject\yonyou\u8cdev\UStock\meta-models\pc.userdefine.xml
发邮件(申请 上传领域元数据 xml) 预发，生产元数据升级参照这个邮件发 测试/日常直接上传xml元数据即可 而预发要发邮件申请
元数据管理后台


开发者中心:
测试 日常 预发 生产
u8c3-upc-server
u8c3-upc-web
Yonsuite-基础服务-ugoods-数据库增量更新
Yonsuite-基础服务-redis清理