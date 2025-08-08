ALTER TABLE t_userdata ADD forex_amount DOUBLE;
ALTER TABLE t_userdata ADD forex_fee DOUBLE;
ALTER TABLE t_userdata ADD forex_order_income DOUBLE;

ALTER TABLE t_userdata ADD indices_amount DOUBLE;
ALTER TABLE t_userdata ADD indices_fee DOUBLE;
ALTER TABLE t_userdata ADD indices_order_income DOUBLE;

ALTER TABLE t_userdata ADD cryptos_amount DOUBLE;
ALTER TABLE t_userdata ADD cryptos_fee DOUBLE;
ALTER TABLE t_userdata ADD cryptos_order_income DOUBLE;

ALTER TABLE t_userdata ADD us_stocks_amount DOUBLE;
ALTER TABLE t_userdata ADD us_stocks_fee DOUBLE;
ALTER TABLE t_userdata ADD us_stocks_order_income DOUBLE;

ALTER TABLE t_userdata ADD forex_furtures_amount DOUBLE;
ALTER TABLE t_userdata ADD forex_furtures_fee DOUBLE;
ALTER TABLE t_userdata ADD forex_furtures_income DOUBLE;

ALTER TABLE t_userdata ADD indices_furtures_amount DOUBLE;
ALTER TABLE t_userdata ADD indices_furtures_fee DOUBLE;
ALTER TABLE t_userdata ADD indices_furtures_income DOUBLE;

ALTER TABLE t_userdata ADD cryptos_furtures_amount DOUBLE;
ALTER TABLE t_userdata ADD cryptos_furtures_fee DOUBLE;
ALTER TABLE t_userdata ADD cryptos_furtures_income DOUBLE;

ALTER TABLE t_userdata ADD us_stocks_furtures_amount DOUBLE;
ALTER TABLE t_userdata ADD us_stocks_furtures_fee DOUBLE;
ALTER TABLE t_userdata ADD us_stocks_furtures_income DOUBLE;


update t_item set remarks = symbol;
update t_item set symbol = SYMBOL_DATA where type = 'cryptos';

ALTER TABLE t_realtime_0
    MODIFY OPEN DOUBLE,
    MODIFY HIGH DOUBLE,
    MODIFY LOW DOUBLE,
    MODIFY CLOSE DOUBLE,
    MODIFY AMOUNT DOUBLE,
    MODIFY VOLUME DOUBLE,
    MODIFY bid DOUBLE,
    MODIFY ask DOUBLE;

ALTER TABLE t_realtime_1
    MODIFY OPEN DOUBLE,
    MODIFY HIGH DOUBLE,
    MODIFY LOW DOUBLE,
    MODIFY CLOSE DOUBLE,
    MODIFY AMOUNT DOUBLE,
    MODIFY VOLUME DOUBLE,
    MODIFY bid DOUBLE,
    MODIFY ask DOUBLE;

ALTER TABLE t_realtime_3
    MODIFY OPEN DOUBLE,
    MODIFY HIGH DOUBLE,
    MODIFY LOW DOUBLE,
    MODIFY CLOSE DOUBLE,
    MODIFY AMOUNT DOUBLE,
    MODIFY VOLUME DOUBLE,
    MODIFY bid DOUBLE,
    MODIFY ask DOUBLE;

