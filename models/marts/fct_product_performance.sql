with order_items as (
    select * from {{ ref('int_order_items_with_products') }}
)

select
    product_id,
    product_name,
    category,
    brand,
    department,
    count(distinct order_id) as times_ordered,
    sum(sale_price) as total_revenue,
    sum(profit) as total_profit,
    avg(sale_price) as avg_sale_price,
    sum(case when status = 'Returned' then 1 else 0 end) as return_count
from order_items
group by 1, 2, 3, 4, 5