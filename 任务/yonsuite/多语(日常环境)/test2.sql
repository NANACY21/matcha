select entity.* from  bill_base base
inner join billentity_base entity on entity.iBillId = base.id and entity.tenant_id = base.tenant_id
where base.cBillNo = 'pc_attachmentgrouplist' and base.tenant_id = 0;


select *
from billentity_base
where id = 3411232;


select tpl.*
from bill_base base
         inner join billtplgroup_base tpl on tpl.iBillId = base.id and tpl.tenant_id = base.tenant_id
where base.cBillNo = 'pc_attachmentgrouplist'
  and base.tenant_id = 0
order by tpl.iParentID;


select tpl.*
from bill_base base
         inner join billtplgroup_base tpl on tpl.iBillId = base.id and tpl.tenant_id = base.tenant_id
where base.cBillNo = 'pc_productlist'
  and base.tenant_id = 0
order by tpl.iParentID;


select item.*
from bill_base base
         inner join billitem_base item on item.iBillId = base.id and item.tenant_id = base.tenant_id
         inner join billentity_base entity
                    on entity.iBillId = base.id and entity.tenant_id = base.tenant_id and entity.id = item.iBillEntityId
where base.cBillNo = 'pc_productlist'
  and base.tenant_id = 0
  and entity.cCode = 'pc_taxRevenueclass_tree';


select T0.id          as `id`,
       T0.pubts       as `pubts`,
       T0.code        as `code`,
       T0.name        as `name`,
       T0.iBillType   as `billType`,
       T0.description as `description`
from attachmentGroup T0
where (T0.iBillType = 1 and T0.tenant_id = 1389339883229440);


-- 附件分组参照
select *
from pub_ref
where code = 'pc_attachmentgroupref';


select *
from billitem_base item
         LEFT JOIN bill_base base on item.iBillId = base.id
where base.cBillNo = 'pc_attachmentgroupref'
  and base.tenant_id = 0;



select *
from attachmentGroup T0
where (T0.iBillType = 1
    and T0.iBillType = 1
# and (T0.stop_time is null or T0.stop_time >= '2020-01-09 11:16:13')
    and T0.tenant_id = 1389339883229440);



update attachmentGroup
set `iBillType`=1,
    `code`='001',
    `name`='附件分组1',
    `stopstatus`= true,
    `modifier`='DL',
    `modifierId`=1389339883327744,
    `modify_time`='2020-01-09 11:21:53',
    `modify_date`='2020-01-09 11:21:53',
    `tenant_id`=1389339883229440
where id = 3
  and tenant_id = 1389339883229440;
