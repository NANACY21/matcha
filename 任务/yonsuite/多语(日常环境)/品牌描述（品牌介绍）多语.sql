-- 品牌属性展示页面->品牌描述（品牌介绍）多语


##先看品牌被哪些表引用了

-- 品牌描述的多语
ALTER TABLE `brand` 
ADD COLUMN `brand_desc2` text DEFAULT NULL,
ADD COLUMN `brand_desc3` text DEFAULT NULL,
ADD COLUMN `brand_desc4` text DEFAULT NULL,
ADD COLUMN `brand_desc5` text DEFAULT NULL,
ADD COLUMN `brand_desc6` text DEFAULT NULL
;

-- select * from brand limit 1

##修改元数据定义，为多语字段增加标识， 标签增加is_mul_language="true" 


##对于卡片页多语列的展示需要设置多语控件类型 ： cControlType= InputMultiLang 
-- brand_name的cControlType设为InputMultiLang

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand' 
and item.cFieldName = 'brandDesc'
and item.cName = 'brandDesc' and bill.tenant_id = 1389339883229440;


-- 这是查啥呢？
-- select item.* from billitem_base item   
-- inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
-- inner join billentity_base entity on entity.id = item.iBillEntityId
-- inner join billtemplate_base tpl on tpl.id = item.iTplId
-- inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
-- where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand' 
--  and bill.tenant_id = 1389339883229440;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand' and tenant_id = 1389339883229440;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1389339883229440;
-- 