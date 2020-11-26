insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'aa_goodsposition', 'AA', 1, 'aa_sendtrans', 'aa_goodsposition', 61, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'aa_goodsposition', NOW(), 0, 1, 1, 'aa_goodsposition', 5, 0, tenant.id, NULL, '1', 1 from pb_menu_base menu
inner join tenant on menu.tenant_id = tenant.id
where not exists (select * from pb_menu_base where menu_code = 'aa_goodsposition' and tenant_id <> 0);


insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'aa_goodsposition', 'AA', 1, 'aa_sendtrans', 'aa_goodsposition', 61, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'aa_goodsposition', NOW(), 0, 1, 1, 'aa_goodsposition', 5, 0, 0, NULL, '1', 1 from pb_menu_base
where not exists (select * from pb_menu_base where menu_code = 'aa_goodsposition' and tenant_id = 0);
# delete
# from pb_menu_base
# where menu_code = 'aa_goodsposition';
select *
from pb_menu_lang where tenant_id=1292161350684928 and menu_code='aa_goodsposition';


INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'aa_goodsposition', '货位', 'zh-cn', NOW(), 0, tenant.id from pb_menu_lang lang
inner join tenant on tenant.id = lang.tenant_id
where not exists (select * from pb_menu_lang where menu_code = 'aa_goodsposition' and menu_name = '货位' and tenant_id <> 0);


INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'aa_goodsposition', '货位', 'zh-cn', NOW(), 0, 0 from pb_menu_lang
where not exists (select * from pb_menu_lang where menu_code = 'aa_goodsposition' and menu_name = '货位' and tenant_id = 0);
# delete
# from pb_menu_lang
# where menu_code = 'aa_goodsposition';


-- 新增附件分组菜单权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsposition', '货位', 'PC', 2, NULL, 120, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsposition' and name='货位') limit 1;
-- 加查看权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositionlist', '查看', 'aa_goodsposition', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodspositionlist' and name='查看') limit 1;

INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositionadd', '新增', 'aa_goodsposition', 3, NULL, 2, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodspositionadd' and name='新增') limit 1;
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositiondelete', '删除', 'aa_goodsposition', 3, NULL, 3, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodspositiondelete' and name='删除') limit 1;
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositionedit', '修改', 'aa_goodsposition', 3, NULL, 4, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodspositionedit' and name='修改') limit 1;


# excel 后2张表涉及 authid
delete
from auth
where code like '%aa_goodsposition%';


# [货位]billnum命名各方面 和[仓库]保持一致
# pb_menu_lang表menu_code字段 - billnum
select *
from pb_menu_lang
where tenant_id = 0 and menu_code like '%house%';


select * from auth where parent_id = 'aa_businessarchives';


# 参照类型 - pub_ref表code字段
# getrefmeta请求头 有参照类型 （refcode）
select *
from pub_ref where code like '%aa_warehouse_stocksref%' or code like '%aa_goodspositionref%';


update billitem_base
         inner join bill_base on billitem_base.iBillId = bill_base.id set billitem_base.cRefType='aa_warehouse_stocksref'
where cRefType = 'aa_warehouse'
  and bill_base.cBillNo = 'aa_goodsposition';


update billitem_base
         inner join bill_base on billitem_base.iBillId = bill_base.id set billitem_base.bCanModify=0
where cFieldName = 'conditionOrgId' and bCanModify=1
  and bill_base.cBillNo = 'aa_goodsposition';


update billitem_base
         inner join bill_base on billitem_base.iBillId = bill_base.id set billitem_base.bCanModify=0
where cFieldName = 'conditionOrgName' and bCanModify=1
  and bill_base.cBillNo = 'aa_goodsposition';


# 【参照】
# 1.参照是一个页面 ui元数据以生成
# 2.引用参照： 别的页面的billitembase字段 reftype pub_ref表增行


