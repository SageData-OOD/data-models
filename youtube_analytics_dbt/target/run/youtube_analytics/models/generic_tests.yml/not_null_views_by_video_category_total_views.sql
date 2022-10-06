select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_views
from "dev"."public"."views_by_video_category"
where total_views is null



      
    ) dbt_internal_test