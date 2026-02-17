# E-Commerce Data Pipeline

## Overview
An end-to-end ELT pipeline that transforms raw e-commerce data into analytics-ready tables using BigQuery and dbt.

## Architecture
![Pipeline Architecture](docs/architecture.png)

## Tech Stack
- **Google BigQuery** - Cloud data warehouse
- **dbt Core** - Data transformation
- **SQL** - Business logic
- **Data Quality Tests** - Ensuring data integrity

## Pipeline Structure

| Layer | Models | Purpose |
|-------|--------|---------|
| **Sources** | 5 tables | Raw data from BigQuery public dataset |
| **Staging** | 5 models | Clean, rename, and standardize |
| **Intermediate** | 3 models | Join and enrich data |
| **Marts** | 4 models | Business-ready metrics |

## Models

### Staging
- `stg_orders` - Cleaned orders data
- `stg_users` - Cleaned customer data
- `stg_products` - Cleaned product catalog
- `stg_order_items` - Cleaned order line items
- `stg_events` - Cleaned website events

### Intermediate
- `int_orders_with_users` - Orders enriched with customer info
- `int_order_items_with_products` - Order items with product details
- `int_customer_orders` - Customer order history

### Marts
- `fct_daily_sales` - Daily sales metrics by country
- `fct_customer_lifetime_value` - Customer segmentation by value
- `fct_monthly_revenue` - Monthly revenue by category
- `fct_product_performance` - Product sales and profitability

## Data Quality
Includes tests for:
- Primary key uniqueness
- Null value checks

## How to Run
1. Clone this repo
2. Set up dbt profile for BigQuery
3. Run `dbt run` to build models
4. Run `dbt test` to validate data
5. Run `dbt docs generate && dbt docs serve` to view documentation

## Author
Built by Mos | Data Analytics Consultant
