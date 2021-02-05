# [教程/文档]
# [物料]
# 物料，相对于工厂即产品，相对于客户即商品
# [相关领域元数据]productextend.xml/productnew.xml/productnew_complete.xml
# [物料视图元数据]product.xml
物料规格(规格档案) 规格值启用状态 影响2处：
1.物料档案 选择 物料模板 后 出现sku页签中 有物料规格
2.物料模板 中 物料规格


# [货位物料对照]
# 新增对照时 物料按使用组织过滤
# 当前登录用户有权限的组织、当前仓库的库存组织 交集



# [货位]
# 仓库参照 仓库按库存组织过滤
# 显示 无库存组织的仓库、有权限的库存组织的仓库
select org_id
from aa_warehouse where (org_id is null) or(org_id in (当前登录用户有权限的组织id列表));


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


[货位固定自定义项]
# 1.领域元数据
# 2.java实体类 不需要
# 3.mysql 表一张! [后置任务]
# 4.货位树卡ui元数据
# 5.货位参照ui元数据
# 了解实现机制：模型驱动开发
# 修改一个功能不影响另一个功能
# 对扩展开放 对修改关闭


本地启ys：
本地启动服务后，先登录ystest环境
[更换环境]UPC-Web\package.json：SRV_URL=http://localhost:8000换成http://upc-server.test.app.yyuap.com

daily远程端口


应用：基础数据
菜单：数字化建模

什么机制不懂就去问平台，问申波 比自己探索强
数据权限 列表 ui元数据配完自然有数据权限
defaultreferrule 再做一下


菜单（侧边栏） 数字化建模
规格 数字化工作入口（单组织）
应用 基础数据

[API]
分页的api入参带condition
列表的是simple 见仓库列表查询
simpleVOs为根节点的 废弃！


[客户分类]
管理组织 创建的该客户分类

MySQL>领域元数据>UI元数据

[可分可合专属化]
可分可合环境B（分开部署调试功能）
    访问地址：https://2021-b.yyuap.com/workbench yhtmanager/manager@2020 host: 172.20.50.146 2021-b.yyuap.com
    技术中台：172.20.50.238 isvadmin/isvadmin123
    安装器： 172.20.50.35:10000 admin/123
    mysql数据库: 172.20.50.156:3306 root/123456789aA!
    服务器密码： Yonyou@1988-2020 端口 49622
可分可合环境A（合并部署抽公共lib）
    访问地址：https://2021-a.yyuap.com/workbench yhtmanager/manager@2020 host: 172.20.59.19 2021-a.yyuap.com
    技术中台：172.20.59.29 isvadmin/isvadmin123
    安装器： 172.20.59.170:10000 admin/123
    mysql数据库: 172.20.45.169:3306 root/123456789aA!
    postgres数据库: 172.20.45.169:5432 postgres/123456789aA!
    服务器密码： Yonyou@1988-2020 端口 49622
可分可和环境C
    访问地址：https://2021-c.yyuap.com/workbench yhtmanager/manager@2020 host: 172.20.58.53 2021-c.yyuap.com
    技术中台：172.20.58.50 isvadmin/isvadmin123
    安装器： 172.20.58.101:10000 admin/123
    mysql数据库: 172.20.58.68:3306 root/123456789aA!
    服务器密码： Yonyou@1988-2020 端口 49622
今天新装的是A环境，测试在这个环境测试验证； 研发修复bug后调试在B环境； C环境已经重置，大家今天提交的新盘会装在C盘


A环境网站登不上 依次登B/C环境网站以测试
登录安装器 业务中台 查看详情 下载安装报告 以查看redis连接信息 masterNodesStr
可分可合ABC环境 不用打补丁 sql的直接执行验证data.sql提交 需要执行流水线
前后端代码提交后 执行流水线 明天早上出友空间群发新环境信息/友空间群公告 登录网站以测试
登录A环境安装器 业务中台显示"安装中" 导致redis连接信息看不到 表示A环境不可用 换下个环境
看日志：环境信息->技术中台->应用部署管理->看日志 cd logs cd lib/ll cd webapps/ cd logs pwd
root@online-upc-server-5b95b7c7d6-nz7hn /u/l/t/w/logs #
redis：环境信息->技术中台->应用部署管理->配置文件->redis连接信息 执行rule后一定有rule相关的redis缓存

执行rule后没有生成rule的redis缓存 说明redis连的不对
可分可合A redis2个 元数据的 rule的


提交前后端代码 sql脚本 公用测试产品线 执行流水线 等第二天验证
等不了日清 要打补丁
后端分支：iuap-release-20210320
前端分支：iuap-release-20200320
徐诗云

最后一个盘 如果需要打补丁：补丁制作 补丁使用 如果只有sql脚本 就不需要打补丁 前后端代码才需要打补丁
# 可分可合 rule注册到MySQL里不像公有云那么写 data.sql文件执行那会儿 租户表0行数据！ 初始化时租户表0行数据 insert 不能关联租户表 看下别人insert rule咋写的


[九院]
A环境：测试环境
B环境：已废弃
后端分支：u8c-pre-release-solidification
前端分支：premises-yonbip202006-on-0715-xingyu20200827
标准盘后端流水线： iuap5_0业务中台专属化 ...server 开发环境 九院借这个流水线打补丁
标准盘前端流水线： iuap5_0业务中台专属化 ...web 生产环境 九院借这个流水线打补丁

九院测试环境测试过了 再打补丁
上线操作：
1.提交前后端代码/sql脚本到指定git分支
2.执行这两个前后端流水线 结束后的构建产物jar war 和sql脚本 这三者打成zip包+readme.txt 发给田小丹
网址 xml下载json文件
3.元数据上传操作 也要发给田小丹
4.加菜单：刘景新协作打补丁
5.毕玉松：auth表按钮权限 auth表同步
6.黄营：实体接口 只有领域元数据 发我json文件 一块放在补丁里
7.九院现场也要有开发工程师手动执行sql文件

菜单 auth表权限同步 租户升级
登九院A环境技术中台 开发环境流水线 搜索upc 上传构建产物 上传后执行流水线 至此 后端代码上去了



九院元数据补丁 九院A环境（测试环境）是要的 测试环境xml打成补丁 测试环境xml与公有云日常 预发不同 因此不能从日常下载json
要登技术中台安装器 业务中台 下载安装报告 以连接mogodb
select * from metadata.metaclass where uri={实体1，实体2}
查询结果导出json 命名为metaclass.json放入补丁里 至此，九院元数据补丁ok 货位那种和日常预发一样的 直接下载日常的json放到补丁里即可。



前端 李篪
后端 李篪
元数据（提供补丁） 李篪
固定自定义项，平台的接口元数据  黄营
仓库参照 程云吉
sql(表，ui数据) 李篪
菜单，权限  李篪提供脚本


0 菜单，权限
1 提交前后端代码
2 整理好sql，在开发环境执行
3 元数据升级（包括黄营的）
4 自测增删改查


传参赋值 对象赋值 -> 影响生成的sql，