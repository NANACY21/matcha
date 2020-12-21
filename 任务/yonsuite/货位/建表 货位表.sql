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



# 20201207
-- auto-generated definition
create table if not exists `aa_goodsposition_define`
(
    id       bigint auto_increment comment '货位档案id'
        primary key,
    define1  varchar(255) null comment '自定义项1',
    define2  varchar(255) null comment '自定义项2',
    define3  varchar(255) null comment '自定义项3',
    define4  varchar(255) null comment '自定义项4',
    define5  varchar(255) null comment '自定义项5',
    define6  varchar(255) null comment '自定义项6',
    define7  varchar(255) null comment '自定义项7',
    define8  varchar(255) null comment '自定义项8',
    define9  varchar(255) null comment '自定义项9',
    define10 varchar(255) null comment '自定义项10',
    define11 varchar(255) null comment '自定义项11',
    define12 varchar(255) null comment '自定义项12',
    define13 varchar(255) null comment '自定义项13',
    define14 varchar(255) null comment '自定义项14',
    define15 varchar(255) null comment '自定义项15',
    define16 varchar(255) null comment '自定义项16',
    define17 varchar(255) null comment '自定义项17',
    define18 varchar(255) null comment '自定义项18',
    define19 varchar(255) null comment '自定义项19',
    define20 varchar(255) null comment '自定义项20',
    define21 varchar(255) null comment '自定义项21',
    define22 varchar(255) null comment '自定义项22',
    define23 varchar(255) null comment '自定义项23',
    define24 varchar(255) null comment '自定义项24',
    define25 varchar(255) null comment '自定义项25',
    define26 varchar(255) null comment '自定义项26',
    define27 varchar(255) null comment '自定义项27',
    define28 varchar(255) null comment '自定义项28',
    define29 varchar(255) null comment '自定义项29',
    define30 varchar(255) null comment '自定义项30',
    define31 varchar(255) null comment '自定义项31',
    define32 varchar(255) null comment '自定义项32',
    define33 varchar(255) null comment '自定义项33',
    define34 varchar(255) null comment '自定义项34',
    define35 varchar(255) null comment '自定义项35',
    define36 varchar(255) null comment '自定义项36',
    define37 varchar(255) null comment '自定义项37',
    define38 varchar(255) null comment '自定义项38',
    define39 varchar(255) null comment '自定义项39',
    define40 varchar(255) null comment '自定义项40',
    define41 varchar(255) null comment '自定义项41',
    define42 varchar(255) null comment '自定义项42',
    define43 varchar(255) null comment '自定义项43',
    define44 varchar(255) null comment '自定义项44',
    define45 varchar(255) null comment '自定义项45',
    define46 varchar(255) null comment '自定义项46',
    define47 varchar(255) null comment '自定义项47',
    define48 varchar(255) null comment '自定义项48',
    define49 varchar(255) null comment '自定义项49',
    define50 varchar(255) null comment '自定义项50',
    define51 varchar(255) null comment '自定义项51',
    define52 varchar(255) null comment '自定义项52',
    define53 varchar(255) null comment '自定义项53',
    define54 varchar(255) null comment '自定义项54',
    define55 varchar(255) null comment '自定义项55',
    define56 varchar(255) null comment '自定义项56',
    define57 varchar(255) null comment '自定义项57',
    define58 varchar(255) null comment '自定义项58',
    define59 varchar(255) null comment '自定义项59',
    define60 varchar(255) null comment '自定义项60'
)
    comment '货位档案自定义项' collate = utf8mb4_general_ci;