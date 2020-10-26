-- 标签名称多语

-- 标签名称字段，新增字段
ALTER TABLE `tag` 
ADD COLUMN `tag_Name2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_Name3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_Name4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_Name5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_Name6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('tag', 'tag_Name2', 'alter table  tag add column `tag_Name2` varchar(255) DEFAULT NULL COMMENT "自定义标签名称";', 'add');
call p_aa_updatecolumn('tag', 'tag_Name3', 'alter table  tag add column `tag_Name3` varchar(255) DEFAULT NULL COMMENT "自定义标签名称";', 'add');
call p_aa_updatecolumn('tag', 'tag_Name4', 'alter table  tag add column `tag_Name4` varchar(255) DEFAULT NULL COMMENT "自定义标签名称";', 'add');
call p_aa_updatecolumn('tag', 'tag_Name5', 'alter table  tag add column `tag_Name5` varchar(255) DEFAULT NULL COMMENT "自定义标签名称";', 'add');
call p_aa_updatecolumn('tag', 'tag_Name6', 'alter table  tag add column `tag_Name6` varchar(255) DEFAULT NULL COMMENT "自定义标签名称";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag' 
and item.cFieldName = 'name'
and item.cName = 'name' and bill.tenant_id = 1292161350684928;


-- 这是查啥呢？
-- select item.* from billitem_base item   
-- inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
-- inner join billentity_base entity on entity.id = item.iBillEntityId
-- inner join billtemplate_base tpl on tpl.id = item.iTplId
-- inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
-- where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag' 
-- and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
update bill_base set i18ndoc = 1 where cBillNo = 'pc_tag' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;