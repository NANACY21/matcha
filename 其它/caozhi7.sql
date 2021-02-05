insert into bill_toolbar(`billnumber`,`name`,`ismain`,`parent`,`align`,`subid`,`system`,`orderNum`,`childrenField`,`tplmode`,`cStyle`,`tenant_id`,`templateType`,`terminalType`)
select `billnumber`,bill_toolbar.name,`ismain`,`parent`,`align`,`subid`,`system`,`orderNum`,`childrenField`,`tplmode`,`cStyle`,tenant.id,templateType,terminalType
from bill_toolbar
left join tenant on 1=1 and tenant.id<>0  and isOpen = 1
where billnumber='aa_goodsposition' and tenant_id=0;

insert into bill_toolbaritem(`sysid`,`billnumber`,`toolbar`,`name`,`command`,`type`,`style`,`text`,`parameter`,`imgsrc`,`parent`,`order`,`subid`,`system`,`authid`,`authcontrol`,`authname`,`bMerge`,`icon`,`tenant_id`)
select bill_toolbaritem.id,`billnumber`,`toolbar`,bill_toolbaritem.name,`command`,`type`,`style`,`text`,`parameter`,`imgsrc`,`parent`,`order`,`subid`,`system`,`authid`,`authcontrol`,`authname`,`bMerge`,`icon`,tenant.id
from bill_toolbaritem
left join tenant on 1=1 and tenant.id<>0 and isOpen = 1
where billnumber='aa_goodsposition' and tenant_id=0;

