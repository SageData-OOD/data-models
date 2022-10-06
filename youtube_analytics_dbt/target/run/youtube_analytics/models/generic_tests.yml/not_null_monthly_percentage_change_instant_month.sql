select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select instant_month
from "dev"."public"."monthly_percentage_change"
where instant_month is null



      
    ) dbt_internal_test