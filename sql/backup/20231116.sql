ALTER TABLE t_item_summary MODIFY COLUMN investment_type VARCHAR(1024);
update t_item set remarks = 'UUP' where symbol = 'UUP';