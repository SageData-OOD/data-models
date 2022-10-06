select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select category_id
from "dev"."public"."views_by_video_category"
where category_id is null



      
    ) dbt_internal_test