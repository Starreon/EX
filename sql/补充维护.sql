-- 添加合约杠杆参数
DELETE from t_item_leverage;
INSERT INTO t_item_leverage 
SELECT CONCAT(SYMBOL,'111'), UUID, 1, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'112'), UUID, 2, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'113'), UUID, 3, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'114'), UUID, 4, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'115'), UUID, 5, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'116'), UUID, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'117'), UUID, 7, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'118'), UUID, 8, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'119'), UUID, 9, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM 
UNION
SELECT CONCAT(SYMBOL,'121'), UUID, 10, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL FROM T_ITEM
;

-- 202311180100 证券类型修改字段长度
alter table t_item_summary modify security_type varchar(64) NULL DEFAULT NULL COMMENT "证券类型";

-- 202311182247 跟单需求
CREATE TABLE `t_wallet_transfer_log` (
  `uuid` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `party_id` varchar(32) NOT NULL DEFAULT '',
  `order_no` varchar(64) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `wallettype` varchar(128) DEFAULT NULL,
  `create_time_ts` int DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  KEY `index_wallet_log_party_id` (`party_id`,`create_time`) USING BTREE,
  KEY `index_order_no` (`order_no`) USING BTREE,
  KEY `index_wallet_log_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;


CREATE TABLE `tz_follow_wallet` (
  `uuid` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `user_id` varchar(32) NOT NULL DEFAULT '',
  `money` decimal(35,8) NOT NULL DEFAULT '0.00000000' COMMENT '现金/美元',
  `lock_money` decimal(25,8) DEFAULT '0.00000000' COMMENT '锁定金额',
  `freeze_money` decimal(25,8) DEFAULT '0.00000000' COMMENT '冻结金额',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` int DEFAULT '0',
  `update_by` varchar(32) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_time_ts` int DEFAULT NULL,
  `create_time_ts` int DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `INDEX_WALLET_PARTY_ID` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='用户跟单钱包';

-- 银行卡支付模板配置功能改造
alter table t_c2c_translate add column lang_key varchar(128) default '' comment '多语言Key';

-- 币种时区配置表
CREATE TABLE `t_item_type_timezone` (
  `item_type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `timezone` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO t_item_type_timezone VALUES ('A-stocks', 'Asia/Shanghai');
INSERT INTO t_item_type_timezone VALUES ('HK-stocks', 'Asia/Hong_Kong');
INSERT INTO t_item_type_timezone VALUES ('JP-stocks', 'Asia/Tokyo');
INSERT INTO t_item_type_timezone VALUES ('TW-stocks', 'Asia/Taipei');
INSERT INTO t_item_type_timezone VALUES ('US-stocks', 'America/New_York');
INSERT INTO t_item_type_timezone VALUES ('cryptos', 'Asia/Singapore');
INSERT INTO t_item_type_timezone VALUES ('forex', 'Europe/London');
INSERT INTO t_item_type_timezone VALUES ('SG-stocks', 'Asia/Singapore');

update t_item set open_close_type ='cryptos' where type = 'cryptos';

-- 概况表修改字段长度
alter table t_item_summary modify legal_representative varchar(64) null comment '法人代表';
alter table t_item_summary modify performance_benchmark varchar(128) null comment '业绩比较基准';

-- 概况表修改数据
UPDATE  t_item i LEFT JOIN t_item_summary s ON i.symbol =s.symbol SET s.translate =NULL WHERE i.type='indices';
DELETE s FROM t_item i LEFT JOIN t_item_summary s ON i.symbol =s.symbol  WHERE i.type='indices' AND s.lang='en';

-- 概况表 投资类型 修改字段长度
ALTER TABLE t_item_summary MODIFY COLUMN investment_type VARCHAR(3000);

-- BTEX盘 定制返佣功能配置 20231123
-- 1.代理返佣
INSERT INTO t_syspara(UUID, CODE, PARTY_ID, SVALUE, SORDER, STYPE, NOTES, MODIFY)
VALUES ('rebate', 'rebate', NULL, 'rebate_version:1,base_1_level_1:1000,rebate_1_level_1:0.05,rebate_1_level_2:0.03,rebate_1_level_3:0.02,rebate_1_level_4:0.01,rebate_2_level_1:0.05,rebate_2_level_2:0.03,rebate_2_level_3:0.02,rebate_2_level_4:0.01,rebate_3_level_1:0.05,rebate_3_level_2:0.03,rebate_3_level_3:0.02,rebate_3_level_4:0.01,player_level:1-5-10', 100, 2, 'base_1_level_1:返佣分成界限;rebate_1_level_1:等级1的1级返佣,rebate_用户等级_level_几级返佣', 0);
--2.首充
INSERT INTO t_syspara(UUID, CODE, PARTY_ID, SVALUE, SORDER, STYPE, NOTES, MODIFY)
VALUES ('first_recharge', 'first_recharge', NULL, 'true,500,0.2', 100, 2, '是否有首充彩金,首充彩金界限,首充彩金返利比例', 0);

-- 跟单需求 加字段 202311232039
ALTER TABLE `trading_order`.`t_contract_apply_order` ADD COLUMN `follow` TINYINT NOT NULL DEFAULT 0 COMMENT '是否跟单 0-不是  1-是';
ALTER TABLE `trading_order`.`t_contract_order` ADD COLUMN `follow` TINYINT NOT NULL DEFAULT 0 COMMENT '是否跟单 0-不是  1-是';

CREATE TABLE `t_follow_wallet_extend` (
  `uuid` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `party_id` varchar(32) NOT NULL DEFAULT '用户ID',
  `tenant_id` varchar(32) NOT NULL DEFAULT '' COMMENT '租户 的pattyid',
  `wallettype` varchar(16) NOT NULL DEFAULT '' COMMENT '币种类型',
  `wallettype_name` varchar(64) NOT NULL DEFAULT '' COMMENT '币种类型名称',
  `amount` double NOT NULL DEFAULT '0' COMMENT '金额',
  `lock_amount` double DEFAULT '0',
  `frozen_amount` double DEFAULT '0' COMMENT '冻结金额',
  `freeze_amount` double DEFAULT '0',
  `version` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  KEY `index_wallet_ext_party_id` (`party_id`,`wallettype`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 实时同步汇率开关 20231123
INSERT INTO t_syspara (uuid, code, party_id, svalue, sorder, stype, notes, modify)
VALUES ('auto_exchange_rate', 'auto_exchange_rate', NULL, 'false', '100', '2', '是否使用实时同步汇率 true-同步，false-不同步', '0');

-- 邮件发送内容文本 20231123
INSERT INTO t_syspara(UUID, CODE, PARTY_ID, SVALUE, SORDER, STYPE, NOTES, MODIFY)
VALUES ('send_code_text_content', 'send_code_text_content', NULL, '[Exchange]code is :{0}', 100, 2, '邮件发送标题', 0);

-- 借币订单 修改字段长度 20231124
alter table t_loan_order modify loan_currency varchar(16) not null comment '贷款币种';
alter table t_loan_order modify pledge_currency varchar(16) not null comment '质押的币种';

-- 新股认购需求 20231125
CREATE TABLE `t_new_shares_config` (
  `uuid` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_time_ts` int(16) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_time_ts` int(16) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品代码（字母）',
  `product_code` varchar(50) DEFAULT NULL COMMENT '产品代码（数字',
  `market_price` decimal(20,8) DEFAULT NULL COMMENT '市场价',
  `underwriting_price` decimal(20,8) DEFAULT NULL COMMENT '承销价',
  `subscribe_total_number` int(11) DEFAULT NULL COMMENT '总申购数',
  `draw_date` datetime DEFAULT NULL COMMENT '抽签日期',
  `start_subscribe_date` datetime DEFAULT NULL COMMENT '开放申购日期',
  `end_subscribe_date` datetime DEFAULT NULL COMMENT '截止申购日期',
  `issuance_date` datetime DEFAULT NULL COMMENT '发劵日期',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  `applied_subscribe_number` int(11) DEFAULT NULL COMMENT '已申购数',
  `status` int(11) DEFAULT NULL COMMENT '状态  1 未开始 2 开放中  3 已结束',
  `default_limit` varchar(20) DEFAULT NULL COMMENT '默认额度',
  `ipo_status` int(1) DEFAULT NULL COMMENT '发行市场 1 待上市 2 已上市',
  `lock_day` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_apply_new_shares_order` (
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单号',
  `status` int(11) DEFAULT NULL COMMENT '购状态  1 申购中 2已中签 3 未中签',
  `uuid` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_time_ts` int(16) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_time_ts` int(16) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0',
  `sub_price` decimal(30,8) DEFAULT '0.00000000' COMMENT '申购价格',
  `sub_number` decimal(30,8) DEFAULT '0.00000000' COMMENT '申购股数',
  `user_id` varchar(32) DEFAULT NULL,
  `symbol_code` varchar(50) DEFAULT NULL COMMENT '股票代码',
  `symbol_name` varchar(50) DEFAULT NULL COMMENT '股票名称',
  `winning_number` decimal(30,8) DEFAULT '0.00000000' COMMENT '中签数量',
  `required_subscribe` decimal(30,8) DEFAULT '0.00000000' COMMENT '申购需认缴',
  `required_number` decimal(30,8) DEFAULT '0.00000000' COMMENT '中签应认缴',
  `subscribed_count` int(11) DEFAULT '0' COMMENT '已认缴次数',
  `subscribed_amount` decimal(30,8) DEFAULT '0.00000000' COMMENT '已认缴金额',
  `sell` int(1) DEFAULT '0',
  `user_promise_count` int(1) DEFAULT NULL COMMENT '认缴次数',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_user_promise_record` (
  `uuid` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_time_ts` int(16) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_time_ts` int(11) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0',
  `deduct_usdt` decimal(30,8) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `new_shares_config_id` varchar(32) DEFAULT NULL,
  `order_no` varchar(40) DEFAULT NULL,
  `deduct_number` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `lock_end_time` datetime DEFAULT NULL,
  `show_flag` int(1) DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 菜单配置
INSERT INTO tz_sys_menu (`menu_id`, parent_id, name, url, perms, type, icon, order_num, `app_type`) VALUES (1525, 0, '新股认购', '', '', 0, 'shezhi', 12, '1');
INSERT INTO tz_sys_menu (`menu_id`, parent_id, name, url, perms, type, icon, order_num, `app_type`) VALUES (1526, 1525, '新股发布', 'mining/stock-release', '', 1, 'mudedi', 1, '1');
INSERT INTO tz_sys_menu (`menu_id`, parent_id, name, url, perms, type, icon, order_num, `app_type`) VALUES (1527, 1525, '新股申购', 'mining/stock-subscription', '', 1, 'role', 2, '1');
INSERT INTO tz_sys_menu (`menu_id`, parent_id, name, url, perms, type, icon, order_num, `app_type`) VALUES (1528, 1525, '新股认缴', 'mining/application-record', '', 1, 'form', 3, '1');

-- 跟单流水需求 20231129
CREATE TABLE `t_follow_money_log` (
  `uuid` varchar(32) NOT NULL,
  `log` text,
  `wallet_type` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_before` double DEFAULT NULL,
  `amount_after` double DEFAULT NULL,
  `content_type` varchar(32) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `del_flag` int(1) DEFAULT NULL,
  `create_time_ts` int(11) DEFAULT NULL,
  `update_time_ts` int(11) DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL,
  `show` varchar(2) DEFAULT '1' COMMENT '是否前端顯示',
  PRIMARY KEY (`uuid`) USING BTREE,
  KEY `INDEX_MONEY_LOG_PARTY_ID` (`user_id`,`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `t_trader_days_setting` (
  `UUID` varchar(32) NOT NULL COMMENT '主键',
  `DAYS` int(32) DEFAULT NULL COMMENT '跟单天数',
  `LEVEL` int(11) DEFAULT NULL COMMENT '杠杆',
  `DAY_RATE` double DEFAULT NULL COMMENT '借款一天利率',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_TIME_TS` int(11) DEFAULT NULL,
  `UPDATE_TIME_TS` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DEL_FLAG` int(11) DEFAULT NULL,
  `UPDATE_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `t_trader_follow_setting` (
  `UUID` varchar(32) NOT NULL COMMENT '主键',
  `PARTY_ID` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `USERNAME` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `DAYS_SETTING` varchar(32) DEFAULT NULL COMMENT '跟单天数',
  `AMOUNT` decimal(11,5) DEFAULT NULL COMMENT '跟单金额',
  `RATE` double DEFAULT NULL COMMENT '带单利润比例',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_TIME_TS` int(11) DEFAULT NULL,
  `UPDATE_TIME_TS` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DEL_FLAG` int(11) DEFAULT NULL,
  `UPDATE_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  UNIQUE KEY `PARTY_ID_UNIQUE` (`PARTY_ID`),
  KEY `INDEX_PARTY_ID` (`PARTY_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE `t_trader_invite_link` (
  `UUID` varchar(32) NOT NULL,
  `TRADER_ID` varchar(45) NOT NULL,
  `PROFIT_SHARE_RATIO` double DEFAULT NULL,
  `LEVEL` varchar(45) DEFAULT NULL,
  `IDS` longtext,
  `LINK` varchar(128) DEFAULT NULL,
  `STATUS` TINYINT(4) DEFAULT '1' COMMENT '状态:0-失效，1-有效',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_TIME_TS` int(11) DEFAULT NULL,
  `UPDATE_TIME_TS` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `DEL_FLAG` int(11) DEFAULT NULL,
  `UPDATE_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `t_trader_follow_user` ADD COLUMN `DAYS_SETTING` VARCHAR(45) NULL DEFAULT NULL;
ALTER TABLE `tz_user` ADD COLUMN `days_setting` VARCHAR(45) NULL DEFAULT NULL COMMENT '跟单贷款天数设置';

-- EFT没有k线图的问题SQL 20231202
update t_item set sorted = 10000 where symbol
in (".DJI", ".IXIC", ".INX", "SZ399001", "SZ399005", "SH000016", "SH000300", "SZ399006", "HKHSI", "HKHSCEI", "HKHSTECH")

-- 客户端访问控制表 （黑、白名单，断网配置）
DROP TABLE IF EXISTS `t_risk_client`;
CREATE TABLE `t_risk_client`  (
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `client_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端值，可为 ip值（支持*号占位符）或 userCode值',
  `client_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端值类型：ip, userCode',
  `client_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型: black - 黑名单, white - 白名单, badnetwork - 断网',
  `status` int(11) NULL DEFAULT 0 COMMENT '0-无效，1-正常',
  `begin_time_ts` bigint(20) NOT NULL DEFAULT 0 COMMENT '起止时间，不限制时设置为 0',
  `end_time_ts` bigint(20) NOT NULL DEFAULT 0 COMMENT '起止时间，不限制时设置为 0',
  `last_opera_time` datetime(0) NULL DEFAULT NULL COMMENT '最后处理时间',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE,
  UNIQUE INDEX `uk_risk`(`client_key`, `client_type`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- 币种搜索记录表 20231210
CREATE TABLE `t_item_visit` (
  `symbol` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `default_active` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `visit_count` int(8) unsigned zerofill DEFAULT '00000000',
  `last_visit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 币种激活、冻结需求 20231210
ALTER TABLE t_item ADD COLUMN crawl_status  varchar(32) NULL COMMENT '采集状态' ;
UPDATE t_item SET crawl_status = 'default_active';

-- 简况修改字段长度 20231211
alter table t_item_summary modify reg_address text null comment '注册地址';

-- 银行卡订单默认过期时间 20231211 Tradestation盘
 INSERT INTO t_syspara(uuid, code, party_id, svalue, sorder, stype, notes, modify)
 VALUES ('bank_card_expire_time', 'bank_card_expire_time', NULL, '120', 100, 2, '银行卡订单默认过期时间', 0);

 -- 币币交易杠杠需求 20231213
 CREATE TABLE `t_exchange_lever_apply_order` (
  `uuid` varchar(32) NOT NULL COMMENT '主键',
  `party_id` varchar(32) DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL COMMENT '代码',
  `order_no` varchar(64) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `offset` varchar(32) DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `volume_open` double DEFAULT NULL,
  `lever_rate` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stop_price_profit` double DEFAULT NULL,
  `stop_price_loss` double DEFAULT NULL,
  `order_price_type` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `unit_amount` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `index_contract_apply_order_status` (`state`,`create_time`),
  KEY `index_contract_apply_order_order_no` (`order_no`),
  KEY `index_contract_apply_order_party_id` (`party_id`,`state`,`direction`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_exchange_lever` (
  `uuid` varchar(32) NOT NULL DEFAULT '',
  `lever_rate` double DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_exchange_lever_order` (
  `uuid` varchar(32) NOT NULL COMMENT '主键',
  `party_id` varchar(32) DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL COMMENT '代码',
  `order_no` varchar(64) DEFAULT NULL,
  `direction` varchar(32) DEFAULT NULL,
  `unit_amount` double DEFAULT NULL,
  `amount_close` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `deposit_open` double DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `trade_avg_price` double DEFAULT NULL,
  `stop_price_profit` double DEFAULT NULL,
  `stop_price_loss` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pips` double DEFAULT NULL,
  `pips_amount` double DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `lever_rate` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `volume_open` double DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  `close_avg_price` double DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `index_contract_order_status` (`state`,`create_time`),
  KEY `index_contract_order_order_no` (`order_no`),
  KEY `index_contract_order_party_id` (`party_id`,`state`,`direction`,`create_time`),
  KEY `index_contract_party_id_state` (`party_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 现货交易杠杆订单表 上次结息日期纪录 20231216
alter table `t_exchange_lever_order` add column `compute_day`  datetime null after `close_avg_price`;

-- 交割合约配置 增加'比率基数'字段 20231216
ALTER TABLE `t_futures_para`
ADD COLUMN `profit_ratio_cardinality` int(11) NULL DEFAULT 10000 COMMENT '比率基数，例如：10000，1000，1000整数类型，默认10000' AFTER `profit_ratio`;

-- 交割合约配置 关联到订单表 20231218
ALTER TABLE `t_futures_order`
ADD COLUMN `futures_para_id`  varchar(32) NULL COMMENT 't_futures_para配置参数ID' AFTER `profit_ratio`,
ADD COLUMN `profit_ratio_cardinality`  int(11) NULL DEFAULT 1000 COMMENT '收益率基数，例如：10000，1000，1000整数类型，默认1000' AFTER `profit`;

-- 汇率默认币种 20231220
INSERT INTO `t_syspara` (`uuid`, `code`, `party_id`, `svalue`, `sorder`, `stype`, `notes`, `modify`)
VALUES ('rate_default_currency', 'rate_default_currency', NULL, 'USD', '100', '2', '默认币种类型，默认是USD', '0');

-- 管理员token过期时间 20231223
INSERT INTO `t_syspara` (`uuid`, `code`, `party_id`, `svalue`, `sorder`, `stype`, `notes`, `modify`)
VALUES ('admin_token_expires_time', 'admin_token_expires_time', NULL, '2', '100', '2', '管理员token过期时间，单位小时', '0');

-- ICE盘定制交易返佣
INSERT INTO t_syspara(UUID, CODE, PARTY_ID, SVALUE, SORDER, STYPE, NOTES, MODIFY) VALUES ('trade_bouns', 'trade_bouns', NULL, '0.15,0.10,0.05,10000', 100, 2, 'ICE盘交易返佣:一代，二代，三代,交易量超过才能提现', 0);

-- 部分仓位限价成交 20240102
ALTER TABLE `t_exchange_apply_order` ADD COLUMN `success_volume` double NOT NULL COMMENT '委托成功数量' AFTER `update_time_ts`;

-- 现货禁止成交开关 这个设置false 禁止交易 20240105
INSERT INTO t_syspara(uuid, code, party_id, svalue, sorder, stype, notes, modify)
VALUES ('exchange_switch', 'exchange_switch', NULL, 'false', 100, 2, '现货禁止成交开关', 0);

-- 用户表增加唯一索引 20240111
CREATE UNIQUE INDEX ud_user_name ON tz_user(user_name);

-- 更新 btc 提现最低额度为 0.001
update t_syspara set svalue = '0.001' where CODE = 'withdraw_limit_btc';
-- 新增 btc 提现最高额度为 100000
INSERT INTO t_syspara VALUES ('withdraw_limit_max_btc', 'withdraw_limit_max_btc', NULL, '100000', 100, 2, 'btc单次最高提现金额', 0);

-- 更新 eth 提现最低额度为 0.01
update t_syspara set svalue = '0.01' where CODE = 'withdraw_limit_eth';
-- 新增 eth 提现最高额度为 100000
INSERT INTO t_syspara VALUES ('withdraw_limit_max_eth', 'withdraw_limit_max_eth', NULL, '100000', 100, 2, 'eth单次最高提现金额', 0);

-- 新增 usdt 提现最低额度为 10
INSERT INTO t_syspara VALUES ('withdraw_limit_usdt', 'withdraw_limit_usdt', NULL, '10', 10, 2, 'usdt单次最低提现金额', 0);
-- 新增 usdt 提现最高额度为 1000000
INSERT INTO t_syspara VALUES ('withdraw_limit_max_usdt', 'withdraw_limit_max_usdt', NULL, '1000000', 100, 2, 'usdt单次最高提现金额', 0);

-- 合约 及现货交易汇率换算问题 20240113
alter table t_exchange_rate add type varchar(32) null comment '股票类型';

INSERT INTO t_exchange_rate (UUID, OUT_OR_IN, RATA, CURRENCY, NAME, CURRENCY_SYMBOL, type) VALUES ('BRL_in', 'in', 4.89, 'BRL', '雷亚尔', 'R$', 'BZ-stocks');
INSERT INTO t_exchange_rate (UUID, OUT_OR_IN, RATA, CURRENCY, NAME, CURRENCY_SYMBOL, type) VALUES ('BRL_out', 'out', 4.89, 'BRL', '雷亚尔', 'R$', null);
INSERT INTO t_exchange_rate (UUID, OUT_OR_IN, RATA, CURRENCY, NAME, CURRENCY_SYMBOL, type) VALUES ('INR_in', 'in', 83.12, 'INR', '卢比', '₹', 'INDI-stocks');
INSERT INTO t_exchange_rate (UUID, OUT_OR_IN, RATA, CURRENCY, NAME, CURRENCY_SYMBOL, type) VALUES ('INR_out', 'out', 83.12, 'INR', '卢比', '₹', null);

UPDATE t_exchange_rate SET type = 'A-stocks' WHERE UUID = 'CNY_in';
UPDATE t_exchange_rate SET type = 'DE-stocks' WHERE UUID = 'EUR_in';
UPDATE t_exchange_rate SET type = 'UK-stocks' WHERE UUID = 'GBP_in';
UPDATE t_exchange_rate SET type = 'HK-stocks' WHERE UUID = 'HKD_in';
UPDATE t_exchange_rate SET type = 'JP-stocks' WHERE UUID = 'JPY_in';
UPDATE t_exchange_rate SET type = 'TW-stocks' WHERE UUID = 'TWD_in';
UPDATE t_exchange_rate SET type = 'US-stocks,forex,indices' WHERE UUID = 'USD_in';

-- 20240129 虚拟账号注册自动赠送金额配置
INSERT INTO t_syspara(UUID, CODE, PARTY_ID, SVALUE, SORDER, STYPE, NOTES, MODIFY) VALUES ('virtual_register_gift_coin', 'virtual_register_gift_coin', NULL, '0', 100, 2, '虚拟账号注册自动赠送金额', 0);

-- 20240131 新增新股认购持仓多少天显示出来配置
INSERT INTO t_syspara(`uuid`, `code`, `party_id`, `svalue`, `sorder`, `stype`, `notes`, `modify`) VALUES ('new_shares_order_show_day', 'new_shares_order_show_day', NULL, '3', 100, 2, '新股认购库存显示延迟显示天数', 0);
