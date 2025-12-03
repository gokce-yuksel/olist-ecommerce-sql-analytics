-- stg_olist_products.sql
-- Ürün bilgileri + kategori adı + ürün ölçülerinin temel hali

SELECT
  product_id,
  product_category_name,
  product_name_lenght,
  product_description_lenght,
  product_photos_qty,
  product_weight_g,
  product_length_cm,
  product_height_cm,
  product_width_cm
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_products_dataset`;
