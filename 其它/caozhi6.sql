谁调用 token就一直是哪个领域
token被重写？



# 表单规则配置 表单编码参照搜索报错
update pub_ref
set ccheckflds='cBillNo,cName'
where code = 'at_sourceBillList';


# 编辑表单规则配置
INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex, icon,
                     description)
select 'sys_action', 'text', 'unstop', 'zh-cn', '启用', 'aa', 0, 0, null, 'sys_action'
from tenant where not exists(select 1 from aa_enum where enumtype='sys_action' and enumname='启用') limit 1;

INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex, icon,
                     description)
select 'sys_action', 'text', 'stop', 'zh-cn', '停用', 'aa', 0, 0, null, 'sys_action'
from tenant where not exists(select 1 from aa_enum where enumtype='sys_action' and enumname='停用') limit 1;

select *
from bill_command where tenant_id=1347014292918528 and billnumber='sys_billrule';


select *
from aa_enum where enumtype='sys_action';

select action
from billruleregister group by action;

select *
from aa_enum where enumname='启用';

INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex, icon,
                     description)
VALUES ('sys_action', 'text', 'unstop', 'zh-cn', '启用', 'aa', 0, 0, null, 'sys_action');

INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex, icon,
                     description)
VALUES ('sys_action', 'text', 'stop', 'zh-cn', '停用', 'aa', 0, 0, null, 'sys_action');

取消执行后面rule（引起） 导致返回结果改变 导致前端报错（现象原因）



INSERT INTO pub_ref (id, code, name, description, reftype, isorgrel, datasourcetype, datasourcesql,
                            datasourcegridsql, iparentrefid, csub_id, centitykeyfld, ctpltype, centitynamefld, cretfld,
                            bmultisel, creffiltersql, cautocompletefiltersql, bauth, ccheckflds, ctipprefix, ctipfld,
                            ifilterstyle, ishowstyle, bpage, lPageSize, cdatagrid_fullname, cdatagrid_classfk,
                            cdataclass_fullname, cdataclass_refclsname, bdataclass_rule, bdataclass_retenddata,
                            cdataclass_lscode, cdataclass_lsname, cdataclass_sortfield, clsname, sortfield, cbillnum,
                            eventbean, svcKey, cFilterId, authType, extendField, domain, treedomain)
select 30138,
'aa_goodspositionref', '货位参照', '货位参照', 'aa_goodspositionref', null, 'meta', null, null, null, 'AA', 'code', 'Table',
        'name', 'code', false, '0', null, false, 'code,name', null, null, null, null, false, null,
        'aa.goodsposition.GoodsPosition', 'id', 'aa.goodsposition.GoodsPosition', 'code', false, false, 'code', 'name', 'code', 'name', null, 'aa_goodspositionref', null,
        '/bill', null, null, '{"placeholder":"编码/名称"}', null, null
from pub_ref where not exists(select 1 from pub_ref where code='aa_goodspositionref') limit 1;


导入没验重->第一反应 导入请求 中 加验重方法 其实不必如此 导入走了saveuserbeforerule
只需加服务参数 因为导入是另一个服务



什么时候上预发 问测试
最晚什么时候上预发 问陈哥




update billentity_base entity inner join bill_base bill on entity.iBillId = bill.id
set entity.isTplExport=0
where entity.cCode = 'pc_attachmentgroup_product'
  and bill.cBillNo = 'pc_attachmentgrouplist';
# 20201217
# 预发货位导入按钮事件串了
update bill_toolbaritem set text='导入' where billnumber='aa_goodsposition' and name='btnImport';
update bill_toolbaritem set text='模板下载' where billnumber='aa_goodsposition' and name='btnTempexport';

# 货位模板下载多字段了
update billitem_base item inner join bill_base bill on item.iBillId=bill.id
set item.isExport=0
where bill.cBillNo='aa_goodsposition' and item.cName in ('id','warehouseId','parent','level','path','sort','isEnd','pubts','iCustID','iCustID_name','conditionWareId','conditionWareName',
                                                        'oneDName','oneDMaxNum','twoDName','twoDMaxNum','threeDName','threeDMaxNum','fourDName','fourDMaxNum');



# auth表数据
# INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
#                    `alias_code`, `subId`)
# select 'aa_goodspositionexport', '模板下载', 'aa_goodsposition', 3, NULL, 5, 0, NOW(), 5, NULL, NULL, 'upc' from auth where
# not exists(select 1 from auth where code='aa_goodspositionexport' and name='模板下载') limit 1;
#
# INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
#                    `alias_code`, `subId`)
# select 'aa_goodspositionimport', '导入', 'aa_goodsposition', 3, NULL, 5, 0, NOW(), 5, NULL, NULL, 'upc' from auth where
# not exists(select 1 from auth where code='aa_goodspositionimport' and name='导入') limit 1;

INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositionexport', '模板下载', 'aa_goodsposition', 3, NULL, 5, 0, NOW(), 5, NULL, NULL, 'upc' from dual where
not exists(select 1 from auth where code='aa_goodspositionexport' and name='模板下载');

INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `pubts`, `auth_level`, `note`,
                   `alias_code`, `subId`)
select 'aa_goodspositionimport', '导入', 'aa_goodsposition', 3, NULL, 5, 0, NOW(), 5, NULL, NULL, 'upc' from dual where
not exists(select 1 from auth where code='aa_goodspositionimport' and name='导入');


update bill_toolbaritem
set authid='aa_goodspositionimport'
where billnumber='aa_goodsposition' and name ='btndropdown';
update bill_toolbaritem
set authid='aa_goodspositionexport'
where billnumber='aa_goodsposition' and name ='btnTempexport';
update bill_toolbaritem
set authid='aa_goodspositionimport'
where billnumber='aa_goodsposition' and name ='btnImport';


