with daily_video_info as 
(
    select * 
    from "dev"."sd_stage"."sd__youtube__youtube_test__channel_basic"
)

select
    dvi.date as instance_date,
    dvi.video_id,
    vi.video_title,
    dvi.views
from daily_video_info as dvi
left join (
    select * 
    from "dev"."public"."videos_info"
                
                ) as vi
on dvi.video_id = vi.video_id
order by 
instance_date, views