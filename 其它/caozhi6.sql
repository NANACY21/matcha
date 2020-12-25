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


desc  productextendview;


