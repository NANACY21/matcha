-- billentity_base.cCode查询
select billentity_base.*
from billentity_base
         INNER JOIN bill_base on billentity_base.iBillId = bill_base.id
    and billentity_base.tenant_id = bill_base.tenant_id
where bill_base.tenant_id = 0
  and bill_base.cBillNo = 'aa_cuslevel';


-- 查询不同
select item.*
from billitem_base item -- 如果不存在再新增
         inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
         inner join billentity_base entity on entity.id = item.iBillEntityId
         inner join billtemplate_base tpl on tpl.id = item.iTplId
         inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where (bill.cBillNo = 'pc_productlist' and bill.tenant_id = 0
    and item.cName = 'lookat')
   or (bill.cBillNo = 'pc_attachmentgrouplist' and bill.tenant_id = 0
    and item.cName = 'lookat1');


select bi.*
from billtplgroup_base tplgroup
         inner join bill_base bill on bill.id = tplgroup.iBillId and bill.tenant_id = tplgroup.tenant_id
         inner join billentity_base entity on entity.id = tplgroup.iBillEntityId
         inner join billtemplate_base tpl on tpl.id = tplgroup.iTplId
         inner JOIN billitem_base bi on bi.iTplId = tpl.id
where bill.cBillNo = 'pc_attachmentgroupitem' -- and entity.cCode = 'pc_attachmentgrouplist' -- and tplgroup.cCode ='comparediv'
  and bill.tenant_id = 1389339883229440;


SELECT *
FROM bill_toolbaritem
WHERE billnumber = 'pc_attachmentgrouplist'
  and tenant_id = 1379803449774336;

SELECT *
from user
WHERE code = 'fiuser';


-- 看区别
-- 前端根据mysql数据访问后端，后端响应后返回前端json
select solution.* from pb_filter_solution solution inner join pb_meta_filters filter on filter.id = solution.filtersId
where  solution.tenant_id=0 and filter.filterName in( 'pc_attachmentgrouplist','pc_productlist');


select filter.* from pb_filter_solution solution inner join pb_meta_filters filter on filter.id = solution.filtersId
where  solution.tenant_id=0 and filter.filterName in( 'pc_attachmentgrouplist','pc_productlist');


SELECT filter.* from pb_meta_filter_item filter INNER JOIN pb_filter_solution_common solution
on filter.id=solution.itemId
INNER JOIN pb_filter_solution pfs on pfs.id=solution.solutionId
WHERE solution.tenant_id=0 and pfs.solutionName in( 'pc_attachmentgrouplist','pc_productlist');


select * from pb_filter_solution_common common inner join pb_filter_solution solution on common.solutionId = solution.id and common.tenant_id = solution.tenant_id
inner join pb_meta_filters filter on filter.id = solution.filtersId
where solution.tenant_id=0 and filter.filterName in( 'pc_attachmentgrouplist','pc_productlist');


SELECT *
from pb_filter_solution_common
WHERE solutionId = 1001696370
  and tenant_id = 0;


-- 枚举问题 看区别
select item.*
from billitem_base item
         inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
         inner join billentity_base entity on entity.id = item.iBillEntityId
         inner join billtemplate_base tpl on tpl.id = item.iTplId
         inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
         right join (select item.*
                     from billitem_base item
                              inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
                              inner join billentity_base entity on entity.id = item.iBillEntityId
                              inner join billtemplate_base tpl on tpl.id = item.iTplId
                              inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
                     where bill.cBillNo = 'pc_attachmentgrouplist'
                       and item.cName = 'lookat66'
                       and bill.tenant_id = 0) a on a.tenant_id = bill.tenant_id
where bill.cBillNo = 'pc_goodsproductskuprolist'
    and item.cName = 'lookat' and bill.tenant_id = 0
   or item.cName = 'lookat66' and bill.tenant_id = 0;


select *
from bill_base
where id = 1004887501;


select *
from billentity_base
where iBillId = 1004887501;


select *
from billtplgroup_base
where iBillId = 1004887501;


select *
from billitem_base
where iBillId = 1004887501;


