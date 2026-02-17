

  create or replace view `portfolio-ecommerce-pipeline`.`dbt_mos`.`stg_events`
  OPTIONS()
  as with source as (
    select * from `bigquery-public-data`.`thelook_ecommerce`.`events`
)

select
    id as event_id,
    user_id,
    session_id,
    event_type,
    uri as page_url,
    created_at as event_time,
    traffic_source,
    browser
from source;

