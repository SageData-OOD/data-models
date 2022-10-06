
    
    

select
    video_id as unique_field,
    count(*) as n_records

from "dev"."public"."videos_info"
where video_id is not null
group by video_id
having count(*) > 1


