select *
from user where code like '%dahan%' and name like 'test%';

userType=-1:
test1@dahan 123456
所有菜单
userType=0:
test2@dahan 123456
所有菜单
userType=1:
test3@dahan 123456
商品中心->产品线
系统设置->通道交换信息
userType=2:
test4@dahan 123456
无菜单
userType=3:
test5@dahan 123456
无菜单
userType=4:
test6@dahan 123456
商品中心(那4个子菜单)
userType=5:
test7@dahan 123456
商品中心(那4个子菜单)

select *
from user
where yxyuserid='019aaec0196547198125e26aa3c5158e' and user_type=1;

谁调用 token就一直是哪个领域
token被重写？