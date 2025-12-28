select
  i.install_date,
  i.media_source,
  i.campaign_id,
  i.country,
  i.platform,

  count(distinct i.user_id) as installs,
  count(distinct case when e.revenue_value > 0 then i.user_id end) as payers,

  sum(case when datediff(e.event_date, i.install_date) = 0 then e.revenue_value end)  as ltv0,
  sum(case when datediff(e.event_date, i.install_date) <= 30 then e.revenue_value end) as ltv30,
  sum(case when datediff(e.event_date, i.install_date) <= 60 then e.revenue_value end) as ltv60,
  sum(case when datediff(e.event_date, i.install_date) <= 90 then e.revenue_value end) as ltv90

from sql.standardize.stg_installs i
left join sql.standardize.stg_events e
  on i.user_id = e.user_id
where i.is_fraud = 0
group by 1,2,3,4,5;