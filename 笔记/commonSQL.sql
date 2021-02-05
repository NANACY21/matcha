# 常用SQL语句
select id from tenant where alias = 'x30fk78m';

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
where tenant_id = 2105547231727872
  and billnum in ('aa_goodsposition', 'common')
  and action = 'refer'
order by iorder;

select action
from billruleregister group by action;

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
where billno = 'aa_goodsposition' and tenant_id=0;

update billforeignkey
set extra='id as headDefine!id'
where type = 0
  and entityname = 'GoodsPosition'
  and billno = 'aa_goodsposition'
  and source = 'code'
  and sourceattr = 'code'
  and target = 'id'
  and extra is null;


