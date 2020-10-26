-- 客户属性别名多语
ALTER TABLE `userdef_base`
ADD COLUMN `userdef_alias2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('userdef_base', 'userdef_alias2', 'alter table  userdef_base add column `userdef_alias2` varchar(255) DEFAULT NULL COMMENT "自定义客户属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias3', 'alter table  userdef_base add column `userdef_alias3` varchar(255) DEFAULT NULL COMMENT "自定义客户属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias4', 'alter table  userdef_base add column `userdef_alias4` varchar(255) DEFAULT NULL COMMENT "自定义客户属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias5', 'alter table  userdef_base add column `userdef_alias5` varchar(255) DEFAULT NULL COMMENT "自定义客户属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias6', 'alter table  userdef_base add column `userdef_alias6` varchar(255) DEFAULT NULL COMMENT "自定义客户属性别名";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_customerpro' and entity.cCode = 'aa_customerpro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias' and bill.tenant_id = 1292161350684928;



select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'aa_customerpro' and entity.cCode = 'aa_customerpro'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'aa_customerpro' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;