ALTER TABLE t_realtime_4
    MODIFY OPEN DOUBLE,
    MODIFY HIGH DOUBLE,
    MODIFY LOW DOUBLE,
    MODIFY CLOSE DOUBLE,
    MODIFY AMOUNT DOUBLE,
    MODIFY VOLUME DOUBLE,
    MODIFY bid DOUBLE,
    MODIFY ask DOUBLE;

    ALTER TABLE t_realtime_5
        MODIFY OPEN DOUBLE,
        MODIFY HIGH DOUBLE,
        MODIFY LOW DOUBLE,
        MODIFY CLOSE DOUBLE,
        MODIFY AMOUNT DOUBLE,
        MODIFY VOLUME DOUBLE,
        MODIFY bid DOUBLE,
        MODIFY ask DOUBLE;

           ALTER TABLE t_realtime_6
                MODIFY OPEN DOUBLE,
                MODIFY HIGH DOUBLE,
                MODIFY LOW DOUBLE,
                MODIFY CLOSE DOUBLE,
                MODIFY AMOUNT DOUBLE,
                MODIFY VOLUME DOUBLE,
                MODIFY bid DOUBLE,
                MODIFY ask DOUBLE;
             ALTER TABLE t_realtime_7
                             MODIFY OPEN DOUBLE,
                             MODIFY HIGH DOUBLE,
                             MODIFY LOW DOUBLE,
                             MODIFY CLOSE DOUBLE,
                             MODIFY AMOUNT DOUBLE,
                             MODIFY VOLUME DOUBLE,
                             MODIFY bid DOUBLE,
                             MODIFY ask DOUBLE;

                ALTER TABLE t_realtime_8
                                MODIFY OPEN DOUBLE,
                                MODIFY HIGH DOUBLE,
                                MODIFY LOW DOUBLE,
                                MODIFY CLOSE DOUBLE,
                                MODIFY AMOUNT DOUBLE,
                                MODIFY VOLUME DOUBLE,
                                MODIFY bid DOUBLE,
                                MODIFY ask DOUBLE;
  ALTER TABLE t_realtime_9
                                MODIFY OPEN DOUBLE,
                                MODIFY HIGH DOUBLE,
                                MODIFY LOW DOUBLE,
                                MODIFY CLOSE DOUBLE,
                                MODIFY AMOUNT DOUBLE,
                                MODIFY VOLUME DOUBLE,
                                MODIFY bid DOUBLE,
                                MODIFY ask DOUBLE;



  -- 导出  表 trading_order.t_finance 结构
  CREATE TABLE IF NOT EXISTS `t_finance` (
    `uuid` varchar(32) NOT NULL,
    `name` varchar(32) DEFAULT NULL,
    `name_en` varchar(32) DEFAULT NULL,
    `name_jn` varchar(32) DEFAULT NULL,
    `name_kn` varchar(32) DEFAULT NULL,
    `name_cn` varchar(32) DEFAULT NULL,
    `img` varchar(64) DEFAULT NULL,
    `cycle` varchar(32) DEFAULT NULL,
    `daily_rate` double DEFAULT NULL,
    `today_rate` double DEFAULT NULL,
    `default_ratio` double DEFAULT NULL,
    `investment_min` double DEFAULT NULL,
    `investment_max` double DEFAULT NULL,
    `state` varchar(32) DEFAULT NULL,
    `daily_rate_max` double DEFAULT '0',
    PRIMARY KEY (`uuid`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  -- 导出  表 trading_order.t_finance_order 结构
  CREATE TABLE IF NOT EXISTS `t_finance_order` (
    `uuid` varchar(32) NOT NULL,
    `party_id` varchar(32) DEFAULT NULL,
    `order_no` varchar(64) DEFAULT NULL,
    `finance_id` varchar(32) DEFAULT NULL,
    `cycle` int(11) DEFAULT NULL,
    `amount` double DEFAULT NULL,
    `earn_time` datetime DEFAULT NULL,
    `stop_time` datetime DEFAULT NULL,
    `create_time` datetime DEFAULT NULL,
    `close_time` datetime DEFAULT NULL,
    `profit` double DEFAULT NULL,
    `state` varchar(32) DEFAULT NULL,
    `name` varchar(32) DEFAULT NULL,
    `name_en` varchar(32) DEFAULT NULL,
    `name_cn` varchar(32) DEFAULT NULL,
    `profit_before` double DEFAULT '0',
    PRIMARY KEY (`uuid`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  -- 导出  表 trading_order.t_miner 结构
  CREATE TABLE IF NOT EXISTS `t_miner` (
    `uuid` varchar(32) NOT NULL,
    `name` varchar(32) DEFAULT NULL,
    `name_en` varchar(64) DEFAULT NULL,
    `name_cn` varchar(32) DEFAULT NULL,
    `img` varchar(64) DEFAULT NULL,
    `cycle` varchar(32) DEFAULT NULL,
    `daily_rate` double DEFAULT NULL,
    `investment_min` double DEFAULT NULL,
    `state` varchar(32) DEFAULT NULL,
    `test` char(1) DEFAULT NULL,
    `on_sale` varchar(2) DEFAULT NULL,
    `CYCLE_CLOSE` double DEFAULT NULL,
    PRIMARY KEY (`uuid`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 -- 导出  表 trading_order.t_miner_order 结构
 CREATE TABLE IF NOT EXISTS `t_miner_order` (
   `uuid` varchar(32) NOT NULL,
   `party_id` varchar(32) DEFAULT NULL,
   `order_no` varchar(64) DEFAULT NULL,
   `miner_id` varchar(32) DEFAULT NULL,
   `amount` double DEFAULT NULL,
   `earn_time` datetime DEFAULT NULL,
   `stop_time` datetime DEFAULT NULL,
   `create_time` datetime DEFAULT NULL,
   `compute_day` datetime DEFAULT NULL,
   `profit` double DEFAULT NULL,
   `state` varchar(32) DEFAULT NULL,
   `compute_profit` double DEFAULT '0',
   `default_money` double DEFAULT '0',
   `close_time` datetime DEFAULT NULL,
   PRIMARY KEY (`uuid`),
   KEY `INDEX_FINANCE_ORDER_ORDER_NO` (`order_no`),
   KEY `INDEX_FINANCE_ORDER_STATE` (`state`),
   KEY `INDEX_FINANCE_ORDER_PARTY_ID` (`party_id`,`state`,`create_time`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `trading_order`.`t_item` (
	`UUID`,
	`NAME`,
	`SYMBOL`,
	`SYMBOL_DATA`,
	`PIPS`,
	`PIPS_AMOUNT`,
	`ADJUSTMENT_VALUE`,
	`UNIT_AMOUNT`,
	`UNIT_FEE`,
	`MARKET`,
	`DECIMALS`,
	`MULTIPLE`,
	`BORROWING_RATE`,
	`SYMBOL_FULL_NAME`,
	`create_by`,
	`create_time`,
	`update_by`,
	`update_time`,
	`remarks`,
	`del_flag`,
	`type`,
	`create_time_ts`,
	`update_time_ts`,
	`category`,
	`sorted`,
	`open_close_type`,
	`fake`,
	`board`,
	`show_status`,
	`trade_status`,
	`quote_currency`,
	`enable`,
	`can_buy_at_market_price`,
	`can_sell_at_market_price`,
	`limit_can_buy`,
	`limit_can_sell`,
	`en_name`
)
VALUES
	(
		'ff8080816347d026017247d2aebf0122',
		'美国科技股指数',
		'IYW',
		'IYW',
		'0.01',
		'0.02',
		'-0.14',
		'1000',
		'30',
		'FOREVER',
		2,
		'0',
		'0',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'IYW',
		'0',
		'forex',
		NULL,
		NULL,
		'indices',
		'1000',
		'forex',
		'0',
		NULL,
		'1',
		'1',
		'USDT',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'iShares U.S. Technology ETF'
	);


INSERT INTO `trading_order`.`t_item` (
	`UUID`,
	`NAME`,
	`SYMBOL`,
	`SYMBOL_DATA`,
	`PIPS`,
	`PIPS_AMOUNT`,
	`ADJUSTMENT_VALUE`,
	`UNIT_AMOUNT`,
	`UNIT_FEE`,
	`MARKET`,
	`DECIMALS`,
	`MULTIPLE`,
	`BORROWING_RATE`,
	`SYMBOL_FULL_NAME`,
	`create_by`,
	`create_time`,
	`update_by`,
	`update_time`,
	`remarks`,
	`del_flag`,
	`type`,
	`create_time_ts`,
	`update_time_ts`,
	`category`,
	`sorted`,
	`open_close_type`,
	`fake`,
	`board`,
	`show_status`,
	`trade_status`,
	`quote_currency`,
	`enable`,
	`can_buy_at_market_price`,
	`can_sell_at_market_price`,
	`limit_can_buy`,
	`limit_can_sell`,
	`en_name`
)
VALUES
	(
		'ff8080816347d026017247d2aebf0123',
		'做多美元指数',
		'UUP',
		'UUP',
		'0.01',
		'0.02',
		'-0.14',
		'1000',
		'30',
		'FOREVER',
		2,
		'0',
		'0',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'IYW',
		'0',
		'forex',
		NULL,
		NULL,
		'indices',
		'1000',
		'forex',
		'0',
		NULL,
		'1',
		'1',
		'USDT',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'PowerShares UUP'
	);

ALTER TABLE `t_miner` ADD COLUMN `show_daily_rate` double NULL DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `investment_max` double NULL DEFAULT '0';

ALTER TABLE `t_miner` ADD COLUMN `unlock_user_need` int(11) NULL DEFAULT '0';

--ALTER TABLE `t_miner` ADD COLUMN `cycle_close` int(11) DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `algorithm` varchar(255) NULL DEFAULT NULL;

ALTER TABLE `t_miner` ADD COLUMN `computing_power` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `computing_power_unit` varchar(64) NULL DEFAULT NULL;
ALTER TABLE `t_miner` ADD COLUMN `power` double DEFAULT '0';

ALTER TABLE `t_miner` ADD COLUMN `product_factory` varchar(255) DEFAULT NULL;
ALTER TABLE `t_miner` ADD COLUMN `product_size` varchar(255) DEFAULT NULL;
ALTER TABLE `t_miner` ADD COLUMN `weight` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `work_temperature_min` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `work_temperature_max` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `work_humidity_min` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `work_humidity_max` double DEFAULT '0';
ALTER TABLE `t_miner` ADD COLUMN `internet` varchar(255) DEFAULT NULL;
ALTER TABLE `t_miner` ADD COLUMN `base_compute_amount` double DEFAULT '0';


INSERT INTO `T_MINER`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `IMG`, `CYCLE`, `DAILY_RATE`, `SHOW_DAILY_RATE`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `TEST`, `ON_SALE`, `UNLOCK_USER_NEED`, `CYCLE_CLOSE`, `ALGORITHM`, `COMPUTING_POWER`, `COMPUTING_POWER_UNIT`, `POWER`, `PRODUCT_FACTORY`, `PRODUCT_SIZE`, `WEIGHT`, `WORK_TEMPERATURE_MIN`, `WORK_TEMPERATURE_MAX`, `WORK_HUMIDITY_MIN`, `WORK_HUMIDITY_MAX`, `INTERNET`, `BASE_COMPUTE_AMOUNT`) VALUES ('4028abaf73e1acb70173e1ca8d1a16e2', '体验矿机 3天', 'Super computing power miner 3 days', '体验礦機 3天', '', 3, 0, 0, 0, 0, '1', 'Y', '1', 0, 0, 'EtHash', 420, 'Ksol/s', 1510, '比特大陆', '245mm*132.5mm*290mm', 5.9, 0, 40, 5, 95, 'Ethernet', 0);
INSERT INTO `T_MINER`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `IMG`, `CYCLE`, `DAILY_RATE`, `SHOW_DAILY_RATE`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `TEST`, `ON_SALE`, `UNLOCK_USER_NEED`, `CYCLE_CLOSE`, `ALGORITHM`, `COMPUTING_POWER`, `COMPUTING_POWER_UNIT`, `POWER`, `PRODUCT_FACTORY`, `PRODUCT_SIZE`, `WEIGHT`, `WORK_TEMPERATURE_MIN`, `WORK_TEMPERATURE_MAX`, `WORK_HUMIDITY_MIN`, `WORK_HUMIDITY_MAX`, `INTERNET`, `BASE_COMPUTE_AMOUNT`) VALUES ('4028abaf73e2acb70173e1ca8d1a16e2', 'FPGA 矿机', 'FPGA Miner', 'FPGA 礦機', '', 10, 2.5, 2.5, 50, 1499, '1', 'N', '1', 0, 0, 'EtHash', 550, 'MH/s', 1650, 'FPGA', '188mm*302mm*528mm', 15.5, 0, 40, 10, 95, 'Ethernet', 0);
INSERT INTO `T_MINER`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `IMG`, `CYCLE`, `DAILY_RATE`, `SHOW_DAILY_RATE`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `TEST`, `ON_SALE`, `UNLOCK_USER_NEED`, `CYCLE_CLOSE`, `ALGORITHM`, `COMPUTING_POWER`, `COMPUTING_POWER_UNIT`, `POWER`, `PRODUCT_FACTORY`, `PRODUCT_SIZE`, `WEIGHT`, `WORK_TEMPERATURE_MIN`, `WORK_TEMPERATURE_MAX`, `WORK_HUMIDITY_MIN`, `WORK_HUMIDITY_MAX`, `INTERNET`, `BASE_COMPUTE_AMOUNT`) VALUES ('4028abaf73e3acb70173e1cb79881793', 'IPFS 矿机', 'IPFS Miner', 'IPFS 礦機', '', 20, 2.8, 2.8, 1500, 4999, '1', 'N', '1', 0, 0, 'EquiHash', 680, 'Ksol/s', 1800, 'IPFS', '188mm*402mm*528mm', 19, 0, 40, 10, 75, 'Ethernet', 0);
INSERT INTO `T_MINER`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `IMG`, `CYCLE`, `DAILY_RATE`, `SHOW_DAILY_RATE`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `TEST`, `ON_SALE`, `UNLOCK_USER_NEED`, `CYCLE_CLOSE`, `ALGORITHM`, `COMPUTING_POWER`, `COMPUTING_POWER_UNIT`, `POWER`, `PRODUCT_FACTORY`, `PRODUCT_SIZE`, `WEIGHT`, `WORK_TEMPERATURE_MIN`, `WORK_TEMPERATURE_MAX`, `WORK_HUMIDITY_MIN`, `WORK_HUMIDITY_MAX`, `INTERNET`, `BASE_COMPUTE_AMOUNT`) VALUES ('4028abaf73e4acb70173e1cda5ac18ff', 'GPU 矿机', 'GPU Miner', 'GPU 礦機', '', 30, 3.3, 3.3, 5000, 9999, '1', 'N', '1', 0, 0, 'EquiHash', 790, 'MH/s', 1880, 'GPU', '288mm*302mm*428mm', 19, 0, 40, 10, 80, 'Ethernet', 0);
INSERT INTO `T_MINER`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `IMG`, `CYCLE`, `DAILY_RATE`, `SHOW_DAILY_RATE`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `TEST`, `ON_SALE`, `UNLOCK_USER_NEED`, `CYCLE_CLOSE`, `ALGORITHM`, `COMPUTING_POWER`, `COMPUTING_POWER_UNIT`, `POWER`, `PRODUCT_FACTORY`, `PRODUCT_SIZE`, `WEIGHT`, `WORK_TEMPERATURE_MIN`, `WORK_TEMPERATURE_MAX`, `WORK_HUMIDITY_MIN`, `WORK_HUMIDITY_MAX`, `INTERNET`, `BASE_COMPUTE_AMOUNT`) VALUES ('4028abaf73e537dd0173e25c31561ce9', 'ASIC 矿机', 'ASIC Miner', 'ASIC 礦機', '', 40, 5, 5, 100000, 0, '1', 'N', '1', 0, 0, 'EtHash', 900, 'MH/s', 2000, 'ASIC', '288mm*302mm*528mm', 20, 0, 40, 20, 80, 'Ethernet', 0);

INSERT INTO `T_FINANCE`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `NAME_KN`, `NAME_JN`, `IMG`, `CYCLE`, `DAILY_RATE`, `TODAY_RATE`, `DEFAULT_RATIO`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `DAILY_RATE_MAX`) VALUES ('ff808081738fbbb701738fd095ed0f9c', '理财5天', 'Financing 5 days', '理財5天', NULL, NULL, 'logo.png', '5', 0.3, 0.25, 0.6, 1000, 9999999, '1', 0.3);
INSERT INTO `T_FINANCE`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `NAME_KN`, `NAME_JN`, `IMG`, `CYCLE`, `DAILY_RATE`, `TODAY_RATE`, `DEFAULT_RATIO`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `DAILY_RATE_MAX`) VALUES ('ff808081738fdd7201738ffe841819d6', '理财15天', 'Financing 15 days', '理財15天', NULL, NULL, 'logo.png', '15', 0.5, 0.38, 0.8, 10000, 9999999, '1', 0.5);
INSERT INTO `T_FINANCE`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `NAME_KN`, `NAME_JN`, `IMG`, `CYCLE`, `DAILY_RATE`, `TODAY_RATE`, `DEFAULT_RATIO`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `DAILY_RATE_MAX`) VALUES ('ff80808173a3f0b70173a43adc793f30', '理财30天', 'Financial 30 days', '理財30天', NULL, NULL, 'logo.png', '30', 0.7, 0.6, 1, 30000, 9999999, '1', 0.7);
INSERT INTO `T_FINANCE`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `NAME_KN`, `NAME_JN`, `IMG`, `CYCLE`, `DAILY_RATE`, `TODAY_RATE`, `DEFAULT_RATIO`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `DAILY_RATE_MAX`) VALUES ('ff80808173a85a300173a8cc46436557', '理财60天', 'Financial 60 days', '理財60天', NULL, NULL, 'logo.png', '60', 1, 0.7, 1.2, 50000, 9999999, '1', 1);
INSERT INTO `T_FINANCE`(`UUID`, `NAME`, `NAME_EN`, `NAME_CN`, `NAME_KN`, `NAME_JN`, `IMG`, `CYCLE`, `DAILY_RATE`, `TODAY_RATE`, `DEFAULT_RATIO`, `INVESTMENT_MIN`, `INVESTMENT_MAX`, `STATE`, `DAILY_RATE_MAX`) VALUES ('ff80808173a85a300173a8ce6de46705', '理财90天', 'Financing 90 days', '理財90天', NULL, NULL, 'logo.png', '90', 1.2, 1, 1.5, 100000, 9999999, '1', 1.2);

