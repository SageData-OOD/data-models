select
    orders.*, 
    coalesce(refund_amount.amount::real, 0) refund_amount
from dev.public.sd__redshift__xl_replicate__sd__shopify__xl__orders as orders
left join dev.public.sd__redshift__xl_replicate__sd__shopify__xl__orders__refunds__order_adjustments as refund_amount
on orders.id=refund_amount.id