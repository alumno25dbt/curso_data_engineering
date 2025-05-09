with 
    raw_generated_data as (
        {{ dbt_date.get_date_dimension("2021-01-01", "2024-12-31") }}
    )

    , spanish_renamed as (
        select 
            *,
             case
                when raw_generated_data.day_of_week = 1 then 'Domingo'
                when raw_generated_data.day_of_week = 2 then 'Lunes'
                when raw_generated_data.day_of_week = 3 then 'Martes'
                when raw_generated_data.day_of_week = 4 then 'Miércoles'
                when raw_generated_data.day_of_week = 5 then 'Jueves'
                when raw_generated_data.day_of_week = 6 then 'Viernes'
                when raw_generated_data.day_of_week = 7 then 'Sábado'
            end as dia_semana_nombre
        from raw_generated_data
    )

select *
from spanish_renamed