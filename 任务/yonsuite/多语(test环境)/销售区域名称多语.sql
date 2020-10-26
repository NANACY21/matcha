-- 销售区域名称多语
ALTER TABLE `aa_salearea`
ADD COLUMN `name2` VARCHAR(20) DEFAULT NULL,
ADD COLUMN `name3` VARCHAR(20) DEFAULT NULL,
ADD COLUMN `name4` VARCHAR(20) DEFAULT NULL,
ADD COLUMN `name5` VARCHAR(20) DEFAULT NULL,
ADD COLUMN `name6` VARCHAR(20) DEFAULT NULL
;

call p_aa_updatecolumn('aa_salearea', 'name2', 'alter table  aa_salearea add column `name2` varchar(20) DEFAULT NULL COMMENT "自定义销售区域名称";', 'add');
call p_aa_updatecolumn('aa_salearea', 'name3', 'alter table  aa_salearea add column `name3` varchar(20) DEFAULT NULL COMMENT "自定义销售区域名称";', 'add');
call p_aa_updatecolumn('aa_salearea', 'name4', 'alter table  aa_salearea add column `name4` varchar(20) DEFAULT NULL COMMENT "自定义销售区域名称";', 'add');
call p_aa_updatecolumn('aa_salearea', 'name5', 'alter table  aa_salearea add column `name5` varchar(20) DEFAULT NULL COMMENT "自定义销售区域名称";', 'add');
call p_aa_updatecolumn('aa_salearea', 'name6', 'alter table  aa_salearea add column `name6` varchar(20) DEFAULT NULL COMMENT "自定义销售区域名称";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_salearea' and entity.cCode = 'aa_salearea'
and item.cFieldName = 'name'
and item.cName = 'name' and bill.tenant_id = 1292161350684928;



select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'aa_salearea' and entity.cCode = 'aa_salearea'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'aa_salearea' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;