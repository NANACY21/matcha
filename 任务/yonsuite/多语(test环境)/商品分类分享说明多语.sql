-- 商品分类分享说明多语
ALTER TABLE `product_presentation_class` 
ADD COLUMN `shareDescription2` VARCHAR(765) DEFAULT NULL,
ADD COLUMN `shareDescription3` VARCHAR(765) DEFAULT NULL,
ADD COLUMN `shareDescription4` VARCHAR(765) DEFAULT NULL,
ADD COLUMN `shareDescription5` VARCHAR(765) DEFAULT NULL,
ADD COLUMN `shareDescription6` VARCHAR(765) DEFAULT NULL
;

call p_aa_updatecolumn('product_presentation_class', 'shareDescription2', 'alter table  product_presentation_class add column `shareDescription2` varchar(765) DEFAULT NULL COMMENT "自定义商品分类分享说明";', 'add');
call p_aa_updatecolumn('product_presentation_class', 'shareDescription3', 'alter table  product_presentation_class add column `shareDescription3` varchar(765) DEFAULT NULL COMMENT "自定义商品分类分享说明";', 'add');
call p_aa_updatecolumn('product_presentation_class', 'shareDescription4', 'alter table  product_presentation_class add column `shareDescription4` varchar(765) DEFAULT NULL COMMENT "自定义商品分类分享说明";', 'add');
call p_aa_updatecolumn('product_presentation_class', 'shareDescription5', 'alter table  product_presentation_class add column `shareDescription5` varchar(765) DEFAULT NULL COMMENT "自定义商品分类分享说明";', 'add');
call p_aa_updatecolumn('product_presentation_class', 'shareDescription6', 'alter table  product_presentation_class add column `shareDescription6` varchar(765) DEFAULT NULL COMMENT "自定义商品分类分享说明";', 'add');

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_presentationclass' and entity.cCode = 'pc_presentationclass'
and item.cFieldName = 'shareDescription'
and item.cName = 'shareDescription' and bill.tenant_id = 1292161350684928;



select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_presentationclass' and entity.cCode = 'pc_presentationclass'
and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- 一个卡片执行一次
update bill_base set i18ndoc = 1 where cBillNo = 'pc_presentationclass' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;