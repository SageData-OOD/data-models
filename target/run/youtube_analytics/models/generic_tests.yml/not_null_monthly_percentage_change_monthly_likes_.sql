select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select monthly_likes(%)
from "dev"."public"."monthly_percentage_change"
where monthly_likes(%) is null



      
    ) dbt_internal_test