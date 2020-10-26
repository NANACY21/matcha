select *
from attachmentgroup
where tenant_id = 1389339883229440
  and iBillType = 1;


select *
from billruleregister
where ruleId = 'addItemRule';


# 默认显示的分组项
select attachmentgroupitem.*
from attachmentgroup,
     attachmentgroupitem
where attachmentgroup.tenant_id = 1389339883229440
  and attachmentgroup.iBillType = 1
  and attachmentgroup.id = attachmentgroupitem.groupId;

