-- stg_olist_orders.sql
-- Olist orders staging table: temiz isimlendirme + timestamp dönüşümleri

SELECT
  order_id,
  customer_id,
  order_status,
  CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_ts,
  CAST(order_approved_at AS TIMESTAMP) AS order_approved_ts,
  CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_ts,
  CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_ts,
  CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_ts
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_orders_dataset`;
