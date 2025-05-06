SELECT 
    {{ dbt_utils.generate_surrogate_key(['address_id'])}} AS address_id,
    address,
    country,
    state,
    zipcode,
    _fivetran_deleted,
    _fivetran_synced
FROM {{source('sql_server_dbo','addresses')}}