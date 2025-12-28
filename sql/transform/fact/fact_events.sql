select
  user_id,
  event_date,
  sum(revenue_value) as daily_revenue
from sql.standardize.stg_events
group by 1,2;