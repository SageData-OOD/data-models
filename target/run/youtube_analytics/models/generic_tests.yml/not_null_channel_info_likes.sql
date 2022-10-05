select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select likes
from "dev"."public"."channel_info"
where likes is null



      
    ) dbt_internal_test