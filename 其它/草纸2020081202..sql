select *
from user where code like '%dahan%' and name like 'test%';

userType=-1:
test1@dahan 123456
所有菜单
userType=0:
test2@dahan 123456
所有菜单
userType=1:
test3@dahan 123456
商品中心->产品线
系统设置->通道交换信息
userType=2:
test4@dahan 123456
无菜单
userType=3:
test5@dahan 123456
无菜单
userType=4:
test6@dahan 123456
商品中心(那4个子菜单)
userType=5:
test7@dahan 123456
商品中心(那4个子菜单)

select *
from user
where yxyuserid='019aaec0196547198125e26aa3c5158e' and user_type=1;

谁调用 token就一直是哪个领域
token被重写？

select *
from mp_department where tenant_id=1347014292918528;


select *
from mp_aa_org
where (cName = '002' or cFullName='002' or cCode='002') and tenant_id=1347014292918528;

select *
from pub_ref where code='aa_cust';
select *
from billforeignkey WHERE entityname='Department';


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
from billruleregister
where tenant_id = 1347014292918528
  and billnum in ('aa_department', 'common')
  and action = 'save'
order by iorder;




if (null != parent) {
                HashMap<String, Object> map = new HashMap<>();
                map.put("cErpCode", parent);
                map.put("tenant", AppContext.getCurrentUser().getTenant());
                Long id = SqlHelper.selectOne("com.yonyoucloud.upc.aa_user.dao.DeleteUserBeforeRule.getParentId", map);
                bill.set("parent", id);
            }

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

select *
from pub_ref where code='aa_goodspositionref';






select *
from billtplgroup_base where cStyle like '%tab-padding-bottom%';


select *
from mp_department where tenant_id=1347014292918528;


select count(*) from user where tenant_id=1869389165678848 and email='16525411111@qq.com';

select *
from pub_ref where code like '%cust%';

select *
from bill_base where cBillno='aa_customerref';


导入没验重->第一反应 导入请求 中 加验重方法 其实不必如此 导入走了saveuserbeforerule
只需加服务参数 因为导入是另一个服务



什么时候上预发 问测试
最晚什么时候上预发 问陈哥


select *
from user where mobile=17912341234;


