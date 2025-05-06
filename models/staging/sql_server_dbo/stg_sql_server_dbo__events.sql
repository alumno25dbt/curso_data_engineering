WITH cte10 AS (
    SELECT 
    event_id,
    event_type,
    order_id,
    product_id,
    session_id,
    user_id,
    page_url,
    created_at,
    _fivetran_deleted,
    _fivetran_synced
    FROM  {{source('sql_server_dbo','events')}}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['event_id'])}} AS event_id,
    event_type,
    {{ dbt_utils.generate_surrogate_key(['order_id'])}} AS order_id,
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} AS product_id,
    {{ dbt_utils.generate_surrogate_key(['session_id'])}} AS session_id,
    {{ dbt_utils.generate_surrogate_key(['user_id'])}} AS user_id,
    page_url,
    created_at,
    _fivetran_deleted,
    _fivetran_synced
FROM cte10