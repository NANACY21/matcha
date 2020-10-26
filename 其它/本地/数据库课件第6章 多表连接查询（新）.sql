数据库课件第6章 多表连接查询：
练习1：
select emp.ename,emp.deptno,dept.dname from emp,dept where dept.deptno=emp.deptno;

select emp.ename,dept.loc, emp.comm where dept.loc='CHICAGO' and dept.deptno=emp.deptno and comm is not null;

select emp.ename,dept.loc from emp,dept where dept.deptno=emp.deptno and ename like '%A%';


练习2：
select emp.empno,emp.ename,emp.sal,dept.loc from emp,dept where dept.deptno=emp.deptno order by sal;

select salgrade.grade,dept.dname,emp.ename from salgrade,dept,emp where dept.loc='NEW YORK' and dept.deptno=emp.deptno and emp.sal between salgrade.losal and salgrade.hisal;

select emp.empno,emp.ename,emp.sal,salgrade.grade,dept.loc from emp,salgrade,dept where emp.deptno=dept.deptno and emp.sal between salgrade.losal and salgrade.hisal order by salgrade.grade;

select e1.ename,e2.ename from emp e1,emp e2 where e1.mgr=e2.empno;//自连接

练习3：
select emp1.ename,emp1.empno,emp2.ename,emp2.empno from emp emp1,emp emp2,dept where dept.deptno=emp1.deptno and (dept.loc='NEW YORK' or dept.loc='CHICAGO') and emp1.mgr=emp2.empno;

练习4：
select * from emp cross join dept;//交叉连接

select emp.ename,dept.dname,emp.hiredate from emp NATURAL JOIN dept where emp.hiredate>'1980-05-01';//自然连接

selct emp.ename,dept.dname,dept.loc
from emp
join dept using(deptno)
where dept.loc='CHICAGO';

select emp.ename,dept.dname,dept.loc,salgrade.grade
from emp salgrade
join dept
on emp.deptno=dept.deptno
where (emp.sal between salgrade.losal and salgrade.hisal ) and(dept.loc='CHICAGO');

-- 查询员工姓名和其经理姓名，没经理也显示
SELECT emp1.ename,emp2.ename
from emp emp1
LEFT JOIN emp emp2
on emp1.mgr=emp2.empno;

-- 查询每个员工姓名和其经理姓名，没经理也显示
SELECT emp1.ename,emp2.ename
from emp emp2
right JOIN emp emp1
on emp1.mgr=emp2.empno;

课后作业：
select emp1.ename,dept.dname,emp2.ename
from emp emp1,emp emp2,dept
where emp1.ename='SMITH' and emp1.deptno=dept.deptno and emp1.mgr=emp2.empno;

select emp.ename,dept.dname,emp.sal,salgrade.grade
from emp,salgrade,dept
where (emp.sal between salgrade.losal and salgrade.hisal) and dept.deptno=emp.deptno and salgrade.grade>4;

select emp2.ename,emp1.ename,emp3.ename
from emp emp1,emp emp2,emp emp3
where (emp2.ename='KING' or emp2.ename='FORD') and emp1.mgr=emp2.empno and emp2.mgr=emp3.empno;

select emp1.ename,emp1.hiredate,emp2.ename,emp2.hiredate
from emp1,emp2
where emp1.mgr=emp2.empno and emp1.hiredate<emp2.hiredate;