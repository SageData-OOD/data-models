select * 
from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__orders__line_items')}}