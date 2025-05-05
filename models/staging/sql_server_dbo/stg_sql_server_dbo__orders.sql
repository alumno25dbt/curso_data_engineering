SELECT
    order_id,
    shipping_service,
    shipping_cost, 
    address_id,
    created_at,
    CASE 
    WHEN promo_id != '' THEN promo_id
    ELSE 'Sin descuento'
    END AS desc_promo,
    estimated_delivery_at,
    order_cost,
    user_id,
    order_total,
    delivered_at,
    tracking_id,
    status,
    _fivetran_deleted,
    _fivetran_synced
FROM {{source('sql_server_dbo','orders')}}