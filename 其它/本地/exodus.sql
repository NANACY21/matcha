# 查询IT行业某类职位有哪些职位
select partition2.name
from position_enum partition1,
     position_enum partition2
where partition1.id = partition2.parent_id
  and partition1.name = '开发';
# 一个公司 - 多个职位
desc position;

# 职位列表条件查询
select *
from position
where (city like '%上海%' or city like '%北京%');

# 投递到本公司的简历数 组数 投递到本公司的简历数
select count(*)
from (select count(*)
      from job_apply apply
      where apply.position_id in
            (select id
             from position
             where company_id = 1)
      group by apply.user_id) as tempTable;


select *
from position
where company_id = 1;

select name
from position_enum
where parent_id = 1;

# 投递状态>=0的都算投递成功的
select *
from job_apply
where user_id = 16
  and status >= 3;
desc position;


select count(*)
from position
where status = 1
  and company_id = 3;


select *
from position
where name like '%java%';

select *
from users
where user_type = 1;

# 不区分大小写啊 https://blog.csdn.net/piaoxuan1987/article/details/73123327
select *
from users where username='melodyy';

# 20200827





