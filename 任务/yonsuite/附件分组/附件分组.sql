-- 某附件分组的分组项
SELECT item.*
from attachmentgroup fjfz,
     attachmentgroupitem item
WHERE fjfz.tenant_id = 1513900316905728
  and fjfz.id = item.groupId
  and fjfz.id = 1552344677650688;


SELECT count(item.name)+1
from attachmentgroup fjfz,
     attachmentgroupitem item
WHERE fjfz.tenant_id = 1389339883229440
  and fjfz.id = item.groupId
  and fjfz.id = 3;


# 该租户物料档案的附件分组
select *
from attachmentgroup
where tenant_id = 1389339883229440
  and iBillType = 2;

# 注册Rule 注意清Redis缓存
select *
from billruleregister
where action = 'query'
  and billnum = 'common'
  and tenant_id = 0;


select *
from billruleregister
where ruleId = 'pc_attachmentgrouplist'
  and tenant_id = 0;
# 1513900316905728 pc_attachmentgroupitem
select *
from billruleregister
where ruleId = 'addItemRule'
  and tenant_id<>0;

# 最后一个select结果为空时->执行该sql以给所有租户注册这个Rule 注意清Redis缓存！！！！！！ 日常、测试环境都执行
INSERT INTO billruleregister (billnum, action, ruleId, iorder, tenant_id,isSystem,isAsyn)
select distinct 'pc_attachmentgroupitem', 'save', 'addItemRule',10,tenant.id ,1,0 from billruleregister
inner join tenant on tenant.id = billruleregister.tenant_id
where not exists (select * from billruleregister where billnum = 'pc_attachmentgroupitem' and action = 'save' and ruleId='addItemRule' and tenant_id <> 0);







select *
from billruleregister
where action='save' and tenant_id=0;

select *
from billruleregister;


select *
from tenant where alias='ouvcq77m';


select *
from billruleregister
where ruleId = 'addItemRule';


# 20200830
# 外键关联 插入时须保证没有这条记录
INSERT INTO billforeignkey (`type`, `entityname`, `billno`, `source`, `sourceattr`, `target`, `extra`, `extraTarget`)
VALUES (0, 'AttachmentGroup', 'pc_attachmentgroupitem', 'name', 'name', 'id', NULL, NULL);

INSERT INTO billforeignkey (`type`, `entityname`, `billno`, `source`, `sourceattr`, `target`, `extra`, `extraTarget`)
VALUES (0, 'AttachmentGroupItem', 'pc_attachmentgroupitem', 'groupId_name', 'name', 'groupId', NULL, NULL);


# INSERT INTO billforeignkey (`type`, `entityname`, `billno`, `source`, `sourceattr`, `target`, `extra`, `extraTarget`)
# select distinct 0, 'AttachmentGroup', 'pc_attachmentgroupitem', 'name', 'name', 'id', NULL, NULL from billforeignkey
# where not exists (select * from billforeignkey where type = '0' and billno = 'pc_attachmentgroupitem');



update bill_base
set cCardKey='pc_attachmentgroupitem'
where cBillNo = 'pc_attachmentgroupref';