# pub_ref表ctpltype字段 决定参照显示树还是卡片
delete
from pub_ref
where code = 'aa_goodspositionref';
INSERT INTO pub_ref ( code, name, description, reftype, isorgrel, datasourcetype, datasourcesql,
                            datasourcegridsql, iparentrefid, csub_id, centitykeyfld, ctpltype, centitynamefld, cretfld,
                            bmultisel, creffiltersql, cautocompletefiltersql, bauth, ccheckflds, ctipprefix, ctipfld,
                            ifilterstyle, ishowstyle, bpage, lPageSize, cdatagrid_fullname, cdatagrid_classfk,
                            cdataclass_fullname, cdataclass_refclsname, bdataclass_rule, bdataclass_retenddata,
                            cdataclass_lscode, cdataclass_lsname, cdataclass_sortfield, clsname, sortfield, cbillnum,
                            eventbean, svcKey, cFilterId, authType, extendField, domain, treedomain)
select
'aa_goodspositionref', '货位参照', '货位参照', 'aa_goodspositionref', null, 'meta', null, null, null, 'AA', 'code', 'Table',
        'name', 'code', false, '0', null, false, 'code,name', null, null, null, null, false, null,
        'aa.goodsposition.GoodsPosition', 'id', 'aa.goodsposition.GoodsPosition', 'code', false, false, 'code', 'name', 'code', 'name', null, 'aa_goodspositionref', null,
        '/bill', null, null, '{"placeholder":"编码/名称"}', null, null
from pub_ref where not exists(select 1 from pub_ref where code='aa_goodspositionref') limit 1;


# 【上传xml元数据】
# 没东西只有两种原因，一种是没权限导入当前领域，
# 一种是当前组件uri在别的领域下已经存在了，需要先把这个组件的领域在页面上改成你这才能导入


INSERT INTO billitem_base (cSubId, iBillId, cFieldName, cName, cCaption, cShowCaption, iBillEntityId,
                                  iBillTplGroupId, iTplId, iOrder, iMaxLength, iFieldType, bEnum, cEnumString,
                                  isDeleted, bMustSelect, bHidden, cRefType, cRefId, cRefRetId, cDataRule,
                                  iFunctionType, bSplit, bExtend, iNumPoint, bCanModify, cSourceType, iMaxShowLen,
                                  cMemo, iColWidth, cSumType, iAlign, bNeedSum, bShowIt, bFixed, bFilter, cDefaultValue,
                                  cFormatData, cUserId, iTabIndex, bIsNull, bPrintCaption, bJointQuery, bPrintUpCase,
                                  bSelfDefine, cSelfDefineType, cDataSourceName, cOrder, bCheck, cControlType,
                                  cEnumType, refReturn, bShowInRowAuth, iRowAuthBillId, cStyle, isMasterOrg, bVmExclude,
                                  bRowAuthDim, tenant_id, isprint, multiple, isshoprelated, depends, iSystem,
                                  auth_level, cDefineName, enterDirection, isExport, makeField, cSensFieldName,
                                  uncopyable, cCaption_resid, cShowCaption_resid, bEnableFormat, cReltzField)
VALUES ('AA', 1011734483, 'lichiTest', 'lichiTest', '李篪测试', '李篪测试', 19006730, 327515987, 12032342, 27,
        null, 1, null, null, 0, 1, 0, 'aa_goodspositionref', null, '{"lichiTest":"name"}', null,
        null, 0, 0, null, 1, null, 255, null, 100, null, null, 0, 1, null, 0, null, null, null, 27, 1, null, null, null,
        null, null, null, null, null, 'Refer', '', 'name', false, null, null, null, 0, false,
        1292161350684928, 1, null, 0, null, 1, 5, null, 4, 1, null, null, 0, null, null, 0, null);





# 所有参照货位者都执行 定义货位参照者来写
# 该rule职责：拼条件 iorder<30
# 为所有租户注册rule！ key:参照类型
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'common',
       'refer',
       'getGoodsPositionRefBeforeRule',
       20,
       null,
       tenant.id,
       'aa_goodspositionref',
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'common' and action = 'refer' and ruleId = 'getGoodsPositionRefBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'common', 'refer', 'getGoodsPositionRefBeforeRule', 20, null, 0, 'aa_goodspositionref', true, null,
        null, 0, null, null from tenant where not exists(select 1 from billruleregister where
            billnum='common' and action='refer' and ruleId='getGoodsPositionRefBeforeRule' and tenant_id=0 and `key`='aa_goodspositionref') limit 1;


