with channel as
( 
    select * 
    from "dev"."sd_stage"."sd__youtube__my_youtube__channel"
)

select
	day,
    views,
    subscribers_gained,
    estimated_minutes_watched,
    likes - coalesce(lag(likes, 0) over (order by day), 0) as likes,
    coalesce(estimated_minutes_watched/nullif(views,0), 0) average_view_duration
from channel