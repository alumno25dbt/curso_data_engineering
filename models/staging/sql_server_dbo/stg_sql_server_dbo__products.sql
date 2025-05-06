WITH cte4 AS (
    SELECT 
        product_id,
        name,
        price,
        inventory,
        _fivetran_deleted,
        _fivetran_synced
     FROM {{source('sql_server_dbo','products')}}
),

cte8 AS (
    SELECT 
    'no prod' AS product_id,
    'Sin producto' AS name,
    0 AS price,
    0 AS inventory,
    NULL AS _fivetran_deleted,
    '2024-10-25' AS _fivetran_synced
),

cte9 AS (
    SELECT * FROM cte4 
    UNION ALL 
    SELECT * FROM cte8
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} AS product_id,
    name,
    price,
    inventory,
    _fivetran_deleted,
    _fivetran_synced
FROM cte9