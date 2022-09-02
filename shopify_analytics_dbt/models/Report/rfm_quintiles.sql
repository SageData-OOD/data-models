
{{
    config(
        tags=["rfm"]
    )
}}


SELECT customer__id,
	ntile(5) over (order by recent_order) as rfm_recency,
	ntile(5) over (order by total_orders) as rfm_frequency,
	ntile(5) over (order by total_sales) as rfm_monetary
from {{ref('rfm_overview')}}
order by 2 desc