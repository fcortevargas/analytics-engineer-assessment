with source as (
    select
        * 
    from
        {{ source('data', 'event_location') }}
),

renamed as (
    select
        -- ids
        id as location_id,
        
        -- strings
        country,
        name as venue_name,
        city
    from
        source
)

select * from renamed