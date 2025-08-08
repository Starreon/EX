-- 修改理财产品图片字段
alter table t_finance modify `img` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;