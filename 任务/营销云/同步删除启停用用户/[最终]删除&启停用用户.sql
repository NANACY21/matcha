# 从基础服务删除用户
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


# 从3U删除用户
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


# 从基础服务启停用用户
# 为所有租户注册rule！
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'unstop',
       'stopStatusChangeBeforeRule',
       10,
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
                 where billnum = 'aa_userlist' and action = 'unstop' and ruleId = 'stopStatusChangeBeforeRule');


INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'stop',
       'stopStatusChangeBeforeRule',
       10,
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
                 where billnum = 'aa_userlist' and action = 'stop' and ruleId = 'stopStatusChangeBeforeRule');


# 现在还没有0租户的 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'unstop', 'stopStatusChangeBeforeRule', 10, null, 0, null, true, null,
        null, 0, null, null);

INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'stop', 'stopStatusChangeBeforeRule', 10, null, 0, null, true, null,
        null, 0, null, null);



# 最终提交的sql

delete from billruleregister where ruleId='deleteUserBeforeRule' and billnum='aa_userlist';
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
VALUES('aa_userlist', 'delete', 'deleteUserBeforeRule',35, NULL, 0, NULL, 1, NULL);
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
select 'aa_userlist', 'delete', 'deleteUserBeforeRule',35, NULL, id, NULL, 1, NULL from tenant;

delete from billruleregister where ruleId='deleteUserFirstRule' and billnum='aa_userlist';
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
VALUES('aa_userlist', 'delete', 'deleteUserFirstRule',20, NULL, 0, NULL, 1, NULL);
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
select 'aa_userlist', 'delete', 'deleteUserFirstRule',20, NULL, id, NULL, 1, NULL from tenant;

delete from billruleregister where ruleId='stopStatusChangeBeforeRule' and billnum='aa_userlist';
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
VALUES('aa_userlist', 'unstop', 'stopStatusChangeBeforeRule',35, NULL, 0, NULL, 1, NULL);
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
select 'aa_userlist', 'unstop', 'stopStatusChangeBeforeRule',35, NULL, id, NULL, 1, NULL from tenant;
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
VALUES('aa_userlist', 'stop', 'stopStatusChangeBeforeRule',35, NULL, 0, NULL, 1, NULL);
INSERT INTO billruleregister(billnum, `action`, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url)
select 'aa_userlist', 'stop', 'stopStatusChangeBeforeRule',35, NULL, id, NULL, 1, NULL from tenant;