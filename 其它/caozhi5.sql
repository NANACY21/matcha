# 物料属性个数
SELECT *
FROM userdef_base
WHERE tenant_id = 0
  and classId = 'productArchive';


发事件url参数
{
    "domain":"ustock",
    "billnums":[
        "pc_product",
        "aa_goodsposition"
    ]
}


select count(1) as totalCount from (
select 1 as num
from aa_warehouse T0
left join aa_warehouse_stock as T1 on T1.warehouse_id=T0.id
left join v_orgs as T2 on T2.id=T1.org_id and T2.tenant_id=2053216227266816
where (T0.isGoodsPosition=true and T0.iUsed='enable' and (T0.org_id is null) and T0.tenant_id=2053216227266816)
) t