select
     category_id,
     sum(no_of_views) total_views
from
"dev"."public"."videos_info"
group by
category_id