
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
SELECT customer__id,
	ntile(5) over (order by recent_order) as rfm_recency,
	ntile(5) over (order by total_orders) as rfm_frequency,
	ntile(5) over (order by total_sales) as rfm_monetary
from {{ref('rfm_overview')}}
)
order by 6 desc
