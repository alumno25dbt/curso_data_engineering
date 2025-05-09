SELECT 
    oi.order_id,
    oi.product_id,
    quantity,
    order_cost,
    desc_promo,
    shipping_cost,
    order_total,
    user_id,
    address_id,
    shipping_service,
    created_at,
    estimated_delivery_at,
    o.delivered_at,
    tracking_id,
    status
FROM {{ref('base_sql_server_dbo__order_items')}} oi 
JOIN {{ref("base_sql_server_dbo__orders")}} o
ON oi.order_id = o.order_id
order by 1

