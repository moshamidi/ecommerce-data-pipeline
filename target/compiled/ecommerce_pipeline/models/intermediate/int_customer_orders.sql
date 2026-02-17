with users as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_users`
),

order_items as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_order_items`
)

select
    u.user_id,
    u.first_name,
    u.last_name,
    u.country,
    u.signup_date,
    count(distinct oi.order_id) as total_orders,
    count(oi.order_item_id) as total_items,
    sum(oi.sale_price) as total_revenue,
    min(oi.ordered_at) as first_order_date,
    max(oi.ordered_at) as last_order_date
from users u
left join order_items oi on u.user_id = oi.user_id
group by 1, 2, 3, 4, 5