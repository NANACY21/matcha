# [教程/文档]
# 数据库内容，经后端->前端，到前端变成json，前端读取这些json以加载/显示页面

aa_enum表：枚举表；
bill_base表：用于定义页面，其字段cBillNo标记唯一页面，一行元组 -- 一个页面，不同租户页面不同；
billentity_base表：该页面涉及到的实体类；
billtemplate_base表：页面大框 每个页面都一样的；
billtplgroup_base表：页面的上下左右区域，每个页面也差不多；
billitem_base表：其字段cFieldName：成员变量，cName：json串的键。每一行元组 -- 一个组件。其cShowCaption字段即html的label；
读取其字段以在页面上显示品牌属性及控件。包含brand表的字段；
billruleregister表：用于注册，其字段ruleId -- bean id，billnum字段 -- 页面编号；
brand表：品牌表，其字段为品牌属性；
pub_ref表：参照表，reftype字段和code字段值一样；
excel中，对应数据表名；
物料档案列表.xlsm


# [解释]
一个环境 一个billnum
0租户/非0租户
excel->sql脚本 执行 为0租户的
非0租户 给定billnum再执行
# [bill_base]
# bill_base表 cBillNo相同 租户不同 id不同
# 相同页面 每个租户的页面id不一样 编码cbillno一样
# [billitem_base]
# 表格中 列宽iColWidth 200 设置为1看不到
# [bill_command]
# action 为list 时 authid为 服务编码


# [模板导出][导入]
billitem_base cStyle提示
有上下级关系的 billforeignkey表 配置 以解析导入信息
billforeignkey表 type 0:导入 1:api
导入遇到的问题:billforeignkey type 引用校验
注意更新导入的问题


UI  会先去找 领域元数据
生成非0租户/某页面 这俩文件重要!