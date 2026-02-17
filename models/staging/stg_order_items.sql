with source as (
    select * from {{ source('thelook_ecommerce', 'order_items') }}
)

select
    id as order_item_id,
    order_id,
    user_id,
    product_id,
    sale_price,
    created_at as ordered_at,
    shipped_at,
    delivered_at,
    returned_at,
    status
from source