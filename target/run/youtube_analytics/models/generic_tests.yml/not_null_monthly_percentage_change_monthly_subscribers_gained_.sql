select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select monthly_subscribers_gained(%)
from "dev"."public"."monthly_percentage_change"
where monthly_subscribers_gained(%) is null



      
    ) dbt_internal_test