# 仅货位树卡参照仓库时执行 该参照仓库者来写 key - 参照类型
# 该rule职责：拼条件 iorder<30
# 为所有租户注册rule！ key:参照类型
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition',
       'refer',
       'getWarehouseRefBeforeRule',
       5,
       null,
       tenant.id,
       'aa_warehouse_stocksref',
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsposition' and action = 'refer' and ruleId = 'getWarehouseRefBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition', 'refer', 'getWarehouseRefBeforeRule', 5, null, 0, 'aa_warehouse_stocksref', true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsposition' and action='refer' and ruleId='getWarehouseRefBeforeRule'
    and tenant_id=0 and `key`='aa_warehouse_stocksref') limit 1;


# [ui元数据多语相关]sql xml
# [代码内容多语]：部署流水线 登预发多语 同步各环境即可！！
# [库存组织]参照类型 aa_orgtree

# 【货位物料对照（关系）】相关####################################################【20200918】
# 业务档案下新增[货位物料关系]菜单
select *
from pb_menu_base where pmenu_code='aa_sendtrans' and tenant_id=0;


insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'aa_goodsproductscomparisonlist', 'AA', 1, 'aa_sendtrans', null, 62, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'aa_goodsproductscomparisonlist', NOW(), 0, 1, 1, 'aa_goodsposition', 5, 0, tenant.id, NULL, '1', 1 from pb_menu_base menu
inner join tenant on menu.tenant_id = tenant.id
where not exists (select * from pb_menu_base where menu_code = 'aa_goodsproductscomparisonlist' and tenant_id <> 0);


insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'aa_goodsproductscomparisonlist', 'AA', 1, 'aa_sendtrans', null, 62, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'aa_goodsproductscomparisonlist', NOW(), 0, 1, 1, 'aa_goodsposition', 5, 0, 0, NULL, '1', 1 from pb_menu_base
where not exists (select * from pb_menu_base where menu_code = 'aa_goodsproductscomparisonlist' and tenant_id = 0);


INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'aa_goodsproductscomparisonlist', '货位物料关系', 'zh-cn', NOW(), 0, tenant.id from pb_menu_lang lang
inner join tenant on tenant.id = lang.tenant_id
where not exists (select * from pb_menu_lang where menu_code = 'aa_goodsproductscomparisonlist' and menu_name = '货位物料关系' and tenant_id <> 0);


INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'aa_goodsproductscomparisonlist', '货位物料关系', 'zh-cn', NOW(), 0, 0 from pb_menu_lang
where not exists (select * from pb_menu_lang where menu_code = 'aa_goodsproductscomparisonlist' and menu_name = '货位物料关系' and tenant_id = 0);


-- 新增[货位物料关系]菜单权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlist', '货位物料关系', 'PC', 2, NULL, 130, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlist' and name='货位物料关系') limit 1;
-- 加查看权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistlist', '查看', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistlist' and name='查看') limit 1;

# 新增权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistadd', '新增', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistadd' and name='新增') limit 1;
# 编辑权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistedit', '编辑', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistedit' and name='编辑') limit 1;
# 导出
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistexport', '导出', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistexport' and name='导出') limit 1;
# 模板导出
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlisttempexport', '模板导出', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlisttempexport' and name='模板导出') limit 1;
# 删除
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistdelete', '删除', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistdelete' and name='删除') limit 1;
# 模板导入
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodsproductscomparisonlistimport', '模板导入', 'aa_goodsproductscomparisonlist', 3, NULL, 1, 0, NOW(), 2, NULL, NULL, 'upc' from auth where
not exists(select 1 from auth where code='aa_goodsproductscomparisonlistimport' and name='模板导入') limit 1;

select *
from auth where parent_id='PC';
# 物料（存货、商品）

select *
from pub_ref where name like '%物料%';

select compareLogic
from pb_filter_solution_common group by compareLogic;




# xml 定义视图 需要手工写

# 货位物料对照列表 左树维度枚举类型
select *
from aa_enum
where enumtype = 'aa_goodsproductscomparison_look';


