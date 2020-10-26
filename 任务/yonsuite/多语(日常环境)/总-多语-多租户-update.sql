# 136环境 ugoods库
-- 1标签备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag'
and item.cFieldName = 'tagAbbr'
and item.cName = 'tagAbbr';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_tag';



-- 2标签分组备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tagclass' and entity.cCode = 'pc_tagclass'
and item.cFieldName = 'tagclassAbbr'
and item.cName = 'tagclassAbbr';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_tagclass';



-- 3标签分组名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tagclass' and entity.cCode = 'pc_tagclass'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_tagclass';




-- 4标签名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_tag' and entity.cCode = 'pc_tag'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_tag';




-- 5产品线备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productline' and entity.cCode = 'pc_productline'
and item.cFieldName = 'remark'
and item.cName = 'remark';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productline';



-- 6产品线名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productline' and entity.cCode = 'pc_productline'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productline';



-- 7品牌属性展示页面->品牌logo多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'Avatar'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'brandLogo'
and item.cName = 'brandLogo';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 8品牌别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'randKeywords'
and item.cName = 'randKeywords';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 9品牌属性展示页面->品牌分组备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brandclass' and entity.cCode = 'pc_brandclass'
and item.cFieldName = 'brandclassAbbr'
and item.cName = 'brandclassAbbr';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandclass';




-- 10品牌属性展示页面->品牌分组名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brandclass' and entity.cCode = 'pc_brandclass'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brandclass';




-- 11品牌属性展示页面->品牌广告图片多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'Avatar'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'adImage'
and item.cName = 'adImage';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 12品牌属性展示页面->品牌描述（品牌介绍）多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'brandDesc'
and item.cName = 'brandDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 13品牌属性展示页面->品牌名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 14品牌属性展示页面->品牌属性备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productbrandpro' and entity.cCode = 'pc_productbrandpro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productbrandpro';




-- 15品牌属性展示页面->品牌属性别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productbrandpro' and entity.cCode = 'pc_productbrandpro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productbrandpro';




-- 16品牌属性展示页面->品牌属性名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productbrandpro' and entity.cCode = 'pc_productbrandpro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productbrandpro';




-- 17品牌属性展示页面->品牌网址多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_brand' and entity.cCode = 'pc_brand'
and item.cFieldName = 'brandUrl'
and item.cName = 'brandUrl';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_brand';




-- 18供应商属性备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_vendorpro' and entity.cCode = 'pc_vendorpro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_vendorpro' ;




-- 19供应商属性别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_vendorpro' and entity.cCode = 'pc_vendorpro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_vendorpro' ;




-- 20供应商属性名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_vendorpro' and entity.cCode = 'pc_vendorpro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_vendorpro' ;




-- 21客户行业名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_customertrade' and entity.cCode = 'aa_customertrade'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_customertrade' ;




-- 22客户级别备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_cuslevel' and entity.cCode = 'aa_cuslevel'
and item.cFieldName = 'comment'
and item.cName = 'comment';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_cuslevel' ;




-- 23客户级别名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_cuslevel' and entity.cCode = 'aa_cuslevel'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_cuslevel' ;




-- 24客户属性备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_customerpro' and entity.cCode = 'aa_customerpro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_customerpro' ;




-- 25客户属性别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_customerpro' and entity.cCode = 'aa_customerpro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_customerpro' ;




-- 26客户属性名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_customerpro' and entity.cCode = 'aa_customerpro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_customerpro' ;




-- 27商品分类备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_presentationclass' and entity.cCode = 'pc_presentationclass'
and item.cFieldName = 'remark'
and item.cName = 'remark';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_presentationclass' ;




-- 28商品分类分享说明多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_presentationclass' and entity.cCode = 'pc_presentationclass'
and item.cFieldName = 'shareDescription'
and item.cName = 'shareDescription';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_presentationclass' ;





-- 29物料SKU属性备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productskupro' and entity.cCode = 'pc_productskupro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productskupro' ;




-- 30物料SKU属性别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productskupro' and entity.cCode = 'pc_productskupro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productskupro' ;




-- 31物料SKU属性名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productskupro' and entity.cCode = 'pc_productskupro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productskupro' ;





-- 32物料规格备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_spepro' and entity.cCode = 'pc_spepro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_spepro' ;




-- 33物料规格规格值名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_spepro' and entity.cCode = 'pc_speproSub'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_spepro' ;




-- 34物料规格名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_spepro' and entity.cCode = 'pc_spepro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_spepro' ;




-- 35物料属性备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productpro' and entity.cCode = 'pc_productpro'
and item.cFieldName = 'userdefDesc'
and item.cName = 'userdefDesc';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productpro' ;



-- 36物料属性别名多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productpro' and entity.cCode = 'pc_productpro'
and item.cFieldName = 'userdefAlias'
and item.cName = 'userdefAlias';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productpro' ;



-- 37物料属性名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'pc_productpro' and entity.cCode = 'pc_productpro'
and item.cFieldName = 'showItem'
and item.cName = 'showItem';

update bill_base set i18ndoc = 1 where cBillNo = 'pc_productpro' ;




-- 38销售区域备注多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_salearea' and entity.cCode = 'aa_salearea'
and item.cFieldName = 'remark'
and item.cName = 'remark';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_salearea' ;




-- 39销售区域名称多语
update billitem_base item
inner join bill_base bill on bill.id = item.iBillId and bill.tenant_id = item.tenant_id
inner join billentity_base entity on entity.id = item.iBillEntityId
inner join billtemplate_base tpl on tpl.id = item.iTplId
inner join billtplgroup_base tplgroup on tplgroup.id = item.iBillTplGroupId
set item.cControlType = 'InputMultiLang'
where  bill.cBillNo = 'aa_salearea' and entity.cCode = 'aa_salearea'
and item.cFieldName = 'name'
and item.cName = 'name';

update bill_base set i18ndoc = 1 where cBillNo = 'aa_salearea' ;
