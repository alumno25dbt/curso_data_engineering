WITH cte_1 AS (
    SELECT * FROM {{source('sql_server_dbo','promos')}}
),
cte_2 AS (
    SELECT
    'Sin descuento' AS promo_id,
    '0' AS discount,
    'Inactive' AS status,
    NULL as _fivetran_deteled,
    '2024-10-25' AS _fivetran_synced
),
 cte_3 AS (
    SELECT * FROM cte_1 
    UNION ALL 
    SELECT * FROM cte_2
)

SELECT
{{ dbt_utils.generate_surrogate_key(['promo_id'])}} AS promo_id,
promo_id as desc_promo, 
discount,
status, 
_fivetran_deleted,
_fivetran_synced
FROM cte_3