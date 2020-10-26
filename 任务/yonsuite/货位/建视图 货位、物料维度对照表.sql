create OR REPLACE VIEW aa_v_positionlook as
select distinct `t1`.`position_id`                          AS `id`,
                ''                                          AS `code`,
                concat(`t2`.`name`, ' (', `t3`.`name`, ')') AS `name`,
                `t1`.`position_id`                          AS `position_id`,
                ''                                          AS `warehouse_id`,
                ''                                          AS `lookat`,
                `t1`.`tenant_id`                            AS `tenant_id`,
                ''                                          AS `parent_id`,
                ''                                          AS `level`,
                `t1`.`position_id`                          AS `path`,
                1                                           AS `sort_num`,
                1                                           AS `isEnd`,
                ''                                          AS `pubts`
from ((`aa_goodsproductscomparison` `t1` join `aa_goodsposition` `t2` on ((`t1`.`position_id` = `t2`.`id`)))
         join `aa_warehouse` `t3` on ((`t2`.`warehouseId` = `t3`.`id`)));

-- comment on column aa_v_positionlook.id not supported: 货位档案

-- comment on column aa_v_positionlook.position_id not supported: 货位档案

-- comment on column aa_v_positionlook.tenant_id not supported: 租户

-- comment on column aa_v_positionlook.path not supported: 货位档案

create OR REPLACE VIEW aa_v_productlook as
select distinct `t1`.`product_id` AS `id`,
                ''                AS `code`,
                'tempName222'     AS `name`,
                `t1`.`product_id` AS `product_id`,
                ''                AS `lookat`,
                `t1`.`tenant_id`  AS `tenant_id`,
                ''                AS `parent_id`,
                ''                AS `level`,
                ''                AS `path`,
                ''                AS `sort_num`,
                ''                AS `isEnd`,
                ''                AS `pubts`
from `aa_goodsproductscomparison` `t1`;

-- comment on column aa_v_productlook.id not supported: 物料id

-- comment on column aa_v_productlook.product_id not supported: 物料id

-- comment on column aa_v_productlook.tenant_id not supported: 租户

