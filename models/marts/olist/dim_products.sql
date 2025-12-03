-- dim_products.sql
-- Ürün bilgilerini kategori çevirisiyle birleştiren ürün boyut tablosu

WITH products AS (
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
    FROM {{ ref('stg_olist_products') }}
),

category_translation AS (
    SELECT
        product_category_name,
        product_category_name_english
    FROM `olist-sql-dbt.Olist_SQL_DBT.olist_product_category_name_translation`
)

SELECT
    p.product_id,
    p.product_category_name,
    ct.product_category_name_english,
    p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM products p
LEFT JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name;
