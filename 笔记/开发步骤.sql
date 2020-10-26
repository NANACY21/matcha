# 数据有实体、对应MySQL表，元数据也有实体，对应MySQL表


# 1：设计领域元数据xml   pc.userdef.xml
# 2：Java实体类修改     Userdefine
# 3：Java实体类对应MySQL数据表字段修改   userdefine
# 4：设计UI元数据 excel （或者直接操作数据库 insert）  billnum = pc_spepro
# 5：ys要 元数据管理后台上传xml 测试 daily 上传后立刻好使！！
# 6：提交sql脚本 dml（增删值） ddl（改表结构）
# 7：Rule
# 8：Redis缓存 db0 db4

# 铁子 清缓存！！！
# 铁子 上传元数据！！！20201010！！！
# 总的就是：
# 提交前后端代码、sql脚本
# 前端：js扩展脚本
# 后端: rule 实体类 xml mapper.xml sql


# 类与类 基础数据之间的关系 引用 参照 怎么看的？？  关联关系

# 20200728
# 别修改billcontroller 原有接口的代码 ！！！业务逻辑写在rule里 可以自定义接口url
# 对外提供的接口是ApiBillController

# 按钮支持重复调用 已启用时再点启用 仍试图启用
# 删除用户时 用户不存在 也是删除成功

# 租户id
# cb.rest.AppContext.tenant.id
# ys
# cb.rest.AppContext.productcenter.tenant.id


# 别的领域调用时 他的token：
# http://udhitg.yonyouup.com/api/archives/system/yxytoken?isArchive=1
# data token
# 同步、异步rule
# 同义词转换！！！
# 谁提的问题 谁测