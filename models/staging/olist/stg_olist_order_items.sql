-- stg_olist_order_items.sql
-- Sipariş içerisindeki ürün detayları + fiyat & kargo bilgileri

SELECT
  order_id,
  order_item_id,
  product_id,
  seller_id,
  price,
  freight_value
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_order_items_dataset`;
