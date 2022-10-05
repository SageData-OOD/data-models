select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select average_view_duration
from "dev"."public"."channel_info"
where average_view_duration is null



      
    ) dbt_internal_test