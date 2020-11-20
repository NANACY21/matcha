# 当前登录用户的租户id
select tenant_id
from bill_base
where id = 1008145567;

# 当前登录用户的租户id
select id
from tenant
where alias = 'xijttlrl';

# 查询excel所有数据
set @billNo = 'pc_attachmentgrouplist';
set @filterName = 'pc_attachmentgrouplist';
set @tenant = 1389339883229440;
select * from bill_base where cBillNo = @billNo and tenant_id = @tenant;
set @id1 = (select id from bill_base where cBillNo = @billNo and tenant_id = @tenant);
select * from billentity_base where iBillId = @id1 and tenant_id = @tenant;
select * from billtemplate_base where iBillId = @id1 and tenant_id = @tenant;
select * from billtplgroup_base where iBillId = @id1 and tenant_id = @tenant;
select * from billitem_base where iBillId = @id1 and tenant_id = @tenant and iBillTplGroupId in
(select id from billtplgroup_base where iBillId = @id1 and tenant_id = @tenant);
select * from pb_meta_filters where filterName = @filterName;
set @id5 = (select id from pb_meta_filters where filterName = @filterName);
select * from pb_meta_filter_item where filtersId in
(select id from pb_meta_filters where filterName = @filterName);
select * from pb_filter_solution where filtersId = @id5 and tenant_id = @tenant;
select * from pb_filter_solution_common where tenant_id = @tenant and solutionId in
(select id from pb_filter_solution where filtersId = @id5 and tenant_id = @tenant);
select * from bill_toolbar where tenant_id = @tenant and billnumber = @billNo;
select * from bill_toolbaritem where  tenant_id = @tenant and billnumber = @billNo;
select * from bill_command where tenant_id = @tenant and billnumber = @billNo;


# [解释]
一个环境 一个billnum
0租户/非0租户
excel->sql脚本 执行 为0租户的
非0租户 给定billnum再执行
# [billitem_base]
# 表格中 列宽200
# [bill_command]
# action 为list 时 authid为 服务编码