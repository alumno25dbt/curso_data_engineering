SELECT
    shipping_service,
    created_at,
    estimated_delivery_at,
    delivered_at,
    tracking_id,
    status
FROM {{source('sql_server_dbo','orders')}}