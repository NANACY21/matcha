-- 异步导入参数 测试
-- select * from bill_command where name='cmdImport' and action='batchimport' and billnumber='pc_unitlist';
UPDATE `bill_command` SET parameter='{"isAsync":true}' where billnumber='pc_unitlist' and name='cmdImport' and action='batchimport';




-- 异步导入参数 测试
-- select * from bill_command where name='cmdImport' and action='batchimport' and billnumber='aa_channeltypelist';
UPDATE `bill_command` SET parameter='{"isAsync":true}' where billnumber='aa_channeltypelist' and name='cmdImport' and action='batchimport';




-- 异步导入参数 测试
-- select * from bill_command where name='cmdImport' and action='batchimport' and billnumber='pc_purchaseclasslist';
UPDATE `bill_command` SET parameter='{"isAsync":true}' where billnumber='pc_purchaseclasslist'  and name='cmdImport' and action='batchimport';








-- 异步导入参数 测试
-- select * from bill_command where name='cmdImport' and action='batchimport' and billnumber in ('aa_deliverycorplist','pc_addressarchiveslist',
-- 'aa_cuslevellist',
-- 'aa_custcategorylist',
-- 'aa_customerprolist',
-- 'aa_customertradelist','aa_salearealist','aa_settlemethodlist','pc_brandclasslist','pc_brandlist',
-- 'pc_managementclasslist',
-- 'pc_presentationclasslist',
-- 'pc_productbrandprolist',
-- 'pc_productlinelist',
-- 'pc_productorderprolist',
-- 'pc_productprolist',
-- 'pc_productskuprolist',
-- 'pc_producttpllist',
-- 'pc_speprolist',
-- 'pc_tagclasslist',
-- 'pc_taglist',
-- 'pc_unitlist',
-- 'aa_vendorclassificationlist',
-- 'pc_vendorprolist',
-- 'aa_vendorlist');


UPDATE `bill_command` SET parameter='{"isAsync":true}' where billnumber in ('aa_deliverycorplist','pc_addressarchiveslist',
'aa_cuslevellist',
'aa_custcategorylist',
'aa_customerprolist',
'aa_customertradelist','aa_salearealist','aa_settlemethodlist','pc_brandclasslist','pc_brandlist',
'pc_managementclasslist',
'pc_presentationclasslist',
'pc_productbrandprolist',
'pc_productlinelist',
'pc_productorderprolist',
'pc_productprolist',
'pc_productskuprolist',
'pc_producttpllist',
'pc_speprolist',
'pc_tagclasslist',
'pc_taglist',
'pc_unitlist',
'aa_vendorclassificationlist',
'pc_vendorprolist',
'aa_vendorlist') and name='cmdImport' and action='batchimport';



-- 异步导入参数 测试
-- select * from bill_command where billnumber='aa_merchantlist' and name='cmdOrderImport' and action='batchimport';
UPDATE `bill_command` SET parameter='{"isAsync":true}' where billnumber='aa_merchantlist' and name='cmdOrderImport' and action='batchimport';