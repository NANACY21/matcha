# 本地下，线上不用这样
select *
from pb_menu_base
WHERE menu_code = 'pc_addressarchiveslist'
  and tenant_id = 0;


select *
from pb_menu_lang
WHERE menu_name = '原因档案'
  and tenant_id = 0;


select *
from pb_menu_base
WHERE menu_code = 'pc_attachmentgrouplist'
  and tenant_id = 0;


-- 该父菜单下的菜单ordernum
select *
from pb_menu_base
WHERE pmenu_code = 'aa_sendtrans'
  and tenant_id = 0;


select *
from pb_menu_base
WHERE pmenu_code = 'aa_businessarchives'
  and tenant_id = 0;


-- 查询租户
SELECT *
from tenant;


-- 查询用户 租户下有很多用户
SELECT *
from user
WHERE tenant_id = 1292161350684928
  and email = 'u8c_vip@163.com';


-- begin
-- 新增菜单
insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'pc_attachmentgrouplist', 'AA', 1, 'aa_sendtrans', 'pc_attachmentgrouplist', 400, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'pc_attachmentgrouplist', NOW(), 0, 1, 1, NULL, 3, 0, tenant.id, NULL, '1', 1 from pb_menu_base menu
inner join tenant on menu.tenant_id = tenant.id
where not exists (select * from pb_menu_base where menu_code = 'pc_attachmentgrouplist' and tenant_id <> 0);


insert into pb_menu_base (`id`, `menu_code`, `subid`, `ilevel`, `pmenu_code`, `auth_id`, `ordernum`, `depends`, `flag`, `imagename`, `viewtype`, `menu_url`, `metatype`, `metakey`, `pubts`, `ideleted`, `bendgrade`, `bEA`, `icon`, `auth_level`, `isshoprelated`, `tenant_id`, `propertytype`, `terminalType`, `isSystem`)
select distinct 0, 'pc_attachmentgrouplist', 'AA', 1, 'aa_sendtrans', 'pc_attachmentgrouplist', 400, NULL, 1, NULL, 'meta', NULL, 'voucherList', 'pc_attachmentgrouplist', NOW(), 0, 1, 1, NULL, 3, 0, 0, NULL, '1', 1 from pb_menu_base
where not exists (select * from pb_menu_base where menu_code = 'pc_attachmentgrouplist' and tenant_id = 0);


-- DELETE  from pb_menu_base where menu_code='pc_attachmentgrouplist';


SELECT *
from auth
WHERE `code` = 'pc_addressarchiveslistlist';





INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'pc_attachmentgrouplist', '附件分组', 'zh-cn', NOW(), 0, tenant.id from pb_menu_lang lang
inner join tenant on tenant.id = lang.tenant_id
where not exists (select * from pb_menu_lang where menu_code = 'pc_attachmentgrouplist' and menu_name = '附件分组' and tenant_id <> 0);


INSERT INTO pb_menu_lang (`id`, `menu_code`, `menu_name`, `localeid`, `pubts`, `ideleted`, `tenant_id`)
select distinct 00000000000000000000, 'pc_attachmentgrouplist', '附件分组', 'zh-cn', NOW(), 0, 0 from pb_menu_lang
where not exists (select * from pb_menu_lang where menu_code = 'pc_attachmentgrouplist' and menu_name = '附件分组' and tenant_id = 0);


-- DELETE  from pb_menu_lang where menu_code='pc_attachmentgrouplist';
-- 新增菜单ok



-- end


SELECT *
from auth
WHERE `code` = 'pc_attachmentgrouplist';


SELECT *
from auth
WHERE `parent_id` = 'aa_businessarchives';