# company库练习3
# 例1：参加了p2项目的员工号
select essn
from works_on
where pno = 'p2';

# 例2：参加了项目名为“哈同公路”的员工名字
select name
from employee,
     project,
     works_on
where pname = '哈同公路'
  and ssn = essn
  and pnumber = pno;

# 例3：在“研发部”工作的所有工作人员名字
select name
from employee,
     department
where dname = '研发部'
  and dno = dnumber;

select name
from employee
where dno in (select dnumber from department where dname = '研发部');

select name
from employee
where dno = (select dnumber from department where dname = '研发部');

# 例4：在“研究部”工作的所有工作人员的名字和地址
select name, address
from employee,
     department
where dname = '研发部'
  and dno = dnumber;

select name, address
from employee
where dno in (select dnumber from department where dname = '研发部');

select name, address
from employee
where dno = (select dnumber from department where dname = '研发部');

# 例5：在“研发部”工作且工资低于3000元的员工名字和地址
select name, address
from employee,
     department
where dname = '研发部'
  and salary < 3000
  and dno = dnumber;

select name, address
from employee
where dno in (select dnumber from department where dname = '研发部')
  and salary < 3000;

select name, address
from employee
where dno = (select dnumber from department where dname = '研发部')
  and salary < 3000;

# 例6：没有参加项目p1的员工姓名
select name
from employee
where not exists(select * from works_on where ssn = essn and pno = 'p1');

# 例7：没有家属的工作人员名字
select name
from employee
where not exists(select * from dependent where ssn = essn);

# 例8：由张红领导的工作人员的姓名和所在部门的名字
select E.name, dname
from employee E,
     employee M,
     department
where E.superssn = M.ssn
  and M.name = '张红'
  and E.dno = dnumber;

# 例9：至少参加了3个项目的职工号
select essn
from works_on
group by essn
having count(*) >= 3;

select distinct a.essn
from works_on a,
     works_on b,
     works_on c
where a.essn = b.essn
  and b.essn = c.essn
  and a.pno != b.pno
  and b.pno != c.pno
  and a.pno != c.pno;

# 例10：至少参加了项目P1和项目P2的员工号
select E.essn
from works_on E,
     works_on M
where E.pno = 'p1'
  and M.pno = 'p2'
  and E.essn = M.essn;

# 例11：参加了全部项目的员工号码和姓名
select ssn, name
from employee
where not exists(select * from project where not exists(select * from works_on where ssn = essn and pnumber = pno));

select ssn, name
from employee,
     works_on
where ssn = essn
group by ssn, name
having count(*) = (select count(*) from project);

select ssn, name
from employee
where ssn in (select essn from works_on group by essn having count(*) = (select count(*) from project));

# 例12：在参加了2号项目的雇员中，查询比雇员“张三”的酬金低的雇员姓名
select name
from employee
where ssn in (select essn from works_on where pno = 'p2')
  and salary < (select salary from employee where name = '张三');

# 例13：求这样的员工姓名，该员工参加了张三没有参加的某个项目。
select name
from employee
where ssn in (select essn
              from works_on
              where pno not in (select pno
                                from employee,
                                     works_on
                                where ssn = essn
                                  and name = '张三'));

# 例14：求这样的员工姓名，该员工至少参加了王二参加的所有项目(不列出王二)。
select name
from employee
where name != '王二'
  and not exists(
        select *
        from works_on works_on_1
        where essn in (select ssn from employee where name = '王二')
          and not exists
            (select * from works_on works_on_2 where works_on_2.essn = ssn and works_on_2.pno = works_on_1.pno));


select name
from employee
where name != '王二'
  and ssn in
      (
          select essn
          from (
                   select *
                   from works_on
                   where pno in (select pno from works_on where essn in (select ssn from employee where name = '王二'))
               ) as x
          group by essn
          having count(*) =
                 (
                     select count(*) from works_on where essn in (select ssn from employee where name = '王二')
                 )
      );

# 例15：求这样的员工姓名和他在项目中的平均工作时间，该员工至少参加了两个项目，并且在这两个项目中的工作时间都不低于100小时。
select name, avg(hours)
from employee,
     works_on
where ssn = essn
  and essn in
      (select distinct works_on_1.essn
       from works_on works_on_1,
            works_on works_on_2
       where works_on_1.essn = works_on_2.essn
         and works_on_1.pno != works_on_2.pno
         and works_on_1.hours >= 100
         and works_on_2.hours >= 100)
group by name;

# 例16：求这样的员工姓名，该员工至少参加了三个部门的项目。
select name
from employee
where ssn in (select essn
              from works_on,
                   project
              where pno = pnumber
              group by essn
              having count(distinct dnum) >= 3);

# 例17：至少参加了项目P1、项目P2和项目P3的员工姓名
select name
from employee
where ssn in (
    select essn
    from works_on
    where pno in ('p1', 'p2', 'p3')
    group by essn
    having count(*) = 3);

# 列出在部门d1管辖的工程项目中工作的工作人员名字
# 未去重
select employee.name
from employee
where employee.ssn in (select essn
                       from works_on
                       where pno in (select pnumber from project where dnum = 'd1'));

# 列出至少参加了两个项目的工作人员名字
select name
from employee
where ((select count(distinct pno) from works_on where employee.ssn = essn) >= 2);

select name
from employee
where ssn in (select essn from works_on group by essn having count(*) >= 2);