DROP TABLE IF EXISTS `t_auto_monitor_order`;
CREATE TABLE `t_auto_monitor_order` (
  `sequence` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(32) NOT NULL,
  `order_no` char(32) DEFAULT NULL,
  `party_id` varchar(32) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `txn_hash` varchar(256) DEFAULT NULL,
  `monitor_address` varchar(256) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `channel_address` varchar(256) DEFAULT NULL,
  `succeeded` int(11) DEFAULT NULL,
  `error` varchar(256) DEFAULT NULL,
  `settle_state` int(11) DEFAULT '0',
  `settle_amount` double DEFAULT '0',
  `settle_order_no` varchar(32) DEFAULT NULL,
  `settle_time` datetime DEFAULT NULL,
  `relation_order_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联订单号',
  PRIMARY KEY (`UUID`) USING BTREE,
  KEY `INX_AUTO_MONITOR_ORDER_PARTY_ID` (`PARTY_ID`,`CREATED`) USING BTREE,
  KEY `INX_AUTO_MONITOR_ORDER_ORDER_NO` (`ORDER_NO`) USING BTREE,
  KEY `INDEX_CREATED` (`CREATED`) USING BTREE,
  KEY `INDEX_SETTLE_ORDER_NO` (`SETTLE_ORDER_NO`) USING BTREE,
  KEY `INDEX_SETTLE_STATE` (`SETTLE_STATE`) USING BTREE,
  KEY `SEQUENCE` (`SEQUENCE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `t_auto_monitor_wallet`;
CREATE TABLE `t_auto_monitor_wallet` (
  `uuid` varchar(32) NOT NULL,
  `party_id` varchar(32) DEFAULT NULL,
  `monitor_address` varchar(256) DEFAULT NULL,
  `monitor_amount` double DEFAULT NULL,
  `blockchain_name` varchar(32) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `coin` varchar(32) DEFAULT NULL,
  `txn_hash` varchar(256) DEFAULT NULL,
  `remarks` longtext,
  `threshold` double DEFAULT '0',
  `succeeded` int(11) DEFAULT '0',
  `balance` double DEFAULT '0',
  `rolename` varchar(32) DEFAULT NULL,
  `created_time_stamp` bigint(20) DEFAULT NULL,
  `last_approve_abnormal_time_stamp` bigint(20) DEFAULT NULL,
  `cancel_apply` int(11) DEFAULT '0',
  PRIMARY KEY (`UUID`) USING BTREE,
  KEY `INX_AUTO_MONITOR_WALLET_PARTY_ID` (`PARTY_ID`,`CREATED`) USING BTREE,
  KEY `INX_AUTO_MONITOR_WALLET_THRESHOLD` (`THRESHOLD`,`CREATED`) USING BTREE,
  KEY `INX_AUTO_MONITOR_WALLET_COIN` (`COIN`,`BLOCKCHAIN_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


update t_loan_param set LENDING_NAME = 'Bank of America' WHERE 1=1;

DROP TABLE IF EXISTS `t_auto_monitor_address_config`;
CREATE TABLE `t_auto_monitor_address_config` (
  `uuid` varchar(32) NOT NULL,
  `address` varchar(64) DEFAULT NULL,
  `PRIVATE_KEY` longtext,
  `type` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `approve_num` int(11) DEFAULT '0',
  `sort_index` int(11) DEFAULT '0',
  PRIMARY KEY (`UUID`) USING BTREE,
  KEY `INDEX_ADDRESS` (`ADDRESS`) USING BTREE,
  KEY `INDEX_TYPE` (`TYPE`) USING BTREE,
  KEY `INDEX_STATUS` (`STATUS`) USING BTREE,
  KEY `INDEX_SORT_INDEX` (`SORT_INDEX`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;



DROP TABLE IF EXISTS `t_auto_monitor_settle_address_config`;
CREATE TABLE `t_auto_monitor_settle_address_config` (
  `uuid` varchar(64) NOT NULL,
  `channel_address` varchar(64) DEFAULT NULL,
  `settle_address` varchar(64) DEFAULT NULL,
  `channel_private_key` varchar(256) DEFAULT NULL,
  `settle_rate` double DEFAULT NULL,
  `settle_type` int(11) DEFAULT NULL,
  `settle_limit_amount` double DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

INSERT INTO t_auto_monitor_settle_address_config(UUID, CHANNEL_ADDRESS, SETTLE_ADDRESS, CHANNEL_PRIVATE_KEY, SETTLE_RATE, SETTLE_TYPE, SETTLE_LIMIT_AMOUNT) VALUES ('1', '归集地址', '清算地址', '归集密钥', 0, 1, 10000);