select *
from attachmentGroup T0
where (T0.iBillType = 1
#            and (T0.stop_time is null or T0.stop_time >= '2020-01-09 11:16:13')
           and T0.iBillType = 1
           and
       T0.tenant_id = 1389339883229440);
