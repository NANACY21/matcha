# [用户]
select *
from user
where tenant_id = 1221385947746560
  and user_type = 4;

# [角色]
select *
from role;

# [权限]
# ys 领域云 都提供脚本
select *
from auth;

select *
from user_role;
select *
from role_auth;

select *
from usertype_authlevel;


# [菜单] 前端ui元素
# 1.有无菜单
# 2.菜单显不显示
# 领域云 执行sql以加菜单
# ys 加菜单找刘景新 不手动执行sql
select *
from pb_menu_base
where tenant_id = 1221385947746560;


select *
from pb_menu_lang;

# [权限问题]
加权限隐藏：
insert->单个租户升级（测试环境下就有菜单了）->同步流水线->授权按钮->查询当前登录用户的角色->角色管理->选我的角色编辑

单个租户升级：查找指定租户->领域列表
全租户升级：选择指定领域->租户列表