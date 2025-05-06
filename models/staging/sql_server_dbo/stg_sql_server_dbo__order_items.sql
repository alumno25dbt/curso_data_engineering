WITH cte5 AS (
    SELECT * FROM  {{source('sql_server_dbo','order_items')}}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['order_id'])}} AS order_id,
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} AS product_id,
    quantity,
    _fivetran_deleted,
    _fivetran_synced
 FROM  cte5
