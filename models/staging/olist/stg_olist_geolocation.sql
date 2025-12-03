-- stg_olist_geolocation.sql
-- Müşteri ve satıcı konumları için coğrafi bilgiler

SELECT
  geolocation_zip_code_prefix,
  geolocation_lat,
  geolocation_lng,
  geolocation_city,
  geolocation_state
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_geolocation_dataset`;
