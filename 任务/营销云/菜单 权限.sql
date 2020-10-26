20200806晚：这个我没解决 转给程云吉了！！！
# 不需要写代码！！！
给商家管理员/商家操作员正常分配角色，
跳基础服务时：
商家管理员：有商品中心、用户管理菜单。只能显示自己创建的所有操作员，这没问题了。
商家操作员：只有一个商品中心菜单（未分配角色时的状态） 之前用户管理能看到所有用户 现在把用户管理菜单去掉。


1.给用户分配角色 读取分配的角色
2.读默认权限 （不受权限控制） ：根据用户类型对应auth_level

user_type=4：他有被分配角色 但不受权限控制 默认权限还得改一下
user_type=5：他有被分配角色 但不受权限控制

# and iCustID=''


# iCustID赋值
update user
set iCustID=iShopID
where user_type = 4
  and iCustID is null
  and registersource in (0);

select *
from user where user_type = 4
  and iCustID is null
  and registersource in (0);

update user a
join pc_customer b on a.`code` = b.iUserCode
set a.iCustID = a.iShopID
where a.iCustID is null
and registersource = 0;


# 解决！！！
select *
from usertype_auth where usertype=5
# limit 10;

select *
from usertype_auth limit 10;


select *
from auth
where code like '%aa_userlist%';


# 设置 不受权限控制时 默认菜单列表
# 商家管理员
insert into usertype_auth(usertype, auth)
SELECT 4, code
from auth
where code like '%aa_userlist%'
  and not exists(select 1 from usertype_auth where usertype = 4 and auth like '%aa_userlist%');


# 商家操作员 不受权限控制时 商品中心里默认四个菜单 4条insert
insert into usertype_auth(usertype, auth)
SELECT 5, code
from auth
where code like '%pc_product%'
  and not exists(select 1 from usertype_auth where usertype = 5 and auth like '%pc_product%');

select *
from auth
where code like 'pc_product%'
  and parent_id = 'pc_product';



select 4, code
from auth
where `code` like 'pc_product%' and (parent_id = 'pc_product' or code = 'pc_product')
and not exists(select * from usertype_auth a where a.usertype = 4 and a.auth = auth.code);


select 4, code
from auth
where `code` like 'pc_goodsproductskupro%' and (parent_id = 'pc_goodsproductskupro' or code = 'pc_goodsproductskupro')
and not exists(select * from usertype_auth a where a.usertype = 4 and a.auth = auth.code);


select 4, code
from auth
where `code` like 'pc_presentationClass_shop%' and (parent_id = 'pc_presentationClass_shop' or code = 'pc_presentationClass_shop')
and not exists(select * from usertype_auth a where a.usertype = 4 and a.auth = auth.code);


select 4, code
from auth
where `code` like 'pc_product_query%' and (parent_id = 'pc_product_query' or code = 'pc_product_query')
and not exists(select * from usertype_auth a where a.usertype = 4 and a.auth = auth.code);
