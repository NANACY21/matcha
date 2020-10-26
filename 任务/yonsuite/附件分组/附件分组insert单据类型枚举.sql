-- 切换附件分组单据类型
##枚举
insert into aa_enum (`enumtype`, `nametype`, `enumcode`, `localid`, `enumname`, `subid`, `pubts`, `ideleted`, `enumindex`, `icon`, `description`) 
select DISTINCT 'AttachmentGroupBillType', 'text', '0', 'zh-cn', '物料档案', 'PC', NOW(), 0, 1, NULL, 'AttachmentGroupBillType' from aa_enum
where not exists (select * from aa_enum where enumtype = 'AttachmentGroupBillType' and enumname = '物料档案' and enumcode = '0');


insert into aa_enum (`enumtype`, `nametype`, `enumcode`, `localid`, `enumname`, `subid`, `pubts`, `ideleted`, `enumindex`, `icon`, `description`) 
select DISTINCT 'AttachmentGroupBillType', 'text', '1', 'zh-cn', '客户档案', 'PC', NOW(), 0, 0, NULL, 'AttachmentGroupBillType' from aa_enum
where not exists (select * from aa_enum where enumtype = 'AttachmentGroupBillType' and enumname = '客户档案' and enumcode = '1');


SELECT *
from aa_enum
where enumtype = 'pc_attachmentGroupBillType';
