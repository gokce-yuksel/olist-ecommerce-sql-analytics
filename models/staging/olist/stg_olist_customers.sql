-- stg_olist_customers.sql
-- Müşteri temel bilgileri + temiz kolon adları

SELECT
  customer_id,
  customer_unique_id,
  customer_zip_code_prefix,
  customer_city,
  customer_state
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_customers_dataset`;
