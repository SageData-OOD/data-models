

  create  table
    "dev"."public"."monthly_percentage_change__dbt_tmp"
    
    
    
  as (
    select
instant_month,
coalesce(((monthly_views - (lag(monthly_views, 0) over (order by instant_month)))/nullif(lag(monthly_views, 0) 
over (order by instant_month), 0))*100, 0) 
as monthly_views,
coalesce(((monthly_subscribers_gained - (lag(monthly_subscribers_gained, 0) over (order by instant_month)))/nullif(lag(monthly_subscribers_gained, 0) 
over (order by instant_month),0))*100, 0) 
as monthly_subscribers_gained,
coalesce(((monthly_estimated_minutes_watched - (lag(monthly_estimated_minutes_watched, 0) over (order by instant_month)))/nullif(lag(monthly_estimated_minutes_watched, 0) 
over (order by instant_month),0))*100, 0) 
as monthly_estimated_minutes_watched,
coalesce(((monthly_likes - (lag(monthly_likes, 0) over (order by instant_month)))/nullif(lag(monthly_likes, 0) 
over (order by instant_month),0))*100, 0)
as monthly_likes,
coalesce(((monthly_average_view_duration - (lag(monthly_average_view_duration, 0) over (order by instant_month)))/nullif(lag(monthly_average_view_duration, 0) 
over (order by instant_month),0))*100, 0) 
as monthly_average_view_duration
from
(
select 
    date_trunc('month',day) as instant_month,
    sum(views) monthly_views,
    sum(subscribers_gained) monthly_subscribers_gained,
    sum(estimated_minutes_watched) monthly_estimated_minutes_watched,
    sum(likes) monthly_likes,
    sum(average_view_duration) monthly_average_view_duration
from "dev"."public"."channel_info"
group by
instant_month
order by 1 asc
)
order by 1 desc
  );