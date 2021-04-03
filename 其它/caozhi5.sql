# 物料属性个数
SELECT *
FROM userdef_base
WHERE tenant_id = 0
  and classId = 'productArchive';


select *
from billruleregister
where tenant_id = 0
  and billnum in ('pc_product', 'common')
  and action = 'save'
order by iorder;