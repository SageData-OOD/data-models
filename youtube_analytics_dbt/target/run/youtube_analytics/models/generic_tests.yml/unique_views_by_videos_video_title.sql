select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    video_title as unique_field,
    count(*) as n_records

from "dev"."public"."views_by_videos"
where video_title is not null
group by video_title
having count(*) > 1



      
    ) dbt_internal_test