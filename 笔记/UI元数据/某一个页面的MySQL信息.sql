# bill_base表 cBillNo相同 租户不同 id不同
# 相同页面 每个租户的页面id不一样 编码cbillno一样
# 1838010622546176 aa_warehouse_stocksref 1292161350684928
# 零售 - aa_goodsproductscomparisonlist aa_goodsproductscomparison_position aa_goodsproductscomparison aa_comparisongoodstable
# 库存 - st_wareandinvlist 1838010622546176
set @billno = 'pc_customerref';
set @tenantId = 0;

select id into @billid from bill_base where cBillNo = @billno and tenant_id = @tenantId;
select * from bill_base where id = @billid;
select * from billentity_base where ibillid = @billid;
select * from billtemplate_base where ibillid = @billid;
select * from billtplgroup_base  where ibillid = @billid;
select * from billitem_base  where ibillid = @billid;

select * from pb_meta_filters where filterName = 'AA_aa_userauthlist';
select id into @filtersid from pb_meta_filters where filterName = 'AA_aa_userauthlist';
select * from pb_meta_filter_item where filtersId = @filtersid;
--
select * from pb_filter_solution where filtersId = @filtersId and tenant_id = @tenantId;
select id into @solutionId from pb_filter_solution where filtersId = @filtersId and tenant_id = @tenantId limit 1;
select * from pb_filter_solution_common where solutionId = @solutionId;

select * from bill_toolbar where billnumber = @billno and tenant_id = @tenantId;
select * from bill_toolbaritem where billnumber = @billno and tenant_id = @tenantId ORDER BY `order`;
select * from bill_command where billnumber = @billno and tenant_id = @tenantId;