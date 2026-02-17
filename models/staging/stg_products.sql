with source as (
    select * from {{ source('thelook_ecommerce', 'products') }}
)

select
    id as product_id,
    name as product_name,
    category,
    brand,
    department,
    cost,
    retail_price
from source