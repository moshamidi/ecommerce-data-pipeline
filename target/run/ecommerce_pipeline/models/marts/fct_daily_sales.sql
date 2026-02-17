

  create or replace view `portfolio-ecommerce-pipeline`.`dbt_mos`.`fct_daily_sales`
  OPTIONS()
  as with orders as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`int_orders_with_users`
)

select
    date(order_date) as sale_date,
    country,
    count(distinct order_id) as total_orders,
    count(distinct user_id) as unique_customers,
    sum(item_count) as total_items_sold
from orders
where status = 'Complete'
group by 1, 2;

