# [用户]
select *
from user
where tenant_id = 1221385947746560
  and user_type = 4;

# [角色]
select *
from role;

# [权限]
select *
from auth;

select *
from user_role;
select *
from role_auth;

select *
from usertype_authlevel;


# 菜单 前端ui元素
select *
from pb_menu_base
where tenant_id = 1221385947746560;


select *
from pb_menu_lang;