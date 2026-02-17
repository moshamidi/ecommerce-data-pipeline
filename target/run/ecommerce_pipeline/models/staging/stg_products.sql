

  create or replace view `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_products`
  OPTIONS()
  as with source as (
    select * from `bigquery-public-data`.`thelook_ecommerce`.`products`
)

select
    id as product_id,
    name as product_name,
    category,
    brand,
    department,
    cost,
    retail_price
from source;

