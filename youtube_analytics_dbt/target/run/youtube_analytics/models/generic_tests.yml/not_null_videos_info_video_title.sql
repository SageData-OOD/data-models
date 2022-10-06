select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select video_title
from "dev"."public"."videos_info"
where video_title is null



      
    ) dbt_internal_test