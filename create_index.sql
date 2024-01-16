CREATE INDEX IF NOT EXISTS idx_event_time_interval
ON Event_Time USING btree(start, finish);

CREATE INDEX IF NOT EXISTS idx_product_product_price
ON Product USING btree(product_price);

CREATE INDEX IF NOT EXISTS idx_equipment_product_price
ON Equipment USING btree(product_price);

CREATE INDEX IF NOT EXISTS idx_buyer_warning_count
ON Buyer USING btree(warning_count);

CREATE INDEX IF NOT EXISTS idx_master_fixed
ON Master using btree(fixed);

CREATE INDEX IF NOT EXISTS idx_master_not_fixed
ON Master using btree(not_fixed);

CREATE INDEX IF NOT EXISTS idx_admin_sold_count
ON ADMIN USING btree(sold_count);