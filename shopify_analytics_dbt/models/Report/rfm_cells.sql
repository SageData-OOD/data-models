{{
    config(
        tags=["rfm"]
    )
}}



select 
    customer__id,
    rfm_recency,
    rfm_frequency,
    rfm_monetary,
    rfm_recency || rfm_frequency || rfm_monetary AS rfm_cell
from {{ref('rfm_quintiles')}}
order by 5 desc