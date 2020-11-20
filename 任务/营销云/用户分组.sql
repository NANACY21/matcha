业务权限设置 支持 按用户分组过滤


select *
from bill_base where id=1000763680;

# 该sql使用 新增/已有的tplgroup
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'iGroup','iGroup','用户分组','分组',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+1,255,1,null,null,1,0,null,null,null,null,null,0,0,null,1,null,255,null,item.iColWidth,null,item.iAlign,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Input','name',0,null,'{"placeholder":"用户所属分组"}',0,item.bVmExclude,item.tenant_id,item.multiple,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='aa_user' and item.cName='pubts' and tpl.cCode='aa_user' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='aa_user' and item.cName='group' and item.cCaption='用户分组');


select item.*
from billitem_base item
         inner join bill_base bill on item.iBillId = bill.id and item.tenant_id = bill.tenant_id
where bill.cBillNo = 'aa_user'
  and item.cName = 'iGroup'
  and item.cCaption = '用户分组';


call p_aa_updatecolumn('user', 'iGroup',
                       "ALTER TABLE `user` ADD COLUMN `iGroup` varchar(100) NULL COMMENT '用户所属分组' AFTER `mobilepreno`;",
                       'add');



select *
from user where code like '%20201117%';


insert into pb_meta_filter_item(filtersId, itemName, itemTitle, itemType, referId, referCode, refType, refReturn, compareLogic, iprecision, dataSource, descValue, isCommon, mustInput, rangeInput, multSelect, allowUpdateCompare, orLogic, defaultVal1, defaultVal2, groupName, isSys, dr, cEnumType, bEnum, bAutoflt, displayname, cFormatData, extendField, auth_level, cSelfDefineType) SELECT
item.filtersId,'iGroup','用户分组',item.itemType,item.referId,item.referCode,item.refType,item.refReturn,'eq',item.iprecision,'iGroup',item.descValue,item.isCommon,item.mustInput,item.rangeInput,item.multSelect, item.allowUpdateCompare,item.orLogic,item.defaultVal1,item.defaultVal2,item.groupName,item.isSys,item.dr,item.cEnumType,item.bEnum,item.bAutoflt,item.displayname, item.cFormatData, item.extendField, item.auth_level, item.cSelfDefineType
from pb_meta_filter_item item inner join pb_meta_filters f on item.filtersId=f.id
where item.itemTitle='姓名' and f.filterName='AA_aa_userauthlist' and not exists(select 1 from pb_meta_filter_item item inner join pb_meta_filters f on f.id=item.filtersId where item.itemName='iGroup');

# 查询结果重复 一定是条件少了 条件和连接的表没对应
insert into pb_filter_solution_common(solutionId, itemName, itemId, itemTitle, refType, isCommon, rangeInput, multSelect, compareLogic, defaultVal1, defaultVal2, orderId, saveHistory, checkRefer, pb_filter_solution_commoncol, tenant_id,defineId, itemType, refercode, cEnumType, bEnum, bAutoflt, cDataRule, bIsNull)
select common.solutionId, 'iGroup', item.id, '用户分组', common.refType, common.isCommon, common.rangeInput, common.multSelect, 'eq', common.defaultVal1, common.defaultVal2, common.orderId+6, common.saveHistory, common.checkRefer, common.pb_filter_solution_commoncol, common.tenant_id,common.defineId, common.itemType, common.refercode, common.cEnumType, common.bEnum, common.bAutoflt, common.cDataRule, common.bIsNull
from pb_filter_solution_common common inner join pb_filter_solution s on common.solutionId=s.id inner join pb_meta_filters f on f.id=s.filtersId inner join pb_meta_filter_item item on item.filtersId=f.id
where common.itemTitle='手机号' and item.itemTitle='用户分组' and f.filterName='AA_aa_userauthlist' and not exists(select common.* from pb_filter_solution_common common inner join pb_filter_solution s on s.id=common.solutionId inner join pb_meta_filters f on f.id=s.filtersId where common.itemTitle='用户分组' and f.filterName='AA_aa_userauthlist')


