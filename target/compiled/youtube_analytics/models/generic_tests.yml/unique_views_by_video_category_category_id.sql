
    
    

select
    category_id as unique_field,
    count(*) as n_records

from "dev"."public"."views_by_video_category"
where category_id is not null
group by category_id
having count(*) > 1