delete from aa_enum where enumtype='aa_goodsproductscomparison_look' and enumname='货位';
delete from aa_enum where enumtype='aa_goodsproductscomparison_look' and enumname='物料';
INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex,
                            icon, description)
VALUES ('aa_goodsproductscomparison_look', 'text', '1', 'zh-cn', '货位', 'aa', 0, 0, null,
        'aa_goodsproductscomparison_look');

INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex,
                            icon, description)
VALUES ('aa_goodsproductscomparison_look', 'text', '2', 'zh-cn', '物料', 'aa', 0, 0, null,
        'aa_goodsproductscomparison_look');

select *
from pub_ref where code='pc_nomalproductref';

select pc.name
from product p
         inner join product_management_class pc on p.manageClass = pc.id
where p.code = '1'
  and p.name = '11111';



# 货位物料对照卡片 参照物料时 执行以过滤物料
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparison_position',
       'refer',
       'getProductRefBeforeRule',
       5,
       null,
       tenant.id,
       'pc_productquerytreeref',
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsproductscomparison_position' and action = 'refer' and ruleId = 'getProductRefBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparison_position', 'refer', 'getProductRefBeforeRule', 5, null, 0, 'pc_productquerytreeref', true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsproductscomparison_position' and action='refer' and ruleId='getProductRefBeforeRule'
    and tenant_id=0 and `key`='pc_productquerytreeref') limit 1;


# 保存货位物料对照
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparison_position',
       'save',
       'saveGoodsproductscomparisonRule',
       10,
       'saveBillRule',
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsproductscomparison_position' and action = 'save' and ruleId = 'saveGoodsproductscomparisonRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparison_position', 'save', 'saveGoodsproductscomparisonRule', 10, 'saveBillRule', 0, null, true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsproductscomparison_position' and action='save' and ruleId='saveGoodsproductscomparisonRule'
    and tenant_id=0 and `key` is null) limit 1;





菜单名：货位物料关系
菜单英文名：goodsproductscomparison
服务编码：aa_goodsproductscomparisonlist
地址：http://u8cupc-test.yyuap.com/meta/voucherList/aa_goodsproductscomparisonlist


select *
from aa_enum where subid='aa' and enumname in ('启用','停用');

# 1个xml文件


select cbillnum
from pub_ref
where code = 'pc_productquerytreeref';


# 删除[货位]前校验
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition',
       'delete',
       'deleteGoodsPositionBeforeRule',
       10,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsposition' and action = 'delete' and ruleId = 'deleteGoodsPositionBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition', 'delete', 'deleteGoodsPositionBeforeRule', 10, null, 0, null, true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsposition' and action='delete' and ruleId='deleteGoodsPositionBeforeRule'
    and tenant_id=0 and `key` is null) limit 1;

# [自定义]保存insert[货位]前校验
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition',
       'save',
       'saveGoodsPositionBeforeRule',
       28,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsposition' and action = 'save' and ruleId = 'saveGoodsPositionBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition', 'save', 'saveGoodsPositionBeforeRule', 28, null, 0, null, true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsposition' and action='save' and ruleId='saveGoodsPositionBeforeRule'
    and tenant_id=0 and `key` is null) limit 1;


INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition',
       'save',
       'saveGoodsPositionafterRule',
       31,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsposition' and action = 'save' and ruleId = 'saveGoodsPositionafterRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition', 'save', 'saveGoodsPositionafterRule', 31, null, 0, null, true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsposition' and action='save' and ruleId='saveGoodsPositionafterRule'
    and tenant_id=0 and `key` is null) limit 1;


# [快速定义]
select *
from billforeignkey WHERE entityname='Department' and   target='parent';

INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 0, 'GoodsPosition', 'aa_goodsposition', 'parent_name', 'erpCode', 'parent', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition') limit 1;


# 线索树！！！
select id from aa_goodsposition where erpCode = parentname;

# 一个仓库 - 多个库存组织



[出现过的问题]
bmain viewmodel只能取主表的数据
元数据 配置有误： bMain的缘故
新增点保存 positionId必输：主表positionId没有 和实体状态有关 beforesave
很多问题就是excel配的有问题

