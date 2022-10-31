with raw_ad_insight as (

    select *
    from {{source('facebook_raw_data', 'sd__facebook_ads__dev_daniel__ads_insights')}}
),

ad_by_account_name as (
    
    select 
        date_stop date_day,
        account_id,
        account_name,
        sum(clicks) as clicks,
        sum(impressions) as impressions,
        sum(spend) as spend
    from raw_ad_insight
    group by
        account_name,
        date_day,
        account_id
)

select *
from ad_by_account_name