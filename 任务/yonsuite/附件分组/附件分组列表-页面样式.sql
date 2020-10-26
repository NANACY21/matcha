# 本地下，线上不用这样

-- 右
update billtplgroup_base tpl
inner join bill_base on bill_base.id = tpl.ibillid and bill_base.tenant_id = tpl.tenant_id
set tpl.cStyle = '{"rowheight":"60px", "diffWidth":"240"}'
where bill_base.cbillno = 'pc_attachmentgrouplist' and tpl.cCode = 'rightdiv';
-- 左
update billtplgroup_base tpl
inner join bill_base on bill_base.id = tpl.ibillid and bill_base.tenant_id = tpl.tenant_id
set tpl.cStyle = '{"classname":"lefttree-select-add-count"}'
where bill_base.cbillno = 'pc_attachmentgrouplist' and tpl.cCode = 'leftdiv';

-- 单据类型样式
update billtplgroup_base tpl
inner join bill_base on bill_base.id = tpl.ibillid and bill_base.tenant_id = tpl.tenant_id
set tpl.cStyle = '{"classname":"left-tree-select"}'
where bill_base.cbillno = 'pc_attachmentgrouplist' and tpl.cCode = 'switchBillType';
# {"classname":"left-tree-select"}





# left-tree-select-count
