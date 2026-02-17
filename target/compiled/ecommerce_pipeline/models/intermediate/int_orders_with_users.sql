with orders as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_orders`
),

users as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_users`
)

select
    o.order_id,
    o.order_date,
    o.status,
    o.item_count,
    u.user_id,
    u.first_name,
    u.last_name,
    u.country
from orders o
left join users u on o.user_id = u.user_id