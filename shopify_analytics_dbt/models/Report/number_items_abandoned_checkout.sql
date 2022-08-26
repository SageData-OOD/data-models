{{
    config(
        tags=["aban_checkout_reports"]
    )
}}


select 
    title Products, 
    sum(quantity) count_of_product
from {{ref('Abandoned_checkouts')}}
group by
    Products