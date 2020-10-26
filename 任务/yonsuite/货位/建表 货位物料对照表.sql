####################
--	货位物料对照表组件
####################
-- ----------------------------
-- Table structure for aa_goodsproductscomparison
-- ----------------------------
DROP TABLE IF EXISTS `aa_goodsproductscomparison`;
CREATE TABLE `aa_goodsproductscomparison` (
	`position_id` bigint NOT NULL COMMENT '货位档案',
	`product_id` bigint COMMENT '物料id',
	`lookat` varchar(20) COMMENT '维度',
	`warehouseId` bigint COMMENT '所属仓库',
	`outPriority` int DEFAULT 1 COMMENT '出库优先级',
	`inPriority` int DEFAULT 1 COMMENT '入库优先级',
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`pubts` timestamp COMMENT '时间戳' NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`tenant_id` bigint NOT NULL COMMENT '租户',
	KEY `IX_position_id` (`position_id`) COMMENT 'id',
	KEY `IX_product_id` (`product_id`) COMMENT '物料id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8;
