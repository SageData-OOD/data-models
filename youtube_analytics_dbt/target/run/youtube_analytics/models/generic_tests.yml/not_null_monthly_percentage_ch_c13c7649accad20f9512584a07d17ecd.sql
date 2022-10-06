select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select monthly_average_view_duration
from "dev"."public"."monthly_percentage_change"
where monthly_average_view_duration is null



      
    ) dbt_internal_test