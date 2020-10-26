# pc_attachmentgrouplist
# 去掉 PDF导出 按钮
delete
from bill_toolbaritem
where billnumber = 'pc_attachmentgrouplist'
  and text = 'PDF导出';


delete
from bill_command
where billnumber = 'pc_attachmentgrouplist'
  and name = (select command
              from bill_toolbaritem
              where text = 'PDF导出'
                and billnumber = 'pc_attachmentgrouplist'
              limit 1);