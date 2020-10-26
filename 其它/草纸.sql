select action
from billruleregister group by action;

select *
from user where code like '%lichi%' and user_type=5;

select *
from billruleregister
where action = 'query'
  and billnum in ('aa_userlist', 'common')
  and tenant_id = 1221385947746560;

传参赋值 对象赋值 -> 影响生成的sql，