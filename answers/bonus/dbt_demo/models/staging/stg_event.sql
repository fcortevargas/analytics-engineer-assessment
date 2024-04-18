with source as (
    select
        * 
    from
        {{ source('data', 'event') }}
),

renamed as (
    select
        -- ids
        id as event_id,
        location_id,
        
        -- strings
        title as event_title,

        -- timestamps
        event_start as event_start_at
    from
        source
)

select * from renamed