# 画页面 （action controller）-> 前端-> 后端 [该功能 一套得熟悉]
# 20200812
# 前端加个下拉列表 下拉列表里2项-> 每个租户 -- bill_toolbaritem增3行
insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text, `order`, subid, `system`,
                             authcontrol, bMerge, sysid, tenant_id, auth_level)
select 'aa_userauthlist',
       'ListHeader',
       'btnBatchAdd',
       'cmdBatchAdd',
       'aa_userauthlistEdit',
       'dropdownbutton',
       0,
       '批量授权',
       bb.`order` + 1,
       bb.subid,
       bb.`system`,
       bb.authcontrol,
       bb.bMerge,
       bb.sysid,
       bb.tenant_id,
       bb.auth_level
from bill_toolbaritem bb
where bb.text = '授权'
  and bb.billnumber='aa_userauthlist' and bb.toolbar='ListHeader'
and not exists(select 1 from bill_toolbaritem baritem where baritem.text='批量授权' and baritem.billnumber='aa_userauthlist');

# 把所有租户的这个页面的该按钮删了
select 1
from bill_toolbaritem
where billnumber = 'aa_userauthlist'
  and toolbar = 'ListHeader'
  and text = '授权';


delete
from bill_toolbaritem
where billnumber = 'aa_userauthlist'
  and toolbar = 'ListHeader'
  and text = '授权' ;




insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text,parent, `order`, subid, `system`,
                             authcontrol, bMerge, tenant_id, auth_level)
select 'aa_userauthlist',
       'ListHeader',
       'btnStoreAuth',
       'cmdStoreAuth',
       'aa_userauthlistEdit',
       'button',
       0,
       '门店',
       bb.id,
       10,
       bb.subid,
       bb.`system`,
       bb.authcontrol,
       bb.bMerge,
       bb.tenant_id,
       bb.auth_level
from bill_toolbaritem bb
where bb.text = '批量授权'
  and bb.billnumber='aa_userauthlist' and bb.toolbar='ListHeader'
and not exists(select 1 from bill_toolbaritem baritem where baritem.text='门店' and baritem.billnumber='aa_userauthlist');



insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text,parent, `order`, subid, `system`,
                             authcontrol, bMerge, tenant_id, auth_level)
select 'aa_userauthlist',
       'ListHeader',
       'btnWarehouseAuth',
       'cmdWarehouseAuth',
       'aa_userauthlistEdit',
       'button',
       0,
       '仓库',
       bb.id,
       20,
       bb.subid,
       bb.`system`,
       bb.authcontrol,
       bb.bMerge,
       bb.tenant_id,
       bb.auth_level
from bill_toolbaritem bb
where bb.text = '批量授权'
  and bb.billnumber='aa_userauthlist' and bb.toolbar='ListHeader'
and not exists(select 1 from bill_toolbaritem baritem where baritem.text='仓库' and baritem.billnumber='aa_userauthlist');


# 门店/仓库参照所在分组 每个租户 门店/仓库参照所在div增一行
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select 'storeAndWhRef',
       tpl.cSubId,
       '门店和仓库参照',
       tpl.iOrder + 1,
       tpl.cPrimaryKey,
       tpl.cDataSourceName,
       tpl.iBillId,
       tpl.iBillEntityId,
       tpl.bMain,
       tpl.cForeignKey,
       tpl.cParentDataSource,
       tpl.iTplId,
       tpl.cImage,
       'div',
       null,
       'center',
       tpl.iCols,
       tpl.cStyle,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'aa_userauthlist'
  and tpl.cCode = 'Table_3'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'aa_userauthlist'
                   and ttt.cCode = 'storeAndWhRef'
                   and ttt.cName = '门店和仓库参照');

# 门店 每个租户 -- 门店增1行 放到新增的tplgroup里 item所属的tplgroup被放在该tplgroup里了
# item所属分组 where里那样写 就限制（确定）了item所属的分组
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'storeRef','storeRef','门店参照','门店参照',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+1,255,1,null,null,1,0,'aa_store',null,null,null,null,0,0,null,1,null,255,null,120,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Refer','id',0,null,null,0,1,item.tenant_id,item.multiple,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='aa_userauthlist' and item.cName='pubts' and tpl.cCode='storeAndWhRef' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='aa_userauthlist' and item.cName='storeRef' and item.cCaption='门店参照');
# 仓库 每个租户 -- 仓库增1行 放到新增的tplgroup里
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'warehouseRef','warehouseRef','仓库参照','仓库参照',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+10,255,1,null,null,1,0,'aa_warehouse',null,null,null,null,0,0,null,1,null,255,null,120,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Refer','id',0,null,null,0,1,item.tenant_id, item.multiple,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='aa_userauthlist' and item.cName='pubts' and tpl.cCode='storeAndWhRef' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='aa_userauthlist' and item.cName='warehouseRef' and item.cCaption='仓库参照');

