select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select no_of_views
from "dev"."public"."videos_info"
where no_of_views is null



      
    ) dbt_internal_test