-- 客户级别名称多语
ALTER TABLE `agentlevel`
ADD COLUMN `cName2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `cName3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `cName4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `cName5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `cName6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('agentlevel', 'cName2', 'alter table  agentlevel add column `cName2` varchar(255) DEFAULT NULL COMMENT "自定义客户级别名称";', 'add');
call p_aa_updatecolumn('agentlevel', 'cName3', 'alter table  agentlevel add column `cName3` varchar(255) DEFAULT NULL COMMENT "自定义客户级别名称";', 'add');
call p_aa_updatecolumn('agentlevel', 'cName4', 'alter table  agentlevel add column `cName4` varchar(255) DEFAULT NULL COMMENT "自定义客户级别名称";', 'add');
call p_aa_updatecolumn('agentlevel', 'cName5', 'alter table  agentlevel add column `cName5` varchar(255) DEFAULT NULL COMMENT "自定义客户级别名称";', 'add');
call p_aa_updatecolumn('agentlevel', 'cName6', 'alter table  agentlevel add column `cName6` varchar(255) DEFAULT NULL COMMENT "自定义客户级别名称";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_cuslevel' and entity.cCode = 'aa_cuslevel'
and item.cFieldName = 'name'
and item.cName = 'name' and bill.tenant_id = 1292161350684928;



select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'aa_cuslevel' and entity.cCode = 'aa_cuslevel'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'aa_cuslevel' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;