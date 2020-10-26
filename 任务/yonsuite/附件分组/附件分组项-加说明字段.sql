call p_aa_updatecolumn('attachmentgroupitem', 'description',
                       'alter table attachmentgroupitem add column `description` varchar(255) DEFAULT NULL COMMENT "附件分组项说明";',
                       'add');