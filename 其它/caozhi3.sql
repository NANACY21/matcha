select *
from bill_base
where tenant_id = 0
  and cBillNo = 'pc_producttpl';


# 关联品牌放在和附件分组一个tplgroup里 iorder是附件分组+1 每次update先查询确保一下
update billitem_base item inner join bill_base bill on bill.id = item.iBillId
inner join billitem_base item2 on bill.id=item2.iBillId
set item.iBillTplGroupId=item2.iBillTplGroupId ,item.iOrder=item2.iOrder+1
where item.cName = 'brand_name'
  and item2.cName='attachmentGroup_name'
and bill.cBillNo='pc_producttpl';



select *
from billitem_base item inner join bill_base bill on bill.id = item.iBillId
WHERE bill.cBillNo='pc_producttpl' AND item.cName='brand_name';


select *
from billitem_base item inner join bill_base bill on bill.id = item.iBillId
WHERE bill.cBillNo='pc_producttpl' AND item.cName='attachmentGroup_name';


alter table aa_goodsposition
    add unique index (code, tenant_id);





