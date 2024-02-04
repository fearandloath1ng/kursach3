CREATE INDEX IF NOT EXISTS idx_event_time_interval
ON Event_Time USING btree(start, finish);

CREATE INDEX IF NOT EXISTS idx_product_product_price
ON Product USING btree(product_price);

CREATE INDEX IF NOT EXISTS idx_admin_sold_count
ON ADMIN USING btree(sold_count);
