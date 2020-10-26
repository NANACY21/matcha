-- 标签备注多语

-- 标签备注字段，新增字段
ALTER TABLE `tag` 
ADD COLUMN `tag_abbr2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_abbr3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_abbr4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_abbr5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `tag_abbr6` VARCHAR(255) DEFAULT NULL
;

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag' 
and item.cFieldName = 'tagAbbr'
and item.cName = 'tagAbbr' and bill.tenant_id = 1389339883229440;


-- 这是查啥呢？
select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag' 
and bill.tenant_id = 1389339883229440;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'pc_tag' and tenant_id = 1389339883229440;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1389339883229440;