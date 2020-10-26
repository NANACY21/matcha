# company库练习1
# 参照大三(上)数据库课教材22页的sql语句 company库
# 1.单表查询
# 查询全体工作人员的身份证号和姓名:
select SSN, NAME
from EMPLOYEE;

# 查询全体工作人员的详细记录
select *
from EMPLOYEE;

# 查询参与了工程项目的工作人员的身份证号
select DISTINCT ESSN
from WORKS_ON;

# 查询在1号部门工作的工作人员姓名
select NAME
from EMPLOYEE
where DNO = '1';

# 查询全体工作人员的情况，按薪水降序排列
select *
from EMPLOYEE
ORDER BY SALARY DESC;

# 降序排序
select *
from employee
ORDER BY employee.name, employee.address desc;

# 查询所有姓刘的工作人员的信息
select *
from EMPLOYEE
where name like '刘%';

# 查询没有直接领导人的工作人员的姓名
select NAME
from EMPLOYEE
where SUPERSSN is null;

# 统计元组个数( 仅COUNT(*)不忽略null值 )
SELECT COUNT(*)
FROM employee;

SELECT COUNT(all *)
FROM employee;

SELECT COUNT(DISTINCT *)
FROM employee;

# 统计工作人员总人数
SELECT COUNT(*)
FROM EMPLOYEE;

# 统计一列中值的个数
SELECT COUNT(all employee.name)
FROM employee;

SELECT COUNT(DISTINCT employee.name)
FROM employee;

# 统计参与工程总人数
SELECT COUNT(DISTINCT ESSN)
FROM WORKS_ON;

# 计算列值的和
SELECT SUM(employee.salary) as sumvalue
from employee;

# 计算参与工程项目号为'1'的工作人员的平均工作小时数
SELECT AVG(HOURS)
from WORKS_ON
where PNO = '1';

# 最大值
SELECT MAX(employee.salary) as maxvalue
from employee;

# 最小值
SELECT MIN(employee.salary) as minvalue
from employee;

# 总数
SELECT count(*) as totalcount
from employee;

# 各部门平均工资 和 平均工资>2000的部门
SELECT DNO, avg(employee.salary)
from employee
group by employee.dno
having AVG(salary) > 2000 ;

# 2.连接查询
# 查询所有在"研究部"工作的工作人员姓名和地址
SELECT name, address
from EMPLOYEE,
     department
where dno = dnumber
  and dname = '研究部';

# 在"哈尔滨"进行的工程项目,列出工程项目号、所属部门号、该部门领导的名字、生日和地址
SELECT name, bdate, address, pnumber, dnum
from project,
     EMPLOYEE,
     department
where dnum = dnumber
  and mgrssn = ssn
  and plocation = '哈尔滨';

# 查询每个工作人员及其直接领导人的姓名(自身连接要起名)
SELECT E.name, S.name
from EMPLOYEE E,
     EMPLOYEE S
where E.superssn = S.ssn;

# 3.嵌套查询(IN EXISTS)
# ①带IN谓词的子查询
SELECT name
from EMPLOYEE
where dno in (select dno from employee where name = '刘明');

# 查询参与工程项目名为"家园"的工作人员姓名
SELECT name
from employee
where ssn in (select essn from works_on where pno in (select PNUMBER from project where pname = '家园'));

# 教材47页例2.6.13
select essn
from works_on
where pno in ('1', '2', '3');

# ②带EXISTS谓词的子查询(相对应的是NOT EXISTS)
# 查询参与"1"号工程项目的工作人员姓名:
SELECT name
from EMPLOYEE
where ssn in (select essn from works_on where pno = '1');

SELECT name
from EMPLOYEE
where EXISTS(select * from works_on where pno = '1' and ssn = essn);

# 查未参与"1"号工程项目的工作人员姓名
SELECT name
from EMPLOYEE
where NOT EXISTS(select * from works_on where pno = '1' and ssn = essn);

# 查参与了全部工程项目的工作人员姓名
SELECT name
from EMPLOYEE
where ssn in (select essn from works_on group by essn having count(*) = (select count(*) from project));

SELECT name
from EMPLOYEE
where NOT EXISTS(select * from project where not exists(select * from works_on where ssn = essn and pno = pnumber));

# 查询至少有1个家属的领导的名字
SELECT name
from EMPLOYEE
where EXISTS(select * from dependent where ssn = essn)
  and exists(select * from department where ssn = mgrssn);