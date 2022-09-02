{{
    config(
        tags=["aban_checkout_reports"]
    )
}}


select 
    title Products, 
    sum(quantity) count_of_product
from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__abandoned_checkouts__line_items')}}
group by
    Products