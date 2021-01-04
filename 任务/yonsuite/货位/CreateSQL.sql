﻿
delete billentity_base from billentity_base inner join bill_base on billentity_base.iBillId=bill_base.id where bill_base.cBillNo='aa_goodsproductscomparison_position' ;
delete billtemplate_base from billtemplate_base inner join bill_base on billtemplate_base.iBillId=bill_base.id where bill_base.cBillNo='aa_goodsproductscomparison_position' ;
delete billtplgroup_base from billtplgroup_base inner join bill_base on billtplgroup_base.iBillId=bill_base.id where bill_base.cBillNo='aa_goodsproductscomparison_position' ;
delete billitem_base from billitem_base inner JOIN bill_base on billitem_base.iBillId=bill_base.id where bill_base.cBillNo='aa_goodsproductscomparison_position' ;
delete from pub_makebillrule_detail where makebill_id in (select makebill_id from pub_makebillrule where iBillId in (select id from bill_base where cBillNo='aa_goodsproductscomparison_position'));
delete from pub_makebillrule where iBillId in (select id from bill_base where cBillNo='aa_goodsproductscomparison_position');
delete from bill_base where cBillNo='aa_goodsproductscomparison_position';

select ifnull(max(id),0)+1 into @id4 from bill_base;
insert into bill_base(`id`,`cBillNo`,`cName`,`cCardKey`,`cSubId`,`iDefTplId`,`iDefPrnTplId`,`iOrder`,`bAllowMultiTpl`,`cDefWhere`,`isDeleted`,`bPrintLimited`,`iSystem`,`cAuthId`,`cBillType`,`cBeanId`,`cFilterId`,`bRowAuthControl`,`bColumnAuthControl`,`bRowAuthObject`,`bColumnAuthControlled`,`bRowAuthControlled`,`cPersonDataSource`,`cCarry`,`authGroupKey`,`printBoPk`,`i18ndoc`) values (@id4,'aa_goodsproductscomparison_position','货位物料对照','aa_goodsproductscomparison_position','AA',null,null,'10',0,null,0,0,1,null,'Archive',null,null,0,0,0,0,0,null,'{"belongClass_name":"name","belongClass_code":"code","belongClass":"id"}','pu_purchasecatalog',null,1);

select ifnull(max(id),0)+1 into @id9 from billentity_base;
insert into billentity_base(`id`,`iBillId`,`cCode`,`cName`,`cSubId`,`iOrder`,`isDeleted`,`cDataSourceName`,`cPrimaryKey`,`iSystem`,`bMain`,`cForeignKey`,`cParentCode`,`childrenField`,`cModelType`,`bIsNull`) values (@id9,@id4,'GoodsPosition_4','货位','AA',null,0,'aa.goodsposition.GoodsPosition','id',1,1,null,null,null,null,null);
set @id10=@id9+1;
insert into billentity_base(`id`,`iBillId`,`cCode`,`cName`,`cSubId`,`iOrder`,`isDeleted`,`cDataSourceName`,`cPrimaryKey`,`iSystem`,`bMain`,`cForeignKey`,`cParentCode`,`childrenField`,`cModelType`,`bIsNull`) values (@id10,@id4,'GoodsProductsComparison_2','货位物料对照','AA',null,0,'aa.goodsposition.GoodsProductsComparison','id',1,0,'positionId','GoodsPosition_4','goodsProductsComparisons',null,null);

select ifnull(max(id),0)+1 into @id16 from billtemplate_base;
insert into billtemplate_base(`id`,`iBillId`,`cName`,`iOrder`,`iTplMode`,`iWidth`,`isDeleted`,`cPrintSetting`,`cPageHeader`,`cPageFooter`,`cTitleHeight`,`iPrintTotal`,`iFixedCols`,`cMemo`,`cTitle`,`iGridStyle`,`cRowLayout`,`cTitleStyle`,`cTotalColor`,`cAmongColor`,`cFixedColor`,`templateType`) values (@id16,@id4,'货位维度对照',0,0,'1200',0,null,null,null,null,null,null,null,'货位物料对照',null,null,null,null,null,null,'modal');