没热部署上 重启服务
tail -f .log日志文件 | grep -C10  'keyword'


select *
from billruleregister
where tenant_id = 1869389165678848
  and billnum in ('aa_user', 'common')
  and action = 'save'
order by iorder;


select *
from billruleregister where ruleId like '%import%';



# 处理返回的json name 值
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparisonlist',
       'querytree',
       'querytreeComparisonlistBeforeRule',
       40,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_goodsproductscomparisonlist' and action = 'querytree' and ruleId = 'querytreeComparisonlistBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsproductscomparisonlist', 'querytree', 'querytreeComparisonlistBeforeRule', 40, null, 0, null, true, null,
        null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsproductscomparisonlist' and action='querytree' and ruleId='querytreeComparisonlistBeforeRule'
    and tenant_id=0 and `key` is null) limit 1;


# 相同货位号并发测试没有提示货位号重复
# 给code,tenant_id字段 加 联合唯一索引
alter ignore table aa_goodsposition
    add unique index (code, tenant_id);
# https://blog.csdn.net/weistin/article/details/79698996
# https://blog.csdn.net/badplayerz/article/details/53608087


select *
from pub_ref
where code = 'aa_goodspositionref';


INSERT INTO ugoods.pub_ref (id, code, name, description, reftype, isorgrel, datasourcetype, datasourcesql,
                            datasourcegridsql, iparentrefid, csub_id, centitykeyfld, ctpltype, centitynamefld, cretfld,
                            bmultisel, creffiltersql, cautocompletefiltersql, bauth, ccheckflds, ctipprefix, ctipfld,
                            ifilterstyle, ishowstyle, bpage, lPageSize, cdatagrid_fullname, cdatagrid_classfk,
                            cdataclass_fullname, cdataclass_refclsname, bdataclass_rule, bdataclass_retenddata,
                            cdataclass_lscode, cdataclass_lsname, cdataclass_sortfield, clsname, sortfield, cbillnum,
                            eventbean, svcKey, cFilterId, authType, extendField, domain, treedomain, name_resid)
VALUES (111241, 'aa_goodspositionref', '货位参照', '货位参照', 'aa_goodspositionref', null, 'meta', null, null, null, 'AA',
        'code', 'Table', 'name', 'code', false, '0', null, false, 'code,name', null, null, null, null, false, null,
        'aa.goodsposition.GoodsPosition', 'id', 'aa.goodsposition.GoodsPosition', 'code', false, false, 'code', 'name',
        'code', 'name', null, 'aa_goodspositionref', null, '/bill', null, null, '{"placeholder":"编码/名称"}', null, null,
        null);



INSERT INTO ugoods.pub_ref (id, code, name, description, reftype, isorgrel, datasourcetype, datasourcesql,
                            datasourcegridsql, iparentrefid, csub_id, centitykeyfld, ctpltype, centitynamefld, cretfld,
                            bmultisel, creffiltersql, cautocompletefiltersql, bauth, ccheckflds, ctipprefix, ctipfld,
                            ifilterstyle, ishowstyle, bpage, lPageSize, cdatagrid_fullname, cdatagrid_classfk,
                            cdataclass_fullname, cdataclass_refclsname, bdataclass_rule, bdataclass_retenddata,
                            cdataclass_lscode, cdataclass_lsname, cdataclass_sortfield, clsname, sortfield, cbillnum,
                            eventbean, svcKey, cFilterId, authType, extendField, domain, ideleted)
VALUES (111241, 'at_sourceBillList', '来源单据', '来源单据', null, null, 'sql',
        'select cbillno as id,cbillno as code,cname as name from bill_base where tenant_id=0;', null, null, 'AT', null,
        'Table', 'name', 'code', false, '0', null, false, 'cBillNo,cName', null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, 'pub_refList', null, null, null, null, null, null, false);


select *
from auth where code like '%aa_goods%';
服务编码：aa_goodsposition aa_goodsproductscomparisonlist



# [需求]
货位物料对照列表 上方查询区问题 112 116


 SELECT a.authid
from bill_command a
where billnumber=#{billnumber} and tenant_id=#{tenant_Id}
      and `action` in ('list','detail')


