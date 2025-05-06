SELECT 
    {{ dbt_utils.generate_surrogate_key(['user_id'])}} AS user_id,
    created_at,
    updated_at,
    {{ dbt_utils.generate_surrogate_key(['address_id'])}} AS address_id,
    first_name,
    last_name,
    phone_number,
    email,
    _fivetran_deleted,
    _fivetran_synced
FROM {{source('sql_server_dbo','users')}}