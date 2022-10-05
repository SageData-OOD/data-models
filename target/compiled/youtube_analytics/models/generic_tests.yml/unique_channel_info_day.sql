
    
    

select
    day as unique_field,
    count(*) as n_records

from "dev"."public"."channel_info"
where day is not null
group by day
having count(*) > 1