select ifnull(max(id),0)+1 into @id22 from billtplgroup_base;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id22,@id4,@id9,@id16,'outerlayer','最外层','AA',1,'aa.goodsposition.GoodsPosition','id',0,1,1,null,null,'view',null,'top',null,null,null);
set @id23=@id22+1;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id23,@id4,@id9,@id16,'topposition','表格上方货位','AA',2,'aa.goodsposition.GoodsPosition','id',0,1,1,null,null,'div',@id22,'top',2,null,null);
set @id24=@id23+1;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id24,@id4,@id10,@id16,'comparetable_pp','表格最外层','AA',3,'aa.goodsposition.GoodsProductsComparison','id',0,1,0,null,null,'LineTabs',@id22,'bottom',null,null,null);
set @id25=@id24+1;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id25,@id4,@id10,@id16,'comparetable_p','货位物料对照表','AA',4,'aa.goodsposition.GoodsProductsComparison','id',0,1,0,null,null,'group',@id24,'top',null,null,null);
set @id26=@id25+1;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id26,@id4,@id10,@id16,'comparetable','表格','AA',5,'aa.goodsposition.GoodsProductsComparison','id',0,1,0,null,null,'Table',@id25,'top',null,null,null);
set @id27=@id26+1;
insert into billtplgroup_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`cCode`,`cName`,`cSubId`,`iOrder`,`cDataSourceName`,`cPrimaryKey`,`isDeleted`,`iSystem`,`bMain`,`cForeignKey`,`cParentDataSource`,`cType`,`iParentID`,`cAlign`,`iCols`,`cStyle`,`cImage`) values (@id27,@id4,@id9,@id16,'footertoolbar','底部按钮区','AA',6,'aa.goodsposition.GoodsPosition','id',0,1,1,null,null,'div',@id22,'bottom',null,null,null);

