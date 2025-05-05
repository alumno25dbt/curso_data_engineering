SELECT 
    user_id,
    created_at,
    updated_at,
    address_id,
    first_name,
    last_name,
    phone_number,
    email,
    _fivetran_deleted,
    _fivetran_synced
FROM {{source('sql_server_dbo','users')}}