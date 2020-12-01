u8cdev分支
    UStock\scripts\mysql\aa_product\DDL\aa_product_view_20200710_1.sql 视图sql 维护!
u8c-pre-release分支
    aa_product_view.sql


UStock\meta-models\product.xml 视图xml 维护!
UStock\meta-models\productnew_complete.xml 真实表

执行sql->上传xml
sql:导出ddl -> 加字段 -> 粘贴到文件里 -> 提交
xml:日常 本地/元数据管理后台一致;


视图:别用create/replace 用alter;


desc productapplyrangedetail;
show create table productExtendView;->ddl







