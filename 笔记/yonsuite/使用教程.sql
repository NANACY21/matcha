# [物料]
# 物料，相对于工厂即产品，相对于客户即商品
物料规格(规格档案) 规格值启用状态 影响2处：
1.物料档案 选择 物料模板 后 出现sku页签中 有物料规格
2.物料模板 中 物料规格


# 上线流程
sql 检测到文件被修改就会重新执行文件全部内容
4.推一堆流水线
1.上传领域元数据
3.加菜单 执行sql工单 也需要写入YS上线申请
加权限
自己的库预置auth表数据，执行流水线以同步auth表数据到中台
2.升级菜单 升级单租户/全租户
5.上预发 新增表 发邮件或电话告知同步查询仓
视图不会自动DTS。需要查询仓手工执行    联系一下运维  帮忙执行一下吧


# 做法
u8cdev 和 预发临时分支 sql不完全相同 以预发临时为准
以后再改ui元数据 走update语句