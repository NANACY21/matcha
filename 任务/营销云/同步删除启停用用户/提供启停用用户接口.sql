# 该文件内容暂不执行！！！
# 3U启停用用户时 调用基础服务接口 同步用户启停用状态

# 一个租户 - 2行Rule注册数据
# 启停用用户触发的Rule 为了别人调接口而进行数据处理 最先的Rule
# 为指定租户注册rule 为了一开始的测试调试 调试完删除这2条
INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'unstop', 'stopStatusChangeFirstRule', 5, null, 1221385947746560, null, true, null,
        null, 0, null, null);

INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'stop', 'stopStatusChangeFirstRule', 5, null, 1221385947746560, null, true, null,
        null, 0, null, null);



# 为所有租户注册rule！
INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'unstop',
       'stopStatusChangeFirstRule',
       5,
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
                 where billnum = 'aa_userlist' and action = 'unstop' and ruleId = 'stopStatusChangeFirstRule');


INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
select 'aa_userlist',
       'stop',
       'stopStatusChangeFirstRule',
       5,
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
                 where billnum = 'aa_userlist' and action = 'stop' and ruleId = 'stopStatusChangeFirstRule');


# 现在还没有0租户的 再加一下0租户的（为已有租户注册了 新注册的租户还没有这个rule 需要参考0租户的这个）
INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'unstop', 'stopStatusChangeFirstRule', 5, null, 0, null, true, null,
        null, 0, null, null);

INSERT INTO ugoods.billruleregister (billnum, action, ruleId, iorder, overrule, tenant_id, `key`, isSystem, url,
                                     config, isAsyn, domain, dataRule)
VALUES ('aa_userlist', 'stop', 'stopStatusChangeFirstRule', 5, null, 0, null, true, null,
        null, 0, null, null);

select yxyuserid
from user where id =1830992241496320;

select *
from billruleregister where tenant_id=0 and ruleId='stopStatusChangeBeforeRule';

# 【出错记录】
# 1.性别格式不合法：
# 订货新增用户 基础服务同步新增时 性别字段不对
# 说性别 性别字段 性别字段老跳 看Java性别枚举类规定
call p_aa_updatecolumn('user','gender','ALTER TABLE `user` MODIFY COLUMN `gender` smallint(6) NULL DEFAULT 3 COMMENT "性别";','alter');

# 2.停用后，还是启用状态：
# 从订货停 postman明箱好使 按钮暗箱不好使（F12看不出鸟来）
# 明箱好使暗箱不好使 你说为啥 参数不对呗 很显然
# 但是他听话 参数我认为他传对了！！！
# 参数反了