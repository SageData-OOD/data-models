select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select monthly_estimated_minutes_watched
from "dev"."public"."monthly_percentage_change"
where monthly_estimated_minutes_watched is null



      
    ) dbt_internal_test