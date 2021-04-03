# 常用SQL语句
select id, name,isOpen
from tenant
where alias = 'gf3g1m9k';


select tenant_id from bill_base where id = 1001041213;

select * from aa_goodsposition where id = 2037939080892672;

# 加签验签
select * from apiuser;

select yxyuserid
from user where user_type = 4 and yxyuserid = '75c53303f2b94985963735919cb6b905';

select *
from billforeignkey WHERE entityname = 'GoodsPosition';

select *
from pub_ref where code like '%goods%';

select *
from billruleregister
where tenant_id = 0
  and billnum in ('aa_merchant', 'common')
  and action = 'save'
order by iorder;



select cName
from bill_base where cBillNo='pc_speprolist' and tenant_id=0;

select action
from billruleregister group by action;

select *
from billruleregister where tenant_id=0 and ruleId='deleteNotifyNewRule';
select *
from auth where code like '%aa_goods%';



select item.cName, item.cCaption, item.bMustSelect, item.bSelfDefine
from billitem_base item
         inner join bill_base bill on bill.id = item.iBillId
where bill.cBillNo = 'aa_goodsposition'
  and bill.tenant_id = 0;

update billitem_base item inner join bill_base bill on item.iBillId = bill.id
set item.bSelfDefine=1
where bill.cBillNo = 'aa_goodsposition'
  and item.cCaption = '货位自定义项id';



select *
from billforeignkey
where billno='pc_spepro';


INSERT INTO billforeignkey (type, entityname, billno, source, sourceattr, target, extra, extraTarget, extra_condition,
                            tenant_id, sort)
select 1,
       'UserDefineClassSpec',
       'pc_spepro',
       'showItem',
       'showItem',
       'id',
       'defineId as defineId',
       null,
       '{"conditions":[{ "v1":"productSpec","v2":null,"arr1":null,"name":"classId", "op":"eq" }],"op":"and"}',
       null,
       0
from dual
where not exists(select 1
                 from billforeignkey
                 where entityname = 'UserDefineClassSpec'
                   and billno = 'pc_spepro'
                   and source = 'showItem'
                   and sourceattr = 'showItem'
                   and target = 'id'
                   and type = 1);


desc userdefine;
desc userdef_base;

https://u8cupcb-daily.yyuap.com/api/upc/save
https://u8cupcb-daily.yyuap.com/bill/save





update billforeignkey
set extra='id as headDefine!id'
where type = 0
  and entityname = 'GoodsPosition'
  and billno = 'aa_goodsposition'
  and source = 'code'
  and sourceattr = 'code'
  and target = 'id'
  and extra is null;

select ruleId
from billruleregister where tenant_id=0 and iorder=199;


select *
from billruleregister where tenant_id=0 and ruleId='deleteNotifyNewRule';






