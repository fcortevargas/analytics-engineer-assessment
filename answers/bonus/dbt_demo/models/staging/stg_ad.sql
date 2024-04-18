with source as (
    select
        *
    from
        {{ source('data', 'ad') }}
),

renamed as (
    select
        -- ids
        id as ad_id,
        event_id,

        -- strings
        original_price_currency as original_listing_currency,

        -- numerics
        original_price as original_listing_price_cents,
        round(original_price / 100, 2) as original_listing_price,
        round(original_price  * 1.2 / 100, 2) as maximum_listing_price,

        -- booleans
        cast(is_sold as boolean) as is_sold,

        -- timestamps
        created_at
    from
        source
)

select * from renamed