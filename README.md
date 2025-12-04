🛒 Olist E-Commerce Analytics
BigQuery + dbt + SQL End-to-End Data Pipeline

🚀 Project Overview

This project delivers a complete analytics workflow built using Google BigQuery, dbt, and SQL on top of the Olist Brazilian e-commerce dataset.

The pipeline includes:

✔️ Raw data ingestion into BigQuery
✔️ Staging & cleaning with dbt
✔️ Fact & dimension modeling
✔️ Analytical SQL queries
✔️ Final insights exported as CSV

The goal is to build a reliable analytics model and generate insights on customers, products, orders, and geography.

🧰 Tech Stack
Component	Purpose
BigQuery	Cloud data warehouse for storing & querying raw + transformed data
dbt Core	Data transformations, staging, marts, fact & dimension modeling
SQL	KPI calculations & analytical queries
GitHub	Version control & project hosting
CSV Exports	Final analytical outputs
📁 Repository Structure
1. Main Folders
Folder	Description
dbt_project/	All dbt models, staging, marts, fact & dimension tables
analysis_results/	Final CSV outputs from analytical queries
presentation/	Slide deck (Olist_Insights_Slides.pptx)
README.md	This documentation
2. dbt Project Structure
Path	Purpose
dbt_project/models/staging/	Cleaned + standardized raw tables (stg_olist_*)
dbt_project/models/marts/dimensions/	Dimension models (dim_customers, dim_products)
dbt_project/models/marts/facts/	Fact models (fact_orders, fct_customer_value, fct_product_performance, fct_delivery_performance)
dbt_project/dbt_project.yml	dbt project configuration
3. Analysis Results (CSV Outputs)
File	Description
customer_segments.csv	VIP / Loyal / New customer segmentation
customer_lifetime_value.csv	Customer Lifetime Value (CLV)
top_selling_products.csv	Best-selling products
best_rated_products.csv	Highest-rated products
revenue_by_city.csv	Revenue by city
orders_by_zipcode.csv	Order distribution by ZIP prefix
4. Presentation
File	Description
Olist_Insights_Slides.pptx	Clean slide deck with placeholders for charts
📊 Key Metrics & Business Insights
👤 Customer Analytics
Customer Segments (VIP, Loyal, New)

Segmented using total order frequency.
Helps identify high-value and retention-critical users.

Customer Lifetime Value (CLV)

Calculated using:

Total revenue per user

Average order value

Number of orders

Top customers show extremely long-tail revenue patterns.

📦 Product Analytics
Top Selling Products

Based on order frequency (from fact tables).

Best Rated Products

Ranked by average review score (min 20 reviews threshold).

💰 Order & Revenue Analytics
Average Order Value (AOV)

Mean order value ≈ 160.58 BRL

Revenue Distribution

Revenue concentrated in a small % of customers.

🗺 Geographic Analytics
Top Revenue Cities

São Paulo is the clear leader, followed by Rio de Janeiro and Belo Horizonte.

Orders by ZIP Prefix

Useful for logistics optimization & delivery performance analytics.

🧱 Fact & Dimension Models
Fact Tables

fact_orders

fct_customer_value

fct_product_performance

fct_delivery_performance

Dimension Tables

dim_customers

dim_products

Staging Tables

All raw source tables standardized under:
stg_olist_*
