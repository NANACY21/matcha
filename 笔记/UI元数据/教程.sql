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
物料档案列表.xlsm；