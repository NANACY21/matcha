# bill_base表 cBillNo相同 租户不同 id不同
# 相同页面 每个租户的页面id不一样 编码cbillno一样
set @billno = 'aa_userauthlist';
set @tenantId = 0;
select id into @billid from bill_base where cBillNo = @billno and tenant_id = @tenantId;
select * from bill_base where id = @billid;
select * from billentity_base where ibillid = @billid and tenant_id=0;
select * from billtemplate_base where ibillid = @billid;
select * from billtplgroup_base  where ibillid = @billid;
select * from billitem_base  where ibillid = @billid;

-- select * from pb_meta_filters where filterName = @billno;
-- select id into @filtersid from pb_meta_filters where filterName = @billno;
-- select * from pb_meta_filter_item where filtersId = @filtersid;
--
-- select * from pb_filter_solution where filtersId = @filtersId and tenant_id = @tenantId;
-- select solutionId into @solutionId from pb_filter_solution where filtersId = @filtersId and tenant_id = @tenantId;
-- select * from pb_filter_solution_common where solutionId = @solutionId;

select * from bill_toolbar where billnumber = @billno and tenant_id = @tenantId;
select * from bill_toolbaritem where billnumber = @billno and tenant_id = @tenantId ORDER BY `order`;
select * from bill_command where billnumber = @billno and tenant_id = @tenantId;