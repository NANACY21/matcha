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


[服务注册]
一个main - 一个服务
本地启 启一个服务 调其它服务时 其他服务不在本地
那个服务挂了 本地和itg应该效果一样 但是本地和itg zookeeper配置不同，用的不是同一个zk实例...
现在 改成本地/itg用同一个zk实例（service.properties中设置）
zookeeper/dubbo
服务提供者/消费者
zookeeper的所在ip地址 端口 不同 多个zookeeper