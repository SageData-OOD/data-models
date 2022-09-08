{{
    config(
        tags=["revenue"]
    )
}}

select 
    date(created_at::timestamp) order_date,
    round(sum(total_line_items_price::real),2) daily_gross_sales,
    count(customer__orders_count) daily_number_of_orders,
    sum(customer__orders_count) daily_number_of_item_sold,
    sum(total_discounts) daily_discount,
    sum(refund_amount) daily_refund_amount,
    daily_gross_sales - daily_refund_amount daily_net_sales,
    sum(total_tax) daily_total_taxes,
    sum(tax_returned) daily_total_tax_returns,
    sum(shipping_charge) daily_shipping_charge,
    daily_gross_sales - daily_discount - daily_refund_amount + daily_total_taxes + daily_shipping_charge total_sales 
from {{ref('Orders_refunds')}}
group by 
order_date
order by
order_date asc