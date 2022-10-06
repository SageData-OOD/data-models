select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select video_id
from "dev"."public"."videos_info"
where video_id is null



      
    ) dbt_internal_test