🎯 Olist E-Commerce Analytics (BigQuery + dbt)
<p align="center"> <img src="https://raw.githubusercontent.com/gokce-yuksel/olist-analytics/main/.assets/olist_banner.png" width="80%" /> </p>
🚀 Project Overview

This project delivers an end-to-end analytics pipeline built with Google BigQuery, dbt, and SQL analytics using the Olist Brazilian e-commerce dataset.

The pipeline includes:
✔️ Raw data ingestion
✔️ Staging & cleaning with dbt
✔️ Fact & dimension modeling
✔️ Analytical SQL queries
✔️ Final insights exported as CSV

🧱 Tech Stack
Tool	Purpose
BigQuery	Cloud data warehouse
dbt Core	Data modeling, transformation, testing
SQL	KPI computation & analytical queries
GitHub	Version control, documentation
CSV Outputs	Final analytical datasets
🗂️ Repository Structure
olist-analytics/
│
├── dbt_project/
│   ├── models/
│   │   ├── staging/
│   │   ├── marts/
│   │   │   ├── dimensions/
│   │   │   └── facts/
│   └── dbt_project.yml
│
├── analysis_results/
│   ├── customer_segments.csv
│   ├── customer_lifetime_value.csv
│   ├── top_selling_products.csv
│   ├── best_rated_products.csv
│   ├── revenue_by_city.csv
│   └── orders_by_zipcode.csv
│
├── presentation/
│   └── Olist_Insights_Slides.pptx
│
└── README.md

📊 Key Metrics & Business Insights
👥 Customer Analytics
Customer Segments (VIP, Loyal, New)

Segmented based on order frequency

Helps identify retention & high-value users

Customer Lifetime Value (CLV)

Computed using aggregated revenue and average order value

Top customers significantly outperform long-tail

📦 Product Analytics
Top Selling Products
<img src="https://raw.githubusercontent.com/gokce-yuksel/olist-analytics/main/.assets/top_selling.png" width="70%">
Highest Rated Products
<img src="https://raw.githubusercontent.com/gokce-yuksel/olist-analytics/main/.assets/best_rated.png" width="70%">
💰 Order & Revenue Analytics
Average Order Value

Mean AOV ≈ 160.58 BRL

Revenue Distribution
<img src="https://raw.githubusercontent.com/gokce-yuksel/olist-analytics/main/.assets/revenue_city.png" width="70%">
🌎 Geographic Insights
Top Revenue-Generating Cities

São Paulo overwhelming leader

Followed by Rio de Janeiro & Belo Horizonte

Orders by ZIP Prefix

Useful for logistics & delivery optimization

🧩 dbt Models
🟦 Fact Tables

fact_orders

fct_customer_value

fct_product_performance

fct_delivery_performance

🟩 Dimension Tables

dim_customers

dim_products

🟨 Staging Models

All raw inputs standardized using:
stg_olist_customers, stg_olist_orders, stg_olist_products, etc.

📁 Final Analytical Outputs

All final insight datasets are exported as CSV and available under:
📂 analysis_results/

Includes:

Customer segments

Customer lifetime value

Top selling products

Best rated products

Revenue by city

Orders by zipcode

🎤 Presentation

A clean slide deck summarizing insights:
📂 presentation/Olist_Insights_Slides.pptx
