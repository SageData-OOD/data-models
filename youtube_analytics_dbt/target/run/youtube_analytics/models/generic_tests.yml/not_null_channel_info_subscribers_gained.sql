select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select subscribers_gained
from "dev"."public"."channel_info"
where subscribers_gained is null



      
    ) dbt_internal_test