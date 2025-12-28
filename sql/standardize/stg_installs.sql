with raw as (
  select *
  from data.raw.installs
)

select
  coalesce(customer_user_id, appsflyer_id) as user_id,
  to_date(install_time)                    as install_date,

  lower(trim(media_source))                as media_source,
  coalesce(trim(campaign), 'na')            as campaign_id,
  coalesce(trim(adset_id), 'na')            as adset_id,
  coalesce(trim(keyword), 'na')             as keyword,

  upper(country_code)                      as country,
  case 
    when lower(platform) like '%ios%' then 'ios'
    when lower(platform) like '%android%' then 'android'
    else 'unknown'
  end                                      as platform,

  case when is_tagged = true then 1 else 0 end as is_fraud,
  tagged_type                               as fraud_type

from raw;