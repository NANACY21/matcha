

select iEnableCyclePurchase
from product_tpl where id= 2142668309386240;

select entity.cDataSourceName
from billentity_base entity
         inner join bill_base bill on entity.iBillId = bill.id
where bill.cBillNo = 'pc_speprolist'
  and bill.tenant_id = 0;


select *
from bill_base where tenant_id=0 and cBillNo='pc_productskupro';

select iEnableCyclePurchase
from product_tpl where iEnableCyclePurchase is null;
select pro.id
        from product_tpl tpl
                 inner join product pro on tpl.id = pro.oSPTemplate_id
        where pro.id = 2141314367590656
          and pro.oSPTemplate_id is not null
          and tpl.iEnableCyclePurchase = true;


select svcurl
from bill_command where svcurl!='/bill/billImport' and tenant_id=0 and name like '%import%';


select *
from pub_ref where code='';


select *
from v_orgs where tenant_id=1292161350684928;


select * from billforeignkey where billno='aa_merchant' and type=1;


select *
from aa_goodsposition_define where id=1954363840057600;


update billitem_base item inner join bill_base bill on item.iBillId = bill.id
set item.bHidden=0,
    item.bShowIt=1
where bill.cBillNo = 'aa_warehouse'
  and item.cCaption = '详细地址';


select * from bill_base where cBillNo='pc_spepro'




select *
from billforeignkey where billno='pc_spepro' and type=1 and source='org_code';

delete
from billforeignkey
where entityname = 'UserDefineSpec'
  and billno = 'pc_spepro'
  and source = 'code'
  and sourceattr = 'code'
  and target = 'id' and type=1;

select *
from userdef_base where tenant_id=2142668309386240;


















select *
from merchant where cCode='lihu'


select *
from billforeignkey where billno='pc_managementclass' and type=1 and source='org_code';







select erpCode
from brand;
select code,erpCode
from product_management_class where tenant_id=2145517607293184 and code='test030200596';

select *
from v_orgs where cName='企业账号级' and tenant_id=1292161350684928;
select *
from aa_enum;

select *
from settle_method where tenant_id=0;

delete from settle_method where ccode = '现金返利' and cname = '现金返利'


select *
from tenant where id=0;





select * from settle_method where cCode like '%system%'

select *
from settle_method
where cCode='3' and tenant_id=0;


select *
from product_management_class where tenant_id=2145517607293184 and code like '%lichi%';


select ccode,tenant_id from settle_method group by ccode, tenant_id
having count(*)>1;


select * from tenant WHERE id in ( select id from  tenant group by id having count(id)>1)


select *
from settle_method where cCode='现金返利' and pubts>'2021-03-16 19:00:00';










SELECT * FROM bill_base WHERE cBillNo='aa_sendtransway' and tenant_id=0;
select *
from billentity_base where iBillId=1001284312;



select cCode
from v_orgs where tenant_id=1292161350684928;



select id
from merchant where merchant.cCode = '0326001';


select *
from merchantroleinfo where imerchantId=2178018371047936;

select *
from v_orgs where tenant_id=2145517607293184;
select *
from merchantsmanager where imerchantId=2188000981881088;



select code,erpCode
from product_management_class
where erpCode is not null;



select *
from billforeignkey where billno = 'pc_product' and type = 1 and target = 'manageClass';


select *
from pub_ref where code='aa_invoicemerchantref';





select *
from tenant where id=1720879008420096;


检查入参是否填写正确，参数值是否真实存在，仍提示该信息请联系开发人员。



请求结果状态码
请求结果信息
请求结果数据
真实类型
实体名称
主键字段
实体状态
租户id
是否停用状态，true：已停用，false：已启用


select *
from tenant where alias='g0qsdea4';


select *
from userdefine
where name in('lcc','l66','aa') ;


select *
from userdef_base
where showitem like '%lichi20210326%' or showitem='ss';



INSERT INTO `settle_method`(`cCode`, `cName`, `service_attr`, `iDepth`, `iOrder`, `sort_num`, `isEnd`, `isEnabled`,
                            `iDeleted`, `sourcetype`, `tenant_id`, `cName2`, `cName3`)
select '0003',
       '现金返利',
       3,
       1,
       0,
       0,
       b'1',
       b'1',
       0,
       b'1',
       0,
       'Cash Back',
       '現金返利'
from dual
where not EXISTS(select 1 from settle_method where ccode = '现金返利' and cname = '现金返利' and tenant_id <> 0);



select *
from product_tpl_propsource;






select cCaption,cShowCaption
from billitem_base item
         inner join bill_base bill on item.iBillId = bill.id
where bill.cBillNo='pc_producttpl' and (item.cShowCaption_resid is null or item.cCaption_resid is null) and bill.tenant_id=0;





select *
from billforeignkey
where billno = 'aa_merchant'
  and type = 1;






select *
from agentcategory where tenant_id=2145517607293184;



select *
from principal where imerchantId=2198135127249152;