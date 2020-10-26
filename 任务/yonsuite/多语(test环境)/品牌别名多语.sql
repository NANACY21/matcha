
##先看品牌被哪些表引用了

-- 别名的多语
ALTER TABLE `brand` 
ADD COLUMN `rand_keywords2` varchar(255) DEFAULT NULL,
ADD COLUMN `rand_keywords3` varchar(255) DEFAULT NULL,
ADD COLUMN `rand_keywords4` varchar(255) DEFAULT NULL,
ADD COLUMN `rand_keywords5` varchar(255) DEFAULT NULL,
ADD COLUMN `rand_keywords6` varchar(255) DEFAULT NULL
;

call p_aa_updatecolumn('brand', 'rand_keywords2', 'alter table  brand add column `rand_keywords2` varchar(255) DEFAULT NULL COMMENT "自定义品牌别名";', 'add');
call p_aa_updatecolumn('brand', 'rand_keywords3', 'alter table  brand add column `rand_keywords3` varchar(255) DEFAULT NULL COMMENT "自定义品牌别名";', 'add');
call p_aa_updatecolumn('brand', 'rand_keywords4', 'alter table  brand add column `rand_keywords4` varchar(255) DEFAULT NULL COMMENT "自定义品牌别名";', 'add');
call p_aa_updatecolumn('brand', 'rand_keywords5', 'alter table  brand add column `rand_keywords5` varchar(255) DEFAULT NULL COMMENT "自定义品牌别名";', 'add');
call p_aa_updatecolumn('brand', 'rand_keywords6', 'alter table  brand add column `rand_keywords6` varchar(255) DEFAULT NULL COMMENT "自定义品牌别名";', 'add');

select * from brand limit 1

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
and item.cFieldName = 'randKeywords'
and item.cName = 'randKeywords' and bill.tenant_id = 1292161350684928;


-- select item.* from billitem_base item   
-- inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
-- inner join billentity_base entity on entity.id = item.iBillEntityId
-- inner join billtemplate_base tpl on tpl.id = item.iTplId
-- inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
-- where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand' 
-- and item.cFieldName = 'randKeywords'
-- and item.cName = 'randKeywords' and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;
-- 