# 20200902
select *
from aa_reasontype
where tenant_id = 1068024923148544;


# 所有租户
INSERT INTO aa_reasontype (name, displayName, isDefault, isChecked, ordernum, iDeleted, tenant_id,
                                  create_time, create_date, modify_time, modify_date, creator, modifier)
select '返工', '返工', false, false, 5, false, t.id, null, null, null, null, null, null from tenant t
where NOT EXISTS(select 1 from aa_reasontype where name='返工');

# delete
# from aa_reasontype
# where name = '报废' or name='返工';



INSERT INTO aa_reasontype (name, displayName, isDefault, isChecked, ordernum, iDeleted, tenant_id,
                                  create_time, create_date, modify_time, modify_date, creator, modifier)
select '报废', '报废', false, false, 6, false, t.id, null, null, null, null, null, null from tenant t
where NOT EXISTS(select 1 from aa_reasontype where name='报废');

# 0租户
INSERT INTO aa_reasontype (name, displayName, isDefault, isChecked, ordernum, iDeleted, tenant_id,
                                  create_time, create_date, modify_time, modify_date, creator, modifier)
select '返工', '返工', false, false, 5, false, 0, null, null, null, null, null, null from tenant
where NOT EXISTS(select 1 from aa_reasontype where name='返工' and tenant_id=0) limit 1;

INSERT INTO aa_reasontype (name, displayName, isDefault, isChecked, ordernum, iDeleted, tenant_id,
                                  create_time, create_date, modify_time, modify_date, creator, modifier)
select '报废', '报废', false, false, 6, false, 0, null, null, null, null, null, null from tenant
where NOT EXISTS(select 1 from aa_reasontype where name='报废' and tenant_id=0) limit 1;



# [新] 以下sql脚本日常执行流水线后多语字段仍没值 直接上预发
select *
from aa_enum
where enumtype like '%reason%';

delete from aa_enum where enumtype='aa_reasonType' and enumname='返工';
delete from aa_enum where enumtype='aa_reasonType' and enumname='报废';
INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex,
                            icon, description)
VALUES ('aa_reasonType', 'text', '5', 'zh-cn', '返工', 'aa', 0, 0, null,
        'aa_reasonType');

INSERT INTO aa_enum (enumtype, nametype, enumcode, localid, enumname, subid, ideleted, enumindex,
                            icon, description)
VALUES ('aa_reasonType', 'text', '6', 'zh-cn', '报废', 'aa', 0, 0, null,
        'aa_reasonType');