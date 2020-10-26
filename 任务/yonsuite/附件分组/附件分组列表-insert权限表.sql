-- 给附件分组列表的按钮添加权限
select *
from auth
where code like '%pc_attachmentgrouplist%';


-- 新增附件分组菜单权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplist', '附件分组', 'PC', 2, NULL, 17, 0, 5, NULL, NULL, 'upc');


-- 加查看权限
INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistlist', '查看', 'pc_attachmentgrouplist', 3, NULL, 1, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistadd', '新增', 'pc_attachmentgrouplist', 3, NULL, 2, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistedit', '编辑', 'pc_attachmentgrouplist', 3, NULL, 3, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistdelete', '删除', 'pc_attachmentgrouplist', 3, NULL, 4, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistexport', '导出模板', 'pc_attachmentgrouplist', 3, NULL, 5, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistimport', '导入模板', 'pc_attachmentgrouplist', 3, NULL, 6, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistpdfexport', 'PDF导出', 'pc_attachmentgrouplist', 3, NULL, 7, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistexcelexport', 'Excel导出', 'pc_attachmentgrouplist', 3, NULL, 8, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistbatcho', '批量操作', 'pc_attachmentgrouplist', 3, NULL, 9, 0, 5, NULL, NULL, 'upc');


INSERT INTO `auth`(`code`, `name`, `parent_id`, `level`, `path`, `sort_num`, `isEnd`, `auth_level`, `note`,
                   `alias_code`, `subId`)
VALUES ('pc_attachmentgrouplistdeleterow', '删行', 'pc_attachmentgrouplist', 3, NULL, 10, 0, 5, NULL, NULL, 'upc');