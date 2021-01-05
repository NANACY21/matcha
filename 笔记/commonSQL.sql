# 常用SQL语句
select id from tenant where alias = 'ny1htdcc';

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
where tenant_id = 1347014292918528
  and billnum in ('aa_department', 'common')
  and action = 'save'
order by iorder;

select action
from billruleregister group by action;

select *
from auth where code like '%aa_goods%';