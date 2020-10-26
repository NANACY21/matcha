-- 物料规格名称多语
ALTER TABLE `userdef_base` 
ADD COLUMN `showitem2` VARCHAR(100) DEFAULT NULL,
ADD COLUMN `showitem3` VARCHAR(100) DEFAULT NULL,
ADD COLUMN `showitem4` VARCHAR(100) DEFAULT NULL,
ADD COLUMN `showitem5` VARCHAR(100) DEFAULT NULL,
ADD COLUMN `showitem6` VARCHAR(100) DEFAULT NULL
;

call p_aa_updatecolumn('userdef_base', 'showitem2', 'alter table  userdef_base add column `showitem2` varchar(100) DEFAULT NULL COMMENT "自定义物料规格名称";', 'add');
call p_aa_updatecolumn('userdef_base', 'showitem3', 'alter table  userdef_base add column `showitem3` varchar(100) DEFAULT NULL COMMENT "自定义物料规格名称";', 'add');
call p_aa_updatecolumn('userdef_base', 'showitem4', 'alter table  userdef_base add column `showitem4` varchar(100) DEFAULT NULL COMMENT "自定义物料规格名称";', 'add');
call p_aa_updatecolumn('userdef_base', 'showitem5', 'alter table  userdef_base add column `showitem5` varchar(100) DEFAULT NULL COMMENT "自定义物料规格名称";', 'add');
call p_aa_updatecolumn('userdef_base', 'showitem6', 'alter table  userdef_base add column `showitem6` varchar(100) DEFAULT NULL COMMENT "自定义物料规格名称";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_spepro' and entity.cCode = 'pc_spepro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem' and bill.tenant_id = 1292161350684928;


-- 这是查啥呢？
select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_spepro' and entity.cCode = 'pc_spepro'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'pc_spepro' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;