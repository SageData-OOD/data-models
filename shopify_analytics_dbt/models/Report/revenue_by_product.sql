{{
    config(
        tags=["revenue"]
    )
}}

SELECT
    title Product,
    sum(quantity) number_sold,
    sum(quantity*(round(price::real,2) - round(total_discount::real,2))) Total_revenue
from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__orders__line_items')}}
group by 
    Product