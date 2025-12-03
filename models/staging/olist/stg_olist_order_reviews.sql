-- stg_olist_order_reviews.sql
-- Müşteri yorumları ve değerlendirme puanları

SELECT
  review_id,
  order_id,
  review_score,
  review_comment_title,
  review_comment_message,
  CAST(review_creation_date AS TIMESTAMP) AS review_creation_ts,
  CAST(review_answer_timestamp AS TIMESTAMP) AS review_answer_ts
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_order_reviews_dataset`;
