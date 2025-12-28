with raw as (
  select *
  from data.raw.in_app_events
)

select
  coalesce(customer_user_id, appsflyer_id) as user_id,
  to_timestamp(event_time)                 as event_time,
  to_date(event_time)                      as event_date,

  event_name,

  cast(event_revenue as double)            as revenue_value,
  upper(currency)                          as currency_code

from raw;