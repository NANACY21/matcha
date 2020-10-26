# 调接口 联调

# 从基础服务删除用户
# ok 别忘了清缓存
# 删除3U时要看一下有木有用户了，没了？？？？？？？？？？？？？？
# 基础服务 itg 用户及角色 用户管理 删除用户
# 从基础服务删除用户时校验相关应用是否开通 如果开通了 就调用他们的删除用户接口即可。 相关应用是否允许删除用户
# 同时把零售 电商通等的用户删除 方法内调用他们的删除用户接口

# 1.是否只能从基础服务删除用户
# 2.删除用户前是否需要校验
#
#
# 3U需要提供删除用户接口：
# [U订货]保留删除按钮 无需校验
# [U会员]去掉删除按钮  无需校验
# [U商城]去掉删除按钮 无需校验
# [友零售]去掉删除按钮 没有校验 零售没有保存用户信息 无需操作
# [电商通]
# [促销中心]
# 删除用户接口一定要支持重复调用，可能会出现，会员删除成功，调用商城报错，下次请求再调用会员。！！！
select *
from billruleregister
where tenant_id = 1221385947746560
  and billnum in ('aa_userlist', 'common')
  and action = 'delete'
order by iorder;

# 租户开通应用情况
select *
from pub_option_data
where tenant_id = 1869389165678848
  and name like '%isopen%';


select *
from pub_option_data
where tenant_id = 1876322457047296
  and name like '%isopen%';


# 删除用户触发的Rule
# 为指定租户注册rule 为了一开始的测试调试 调试完删除这一条
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'delete', 'deleteUserBeforeRule', 35, null, 1221385947746560, null, true, null,
        null, 0, null, null);

# 为所有租户注册rule！
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'delete',
       'deleteUserBeforeRule',
       35,
       null,
       tenant.id,
       null,
       true,
       null,
       null,
       0,
       null,
       null
from tenant
where not exists(select *
                 from billruleregister
                 where billnum = 'aa_userlist' and action = 'delete' and ruleId = 'deleteUserBeforeRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'delete', 'deleteUserBeforeRule', 35, null, 0, null, true, null,
        null, 0, null, null);





# 写Rule，注册Rule，清缓存，写Mapper.xml，
# 俩功能 每个功能写了2个rule的业务逻辑 启停用提供接口的rule没写！！！

select yxyuserid
from user where id in (1847067538559232);

select *
from billruleregister where action in ('delete','common') and tenant_id=1221385947746560 and billnum='aa_userlist';


select yxyuserid from user where id in (1770474006778112,1770459967918336)

select *
from user
where yxyuserid in
      ('74a637ceb1ce48f6a5318ffd10a358c9', '992d3d1978ab48ef864b1aed8bdce68b', '8e6d9fffea4f466bb72167cc4e9b9c4d');


# [20200901更新删除/启停用用户逻辑]
# 从基础服务删：调3U
# 从3U删：调我->调3U
# 调我时：
# 基础服务有用户：正常调3U删除
# 基础服务无用户：只调1u接口
# 从基础服务删：一定有用户 正常调3U删除

select *
from billruleregister where action='delete';

select *
from user where yxyuserid='019aaec0196547198125e26aa3c5158e';