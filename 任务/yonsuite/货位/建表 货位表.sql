####################
--	货位档案组件
####################
-- ----------------------------
-- Table structure for aa_goodsposition
-- ----------------------------
DROP TABLE IF EXISTS `aa_goodsposition`;
CREATE TABLE IF NOT EXISTS `aa_goodsposition` (
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
	`code` varchar(20) COMMENT '货位号',
	`name` varchar(50) COMMENT '货位名称',
	`warehouseId` bigint COMMENT '仓库',
	`charger` varchar(50) COMMENT '负责人',
	`volume` varchar(50) COMMENT '货位容积（立方米）',
	`remark` varchar(255) COMMENT '备注',
	`stopstatus` bit DEFAULT 0 COMMENT '停用状态',
	`stoptime` datetime COMMENT '停用时间',
	`iCustID` bigint COMMENT '所属客户',
	`erpCode` varchar(40) COMMENT 'ERP编码',
	`parent` bigint COMMENT '上级货位',
	`level` int COMMENT '层级',
	`isEnd` bit DEFAULT 0 COMMENT '是否末级',
	`isFastAdd` bit DEFAULT 0 COMMENT '是否快速定义',
	`sort` int COMMENT '排序号',
	`path` varchar(255) COMMENT '路径',
	`pubts` timestamp COMMENT '时间戳' NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`tenant_id` bigint NOT NULL COMMENT '租户',
	`create_time` datetime COMMENT '创建时间',
	`create_date` date COMMENT '创建日期',
	`modify_time` datetime COMMENT '修改时间',
	`modify_date` date COMMENT '修改日期',
	`creator` varchar(255) COMMENT '创建人',
	`creatorId` bigint COMMENT '创建人ID',
	`modifierId` bigint COMMENT '修改人ID',
	`modifier` varchar(255) COMMENT '修改人',
	`name2` varchar(255) COMMENT '自定义名称',
	`name3` varchar(255) COMMENT '自定义名称',
	`name4` varchar(255) COMMENT '自定义名称',
	`name5` varchar(255) COMMENT '自定义名称',
	`name6` varchar(255) COMMENT '自定义名称',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8;