SELECT cForeignKey
from billtplgroup_base
WHERE cForeignKey is not null and tenant_id=0;


select isExport
from billitem_base
where tenant_id = 0;


desc billitem_base;


desc billtplgroup_base;


SELECT id, cCode, cName, cType, iParentID
from billtplgroup_base;


SELECT cDataSourceName, cParentCode
from billentity_base
WHERE bMain = 0
LIMIT 0,100;


select DISTINCT(iOrder)
FROM billtplgroup_base
WHERE cType = 'Tree';


desc billtplgroup_base;


SELECT cFieldName, cName
from billitem_base
LIMIT 200,50;


SELECT cEnumType,
       bEnum,
       bAutoflt,
       displayname,
       cformatData,
       extendField,
       auth_level,
       isMasterOrg
from pb_meta_filter_item
LIMIT 200,50;


SELECT *
from pb_filter_solution_common
LIMIT 700,100;


select *
from user
where tenant_id = 1389339883229440;


select *
from bill_base
where id = 1001048535;


select tpl.*
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id and tpl.tenant_id = bill.tenant_id
where bill.tenant_id = 1389339883229440
  and bill.cBillNo = 'pc_attachmentgrouplist';


SELECT cType, iParentID, cAlign, iCols, cStyle
from billtplgroup_base
WHERE (cStyle is not null)
  and (cStyle LIKE '%substractWidth%')
LIMIT 0,100;


-- {"rowheight":"60px"}
-- style.substractWidth
select tpl.*
from billtplgroup_base tpl
         inner join bill_base bill on tpl.iBillId = bill.id and tpl.tenant_id = bill.tenant_id
where bill.tenant_id = 1389339883229440
  and bill.cBillNo = 'pc_productlist'
  and cStyle is not null;


select *
from aa_enum
where enumtype = 'aa_boolean';


DESC USER;


ALTER TABLE `USER`
    ADD COLUMN `iCorpId` bigint(20) DEFAULT NULL;





select *
from billentity_base
where tenant_id = 0
  and queryJoin is not null;


SELECT queryJoin, cDataSourceName
from billentity_base
WHERE queryJoin is not null
  and tenant_id = 0
GROUP BY queryJoin
ORDER BY queryJoin;





desc attachmentgroupitem;





select *
from attachmentgroupitem
where tenant_id = 1389339883229440;


select *
from billforeignkey where billno='pc_attachmentgroupitem';

select *
from billforeignkey where billno='pc_producttpl';



select *
from attachmentgroupitem;




# 修改字段
update billtplgroup_base tpl
    inner join bill_base base on base.id = tpl.iBillId and base.tenant_id = tpl.tenant_id
set tpl.cStyle = NULL
where base.cBillNo = 'pc_attachmentgrouplist'
  and tpl.cCode = 'addAttachmentGroupDiv';



# 增删改按钮事件处理 无需写前端脚本了
update bill_toolbaritem set  parameter='{"billnum":"pc_attachmentgroup","type":"tree"}' where billnumber = 'pc_unitlist' and name = 'btnGroupAdd';
update bill_toolbaritem set  parameter='{"billnum":"pc_attachmentgroup","type":"tree"}' where billnumber = 'pc_unitlist' and name = 'btnGroupEdit';
update bill_toolbaritem set  parameter='{"billnum":"pc_attachmentgroup","type":"tree"}' where billnumber = 'pc_unitlist' and name = 'btnGroupDelete';

update bill_command set action = 'add', parameter='{"billnum":"pc_attachmentgroup","type":"tree"}' where billnumber = 'pc_unitlist' and name = 'cmdGroupAdd';
update bill_command set action = 'edit', parameter='{"billnum":"pc_attachmentgroup","type":"tree"}' where billnumber = 'pc_unitlist' and name = 'cmdGroupEdit';
update bill_command set action = 'batchdelete', parameter='{"billnum":"pc_attachmentgroup","type":"tree"}', svcurl='/bill/batchdelete', httpmethod = 'POST' where billnumber = 'pc_unitlist' and name = 'cmdGroupDelete';