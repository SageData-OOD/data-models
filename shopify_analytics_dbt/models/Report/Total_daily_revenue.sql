{{
    config(
        tags=["orders_reports"]
    )
}}

select 
    date(created_at::timestamp) order_date,
    round(sum(subtotal_price::real),2) revenue_before_refund,
    count(customer__orders_count) number_of_orders,
    sum(customer__orders_count) number_of_item_sold,
    sum(refund_amount) as daily_refund_amount,
    sum(total_discounts) as discount,
    revenue_before_refund + daily_refund_amount revenue_after_refund 
from {{ref('Orders_refunds')}}
group by 
order_date
order by
order_date asc