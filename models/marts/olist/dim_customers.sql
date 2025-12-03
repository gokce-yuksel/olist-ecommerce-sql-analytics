-- dim_customers.sql
-- Müşteri temel bilgileri (şehir, eyalet, zip) ve unique_id ile zenginleştirilmiş boyut tablosu

SELECT
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state
FROM {{ ref('stg_olist_customers') }} AS c;
