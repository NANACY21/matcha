# company库练习2
# 参加了p2项目的员工身份证号
select essn
from works_on
where pno = 'p2';

# 参加了项目名为“哈同公路”的员工数量
select count(essn)
from project,
     works_on
where pno = pnumber
  and pname = '哈同公路';/*没有去重distict？*/

# 在“研发部”工作且工资低于3000元的员工名字和地址
select name, address
from employee,
     department
where dname = '研发部'
  and salary < 3000
  and dno = dnumber;

# 没有参加项目p1的员工姓名
select name
from employee
where not exists(select * from works_on where essn = ssn and pno = 'p1');/*括号里查询结果有很多行，not exists意思是works_on的反面还是employee的反面？*/

# 没有家属的工作人员名字
select name
from employee
where not exists(select * from dependent where essn = ssn);

# 由张红领导的工作人员的姓名和所在部门的名字
select E.name, dname
from employee E,
     employee S,
     department
where S.name = '张红'
  and S.ssn = E.superssn
  and E.dno = dnumber;

# 至少参加了3个项目的职工号
select essn
from works_on
group by essn
having count(pno) >= 3;

# 至少参加了项目p1和项目p2的员工号
select ssn
from employee
where exists(select * from works_on where essn = ssn and pno = 'p1')
  and exists(select * from works_on where essn = ssn and pno = 'p2');

# 参加了全部项目的员工号码和姓名
select ssn, name
from employee
where ssn in (select essn from works_on group by essn having count(pno) = (select count(*) from project));

# 在参加了p2号项目的雇员中，查询比雇员“张三”的酬金低的雇员姓名
select name
from employee,
     works_on
where pno = 'p2'
  and essn = ssn
  and salary < (select salary from employee where name = '张三');

# 求这样的员工姓名，该员工参加了张三没有参加的某个项目
select name
from employee
where ssn in (select essn
              from works_on
              where pno not in (select pno
                                from works_on,
                                     employee
                                where essn = ssn
                                  and name = '张三'));
