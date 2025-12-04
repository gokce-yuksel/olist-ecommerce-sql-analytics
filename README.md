📦 Olist E-Commerce Analytics (BigQuery + dbt)
<p align="center"> <img src="https://raw.githubusercontent.com/primer/octicons/main/icons/chart-bar-24.svg" width="70"> </p>
🚀 Project Overview

This project presents an end-to-end analytics pipeline built using the Olist Brazilian e-commerce dataset.
The workflow includes data ingestion, cleaning, transformation with dbt, data modeling, and analytical insights built on top of BigQuery.

The goal is to create a reliable data model and generate insights across customers, products, orders, and geography.

🛠 Tech Stack

BigQuery – Data warehouse

dbt Core – Data transformation, modeling, testing

SQL – KPI calculations and analytical queries

GitHub – Version control

CSV outputs – Final analytical result exports

🏗 Data Architecture
Raw CSVs
      ↓
BigQuery Raw Tables
      ↓
dbt Staging Models
      ↓
dbt Dimension & Fact Models
      ↓
Analytical SQL Queries
      ↓
Insights & CSV Exports

📂 Repository Structure
olist-analytics/
│
├── dbt_project/
│   ├── models/
│   │   ├── staging/
│   │   ├── marts/
│   │   │   ├── dimensions/
│   │   │   ├── facts/
│   │   │   └── performance/
│   └── dbt_project.yml
│
├── analysis_results/
│   ├── customer_lifetime_value.csv
│   ├── customer_segments.csv
│   ├── top_selling_products.csv
│   ├── best_rated_products.csv
│   ├── revenue_by_city.csv
│   └── orders_by_zipcode.csv
│
├── presentation/
│   └── Olist_Insights_Slides.pptx
│
└── README.md

📊 Key Metrics & Analyses
Customer Analytics

Customer segmentation (VIP, Loyal, New)

Customer Lifetime Value (CLV)

Order frequency metrics

Product Analytics

Top selling products

Highest rated products

Revenue contribution

Order & Revenue Analytics

Order volume trends

Average Order Value (AOV)

Revenue distribution

Geographic Analytics

Revenue by city

Orders by ZIP code prefix

📈 Fact & Dimension Models
Fact Tables

fact_orders

fct_customer_value

fct_product_performance

fct_delivery_performance

Dimension Tables

dim_customers

dim_products

Staging Models

All raw tables are cleaned and standardized in stg_olist_* models.

📑 Analysis Outputs

All analytical results derived from BigQuery SQL queries are stored in:

analysis_results/


Each CSV file represents a key insight area including customer value, product performance, and geographic revenue breakdowns.

🎯 Business Findings

Revenue is concentrated among repeat and high-value customers.

Certain product groups dominate order volume and average ratings.

Geographic regions show strong differences in purchasing behavior.

City-level revenue analysis reveals clear high-impact markets.

🧭 Reproducibility
Run all dbt models:
dbt build

BigQuery:

Dataset:

Olist_SQL_DBT

⭐ Project Status

Completed end-to-end analytics pipeline including dbt models, SQL insights, CSV exports, and presentation template.
