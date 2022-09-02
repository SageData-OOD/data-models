
{{
    config(
        tags=["rfm"]
    )
}}

select
--o.email,
o.customer__id,
max(o.created_at) recent_order,
count(o.id) total_orders,
sum(o.total_line_items_price) gross_sales,
sum(o.total_line_items_price)
+ sum(-coalesce(o.total_discounts::real, 0))
+ sum(coalesce(o.refund_amount, 0))
+ (sum(coalesce(o.total_tax::real, 0)) - sum(coalesce(o.tax_returned,0))) 
+ sum(coalesce(o.shipping_charge,0)) as total_sales
from {{ref('Orders_refunds')}} as o
group by 1


