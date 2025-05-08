WITH cte12 AS (
    SELECT * FROM {{source('sql_server_dbo','orders')}}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['order_id'])}} AS order_id,
    CASE 
    WHEN status != 'preparing' THEN shipping_service 
    ELSE 'por determinar'
    END AS shipping_service,
    shipping_cost, 
    {{ dbt_utils.generate_surrogate_key(['address_id'])}} AS address_id,
    created_at,
    CASE 
    WHEN promo_id != '' THEN promo_id
    ELSE 'Sin descuento'
    END AS desc_promo,
    CASE
    WHEN status != 'preparing' THEN estimated_delivery_at
    ELSE created_at + interval '3 days'
    END AS estimated_delivery_at,
    order_cost,
    {{ dbt_utils.generate_surrogate_key(['user_id'])}} AS user_id,
    order_total,
    CASE
    WHEN status != 'preparing' THEN delivered_at
    ELSE '1999-01-01'
    END AS delivered_at,
    {{ dbt_utils.generate_surrogate_key(['tracking_id'])}} AS tracking_id,
    status,
    _fivetran_deleted,
    _fivetran_synced
FROM cte12