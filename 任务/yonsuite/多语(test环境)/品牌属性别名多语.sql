-- 品牌属性展示页面->品牌属性别名多语


##先看品牌被哪些表引用了

-- 品牌描述的多语
ALTER TABLE `userdef_base` 
ADD COLUMN `userdef_alias2` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias3` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias4` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias5` VARCHAR(255) DEFAULT NULL,
ADD COLUMN `userdef_alias6` VARCHAR(255) DEFAULT NULL
;

call p_aa_updatecolumn('userdef_base', 'userdef_alias2', 'alter table  userdef_base add column `userdef_alias2` varchar(255) DEFAULT NULL COMMENT "自定义品牌属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias3', 'alter table  userdef_base add column `userdef_alias3` varchar(255) DEFAULT NULL COMMENT "自定义品牌属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias4', 'alter table  userdef_base add column `userdef_alias4` varchar(255) DEFAULT NULL COMMENT "自定义品牌属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias5', 'alter table  userdef_base add column `userdef_alias5` varchar(255) DEFAULT NULL COMMENT "自定义品牌属性别名";', 'add');
call p_aa_updatecolumn('userdef_base', 'userdef_alias6', 'alter table  userdef_base add column `userdef_alias6` varchar(255) DEFAULT NULL COMMENT "自定义品牌属性别名";', 'add');

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
where  bill.cBillNo = 'pc_productbrandpro' and entity.cCode = 'pc_productbrandpro' 
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias' and bill.tenant_id = 1292161350684928;


-- 这是查啥呢？
select item.* from billitem_base item   
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
where  bill.cBillNo = 'pc_productbrandpro' and entity.cCode = 'pc_productbrandpro' 
 and bill.tenant_id = 1292161350684928;


##并且对于需要多语录入的模板中设置bill_base 表中 i18ndoc = 1
-- 列表和卡片
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand' and tenant_id = 1292161350684928;
-- update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandlist' and tenant_id = 1292161350684928;
-- 