select *
from billtplgroup_base where cCode='storeAndWhRef';

# billitem_base表
# delete from billitem_base where cName='storeRef' and cCaption='门店参照';
# delete from billitem_base where cName='warehouseRef' and cCaption='仓库参照';
# bMustSelect 必收集
# bill_command表
# delete from bill_command where action='openStoreRef';
# delete from bill_command where action='openWarehouseRef';



# 还得 insert bill_command表 url写成批量设置标签一样就行 就会引到我的rule
# 门店
insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, `system`, tenant_id, authid)
select 'cmdStoreAuth','openStoreRef','aa_userauthlist',null,null,null,'/bill/batchDo','post',cmdd.subid,cmdd.`system`,cmdd.tenant_id,cmdd.authid
from bill_command cmdd where cmdd.billnumber='aa_userauthlist' and cmdd.name='cmdEdit'
and not exists(select 1 from bill_command where billnumber='aa_userauthlist' and action='openStoreRef');

# 仓库
insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, `system`, tenant_id, authid)
select 'cmdWarehouseAuth','openWarehouseRef','aa_userauthlist',null,null,null,'/bill/batchDo','post',cmdd.subid,cmdd.`system`,cmdd.tenant_id,cmdd.authid
from bill_command cmdd where cmdd.billnumber='aa_userauthlist' and cmdd.name='cmdEdit'
and not exists(select 1 from bill_command where billnumber='aa_userauthlist' and action='openWarehouseRef');

# 该action 注册rule！！！！ 门店的action！！！

# 为所有租户注册rule！
# 门店！！！
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain)
select 'aa_userauthlist',
       'openStoreRef',
       'addStoreRule',
       35,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_userauthlist' and action = 'openStoreRef' and ruleId = 'addStoreRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain)
VALUES ('aa_userauthlist', 'openStoreRef', 'addStoreRule', 35, null, 0, null, true, null,
        null, 0, null);

# 仓库的action！！！
# 为所有租户注册rule！
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain)
select 'aa_userauthlist',
       'openWarehouseRef',
       'addWarehouseRule',
       35,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_userauthlist' and action = 'openWarehouseRef' and ruleId = 'addWarehouseRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain)
VALUES ('aa_userauthlist', 'openWarehouseRef', 'addWarehouseRule', 35, null, 0, null, true, null,
        null, 0, null);


# 至此ok！！！！！！
# 点击门店：执行action：1.弹出参照窗体，2.选中值点确定后（参照中选中的值【返回值】通过js脚本传给后端） 继续执行该action的rule 至此点击门店事件结束
# rule里拿到选中的用户、选中的要添加的门店 真正添加门店在rule里做 做零售的事！！！！！！！！
# select *
# from billruleregister
# where billnum = 'aa_userauthlist'
#   and action in ('openStoreRef','common','openWarehouseRef')
#   and tenant_id = 0;

# select *
# from billruleregister
# where billnum = 'aa_userauthlist'
#   and action = 'openStoreRef'
#   and tenant_id = 1221385947746560;
# desc billruleregister;


# select cType
# from billtplgroup_base
# group by cType;

# desc billitem_base;

# 参照类型 pub_ref表 code
# getrefmeta请求头 有参照类型 （refcode）
# select *
# from pub_ref where code like '%aa_store%';


# 【上线问题】
# 编辑授权f12拿到的门店/仓库参照是基础服务的，应该拿零售的门店/仓库参照 可是 itg就好使 demo就不行？？？
# 相关代码：AA_aa_userauthlist_VM.Extend.js 新参照类型：retail.aa_store
# com.yonyoucloud.upc.controller.BizDomainController 获取参照数据 的请求
# BillController /bill/batchDo -> 调rule 保存 action结束
# 该功能执行流程：（打断点看！！！代码在哪配的） 主线就是一个action 前端后端围绕着action


# 参照卡片的ui元数据 走得零售的MySQL库 该文件的sql走基础服务的MySQL
# billitembase 俩隐藏字段 、前端代码搞出参照（参照类型） 一个作用
# 商品列表
