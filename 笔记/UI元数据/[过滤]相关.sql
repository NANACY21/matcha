# 有需要 删除ui元数据 过滤相关表的数据
set @billno = 'aa_goodsproductscomparisonlist';
set @tenantId = 1292161350684928;
select id
into @filtersid
from pb_meta_filters
where filterName = @billno;
# 1
delete from pb_meta_filters where filterName = @billno;
# 2
delete from pb_meta_filter_item where filtersId = @filtersid;
# 3
delete from pb_filter_solution where filtersId = @filtersid;
select id into @solutionId from pb_filter_solution where filtersId = @filtersId and tenant_id = @tenantId;
# 4
delete from pb_filter_solution_common where solutionId = @solutionId;