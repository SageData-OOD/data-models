select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    instant_month as unique_field,
    count(*) as n_records

from "dev"."public"."monthly_percentage_change"
where instant_month is not null
group by instant_month
having count(*) > 1



      
    ) dbt_internal_test