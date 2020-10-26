-- 销售区域备注多语
ALTER TABLE `aa_salearea`
ADD COLUMN `remark2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `remark3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `remark4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `remark5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `remark6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('aa_salearea', 'remark2', 'alter table  aa_salearea add column `remark2` varchar(255) DEFAULT NULL COMMENT "自定义销售区域备注";', 'add');
call p_aa_updatecolumn('aa_salearea', 'remark3', 'alter table  aa_salearea add column `remark3` varchar(255) DEFAULT NULL COMMENT "自定义销售区域备注";', 'add');
call p_aa_updatecolumn('aa_salearea', 'remark4', 'alter table  aa_salearea add column `remark4` varchar(255) DEFAULT NULL COMMENT "自定义销售区域备注";', 'add');
call p_aa_updatecolumn('aa_salearea', 'remark5', 'alter table  aa_salearea add column `remark5` varchar(255) DEFAULT NULL COMMENT "自定义销售区域备注";', 'add');
call p_aa_updatecolumn('aa_salearea', 'remark6', 'alter table  aa_salearea add column `remark6` varchar(255) DEFAULT NULL COMMENT "自定义销售区域备注";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_salearea' and entity.cCode = 'aa_salearea'
and item.cFieldName = 'remark'
and item.cName = 'remark' and bill.tenant_id = 1292161350684928;



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