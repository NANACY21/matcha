# 分组取第一条
select *
from roles
where id in (select min(id) from roles group by rolename);

select *
from trade

select *
from position where status=1 order by releaseTime desc limit 0,1000;
