# ok
# 写一个Rule.java

select *
from billruleregister
where tenant_id = 1221385947746560
  and billnum in ('aa_userlist', 'common')
  and action = 'stop'
order by iorder;

select *
from billruleregister
where tenant_id = 1221385947746560
  and billnum in ('aa_userlist', 'common')
  and action = 'stop'
order by iorder;


# 一个租户 - 2行Rule注册数据
# 启用用户触发的Rule
# 为指定租户注册rule 为了一开始的测试调试 调试完删除这2条
INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'unstop', 'stopStatusChangeBeforeRule', 10, null, 1221385947746560, null, true, null,
        null, 0, null, null);

INSERT INTO billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'stop', 'stopStatusChangeBeforeRule', 10, null, 1221385947746560, null, true, null,
        null, 0, null, null);



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

select *
from user where id=1849323536371968;

select * from yxyuser a where a.iUserId=73714825699692;

desc user