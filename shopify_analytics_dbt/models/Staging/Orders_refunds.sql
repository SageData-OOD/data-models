select

    orders.*, 
    r.refund_amount,
    r.refunds,
    r.tax_returned,
    sl.shipping_charge


from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__orders')}} as orders
left join 
    (
        select
        r_order.order_id,
        sum(coalesce(r_order.amount::real, 0)) refund_amount,
        count(r_order.order_id) number_of_items_returned,
        sum(coalesce(rline.subtotal::real, 0)) refunds,
        sum(coalesce(rline.total_tax::real, 0)) tax_returned
        from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__orders__refunds__order_adjustments')}} as r_order
        left join 
        {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__order_refunds__refund_line_items')}} as rline
        on rline.id = r_order.refund_id
        group by 1
    ) r
    on orders.id=r.order_id

left join (
    	select 
            sl.id,
    		sum(sl.price) shipping_charge,
    		sum(sl.discounted_price) shipping_discount
    	from {{source('shopify_raw_data', 'sd__redshift__xl_replicate__sd__shopify__xl__orders__shipping_lines')}} sl
    	group by 1
        ) sl
        on orders.id = sl.id