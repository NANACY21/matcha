select * from bill_toolbaritem where billnumber = 'pc_attachmentgrouplist' and tenant_id = 1389339883229440;
select * from bill_command where billnumber = 'pc_attachmentgrouplist' and tenant_id = 1389339883229440;

select *
from billitem_base a
         left join bill_base b on a.ibillid = b.id
where b.cbillno = 'pc_unit'
  and b.tenant_id = 0;


