SELECT
{{ dbt_utils.generate_surrogate_key(['promo_id'])}} AS promo_id,
promo_id as desc_promo, 
discount,
status, 
_fivetran_deleted,
_fivetran_synced
FROM {{source('sql_server_dbo','promos')}}