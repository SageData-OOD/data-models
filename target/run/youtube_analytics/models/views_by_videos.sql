

  create view "dev"."public"."views_by_videos__dbt_tmp" as (
    select
     video_title,
     no_of_views
from
"dev"."public"."videos_info"
  ) ;
