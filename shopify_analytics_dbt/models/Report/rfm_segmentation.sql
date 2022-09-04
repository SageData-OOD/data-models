
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
rfm_recency || rfm_frequency || rfm_monetary as rfm_cell,
case when rfm_cell in ('355','255') then 'Cannot lose'
     when rfm_cell in ('543','542','453','452') then 'Active fans'
     when rfm_cell in ('525','524','515','514') then 'Promising newbies'
     when rfm_cell in ('335','334','325','324') then 'Potential churners'
else 'Other' end as rfm_segment
from (
select customer__id,
	ntile(5) over (order by recent_order) as rfm_recency,
	ntile(5) over (order by total_orders) as rfm_frequency,
	ntile(5) over (order by total_sales) as rfm_monetary
from (
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
group by 1)
)
order by 6 desc
