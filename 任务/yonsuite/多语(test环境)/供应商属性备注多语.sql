-- 供应商属性备注多语
ALTER TABLE `userdef_base` 
ADD COLUMN `userdef_desc2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_desc3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_desc4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_desc5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_desc6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('userdef_base', 'userdef_desc2', 'alter table  userdef_base add column `userdef_desc2` varchar(255) DEFAULT NULL COMMENT "自定义供应商属性备注";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_desc3', 'alter table  userdef_base add column `userdef_desc3` varchar(255) DEFAULT NULL COMMENT "自定义供应商属性备注";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_desc4', 'alter table  userdef_base add column `userdef_desc4` varchar(255) DEFAULT NULL COMMENT "自定义供应商属性备注";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_desc5', 'alter table  userdef_base add column `userdef_desc5` varchar(255) DEFAULT NULL COMMENT "自定义供应商属性备注";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_desc6', 'alter table  userdef_base add column `userdef_desc6` varchar(255) DEFAULT NULL COMMENT "自定义供应商属性备注";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_vendorpro' and entity.cCode = 'pc_vendorpro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc' and bill.tenant_id = 1292161350684928;



select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_vendorpro' and entity.cCode = 'pc_vendorpro'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'pc_vendorpro' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;