select ifnull(max(id),0)+1 into @id33 from billitem_base;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id33,@id4,@id9,@id16,@id23,'AA','id','positionId','货位id','货位id',1,'20',1,null,null,0,0,1,null,null,null,null,null,null,null,null,1,null,null,null,'100',null,1,null,1,null,1,null,null,null,6,1,null,null,null,null,'aa.goodsposition.GoodsPosition',null,null,'Input',null,null,0,null,null,null,0,0);
set @id34=@id33+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id34,@id4,@id9,@id16,@id23,'AA','warehouseId','warehouseId','仓库id','仓库id',2,'255',1,0,null,0,0,1,null,null,null,null,null,0,0,null,1,null,'255',null,1,null,1,0,1,null,1,null,null,null,null,1,1,0,null,0,'aa.goodsposition.GoodsPosition',null,null,'Input',null,null,0,null,null,null,0,0);
set @id35=@id34+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id35,@id4,@id9,@id16,@id23,'AA','warehouseId.name','warehouseId_name','所属仓库','所属仓库',3,'255',1,0,null,0,0,0,'aa_warehouse_stocksref',null,'{"warehouseId":"id","warehouseId_name":"name","orgId":"stocks_org"}',null,null,0,0,null,1,null,'255',null,1,null,1,0,1,null,1,null,null,null,null,1,1,0,null,0,'aa.goodsposition.GoodsPosition',null,null,'Refer',null,'name',0,null,null,null,0,0);
set @id36=@id35+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id36,@id4,@id9,@id16,@id23,'AA','name','positionId_name','货位名称','货位名称',4,'255',1,0,null,0,0,0,'aa_goodspositionref',null,'{"positionId":"id","positionId_name":"name","positionId_code":"code"}',null,null,0,0,null,1,null,'255',null,1,null,1,0,1,null,1,null,null,null,4,1,1,0,null,0,'aa.goodsposition.GoodsPosition',null,null,'Refer',null,'name',0,null,null,null,0,0);
set @id37=@id36+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id37,@id4,@id9,@id16,@id23,'AA','code','positionId_code','货位编码','货位编码',5,'255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,1,null,1,0,1,null,1,null,null,null,5,1,1,0,null,0,'aa.goodsposition.GoodsPosition',null,null,'Input',null,null,0,null,null,null,0,0);
set @id38=@id37+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id38,@id4,@id10,@id16,@id26,'AA','id','id','货位物料对照id','货位物料对照id',6,'20',1,null,null,0,1,1,null,null,null,null,null,null,null,null,0,null,null,null,'100',null,1,null,1,null,1,null,null,null,7,1,null,null,null,null,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id39=@id38+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id39,@id4,@id10,@id16,@id26,'AA','pubts','pubts','时间戳','时间戳',7,'20',1,null,null,0,1,1,null,null,null,null,null,null,null,null,0,null,null,null,'100',null,1,null,1,null,1,null,null,null,7,1,null,null,null,null,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id40=@id39+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id40,@id4,@id10,@id16,@id26,'AA','positionId','positionId','货位id','货位id',8,'255',1,0,null,0,1,1,null,null,null,null,null,0,0,null,1,null,'255',null,'100',null,1,0,1,null,1,null,null,null,9,1,1,0,0,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Refer',null,'name',0,null,null,null,0,0);
set @id41=@id40+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id41,@id4,@id10,@id16,@id26,'AA','positionId.name','positionId_name','货位名称','货位名称',9,'255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,9,1,1,0,0,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id42=@id41+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id42,@id4,@id10,@id16,@id26,'AA','positionId.code','positionId_code','货位编码','货位编码','10','255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'10',1,1,0,0,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id43=@id42+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id43,@id4,@id10,@id16,@id26,'AA','productId','productId','物料id','物料id','11','255',1,0,null,0,1,1,null,null,null,null,null,0,0,null,1,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'11',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id44=@id43+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id44,@id4,@id10,@id16,@id26,'AA','productId.code','productId_code','物料编码','物料编码','12','255',1,0,null,0,0,0,'pc_productquerytreeref',null,'{"productId":"id","productId_code":"code","productId_name":"name","manageClass_name":"manageClass_Name","mnemonicCode":"detail!mnemonicCode","unit_name":"unit_Name"}',null,null,0,0,null,1,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'12',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Refer',null,'ccode',0,null,null,null,0,0);
set @id45=@id44+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id45,@id4,@id10,@id16,@id26,'AA','productId.name','productId_name','物料名称','物料名称','13','255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'13',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id46=@id45+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id46,@id4,@id10,@id16,@id26,'AA','productId.manageClass.name','manageClass_name','物料分类','物料分类','14','255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'13',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id47=@id46+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id47,@id4,@id10,@id16,@id26,'AA','productId.unit.name','unit_name','物料主计量单位','主计量单位','15','255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'13',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id48=@id47+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id48,@id4,@id10,@id16,@id26,'AA','productId.detail.mnemonicCode','mnemonicCode','助记码','助记码','16','255',1,0,null,0,0,0,null,null,null,null,null,0,0,null,0,null,'255',null,'100',null,1,0,1,null,1,null,null,null,'13',1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id49=@id48+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id49,@id4,@id10,@id16,@id26,'AA','inPriority','inPriority','入库优先级','入库优先级','17','11',1,null,null,0,1,0,null,null,null,null,null,null,null,null,1,null,'255',null,'100',null,null,null,1,null,1,null,null,null,0,1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id50=@id49+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id50,@id4,@id10,@id16,@id26,'AA','outPriority','outPriority','出库优先级','出库优先级','18','11',1,null,null,0,1,0,null,null,null,null,null,null,null,null,1,null,'255',null,'100',null,null,null,1,null,1,null,null,null,0,1,1,0,null,0,'aa.goodsposition.GoodsProductsComparison',null,null,'Input',null,null,0,null,null,null,0,0);
set @id51=@id50+1;
insert into billitem_base(`id`,`iBillId`,`iBillEntityId`,`iTplId`,`iBillTplGroupId`,`cSubId`,`cFieldName`,`cName`,`cCaption`,`cShowCaption`,`iOrder`,`iMaxLength`,`iFieldType`,`bEnum`,`cEnumString`,`isDeleted`,`bMustSelect`,`bHidden`,`cRefType`,`cRefId`,`cRefRetID`,`cDataRule`,`iFunctionType`,`bSplit`,`bExtend`,`iNumPoint`,`bCanModify`,`cSourceType`,`iMaxShowLen`,`cMemo`,`iColWidth`,`cSumType`,`iAlign`,`bNeedSum`,`bShowIt`,`bFixed`,`bFilter`,`cDefaultValue`,`cFormatData`,`cUserId`,`iTabIndex`,`bIsNull`,`bPrintCaption`,`bJointQuery`,`bPrintUpCase`,`bSelfDefine`,`cDataSourceName`,`cOrder`,`bCheck`,`cControlType`,`cEnumType`,`refReturn`,`bShowInRowAuth`,`iRowAuthBillId`,`cStyle`,`cSelfDefineType`,`bVmExclude`,`bRowAuthDim`) values (@id51,@id4,@id9,@id16,@id23,'AA','orgId','orgId','仓库所属库存组织id','仓库所属库存组织id','19','255',1,null,null,0,1,1,null,null,null,null,null,null,null,null,1,null,'255',null,'100',null,null,null,1,null,1,null,null,null,0,1,1,0,null,0,'aa.goodsposition.GoodsPosition',null,null,'Input',null,null,0,null,null,null,2,0);







