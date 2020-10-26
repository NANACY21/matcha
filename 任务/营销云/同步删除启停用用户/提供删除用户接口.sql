# 从3U删除用户 调我接口 基础服务有校验 3u也先删了？？对就这样？  事实上，有校验 不调3U接口了（都不删了） 就这样！
# ok
# 会员，商城是去掉删除的功能，需要删除跳转基础服务操作
# postman 传参格式要正确 json格式校验一下！！！

# U订货删除用户时调用基础服务的删除用户接口把基础服务中这个用户删了
# 我提供的接口url：提供调用我服务的接口
# 他调用我时他给我的参数（暂时）：
# {"billnum":"aa_userlist","data":"[{"yxyUserId":4b24b0ede63a421b8537333091deb644}]"}



#
# 我拿到他给的这个参数 用于转化数据 从而删除基础服务这个用户
# 我提供的接口的功能：删除基础服务中这个用户
# 执行这个Rule会不会影响后面的Rule？
# 为指定租户注册rule 要为所有租户注册rule 调试完删除这一条
INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'delete', 'deleteUserFirstRule', 20, null, 1221385947746560, null, true, null,
        null, 0, null, null);


# 为所有租户注册rule！
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'delete',
       'deleteUserFirstRule',
       20,
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
                 where billnum = 'aa_userlist' and action = 'delete' and ruleId = 'deleteUserFirstRule');
# 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'delete', 'deleteUserFirstRule', 20, null, 0, null, true, null,
        null, 0, null, null);



# 给别人提供接口前需要自己先验证一下调通了，假设自己是U订货 自己调用一下提供的这个接口 看是否能删除基础服务中这个用户！！！

