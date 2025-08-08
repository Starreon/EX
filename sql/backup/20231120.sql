DROP TABLE IF EXISTS `t_item_type_timezone`;
CREATE TABLE `t_item_type_timezone` (
  `item_type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `timezone` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of t_item_type_timezone
-- ----------------------------
INSERT INTO `t_item_type_timezone` VALUES ('A-stocks', 'Asia/Shanghai');
INSERT INTO `t_item_type_timezone` VALUES ('HK-stocks', 'Asia/Hong_Kong');
INSERT INTO `t_item_type_timezone` VALUES ('JP-stocks', 'Asia/Tokyo');
INSERT INTO `t_item_type_timezone` VALUES ('TW-stocks', 'Asia/Taipei');
INSERT INTO `t_item_type_timezone` VALUES ('US-stocks', 'America/New_York');
INSERT INTO `t_item_type_timezone` VALUES ('cryptos', 'Asia/Singapore');
INSERT INTO `t_item_type_timezone` VALUES ('forex', 'Europe/London');

DROP TABLE IF EXISTS `t_balance_everyday`;
CREATE TABLE `t_balance_everyday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `balance` decimal(64,2) DEFAULT NULL,
  `date_str` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `party_id` (`party_id`,`date_str`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
