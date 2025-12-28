select
  install_date,
  media_source,
  campaign_id,
  country,
  platform,
  count(distinct user_id) as installs
from sql.standardize.stg_installs
where is_fraud = 0
group by 1,2,3,4,5;