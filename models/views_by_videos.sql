select
     video_title,
     no_of_views
from
{{ref('videos_info')}}
order by
no_of_views desc