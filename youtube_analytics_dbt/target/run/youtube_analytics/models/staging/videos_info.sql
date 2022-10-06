

  create  table
    "dev"."public"."videos_info__dbt_tmp"
    
    
    
  as (
    with videos as
(
    select *
    from "dev"."sd_stage"."sd__youtube__youtube_test__videos"
)

select
    id video_id,
    snippet__title video_title,
    snippet__category_id category_id,
    statistics__view_count no_of_views
from
videos
  );