{{
    config(
        tags=["orders_reports"]
    )
}}

SELECT
    customer__accepts_marketing,
    round(sum(subtotal_price::real),2) Total_Revenue,
    round(sum(customer__total_spent::real),2) Total_Spend,
    round(avg(customer__total_spent::real),2) Average_Spend
from {{ref('Orders_refunds')}}
group by 
customer__accepts_marketing
