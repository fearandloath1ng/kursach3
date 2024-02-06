CREATE INDEX IF NOT EXISTS idx_event_time_interval
ON Event_Time USING btree(start, finish);

CREATE INDEX IF NOT EXISTS idx_product_product_price
ON Product USING btree(product_price);

CREATE INDEX IF NOT EXISTS idx_equipment_product_price
ON Equipment USING btree(product_price);

CREATE INDEX IF NOT EXISTS idx_master_not_fixed_and_fixed
ON Master using btree(not_fixed, fixed);
