select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select suscribers_gained
from "dev"."public"."channel_info"
where suscribers_gained is null



      
    ) dbt_internal_test