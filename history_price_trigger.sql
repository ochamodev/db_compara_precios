CREATE OR REPLACE FUNCTION log_price_history()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO product_history_prices(product_id, sale_price, current_price, created_at, updated_at)
    VALUES(NEW.id, NEW.sale_price, NEW.current_price, NOW(), NOW());

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_log_price_history
AFTER INSERT OR UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION log_price_history();