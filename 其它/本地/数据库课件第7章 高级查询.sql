���ݿ�μ���7�� �߼���ѯ��
��ϰ1��
select sum(emp.sal),avg(emp.sal) from emp group by deptno having deptno=20;

select count(*),max(sal),min(sal) from emp,dept where emp.deptno=dept.deptno and dept.loc='CHICAGO';

-- ��ѯԱ������һ���м��ָ�λ���͡�
select count(*) from emp,dept where emp.deptno=dept.deptno group by dept.dname;//?

��ϰ2��
select d.deptno,d.dname,count(e.empno),max(e.sal),min(e.sal),avg(e.sal),sum(e.sal)
from emp e
join dept d
on e.deptno=d.deptno
group by d.deptno,d.dname;

select
from emp e
join dept d
on e.deptno=d.deptno
group by d.deptno;

select m.empno,m.ename,count(e.empno)
from emp e
left join emp m
on e.mgr=m.empno
group by m.empno,m.ename

��ѯ��ÿ����λ�Ĺ����ܺͣ�����������'SALES'��ͷ�ĸ�λ
���������ܺ���������

select job,sum(sal)
from emp
where job not like 'SALES%'
group by job
having sum(sal) >5000
order by sum(sal) desc;

//select���ִ�й��̣�
����        ���
�� -��where->group by->having->select ->order by

group by job
��ϰ3��

��ϰ4��
select emp.ename,emp.hiredate from emp where emp.hiredate=
(select min(emp.hiredate) from emp);

select emp.ename,emp.sal,dept.dname
from emp,dept
where emp.deptno=dept.deptno and (dept.loc='CHICAGO') and
emp.sal>(select emp.sal from emp where ename='SMITH');

select emp.ename,emp.hiredate
from emp,dept
where emp.deptno=dept.deptno and
emp.hiredate<(select min(emp.hiredate) from emp,dept where emp.deptno=dept.deptno and dept.deptno=20); 

select count(*),dept.deptno,dept.dname
from emp join dept
on emp.deptno=dept.deptno
group by dept.deptno,dept.dname
having count(*)>(select count(*) from emp)/((select count(*) from dept));

��ϰ5��
select emp.ename,emp.hiredate
from emp
where emp.hiredate> any(select emp.hiredate from emp where emp.deptno=10);

select emp.ename,emp.hiredate
from emp
where emp.hiredate> all(select emp.hiredate from emp where emp.deptno=10) and emp.deptno!=10;

select emp.ename,dept.dname
from emp join dept
where dept.dname in (select dept.dname from emp where emp.deptno=10) and dept.deptno!=10;

//�Ѳ�ѯ�������һ�ű���from���һ�����
�κ���ҵ��
1.
select dept.dname,dept.deptno,avg(emp.sal)
from emp,dept
WHERE emp.deptno = dept.deptno
group by dept.deptno,dept.dname
having avg(emp.sal)>2500;

2.
select emp.job,avg(emp.sal)
from emp,dept
group by dept.dname,emp.job
having emp.job not like 'SA%' and avg(emp.sal)>2500
order by emp.sal desc;

3.
select dept.dname,min(emp.sal),max(emp.sal)
from emp
join dept
group by dept.dname
having count(emp.empno)>2
order by emp.sal desc;

4.
select emp.job,sum(emp.sal)
from emp
join dept
group by dept.dname,emp.job
having emp.job!='SALESMAN' and sum(emp.sal)>=2500
order by emp.sal desc;

5.
select emp2.empno,emp2.ename,min(emp1.sal)
from emp emp1
left join emp emp2
where emp1.mgr=emp2.empno and emp1.sal>=3000
order by emp1.sal desc;

6.
select empno,ename,sal
where emp.sal>(select sal from emp where empno=7782) and
emp.job=(select job from emp where empno=7369);

7.
select max(sal),ename
from emp
where emp.sal>all (select sal from emp);

8.
select dept.deptno,dept.dname,min(emp.sal)
from emp join dept
on emp.deptno=dept.deptno
group by dept.deptno
having min(emp.sal)>(select min(sal) from emp join dept group by dept.deptno
having dept.deptno=10);

9.
select min(emp.sal),emp.empno,emp.ename
from emp join dept
on emp.deptno=dept.deptno
group by dept.deptno;

10.select emp1.ename,emp1.sal
from emp emp1,emp emp2
where emp1.mgr=emp2.empno and emp2.ename='KING';

11.
select emp.ename,emp.sal,emp.hiredate
from emp
where emp.hiredate>(select emp.hiredate from emp where emp.ename='SMITH');

12.
select emp.ename
from emp
select 