with order_items as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_order_items`
),

products as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_products`
)

select
    oi.order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    p.product_name,
    p.category,
    p.brand,
    p.department,
    p.cost,
    p.retail_price,
    oi.sale_price,
    oi.sale_price - p.cost as profit,
    oi.ordered_at,
    oi.shipped_at,
    oi.delivered_at,
    oi.returned_at,
    oi.status
from order_items oi
left join products p on oi.product_id = p.product_id