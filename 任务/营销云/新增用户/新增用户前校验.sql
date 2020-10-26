# 调零售库的
# 零售系统参数加盟客户档案来源
# pub_option_data表 value字段 1-U订货，2-基础服务
select *
from uretaildata.pub_option_data
where tenant_id = 1221385947746560
  and `name` = 'leagueCustDocSource';


# 前端
# AA_aa_userlist_VM.Extend.js
# 后端
# BillController
# IUPCBillService
# UPCBillService
# deleteUserBeforeRuleMapper