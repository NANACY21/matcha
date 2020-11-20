基础服务 注册页面 注册 user、tenant表各增一行 user 为租户管理员
验签

其它领域注册后 基础服务 user、tenant表各增一行


properties别提交
本地测可以加properties
@Value肯定和properties有关


[参照]
# 要知道引用的参照：ui元数据、业务数据 在哪个领域
预置(ui元数据) 在pc/3u
查数据(业务数据表) 在pc/3u
billitembase reftype字段：productcenter.**->该参照ui元数据在productcenter

pub_ref表 cbillnum 字段有值->预置ui元数据在自己领域