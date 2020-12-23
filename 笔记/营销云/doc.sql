# [教程/文档]
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



ProductController /billImport 商品档案导入


[3U功能]
[订货]
订货新增/编辑用户->基础服务会同步新增/更新用户
基础服务新增用户->订货不会同步新增用户
[任务]基础服务编辑用户->订货会同步更新用户 开没开通订货 订货该用户是否存在


营销云环境 订货没有开通时，可以在基础服务用商家管理员的身份登录，创建商家操作员；订货若开通，商家管理员则不能在基础服务新增商家操作员；
商家管理员新增商家操作员时不能给商家操作员分配角色；


加盟客户直连：加盟商账号登录时，如果已经开通了U订货，但零售系统参数加盟客户档案来源设置为基础服务，应该允许在基础服务增加用户
AA_aa_userlist_VM.Extend.js
已开通订货并且来源不是基础服务->不能新增 先本库判断是否开通零售


[零售]
# 零售开单


[基础服务业务]
三大档案 物料 客户 供应商（已移除）

domain：
基础服务 productcenter
零售 retail

ui元数据请求
通用查询 不用写sql
动态dao层


user表 registersource字段
0 upc
1 mall
2 会员
3 订货
4 零售

调用：dubbo(rpc) request metahelper QueryConditionGroup
3U 优先dubbo调用
[领域模型]就是对象

领域云 SYSCODE 系统编码
U订货 UOrder
U会员 UMember 罗敏
零售 URetail
商城 UMall 陈志峰
基础服务 upc


# [itg/预发]区别
# [MySQL]
billtplgroup_base表 cDataRule字段 预发 没有 itg 有
该字段 itg 预发 都忽略 该字段有问题