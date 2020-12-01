# 20201114
select id
from product
where name = 'testa'
  and code = 'testa';


select *
from productBarCode
where productId = 1839834338578688;


# 没用
delete from billtplgroup_base where cCode='barCodeUnitTable1';
delete from billtplgroup_base where cCode='barCodeUnitTable2';
delete from billtplgroup_base where cCode='barCodeUnitTable3';
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select 'barCodeUnitTable1',
       tpl.cSubId,
       '条码计量单位表格外',
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
       'group',
       tpl.iParentId,
       'center',
       null,
       '{"classname":"promotion-jewelryGroup"}',
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'pc_product'
  and tpl.cName = '物料多条码'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = 'barCodeUnitTable1'
                   and ttt.cName = '条码计量单位表格外');

# 没用
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select 'barCodeUnitTable2',
       tpl.cSubId,
       '条码计量单位表格中',
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
       tpl.id,
       'top',
       1,
       '{"classname":"padd-bottom-x"}',
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'pc_product'
  and tpl.cName = '条码计量单位表格外'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = 'barCodeUnitTable2'
                   and ttt.cName = '条码计量单位表格中');

# 有用！！
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select '多条码分组',
       tpl.cSubId,
       '多条码',
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
       'group',
       tpl.iParentId,
       tpl.cAlign,
       tpl.iCols,
       tpl.cStyle,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'pc_product'
  and tpl.cName = '基本信息' and tpl.cCode='基本信息分组'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = '多条码分组'
                   and ttt.cName = '多条码');

# 修改 多条码div cType
update billtplgroup_base tpl inner join bill_base bill on tpl.iBillId = bill.id and tpl.tenant_id = bill.tenant_id
inner join billtplgroup_base tpl2 on 1=1 and tpl2.iBillId=bill.id and tpl2.cCode='多条码分组' and tpl2.cName='多条码'
set tpl.cType='Table',
    tpl.cStyle='{"analysis":true,"classname":"pc_product_list pc_productBarCode"}',
    tpl.iCols=2,
    tpl.iParentId=tpl2.id
where tpl.cCode = 'productBarCodeDiv'
  and bill.cBillNo = 'pc_product';


update billentity_base entity inner join bill_base bill on entity.iBillId = bill.id and entity.tenant_id = bill.tenant_id
set entity.cModelType = ''
where entity.cCode = 'pc_productBarCode'
  and bill.cBillNo = 'pc_product';




update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id  inner join billentity_base entity on entity.iBillId=bill.id and entity.id=item.iBillEntityId
set item.cCaption='条码',item.cShowCaption='条码',cControlType='Input',cStyle='{"placeholder":"条码"}',iColWidth=800
where item.cName='barCode' and bill.cBillNo='pc_product' and entity.cCode='pc_productBarCode';





# 条码计量单位表格 中 计量单位id
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'unitId','unitId','条码计量单位id','计量单位id',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+1,255,1,null,null,1,1,null,null,null,null,null,0,0,null,1,null,255,null,200,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Input',null,0,null,null,0,item.bVmExclude,item.tenant_id,item.multiple,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='pc_product' and item.cName='barCode' and tpl.cCode='productBarCodeDiv' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='pc_product' and item.cName='unitId' and item.cCaption='条码计量单位id');
# 条码计量单位表格 中 计量单位名称
# 营销云 itg 1285 rows affected
# ListRefer
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'unitId.name','unitName','条码计量单位名称','条码单位',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+2,255,1,null,null,1,0,'pc_unitref',null,'{"unitId":"id","unitName":"name"}',null,null,0,0,null,1,null,255,null,200,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Refer','name',0,null,null,0,item.bVmExclude,item.tenant_id,0,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='pc_product' and item.cName='barCode' and tpl.cCode='productBarCodeDiv' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='pc_product' and item.cName='unitName' and item.cCaption='条码计量单位');




call p_aa_updatecolumn('productBarCode', 'unitId',
                       "ALTER TABLE `productBarCode` ADD COLUMN `unitId` bigint(20) NULL COMMENT '条码计量单位id' AFTER `cBarCode`;",
                       'add');




select *
from billruleregister
where tenant_id = 1347014292918528
  and billnum in ('pc_product', 'common')
  and action = 'save'
order by iorder;
delete from billitem_base where cName='unitId' and cCaption='条码计量单位id';
delete from billitem_base where cName='unitName' and cCaption='条码计量单位名称';



# 一个bill_toolbar
insert into bill_toolbar(billnumber, name, ismain, parent, align, subid, childrenField, cStyle,tenant_id)
select 'pc_product','barcodeUnit',0,'productBarCodeDiv','right','PC','productBarCodes','{"fixedwidth":150}',bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbar where name='barcodeUnit');

delete from bill_toolbar where name='barcodeUnit';


# 2个bill_toolbaritem
insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text, imgsrc, parent, parameter, `order`, subid, `system`, authcontrol, icon, tenant_id, auth_level)
select 'pc_product','barcodeUnit','btnAddRow_barcodeUnit','cmdAddRow_barcodeUnit',null,'button',0,'增行',null,null,null,1,'PC',1,1,null,bill_base.tenant_id,5
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbaritem where name='btnAddRow_barcodeUnit');

insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text, imgsrc, parent, parameter, `order`, subid, `system`, authcontrol, icon, tenant_id, auth_level)
select 'pc_product','barcodeUnit','btnDeleteRow_barcodeUnit','cmdDeleteRow_barcodeUnit',null,'button',0,'删行',null,null,null,2,'PC',1,1,null,bill_base.tenant_id,5
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbaritem where name='btnDeleteRow_barcodeUnit');

# 2个bill_command
insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, authid,tenant_id) SELECT
'cmdAddRow_barcodeUnit','addRow','pc_product','barcodeUnit',null,'{"direction":"down"}','/bill/insertRow','GET','AA',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_command where name='cmdAddRow_barcodeUnit');

insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, authid,tenant_id) SELECT
'cmdDeleteRow_barcodeUnit','deleteRow','pc_product','barcodeUnit',null,null,'/bill/deleteRow','GET','AA',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_command where name='cmdDeleteRow_barcodeUnit');


delete from bill_toolbaritem where name='btnAddRow_barcodeUnit';
delete from bill_toolbaritem where name='btnDeleteRow_barcodeUnit';
delete from bill_command where name='cmdAddRow_barcodeUnit';
delete from bill_command where name='cmdDeleteRow_barcodeUnit';