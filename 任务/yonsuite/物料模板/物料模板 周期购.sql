update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.bHidden=0,item.bShowIt=1
where item.cName='enableCyclePurchase' and item.cCaption='周期购' and bill.cBillNo='pc_producttpllist';
# "<%u8c-config.option.productLine%>"=="diwork"
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id=bill.tenant_id
set item.cDataRule=''
where item.cName='enableCyclePurchase' and item.cCaption='是否启用周期购' and bill.cBillNo='pc_producttpl';