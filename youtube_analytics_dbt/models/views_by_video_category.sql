select
     category_id,
     sum(no_of_views) total_views
from
{{ref('videos_info')}}
group by
category_id
order by
total_views desc