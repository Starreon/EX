-- 新版返佣，返佣版本-1
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_version', 'rebate_version', NULL, '1', 100, 2, '返利版本', 0);

--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_1_level_1', 'rebate_1_level_1', NULL, '0.05', 100, 2, '1级代理1级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_1_level_2', 'rebate_1_level_2', NULL, '0.03', 100, 2, '1级代理2级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_1_level_3', 'rebate_1_level_3', NULL, '0.02', 100, 2, '1级代理3级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_1_level_4', 'rebate_1_level_4', NULL, '0.01', 100, 2, '1级代理4级返佣', 0);

--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_2_level_1', 'rebate_2_level_1', NULL, '0.05', 100, 2, '2级代理1级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_2_level_2', 'rebate_2_level_2', NULL, '0.03', 100, 2, '2级代理2级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_2_level_3', 'rebate_2_level_3', NULL, '0.02', 100, 2, '2级代理3级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_2_level_4', 'rebate_2_level_4', NULL, '0.01', 100, 2, '2级代理4级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_3_level_1', 'rebate_3_level_1', NULL, '0.05', 100, 2, '3级代理1级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_3_level_2', 'rebate_3_level_2', NULL, '0.03', 100, 2, '3级代理2级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_3_level_3', 'rebate_3_level_3', NULL, '0.02', 100, 2, '3级代理3级返佣', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_3_level_4', 'rebate_3_level_4', NULL, '0.01', 100, 2, '3级代理4级返佣', 0);

--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('player_level_1', 'player_level_1', NULL, '2', 100, 2, '代理等级1人数', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('player_level_2', 'player_level_2', NULL, '5', 100, 2, '代理等级2人数', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('player_level_3', 'player_level_3', NULL, '10', 100, 2, '代理等级3人数', 0);

--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('player_level_max', 'player_level_max', NULL, '3', 100, 2, '最大代理等级', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('base_1_level_1', 'base_1_level_1', NULL, '1000', 100, 2, '返佣分成界限', 0);

-- 首充彩金
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('have_first_recharge', 'have_first_recharge', NULL, 'true', 100, 2, '是否有首充彩金', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('base_first_recharge', 'base_first_recharge', NULL, '500', 100, 2, '首充彩金界限', 0);
--
--INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
--VALUES ('rebate_first_recharge', 'rebate_first_recharge', NULL, '0.2', 100, 2, '首充彩金返利比例', 0);



-- 代理返佣
INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
VALUES ('rebate', 'rebate', NULL, 'rebate_version:1,base_1_level_1:1000,rebate_1_level_1:0.05,rebate_1_level_2:0.03,rebate_1_level_3:0.02,rebate_1_level_4:0.01,rebate_2_level_1:0.05,rebate_2_level_2:0.03,rebate_2_level_3:0.02,rebate_2_level_4:0.01,rebate_3_level_1:0.05,rebate_3_level_2:0.03,rebate_3_level_3:0.02,rebate_3_level_4:0.01,player_level:1-5-10', 100, 2, 'base_1_level_1:返佣分成界限;rebate_1_level_1:等级1的1级返佣,rebate_用户等级_level_几级返佣', 0);

--首充
INSERT INTO `t_syspara`(`UUID`, `CODE`, `PARTY_ID`, `SVALUE`, `SORDER`, `STYPE`, `NOTES`, `MODIFY`)
VALUES ('first_recharge', 'first_recharge', NULL, 'true,500,0.2', 100, 2, '是否有首充彩金,首充彩金界限,首充彩金返利比例', 0);
