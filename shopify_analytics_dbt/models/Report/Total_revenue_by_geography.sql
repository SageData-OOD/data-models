select 
    customer__default_address__country_name,
    round(sum(subtotal_price::real),2) revenue_before_refund,
    count(customer__orders_count::integer) number_of_orders,
    sum(refund_amount) as daily_refund_amount,
    revenue_before_refund + daily_refund_amount revenue_after_refund 
from {{ref('Orders_refunds')}}
group by
    customer__default_address__country_name
order by
    number_of_orders desc