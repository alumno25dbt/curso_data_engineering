WITH cte_google AS (
    SELECT * FROM {{source('google_sheets','budget')}}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} AS product_id,
    quantity,
    month,
    _fivetran_synced
FROM cte_google
