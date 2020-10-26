-- 标签分组名称多语

-- 标签分组名称字段，新增字段
ALTER TABLE `tagclass` 
ADD COLUMN `name2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `name3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `name4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `name5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `name6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('tagclass', 'name2', 'alter table  tagclass add column `name2` varchar(255) DEFAULT NULL COMMENT "自定义标签分组名称";', 'add');
call p_aa_updatecolumn('tagclass', 'name3', 'alter table  tagclass add column `name3` varchar(255) DEFAULT NULL COMMENT "自定义标签分组名称";', 'add');
call p_aa_updatecolumn('tagclass', 'name4', 'alter table  tagclass add column `name4` varchar(255) DEFAULT NULL COMMENT "自定义标签分组名称";', 'add');
call p_aa_updatecolumn('tagclass', 'name5', 'alter table  tagclass add column `name5` varchar(255) DEFAULT NULL COMMENT "自定义标签分组名称";', 'add');
call p_aa_updatecolumn('tagclass', 'name6', 'alter table  tagclass add column `name6` varchar(255) DEFAULT NULL COMMENT "自定义标签分组名称";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tagclass' and entity.cCode = 'pc_tagclass' 
and item.cFieldName = 'name'
and item.cName = 'name' and bill.tenant_id = 1292161350684928;



这是查啥呢？
select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_tagclass' and entity.cCode = 'pc_tagclass' 
and bill.tenant_id = 1292161350684928;


SELECT entity.* from billentity_base entity inner join bill_base bill on bill.id = entity.iBillId and bill.tenant_id = entity.tenant_id
where bill.cBillNo = 'pc_tagclass'  and bill.tenant_id = 1292161350684928;

select * from billentity_base where id = 2428454
##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_tagclass' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;