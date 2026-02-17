

  create or replace view `portfolio-ecommerce-pipeline`.`dbt_mos`.`fct_monthly_revenue`
  OPTIONS()
  as with order_items as (
    select * from `portfolio-ecommerce-pipeline`.`dbt_mos`.`int_order_items_with_products`
)

select
    date_trunc(ordered_at, month) as month,
    category,
    department,
    count(distinct order_id) as total_orders,
    count(order_item_id) as total_items,
    sum(sale_price) as total_revenue,
    sum(profit) as total_profit,
    avg(sale_price) as avg_order_value
from order_items
where status != 'Cancelled'
group by 1, 2, 3;

