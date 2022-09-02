
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
rfm_recency || rfm_frequency || rfm_monetary AS rfm_cell,
case when rfm_cell in ('355','255') then 'Cannot lose'
     when rfm_cell in ('543','542','453','452') then 'Active fans'
     when rfm_cell in ('525','524','515','514') then 'Promising newbies'
     when rfm_cell in ('335','334','325','324') then 'Potential churners'
else 'Other' end as rfm_segment
from {{ref('rfm_quintiles')}}
order by 6 desc