update bill_command
set authid='aa_goodspositionexport'
where billnumber='aa_goodsposition' and name ='cmdTempexport';
update bill_command
set authid='aa_goodspositionimport'
where billnumber='aa_goodsposition' and name ='cmdImport';
# 20201218
update bill_toolbaritem item1 inner join bill_toolbaritem item2 on item1.tenant_id=item2.tenant_id
set item1.parent=item2.id
where item1.billnumber='aa_goodsposition' and item1.type='menuitem' and item2.type='dropdownbutton' and item2.billnumber='aa_goodsposition';



前端地址
后端地址 寻找方式：前端项目的package.json中的SER_URL配置
数据库 流水线的配置文件
redis
linux
zookeeper
dubbo

select u.yxyuserid
from user u
         inner join productapplyrange r on u.iShopID=r.shopId
where r.shopId is not null;
select * from productapplyrange where shopId=4;

select iShopID
from user where user_type=4 and yxyuserid='75c53303f2b94985963735919cb6b905';



select yxyuserid,iShopID,tenant_id
from user where user_type=4 and  yxyuserid='700b8c148bbd40648498f0f799ae649a';

select *
from billruleregister where tenant_id='731215278067968' and action='delete' and billnum='aa_userlist' order by iorder ;


select * from information_schema.innodb_trx;
# select * from information_schema.
kill 21499;


SELECT
 *
FROM
 information_schema.innodb_trx i,
 PERFORMANCE_SCHEMA.events_statements_current c,
 information_schema.PROCESSLIST b,
 PERFORMANCE_SCHEMA.threads t
WHERE
 t.thread_id = c.thread_id
 AND i.trx_mysql_thread_id = b.id
 AND t.processList_id = b.id;


select tenant_id
from bill_base
where id = 1000778366;



select *
from tenant where id=1292161350684928;


select *
from aa_goodsposition;

select *
from aa_warehouse;


# 6666666666666666666666666666666666666
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

#delete from billruleregister where ruleId='saveGoodsPositionBeforeRule';
#here!!!!!!!!!
# [自定义]保存insert[货位]前校验
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_goodsposition',
       'save',
       'saveGoodsPositionBeforeRule',
       21,
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
select 'aa_goodsposition', 'save', 'saveGoodsPositionBeforeRule', 21, null, 0, null, true, null,
       null, 0, null, null
from tenant where not exists(select 1 from billruleregister where billnum='aa_goodsposition' and action='save' and ruleId='saveGoodsPositionBeforeRule'
    and tenant_id=0 and `key` is null) limit 1;




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

#货位 模板导入自定义项的事
update billitem_base item inner join bill_base bill on item.iBillId = bill.id and item.tenant_id = bill.tenant_id
    set item.isExport=0
where item.cName like '%headDefine%'
  and bill.cBillNo = 'aa_goodsposition';


#快速定义相关 已废弃!
delete from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and sourceattr='erpCode';

#导入 货位 相关
INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 0, 'GoodsPosition', 'aa_goodsposition', 'warehouseId_name', 'code', 'warehouseId', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='warehouseId_name' and type=0) limit 1;

INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 0, 'GoodsPosition', 'aa_goodsposition', 'parent_name', 'code', 'parent', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='parent_name' and sourceattr='code' and type=0) limit 1;


#货位 更新导入
INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 0, 'GoodsPosition', 'aa_goodsposition', 'code', 'code', 'id', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='code' and sourceattr='code' and target='id' and type=0) limit 1;








#20201230
INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 1, 'GoodsPosition', 'aa_goodsposition', 'warehouseId_name', 'code', 'warehouseId', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='warehouseId_name' and type=1) limit 1;

INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 1, 'GoodsPosition', 'aa_goodsposition', 'parent_name', 'code', 'parent', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='parent_name' and sourceattr='code' and type=1) limit 1;


#货位 更新导入
INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget,
                                   extra_condition, tenant_id, sort)
select 1, 'GoodsPosition', 'aa_goodsposition', 'code', 'code', 'id', null, null, null, null, 0
from tenant where not exists(select 1 from billforeignkey where entityname='GoodsPosition' and billno='aa_goodsposition' and source='code' and sourceattr='code' and target='id' and type=1) limit 1;




desc shopproductview;





【A安装环境】-【开发环境】 业务中台安装器：http://172.20.53.21:10000/ admin/123 技术中台地址：http://172.20.59.4/ isvadmin/isvadmin123 访问地址：https://9yuan-a.yyuap.com/workbench/#/ yhtmanager/manager@2020 Host: 172.20.53.29 9yuan-a.yyuap.com 数据库：172.20.53.28:3366 库账号：root/rM6Jl5pmapMiVC0Z 安装盘：iuap5-premises_YonBIP202006CAEP_20200921-32.tar 外部域名：172.20.53.29/9yuan-a.yyuap.com 内部域名：172.20.53.208/workbench.imp.pub.caep 【B安装环境】-【生产环境】 业务中台安装器：http://172.20.59.3:10000 admin/123 技术中台地址：http://172.20.59.4/ isvadmin/isvadmin123 访问地址：https://9yuan-b.yyuap.com/workbench/#/ yhtmanager/manager@2020 Host: 172.20.59.241 9yuan-b.yyuap.com 数据库：172.20.53.28:4466 库账号：root/rM6Jl5pmapMiVC0Z 安装盘：iuap5-premises_YonBIP202006CAEP_20200924-34.tar 外部域名：172.20.59.241/9yuan-b.yyuap.com 内部域名：172.20.59.139/dev.imp.pub.caep