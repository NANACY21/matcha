select id
from product
where name = 'testa'
  and code = 'testa';

select *
from unit;
select *
from productBarCode
WHERE tenant_id = 1869389165678848;


SELECT name FROM
product WHERE ID=1958741578944768;

# [更新数据]
update productbarcode bc inner join product p on bc.productId = p.id
set bc.unitId=p.oUnit_id
where bc.unitId is null
  and p.oUnit_id is not null
  and bc.cBarCode is not null ;





# 删除原来的!
delete from billtplgroup_base where cCode='多条码分组' and cName='多条码';
delete from billtplgroup_base where cCode='productBarCodeDiv' and cName='物料多条码';


delete from billtplgroup_base where cCode='多条码页签' and cName='多条码';
delete from billtplgroup_base where cCode='多条码页签容器' and cName='多条码页签容器';
delete from billtplgroup_base where cCode='barCodeTabPage' and cName='多条码';
delete from billtplgroup_base where cCode='barCodeTable' and cName='多条码表格';
# 有用！！
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select '多条码页签',
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
       'center',
       tpl.iCols,
       tpl.cStyle,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'pc_product'
  and tpl.cName = '商品详情' and tpl.cCode='商品详情页签'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = '多条码页签'
                   and ttt.cName = '多条码');

# 有用!
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select '多条码页签容器',
       tpl.cSubId,
       '多条码页签容器',
       tpl.iOrder + 1,
       tpl.cPrimaryKey,
       'pc.product.ProductBarCode',
       tpl.iBillId,
       entity.id,
       0,
       'productId',
       'pc_product',
       tpl.iTplId,
       tpl.cImage,
       'LineTabs',
       tpl.id,
       'top',
       null,
       null,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.iBillId = bill.id
where bill.cBillNo = 'pc_product'
  and tpl.cCode='多条码页签' and tpl.cName = '多条码' and entity.cCode='pc_productBarCode'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = '多条码页签容器'
                   and ttt.cName = '多条码页签容器');
# 有用!
insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select 'barCodeTabPage',
       tpl.cSubId,
       '多条码',
       tpl.iOrder + 1,
       tpl.cPrimaryKey,
       tpl.cDataSourceName,
       tpl.iBillId,
       tpl.iBillEntityId,
       0,
       tpl.cForeignKey,
       tpl.cParentDataSource,
       tpl.iTplId,
       tpl.cImage,
       'div',
       tpl.id,
       'top',
       null,
       null,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
         inner join billentity_base entity on entity.id = tpl.iBillEntityId
where bill.cBillNo = 'pc_product'
  and tpl.cCode='多条码页签容器' and tpl.cName = '多条码页签容器'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = 'barCodeTabPage'
                   and ttt.cName = '多条码');


insert into billtplgroup_base(cCode, cSubId, cName, iOrder, cPrimaryKey, cDataSourceName, iBillId, iBillEntityId, bMain,
                              cForeignKey, cParentDataSource, iTplId, cImage, cType, iParentId, cAlign, iCols, cStyle,
                              tenant_id, dataRule)
select 'barCodeTable',
       tpl.cSubId,
       '多条码表格',
       tpl.iOrder + 1,
       tpl.cPrimaryKey,
       tpl.cDataSourceName,
       tpl.iBillId,
       tpl.iBillEntityId,
       0,
       'productId',
       'pc_product',
       tpl.iTplId,
       tpl.cImage,
       'Table',
       tpl.id,
       'top',
       null,
       null,
       tpl.tenant_id,
       tpl.dataRule
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id
where bill.cBillNo = 'pc_product'
  and tpl.cCode = 'barCodeTabPage' and tpl.cName='多条码'
  and not exists(select 1
                 from billtplgroup_base ttt
                          inner join bill_base bb on ttt.iBillId = bb.id
                 where bb.cBillNo = 'pc_product'
                   and ttt.cCode = 'barCodeTable'
                   and ttt.cName = '多条码表格');





# 没用!
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




# 设置item元素所在div
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
set item.iBillTplGroupId=tpl.id
where item.cName='productId' and item.cCaption='物料ID' and bill.cBillNo='pc_product' and tpl.cCode='barCodeTable';
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
set item.iBillTplGroupId=tpl.id
where  item.cCaption='多条码ID' and bill.cBillNo='pc_product' and tpl.cCode='barCodeTable';
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
set item.iBillTplGroupId=tpl.id
where  item.cCaption='时间戳' and item.cDataSourceName='pc.product.ProductBarCode' and bill.cBillNo='pc_product' and tpl.cCode='barCodeTable';
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id  inner join billentity_base entity on entity.iBillId=bill.id and entity.id=item.iBillEntityId inner join billtplgroup_base tpl on tpl.iBillId=bill.id
set item.cCaption='条码',item.cShowCaption='条码',item.cControlType='Input',item.cStyle='{"placeholder":"条码"}',item.iColWidth=800,item.iBillTplGroupId=tpl.id
where item.cName='barCode' and bill.cBillNo='pc_product' and entity.cCode='pc_productBarCode' and tpl.cCode='barCodeTable';





