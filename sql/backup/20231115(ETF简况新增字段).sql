alter table t_item_summary modify column address text null comment '注册办事处';
alter table t_item_summary modify column main_correspondent_bank text null comment '主要往来银行';
alter table t_item_summary modify column business_scope text null comment '经营范围';
alter table t_item_summary modify column trading_commission text null comment '交易佣金';
alter table t_item_summary add net_unit_value varchar(32) null comment '单位净值';
alter table t_item_summary add net_worth_growth_rate varchar(32) null comment '净值增长率';
alter table t_item_summary add cumulative_net_worth varchar(32) null comment '累计净值';
alter table t_item_summary add expiration_date varchar(32) null comment '截止日期';
alter table t_item_summary add latest_valuation varchar(32) null comment '最新估值';
alter table t_item_summary add quote_change varchar(32) null comment '涨跌幅';
alter table t_item_summary add changes varchar(32) null comment '涨跌额';
alter table t_item_summary add latest_scale varchar(32) null comment '最新规模';
alter table t_item_summary add subscription_status varchar(32) null comment '申购状态';
alter table t_item_summary add redemption_status varchar(32) null comment '赎回状态';
alter table t_item_summary add income_distribution_principle text null comment '收益分配原则';

