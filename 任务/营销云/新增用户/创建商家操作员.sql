# 没开通订货时 可以新增操作员！！！
# 新增商家管理员，并以该账号登录 登录密码
select *
from user where code like '%lichi%'


select *
from user;


select *
from user where user_type=-1 and ;

新增的商家管理员 没有菜单 需要授权
user表 isOpenUdh字段没有用

# password字段是密文 不行 验证租户的开通情况
平台管理员 -1 也属于某个租户
租户管理员 0
商家管理员 4
商家操作员 商家子账号 5

商家操作员 客户档案能看见该商家所有商家操作员


缓存全清
select *
from user where tenant_id=1221385947746560;
开通订货 以租户为单元的

select *
from pub_option_data
where tenant_id = 2408
  and name like '%isopen%';


select *
from billruleregister where action='save' and billnum='aa_user' and tenant_id=0;

select *
from user where yxyuserid='7848ad85c416496c8eb2fff19bc4576a';

商家管理员新增商家操作员时不给他分配角色 （权限）


update user
set gender=3
where gender is null
   or gender = 0;
