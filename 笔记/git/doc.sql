# [git操作]
# itg部署好 -> 打解决 -> itg环境测试 -> 要是没问题（联调情况 双方测试都没问题 同时上demo） -> 上demo（release分支 预发环境）  步骤：
# 1.master分支的修改 提交到master分支
# 2.参照release分支新建分支
# 3.pull 切到新建的分支
# 4.找到修改的文件 和master分支比较 弄到了该新建分支上 提交commit push该新建分支（该操作 idea分支管理器 小樱桃 可配合使用）
# 5.merge请求：请求合并该新建分支到release 选好目标分支！！！
# 6.和陈哥说合并分支 至此ok
# 7.上demo 部署


# 【注意】
# 每次都要新建分支！！！不可以用我之前切的那个分支，否则用旧的副本分支合并分支时会报错，不修改同一个文件就没事
# 合并分支上预发时记得提交sql脚本！！！
# merge请求后 又提交 不用再发一次merge请求！！！
# u8cdev分支：直接提交sql脚本
# master分支：
# itg 改数据库 （不）用提交sql脚本。改的代码、sql脚本都弄到该新建分支上
# 当前分支有未提交的就切换不了分支
# idea不咋支持前端 切换分支需要在目录中切换
# 新建1219目录 放1219分支 每个目录放一个分支 这样就不用切换了


# 【操作】
# 还有俩操作在博客园
# 思考为什么建立分支 分支简介 分支新建与合并
# git reset --hard 强制回滚 全变黑

# 【问题】
# 提交sql脚本到新建的分支 有问题！！！

# 【我的锅】
# 同时部署 忘提交sql脚本


# 【git分支 & 开发部署流程】
# u8c分支 -- ys相关
# master分支 -- 基础服务 itg 本地
# master分支 db redis service peoperties文件需要itg config get

# yxyweb目录 是master分支独有的目录

# release分支 -- demo环境
# u8c-release-dbox分支 -- yonsuite沙箱环境

# 20200903
# [ys]提交代码到[预发分支的副本新建的分支]：[不用创建分支] 直接合并：u8cdev的改动 弄到预发副本分支 再提交！！！
# ys预发环境临时(相当于新建的副本分支 提交到该分支后合并merge申请-> 执行对应环境的流水线以部署 卡住 ->ys上线申请(上预发/生产申请一起勾选) [可以蹭别人的上线申请]->部署ok->预发测过了->ys上生产ok)
# u8c-pre-release 分支
# ys预发环境
# u8c-release 分支

# [注意]
# 不同分支注意切换 maven profiles 事先在本地编译一下代码!!!
# 预发临时分支的视图脚本存放目录
# UStock\scripts\mysql\z_billtemplate\DML


[注意]
在u8c目录 切到了master分支 操作：pull maven reimport
代码 不影响
maven影响 都切成对应的之后 reimport一下就好了