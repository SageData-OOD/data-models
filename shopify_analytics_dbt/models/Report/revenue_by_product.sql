{{
    config(
        tags=["orders_reports"]
    )
}}

SELECT
    title Product,
    sum(quantity) number_sold,
    sum(quantity*(round(price::real,2) - round(total_discount::real,2))) Total_revenue
from {{ref('Orders_line_items')}}
group by 
    Product