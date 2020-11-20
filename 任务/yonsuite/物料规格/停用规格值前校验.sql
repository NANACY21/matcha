# 某物料规格 的某规格值 是否被引用
select item.*
from productspecitem item
         inner join userdefine u on
    item.lsSpecItems_id = u.id
where item.tenant_id=1838010622546176 and (u.name='1 001'
or item.specValue='1 001') and u.id=?;


# 某物料规格的所有规格值
select uf.*
from userdefine uf
         inner join
     userdef_base ufb on uf.userdefid = ufb.id
where ufb.showItem = 'wwdcs-blank'
  and ufb.tenant_id = 1838010622546176;


select *
from tenant where alias='pcnemko0';


select id,name,isEnabled,tenant_id from userdefine where name='1001'

ProductTplController
ProductTplService
mapper.xml
PC_pc_spepro_VM_Extend.js


select *
from billruleregister
where tenant_id = 0
  and billnum in ('aa_goodsposition','common')
  and action = 'save'
order by iorder;

select action
from billruleregister group by action;