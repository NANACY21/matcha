# D:\campus\MySQL
# 数据库课件第5章 常用函数：

select round(100.456,2);

select round(100.456,1);

select round(100.456,0);

select truncate(100.456,2);

select truncate(100.456,1);

select truncate(100.456,0);

select left(ename,3) from emp;

select ename,sal,deptno from emp where length(ename)=5;

select concat(upper(LEFT(ename,1)),lower(substring(ename,2))) ename,length(ename) ename_length from emp where upper(LEFT(ename,1))='A' or upper(LEFT(ename,1))='J' or upper(LEFT(ename,1))='M' order by ename;

select ename from emp where ename like '%a%' or ename like '%A%';

select replace(ename,'A','a') from emp;

select ename,length(ename) ename_length from emp where (deptno=10 or deptno=20 ) and hiredate>'1981-05-01' and ename like '%A%';

select concat(rpad(empno,10,'*'),rpad(ename,10,'*'),lpad(sal,10,'*')) empno_ename_sal from emp;

练习4：
select CURRENT_TIME();

select truncate((datediff(emp.hiredate,'2000-01-01')/30),0),month(emp.hiredate) from emp where deptno=10 or deptno=20;

select emp.ename,emp.hiredate,date_add(hiredate,interval 6 month) zhuanzheng_date,month(hiredate),week(hiredate),from emp where job !='MANAGER';

课后作业：
select truncate((datediff(CURRENT_TIME(),'2000-01-01'))/30,0),truncate((datediff(CURRENT_TIME(),'2000-01-01'))/7,0);

select * from emp where substring(ename,3) like 'A%';
select * from emp where strcmp('aaA',concat('aa',ename))=0;

select trim('h' from 'hello');
select trim(' Hello ');
select trim('b' from 'bllb');
select trim(' hello   ');

select ename,format(sal,2) from emp;

select ename,ifnull(mgr,'No Manager') from emp;

select date_format(hiredate,'%Y/%m/%d') from emp;

select emp.ename,emp.sal,(case when emp.sal<1000 then emp.sal when emp.sal between 1000 and 2000 then emp.sal*0.1 when emp.sal between 2000 and 3000 then sal*0.15 when emp.sal>3000 then sal*0.2 end) should_put from emp;

select ename,lpad(sal,15,'$') SALARY from emp;