-- 修改字段类型 名字
ALTER TABLE `t_miner` CHANGE `CYCLE_CLOSE` `cycle_close` int(11);


ALTER TABLE `T_MINER_ORDER` ADD COLUMN `base_compute_amount` double DEFAULT 0;


ALTER TABLE `T_MINER_ORDER`
ADD COLUMN `volume`  double NULL DEFAULT 0 AFTER `close_time`;

ALTER TABLE `T_MINER_ORDER`
ADD COLUMN `back_money`  double NULL DEFAULT 0 AFTER `volume`;

ALTER TABLE `T_MINER_ORDER`
ADD COLUMN `first_buy`  varchar(4) NULL AFTER `back_money`;

ALTER TABLE `t_money_log`
ADD COLUMN `show`  varchar(2) DEFAULT '1' NULL AFTER `create_time_ts`;

ALTER TABLE `trading_order`.`t_profit_loss_config`
DROP COLUMN `symbol_type`,
ADD COLUMN `symbol_type` varchar(32) NULL COMMENT '币对类型' AFTER `create_time`;

-- 矿机自定义币种
ALTER TABLE `T_MINER` ADD COLUMN `buy_currency` varchar(5) DEFAULT 'usdt' COMMENT '矿机购买币种';
ALTER TABLE `T_MINER` ADD COLUMN `output_currency` varchar(5) DEFAULT 'usdt' COMMENT '矿机产出币种';

