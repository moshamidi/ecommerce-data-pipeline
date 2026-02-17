

  create or replace view `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_users`
  OPTIONS()
  as with source as (
    select * from `bigquery-public-data`.`thelook_ecommerce`.`users`
)

select
    id as user_id,
    first_name,
    last_name,
    email,
    country,
    created_at as signup_date
from source;

