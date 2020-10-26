-- 品牌属性展示页面->品牌广告图片多语
##先看品牌被哪些表引用了
ALTER TABLE `brand` 
ADD COLUMN `adImage2` varchar(765) DEFAULT NULL,
ADD COLUMN `adImage3` varchar(765) DEFAULT NULL,
ADD COLUMN `adImage4` varchar(765) DEFAULT NULL,
ADD COLUMN `adImage5` varchar(765) DEFAULT NULL,
ADD COLUMN `adImage6` varchar(765) DEFAULT NULL
;

call p_aa_updatecolumn('brand', 'adImage2', 'alter table  brand add column `adImage2` varchar(765) DEFAULT NULL COMMENT "自定义品牌广告图片";', 'add');
call p_aa_updatecolumn('brand', 'adImage3', 'alter table  brand add column `adImage3` varchar(765) DEFAULT NULL COMMENT "自定义品牌广告图片";', 'add');
call p_aa_updatecolumn('brand', 'adImage4', 'alter table  brand add column `adImage4` varchar(765) DEFAULT NULL COMMENT "自定义品牌广告图片";', 'add');
call p_aa_updatecolumn('brand', 'adImage5', 'alter table  brand add column `adImage5` varchar(765) DEFAULT NULL COMMENT "自定义品牌广告图片";', 'add');
call p_aa_updatecolumn('brand', 'adImage6', 'alter table  brand add column `adImage6` varchar(765) DEFAULT NULL COMMENT "自定义品牌广告图片";', 'add');


##修改元数据定义，为多语字段增加标识， 标签增加is_mul_language="true" 


##对于卡片页多语列的展示需要设置多语控件类型 ： cControlType= InputMultiLang 
-- brand_name的cControlType设为InputMultiLang

update billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'Avatar'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand' 
and item.cFieldName = 'adImage'
and item.cName = 'adImage' and bill.tenant_id = 1292161350684928;





-- select item.* from billitem_base item   
-- inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
-- inner join billentity_base entity on entity.id = item.iBillEntityId
-- inner join billtemplate_base tpl on tpl.id = item.iTplId
-- inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
-- where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand' 
-- and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;
-- 