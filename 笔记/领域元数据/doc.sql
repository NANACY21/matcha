# [教程/文档]
# [定位领域元数据]
# 某一个页面元素属于哪个实体的属性
# 只要是页面就一定有实体的 元数据
select *
from bill_base
where cbillno = 'pc_spepro'
  and tenant_id = 0;


select *
from billentity_base
where ibillid = 1000351205;


select *
from billitem_base
where ibillid = 1000351205
  and iBillEntityId = '944629';


select *
from billitem_base
where id = 35783877;


select *
from billentity_base
where id = 944629;


注意roleB typeA 啥意思 起的效果!对应关系! =typeA里加了roleB属性