# 条码计量单位表格 中 计量单位id
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'unitId','unitId','条码计量单位id','计量单位id',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+1,255,1,null,null,1,1,null,null,null,null,null,0,0,null,1,null,255,null,200,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'Input',null,0,null,null,0,item.bVmExclude,item.tenant_id,item.multiple,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='pc_product' and item.cName='barCode' and tpl.cCode='barCodeTable' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='pc_product' and item.cName='unitId' and item.cCaption='条码计量单位id');
# 条码计量单位表格 中 计量单位名称
# 营销云 itg 1285 rows affected
# ListRefer
insert into billitem_base(cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId, iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule, iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen, cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue, cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase, bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, bRowAuthControlled,bVmExclude,tenant_id, multiple, depends, cDefineName, makeField, cSensFieldName)
select item.cSubId,item.iBillId,'unitId.name','unitName','条码计量单位名称','条码单位',item.iBillEntityId,tpl.id,item.iTplId,item.iOrder+2,255,1,null,null,1,0,'pc_unitref',null,'{"unitId":"id","unitName":"name"}',null,null,0,0,null,1,null,255,null,200,null,1,0,1,null,1,null,null,null,1,1,1,0,0,0,null,item.cDataSourceName,NULL,null,'ListRefer','name',0,null,null,0,item.bVmExclude,item.tenant_id,0,item.depends, item.cDefineName, item.makeField, item.cSensFieldName
from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id inner join billtplgroup_base tpl on tpl.iBillId=bill.id
where bill.cBillNo='pc_product' and item.cName='barCode' and tpl.cCode='barCodeTable' and not exists(select 1 from billitem_base item inner join bill_base bill on item.iBillId=bill.id and item.tenant_id=bill.tenant_id where bill.cBillNo='pc_product' and item.cName='unitName' and item.cCaption='条码计量单位');




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



# 2个bill_toolbar
insert into bill_toolbar(billnumber, name, ismain, parent, align, subid, childrenField, cStyle,tenant_id)
select 'pc_product','pc_product_toolbar_barcode',0,'barCodeTabPage','right','PC','productBarCodes',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbar where name='pc_product_toolbar_barcode');

insert into bill_toolbar(billnumber, name, ismain, parent, align, subid, childrenField, cStyle,tenant_id)
select 'pc_product','pc_product_toolbar_table_barcode',0,'barCodeTable','right','PC','productBarCodes',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbar where name='pc_product_toolbar_table_barcode');

delete from bill_toolbar where name='pc_product_toolbar_barcode';
delete from bill_toolbar where name='pc_product_toolbar_table_barcode';


# 2个bill_toolbaritem
insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text, imgsrc, parent, parameter, `order`, subid, `system`, authcontrol, icon, tenant_id, auth_level)
select 'pc_product','pc_product_toolbar_barcode','btnAddRow_barcodeUnit','cmdAddRow_barcodeUnit',null,'button',0,'增行',null,null,null,1,'PC',1,1,'plus',bill_base.tenant_id,5
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbaritem where name='btnAddRow_barcodeUnit');

insert into bill_toolbaritem(billnumber, toolbar, name, command, authid, type, style, text, imgsrc, parent, parameter, `order`, subid, `system`, authcontrol, icon, tenant_id, auth_level)
select 'pc_product','pc_product_toolbar_table_barcode','btnDeleteRow_barcodeUnit','cmdDeleteRow_barcodeUnit',null,'button',0,'删除',null,null,null,2,'PC',1,1,null,bill_base.tenant_id,5
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_toolbaritem where name='btnDeleteRow_barcodeUnit');

# 2个bill_command
insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, authid,tenant_id) SELECT
'cmdAddRow_barcodeUnit','addRow','pc_product','pc_product_toolbar_barcode',null,null,'/bill/insertRow','GET','AA',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_command where name='cmdAddRow_barcodeUnit');

insert into bill_command(name, action, billnumber, target, ruleid, parameter, svcurl, httpmethod, subid, authid,tenant_id) SELECT
'cmdDeleteRow_barcodeUnit','deleteRow','pc_product','pc_product_toolbar_table_barcode',null,null,'/bill/deleteRow','GET','AA',null,bill_base.tenant_id
from bill_base where cBillNo='pc_product' and not exists(select 1 from bill_command where name='cmdDeleteRow_barcodeUnit');


delete from bill_toolbaritem where name='btnAddRow_barcodeUnit';
delete from bill_toolbaritem where name='btnDeleteRow_barcodeUnit';
delete from bill_command where name='cmdAddRow_barcodeUnit';
delete from bill_command where name='cmdDeleteRow_barcodeUnit';


# 商品浏览态时 隐藏多条码增删行按钮 不这么做了，麻烦 在js扩展脚本里写!
select *
from bill_status_profile
where billnumber = 'pc_product'
  and tenant_id = 0;
