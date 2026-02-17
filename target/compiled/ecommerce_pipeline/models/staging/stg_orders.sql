with source as (
    select * from `bigquery-public-data.thelook_ecommerce.orders`
)

select
    order_id,
    user_id,
    status,
    created_at as order_date,
    num_of_item as item_count
from source