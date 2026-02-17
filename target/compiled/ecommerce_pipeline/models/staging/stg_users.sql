with source as (
    select * from `bigquery-public-data`.`thelook_ecommerce`.`users`
)

select
    id as user_id,
    first_name,
    last_name,
    email,
    country,
    created_at as signup_date
from source