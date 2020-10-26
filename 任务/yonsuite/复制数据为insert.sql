# [专属化]
# 业务数据！！！
# 复制如下已有数据为insert
# 0租户预置出来 已有租户改过来
# 结算方式
select *
from settle_method
where tenant_id = 0;
# 1831217147859200
# 客户分类
select *
from agentcategory
where tenant_id = 0;

# 提到u8cdev solid巴拉巴拉
# 结算方式 多语字段 20200901
# 预置结算方式 多语字段

# 已有租户/新租户 结算方式修复多语字段问题      0/非0租户 ok
# 结算方式、客户分类预置数据
update settle_method set cName2 = 'Bank Transfer' where cName = '银行转账' and cName2 is null;
update settle_method set cName3 = '銀行轉賬' where cName = '银行转账' and cName3 is null;
update settle_method set cName2 = 'Cash payment' where cName = '现金收付款' and cName2 is null;
update settle_method set cName3 = '現金收付款' where cName = '现金收付款' and cName3 is null;


INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '1', '现金', 1, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Cash', '現金' from tenant where not EXISTS (select 1 from settle_method where ccode = '1' and cname = '现金' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '2', '现金支票', 2, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Cash Cheque', '現金支票' from tenant where not EXISTS (select 1 from settle_method where ccode = '2' and cname = '现金支票' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '3', '转账支票', 2, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Transfer Cheque', '轉賬支票' from tenant where not EXISTS (select 1 from settle_method where ccode = '3' and cname = '转账支票' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '4', '网银', 0, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Online Banking', '網銀' from tenant where not EXISTS (select 1 from settle_method where ccode = '4' and cname = '网银' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '5', '电汇', 0, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Wire Transfer', '電匯' from tenant where not EXISTS (select 1 from settle_method where ccode = '5' and cname = '电汇' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '6', '信汇', 0, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Mail Transfer', '信匯' from tenant where not EXISTS (select 1 from settle_method where ccode = '6' and cname = '信汇' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '7', '银行承兑汇票', 2, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Bank Acceptance Bill', '銀行承兌匯票' from tenant where not EXISTS (select 1 from settle_method where ccode = '7' and cname = '银行承兑汇票' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '8', '商业承兑汇票', 2, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Commercial Acceptance Bill', '商業承兌匯票' from tenant where not EXISTS (select 1 from settle_method where ccode = '8' and cname = '商业承兑汇票' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '9', '银行汇票', 0, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Bank Draft', '銀行匯票' from tenant where not EXISTS (select 1 from settle_method where ccode = '9' and cname = '银行汇票' and tenant_id = 0) LIMIT 1;

INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`, `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '10', '委托收付款', 1, 1, 0,  0, b'1', b'1', 0, b'1', 0, 'Delegated Collection/Pmt', '委托收付款' from tenant where not EXISTS (select 1 from settle_method where ccode = '10' and cname = '委托收付款' and tenant_id = 0) LIMIT 1;

update settle_method
set cPath=concat(cast(id as char),'|')
where tenant_id = 0;


INSERT INTO agentcategory (cCode, cName, isEnabled, iDeleted, iDepth, iOrder, sort_num,
                           isEnd, iCreatorType, tenant_id, cName2, cName3)
select '1', '通用', true, 0, 1, 0, 0, true, 0, 0, 'General', '通用' from tenant
where not exists(select 1 from agentcategory where cCode = '1' and cName = '通用' and tenant_id = 0) limit 1;


update agentcategory
set cPath=concat(cast(id as char),'|')
where tenant_id = 0;


专属化：提交sql脚本到git->执行流水线->提供补丁
专属化分支：脚本提交到：
D:\ideaworkplace\work\u8c\UStock\upc\src\upc-server\ucf_script\db\mysql\upgrade\YonBIP202006\DML\dml.sql
D:\ideaworkplace\work\u8c\UStock\upc\src\upc-server\ucf_script\db\mysql\0102\data.sql