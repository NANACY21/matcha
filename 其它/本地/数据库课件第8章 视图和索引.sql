�κ���ҵ��
create view v_emp_20
as
SELECT empno,ename,(12*(sal+ifnull(comm,0))) year_sal from emp where emp.deptno=20;

select * from v_emp_20 where year_sal>10000;

create view V_dayu2000
as
select dept.deptno,dept.dname,dept.loc,emp.job from emp join dept where emp.sal>2000;

��һ���ɹ�������޸���������ʹԭ��������ͻ���ʲ����޸ĳɹ���