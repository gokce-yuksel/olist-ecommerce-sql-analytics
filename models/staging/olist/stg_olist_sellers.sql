-- stg_olist_sellers.sql
-- Satıcı temel bilgileri (konum + zip prefix)

SELECT
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_sellers_dataset`;