insert into bill_command(`name`,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`,`tenant_id`)
select bill_command.name,`action`,`billnumber`,`target`,`ruleid`,`svcurl`,`httpmethod`,`subid`,`system`,`parameter`,`authid`,tenant.id
from bill_command
left join tenant on 1=1 and tenant.id<>0 and isOpen = 1
where billnumber='aa_goodsposition' and tenant_id=0;

##处理报表查询分组方案 非报表不需要处理
##delete rpt_groupitem from rpt_groupitem inner join rpt_groupschema on rpt_groupitem.mainid=rpt_groupschema.id where rpt_groupschema.billnum=@billno and rpt_groupschema.tenant_id<>0;
##delete from rpt_groupschema where  billnum=@billno and tenant_id<>0;

##insert into rpt_groupschema(`billnum`,`name`,`isDefault`,`isCrossTable`,`tenant_id`,sysid,displayStyle,pageLayout,chartConfig, isDisplayZero,`type`,isPc,isMobile)
##select `billnum`,rpt_groupschema.name,`isDefault`,`isCrossTable`,tenant.id,rpt_groupschema.id,displayStyle,pageLayout,chartConfig, isDisplayZero,`type`,isPc,isMobile
##from rpt_groupschema
##left join tenant on 1=1 and tenant.id<>0
##where billnum=@billno and tenant_id=0;

##insert into rpt_groupitem (mainid,fieldname,groupType,columndefine,entity,showCaption)
##select rpt_groupschema.id,fieldname,groupType,columndefine,entity,showCaption
##from rpt_groupschema inner join (
##			select rpt_groupitem.id,fieldname,groupType,columndefine,entity,rpt_groupschema.billnum,rpt_groupschema.name  from rpt_groupschema
##     left join rpt_groupitem on rpt_groupschema.id=rpt_groupitem.mainid where billnum=@billno and tenant_id=0) item
##			on item.billnum=rpt_groupschema.billnum and rpt_groupschema.name=item.name
##where rpt_groupschema.tenant_id<>0 and rpt_groupschema.billnum=@billno order by item.id;



##更新bill_base的iDefTplId字段
update bill_base left join billtemplate_base on billtemplate_base.iBillId=bill_base.id and billtemplate_base.tenant_id=bill_base.tenant_id
set bill_base.iDefTplId=billtemplate_base.id
where bill_base.cBillNo='aa_goodsposition' and billtemplate_base.iTplMode=0;
##更新tplgroup的iParentId字段
update billtplgroup_base a
					inner join billtplgroup_base b on a.iParentId=b.sysid and a.tenant_id=b.tenant_id and a.iTplId=b.iTplId
set a.iParentId=b.id
where  if(ISNULL(a.iParentId),'',a.iParentId)<>'' and a.iBillId in (select id from bill_base where cBillNo='aa_goodsposition' and tenant_id<>0) and if(ISNULL(b.id),'',b.id)<>'';
##更新bill_toolbaritem 的parent字段
update bill_toolbaritem a
##select a.Parent,b.id from bill_toolbaritem a
					inner join bill_toolbaritem b on a.Parent=b.sysid and a.tenant_id=b.tenant_id and a.billnumber=b.billnumber
set a.Parent=b.id
where  if(ISNULL(a.Parent),'',a.Parent)<>'' and a.billnumber='aa_goodsposition' and a.tenant_id<>0 and if(ISNULL(b.id),'',b.id)<>'';
##更新非0租户的cFilterId、sysid为0租户的billid ##插入时处理了sysid不用在更新
##update bill_base a ,bill_base b
##set a.cFilterId=b.cFilterId,a.sysid=b.id
##where a.cBillNo = b.cBillNo And b.tenant_id = 0 And a.cBillNo = @billno;
##更新非0租户billitem_base的自定义项
Update
billitem_base
left join userdef_base on billitem_base.cSelfDefineType=userdef_base.defineId and userdef_base.tenant_id=billitem_base.tenant_id
left join userdef_type on userdef_base.type = userdef_type.deftype
set
billitem_base.cshowcaption=userdef_base.showitem, billitem_base.bHidden=0, billitem_base.bShowIt=1,
billitem_base.cControlType=(case when userdef_base.type ='String' and (userdef_base.userdef_mode='1' or userdef_base.userdef_mode='2') then 'refer' else  userdef_type.controltype end), #有问题，缺少refer类型 yangzj
billitem_base.bIsNull=(case when userdef_base.isinput=1 and userdef_base.classId not in ('productArchive','productSku') then 0  else 1 END),
billitem_base.refReturn=(case when (userdef_base.userdef_mode='1' or userdef_base.userdef_mode='2')  then 'name' else NULL END),
billitem_base.cRefType=(case when (userdef_base.userdef_mode='1' or userdef_base.userdef_mode='2') then 'pc_userdefref' else NULL END)
where iBillId in (select id from bill_base where cbillno='aa_goodsposition' and tenant_id<>0)
and billitem_base.tenant_id<>0 and bSelfDefine=1 and userdef_base.isenabled=1;

##更新非0租户pb_filter_solution_common的自定义项
Update
pb_filter_solution_common
left join userdef_base on pb_filter_solution_common.defineId=userdef_base.defineId and pb_filter_solution_common.tenant_id=userdef_base.tenant_id
left join userdef_type on userdef_base.type = userdef_type.deftype
set
pb_filter_solution_common.itemTitle=userdef_base.showitem,
pb_filter_solution_common.bHidden=0,
pb_filter_solution_common.itemType=userdef_type.controltype,
pb_filter_solution_common.refercode=(case when userdef_base.userdef_mode='1' then 'pc_userdefref' else NULL END)
where pb_filter_solution_common.solutionId in (select id from pb_filter_solution where filtersId in (select id from pb_meta_filters where filterName='aa_goodsposition'))
and pb_filter_solution_common.tenant_id<>0 and pb_filter_solution_common.defineId is not null and userdef_base.isenabled=1
;



select *
from product_management_class where tenant_id=1347014292918528;


select *
from billforeignkey where entityname='ManagementClass' and source='parent_name';




INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget)
select 1, 'ManagementClass', 'pc_managementclass', 'parent_name', 'code', 'parent', null, null
from tenant where not exists(select 1 from billforeignkey where entityname='ManagementClass' and billno='pc_managementclass' and source='parent_name' and sourceattr='code' and type=1) limit 1;

INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget)
select 0, 'ManagementClass', 'pc_managementclass', 'parent_name', 'code', 'parent', null, null
from tenant where not exists(select 1 from billforeignkey where entityname='ManagementClass' and billno='pc_managementclass' and source='parent_name' and sourceattr='code' and type=0) limit 1;



select *
from aa_warehouse;


update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.bHidden=0,item.bShowIt=1,item.bCanModify=1
where item.cName='detail!iEnableCyclePurchase' and item.cCaption='启用周期购' and bill.cBillNo='pc_productlist';

update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.bHidden=0,item.bShowIt=1,item.bCanModify=1
where item.cName='detail!iEnableCyclePurchase' and item.cCaption='启用周期购' and bill.cBillNo='pc_product';

update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.bHidden=0,item.bShowIt=1,item.bCanModify=1
where item.cName='detail!iEnableCyclePurchase' and item.cCaption='启用周期购' and bill.cBillNo='pc_productlist';

update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.bHidden=0,item.bShowIt=1,item.bCanModify=1
where item.cName='detail!iEnableCyclePurchase' and item.cCaption='启用周期购' and bill.cBillNo='pc_product';


update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id = bill.tenant_id
set item.isExport=0
where item.cName like '%headDefine%'
  and bill.cBillNo = 'aa_goodsposition';
