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



[维护领域元数据]
u8cdev分支
    UStock\scripts\mysql\aa_product\DDL\aa_product_view_20200710_1.sql 视图sql 维护!
u8c-pre-release分支
    aa_product_view.sql


UStock\meta-models\product.xml 视图xml 维护!
UStock\meta-models\productnew_complete.xml 真实表

执行sql->上传xml
sql:导出ddl -> 加字段 -> 粘贴到文件里 -> 提交
xml:日常 本地/元数据管理后台一致;


视图:别用create/replace 用alter也不行;


desc productextendview;
show create table productextendview;->ddl