delete from bill_toolbar where billnumber='aa_goodsproductscomparison_position';
delete from bill_toolbaritem where billnumber='aa_goodsproductscomparison_position';
delete from bill_command where billnumber='aa_goodsproductscomparison_position';

select ifnull(max(id),0)+1 into @id87 from bill_toolbar;
insert into bill_toolbar(`id`,`billnumber`,`name`,`ismain`,`parent`,`align`,`subid`,`system`,`orderNum`,`childrenField`,`tplmode`,`cStyle`) values (@id87,'aa_goodsproductscomparison_position','comparetable_p_toolbar',0,'comparetable_p','right','AA',1,null,'goodsProductsComparisons',0,null);
set @id88=@id87+1;
insert into bill_toolbar(`id`,`billnumber`,`name`,`ismain`,`parent`,`align`,`subid`,`system`,`orderNum`,`childrenField`,`tplmode`,`cStyle`) values (@id88,'aa_goodsproductscomparison_position','comparetable_toolbar',0,'comparetable','top','AA',1,null,'goodsProductsComparisons',0,null);

select ifnull(max(id),0)+1 into @id94 from bill_toolbaritem;
insert into bill_toolbaritem(`id`,`billnumber`,`toolbar`,`name`,`command`,`type`,`style`,`text`,`parameter`,`imgsrc`,`parent`,`order`,`subid`,`system`,`authid`,`authcontrol`,`authname`,`bMerge`,`icon`) values (@id94,'aa_goodsproductscomparison_position','comparetable_p_toolbar','btnAddRow','cmdAddRow','button',0,'增行',null,null,null,3,'AA',1,null,0,null,null,null);
set @id95=@id94+1;
insert into bill_toolbaritem(`id`,`billnumber`,`toolbar`,`name`,`command`,`type`,`style`,`text`,`parameter`,`imgsrc`,`parent`,`order`,`subid`,`system`,`authid`,`authcontrol`,`authname`,`bMerge`,`icon`) values (@id95,'aa_goodsproductscomparison_position','comparetable_toolbar','btnDeleteRow','cmdDeleteRow','button',0,'删行',null,null,null,4,'AA',1,null,0,null,null,null);

select ifnull(max(id),0)+1 into @id101 from bill_command;
insert into bill_command(`id`,`name`,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`) values (@id101,'cmdSave','save','aa_goodsproductscomparison_position','footertoolbar',null,'/bill/save','POST','AA',1,null,null);
set @id102=@id101+1;
insert into bill_command(`id`,`name`,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`) values (@id102,'cmdAbandon','abandon','aa_goodsproductscomparison_position','footertoolbar',null,'/bill/abandon','GET','AA',1,null,null);
set @id103=@id102+1;
insert into bill_command(`id`,`name`,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`) values (@id103,'cmdAddRow','addRow','aa_goodsproductscomparison_position','comparetable_p_toolbar',null,null,'GET','AA',1,null,null);
set @id104=@id103+1;
insert into bill_command(`id`,`name`,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`) values (@id104,'cmdDeleteRow','deleteRow','aa_goodsproductscomparison_position','comparetable_toolbar',null,'/bill/batchdelete','GET','AA',1,null,null);

update bill_base set `iDefTplId`=@id16 where `id`=@id4;