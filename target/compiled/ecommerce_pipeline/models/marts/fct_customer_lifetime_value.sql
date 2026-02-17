with customer_orders as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`int_customer_orders`
)

select
    user_id,
    first_name,
    last_name,
    country,
    signup_date,
    total_orders,
    total_items,
    total_revenue,
    first_order_date,
    last_order_date,
    date_diff(last_order_date, first_order_date, day) as customer_lifespan_days,
    case
        when total_revenue >= 500 then 'High Value'
        when total_revenue >= 100 then 'Medium Value'
        else 'Low Value'
    end as customer_segment
from customer_orders
where total_orders > 0