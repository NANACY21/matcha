# [某页面的MySQL信息]
# [tenant]1292161350684928/1838010622546176/1347014292918528
# [billno]aa_goodsproductscomparisonlist/aa_goodsproductscomparison_position
# 查询excel所有数据 注意 filterName/billno不一定相等
set @billNo = 'aa_merchant';
set @filterName = 'aa_merchant';
set @tenantId = 0;
select id into @billid from bill_base where cBillNo = @billNo and tenant_id = @tenantId;
select * from bill_base where id = @billid;
select * from billentity_base where ibillid = @billid and tenant_id = @tenantId;
select * from billtemplate_base where ibillid = @billid and tenant_id = @tenantId;
select * from billtplgroup_base where ibillid = @billid and tenant_id = @tenantId;
select * from billitem_base where ibillid = @billid;

select * from pb_meta_filters where filterName = @filterName;
select id into @filtersid from pb_meta_filters where filterName = @filterName;
select * from pb_meta_filter_item where filtersId = @filtersid;
select * from pb_filter_solution where filtersId = @filtersid and tenant_id = @tenantId;
select id into @solutionId from pb_filter_solution where filtersId = @filtersid and tenant_id = @tenantId limit 1;
select * from pb_filter_solution_common where solutionId = @solutionId and tenant_id = @tenantId;

select * from bill_toolbar where billnumber = @billNo and tenant_id = @tenantId;
select * from bill_toolbaritem where billnumber = @billNo and tenant_id = @tenantId ORDER BY `order`;
select * from bill_command where billnumber = @billNo and tenant_id = @tenantId;