DROP TABLE IF EXISTS `t_loan_order`;
-- 质押借币订单
CREATE TABLE `t_loan_order` (
  `uuid` varchar(32) NOT NULL COMMENT '主键',
  `order_no` varchar(32) NOT NULL COMMENT '订单号',
  `party_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_type` int(1) NOT NULL DEFAULT '1' COMMENT '订单类型: 1 借款;2新增质押;3续借;4还款;5强平结清',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态: 1计息中;2已结清;3强平结清;4已逾期',
  `load_currency` varchar(5) NOT NULL COMMENT '贷款币种',
  `pledge_currency` varchar(5) NOT NULL COMMENT '质押的币种',
  `pledge_amount` double NOT NULL COMMENT '质押金额',
  `pledge_rate` double NOT NULL DEFAULT '0' COMMENT '质押率%',
  `pledge_type` int(1) NOT NULL DEFAULT '1' COMMENT '质押类型:1币质押',
  `load_amount` double NOT NULL DEFAULT '0' COMMENT '总借款',
  `debt_amount` double NOT NULL DEFAULT '0' COMMENT '总负债',
  `interest_amount` double NOT NULL DEFAULT '0' COMMENT '总利息',
  `overdue_amount` double NOT NULL DEFAULT '0' COMMENT '总逾期',
  `hourly_rate` double NOT NULL DEFAULT '0' COMMENT '时利率',
  `overdue_rate` double NOT NULL DEFAULT '0' COMMENT '逾期时利率',
  `load_cycle` int(2) NOT NULL COMMENT '借款周期',
  `create_time` datetime NOT NULL COMMENT '借款时间',
  `expire_time` datetime NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`uuid`) USING BTREE,
  KEY `INDEX_PARTY_ID` (`party_id`) USING BTREE,
  KEY `INDEX_STATE_CREATE_TIME` (`state`,`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='借币订单表';

DROP TABLE IF EXISTS `t_loan_relation_order`;
-- 质押借币关联订单
CREATE TABLE `t_loan_relation_order` (
  `uuid` varchar(32) NOT NULL COMMENT '主键',
  `loan_relation_order_id` varchar(32) NOT NULL COMMENT '借款关联订单ID',
  `party_id` varchar(32) NOT NULL COMMENT '用户ID',
  `order_type` int(1) NOT NULL DEFAULT '1' COMMENT '订单类型: 1 借款;2新增质押;3续借;4还款;5强平结清',
  `load_amount` double NOT NULL DEFAULT '0' COMMENT '借还款金额',
  `load_currency` varchar(5) DEFAULT NULL COMMENT '贷款币种',
  `pledge_currency` varchar(5) DEFAULT NULL COMMENT '质押的币种',
  `pledge_amount` double NOT NULL COMMENT '质押金额',
  `pledge_type` int(1) NOT NULL DEFAULT '1' COMMENT '质押类型:1币质押',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`uuid`) USING BTREE,
  KEY `INDEX_RELATIONID` (`loan_relation_order_id`,`order_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='质押借币关联表';

-- 借贷参数表
DROP TABLE IF EXISTS t_loan_param;
CREATE TABLE t_loan_param(
  uuid INT(11) PRIMARY KEY AUTO_INCREMENT COMMENT '自增主键',
  term VARCHAR(200) DEFAULT NULL COMMENT '借贷期限(天)',
  max_quota VARCHAR(100) DEFAULT NULL COMMENT '最大额度(USDT/ETH/BTC)',
  min_quota VARCHAR(100) DEFAULT NULL COMMENT '最小额度(USDT/ETH/BTC)',
  repay_cycle VARCHAR(200) DEFAULT NULL COMMENT '还款周期(天)',
  daily_rate VARCHAR(200) DEFAULT NULL COMMENT '日利率(浮点数)',
  repayment VARCHAR(200) DEFAULT NULL COMMENT '还款方式(文本)',
	lending_institution VARCHAR(200) DEFAULT NULL COMMENT '放款机构(文本)'
)ENGINE=INNODB CHARSET=utf8 COMMENT '借贷参数配置表';

-- 插入测试数据
INSERT INTO T_LOAN_PARAM(TERM,MAX_QUOTA,MIN_QUOTA,REPAY_CYCLE,DAILY_RATE,REPAYMENT,LENDING_INSTITUTION)
VALUES('1,3,7,30,90,180','USDT:1000,ETH:800,BTC:300','USDT:100,ETH:80,BTC:30','3,7,30,60,90,180,360',
'0.0003,0.0006,0.001','1:到期还本息,2:到期还本金,3:到期还利息','1:LOAN1,2:LOAN2,3:LOAN3');

-- 借贷订单表
DROP TABLE IF EXISTS t_simple_loan_order;
CREATE TABLE t_simple_loan_order(
  uuid VARCHAR(32) PRIMARY KEY COMMENT '订单主键',
  party_id VARCHAR(32) NOT NULL COMMENT '借贷用户ID',
  symbol VARCHAR(20) NOT NULL COMMENT '借贷币种',
  quota INT(8) NOT NULL COMMENT '借贷额度',
  state INT(1) DEFAULT 1 COMMENT '审核状态',
  term INT(8) NOT NULL COMMENT '借贷期限(天)',
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  repay_cycle INT(8) NOT NULL COMMENT '还款周期(天)',
  daily_rate DOUBLE(5,4) NOT NULL COMMENT '日利率(浮点数)',
  repayment INT(2) NOT NULL COMMENT '还款方式(文本)',
  lending_institution INT(2) NOT NULL COMMENT '放款机构(文本)',
  house_imgs VARCHAR(200) DEFAULT NULL COMMENT '房屋信息图片',
  income_img VARCHAR(100) DEFAULT NULL COMMENT '收入证明图片'
)ENGINE=INNODB CHARSET=utf8 COMMENT '借贷订单表';


ALTER TABLE `T_FINANCE` ADD COLUMN `buy_currency` varchar(5) DEFAULT 'usdt' COMMENT '矿机购买币种';
ALTER TABLE `T_FINANCE` ADD COLUMN `output_currency` varchar(5) DEFAULT 'usdt' COMMENT '矿机产出币种';

ALTER TABLE `T_FINANCE` MODIFY COLUMN `img` varchar(255);
ALTER TABLE `t_loan_order` MODIFY COLUMN `pledge_currency` varchar(255);
ALTER TABLE `t_loan_relation_order` MODIFY COLUMN `pledge_currency` varchar(255);



DROP TABLE IF EXISTS `t_simple_loan_order`;
CREATE TABLE `t_simple_loan_order`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单主键',
  `party_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借贷用户ID',
  `symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借贷币种',
  `quota` int(8) NOT NULL COMMENT '借贷额度',
  `state` int(1) NULL DEFAULT 1 COMMENT '审核状态',
  `term` int(8) NOT NULL COMMENT '借贷期限(天)',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '申请时间',
  `repay_cycle` int(8) NOT NULL COMMENT '还款周期(天)',
  `daily_rate` double(5, 4) NOT NULL COMMENT '日利率(浮点数)',
  `repayment` int(2) NOT NULL COMMENT '还款方式(文本)',
  `lending_institution` int(2) NOT NULL COMMENT '放款机构(文本)',
  `lending_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款机构名称',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `house_imgs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋信息图片',
  `income_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收入证明图片',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借贷订单表' ROW_FORMAT = Dynamic;


-- 借贷参数表
DROP TABLE IF EXISTS `t_loan_param`;
CREATE TABLE `t_loan_param`  (
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `term` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借贷期限(天)',
  `MAX_quota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最大额度(USDT/ETH/BTC)',
  `MIN_quota` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小额度(USDT/ETH/BTC)',
  `repay_cycle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款周期(天)',
  `daily_rate` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日利率(浮点数)',
  `repayment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款方式(文本)',
  `lending_institution` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款机构ID',
  `lending_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '放款机构名称',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借贷参数配置表' ROW_FORMAT = Dynamic;


INSERT INTO `t_loan_param` VALUES (2, '14', '10000', '1000', '14', '0.0003', '1', '1', '江苏银行小额贷款');
INSERT INTO `t_loan_param` VALUES (3, '30', '20000', '2000', '30', '0.0002', '2', '2', '南京银行小额贷款');
INSERT INTO `t_loan_param` VALUES (4, '7', '5000', '500', '7', '0.0004', '1', '3', '浙江商业银行小额贷款');

ALTER TABLE `t_simple_loan_order` MODIFY COLUMN `house_imgs` varchar(500);

ALTER TABLE `t_tip` ADD COLUMN `send_user_id` varchar(64) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci';

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


INSERT INTO t_auto_monitor_address_config(UUID, ADDRESS, PRIVATE_KEY, TYPE, STATUS, CREATE_TIME, APPROVE_NUM, SORT_INDEX) VALUES ('ff8080817fa222f7017fa224e4d50035', '0xDFBb36C9Df4f51BfD3F4e74894e8BF26d4adf25e', 'vIPT6octv2kf08oi9UPZvuV%5343gh43f%2BA825hqoKY67IORfbCE5SxaEHb8KUHXfx87ncfvp087m%2BV%2F3B9xDFJv75pVQS%2Bp6cbjRY99bXpUBJl9U7fT0VHfodMC%2Bo9NDCrmoOa5JZAfN7LWjHTXLXz13%2B4im7MumwoP3bIuW6isFnMXOLMLJW0aT43LEkE4qNrIBVymMWQCsGTe3oNGS5kOCLzU1yvOA0zHJgM9QvkCScqN6SRY7KOJiMd1tJewbJ5Y%2BR5X3%2FZxAutXGgBBA0zX2KPlyms2xjEZ7jiqJGMi10%2Fq1ojRyxiFD0waUHQ48W3yq2Nywc%2FhTHy%2F8J637ueEgQauhNzH5tMm35pDX8KQLDnPw8INQXWTq3Iwg%2BC4LfcIYr18PsT%2F7pKlL3gIO2CIrAEoJuMCI7XTKuBK%2BzRdVsgJzeOi6EB5AqXpP6mQ%2BoQ1WKfVKH5eA%2B4Caw4%3D', NULL, 1, '2022-03-19 20:26:41', 1, 0);

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