-- stg_olist_order_payments.sql
-- Sipariş ödeme bilgileri (taksit sayısı ve toplam ödeme değeri dahil)

SELECT
  order_id,
  payment_sequential,
  payment_type,
  payment_installments,
  payment_value
FROM `olist-sql-dbt.Olist_SQL_DBT.olist_order_payments_dataset`;
