with stg_ad as (
    select
        *
    from 
        {{ ref('stg_ad') }}
),

int_event as (
    select
        *
    from
        {{ ref('int_event') }}
),

dim_currency as (
    select
        *
    from
        {{ ref('dim_currency') }}
),

dim_location as (
    select
        *
    from
        {{ ref ('dim_location') }}
)
select
    {{ dbt_utils.generate_surrogate_key(
        [
            'stg_ad.ad_id',
            'int_event.event_id',
            'dim_location.location_id',
            'dim_currency.currency_key'
        ]
    )}} as listing_key,
    stg_ad.ad_id as listing_id,
    int_event.event_id as event_id,
    dim_location.location_id as location_id,
    dim_currency.currency_key as currency_id,
    stg_ad.original_listing_price as original_listing_price,
    stg_ad.maximum_listing_price as maximum_listing_price,
    stg_ad.is_sold as is_sold,
    stg_ad.created_at as created_at
from
    stg_ad
join int_event on int_event.event_id = stg_ad.event_id
join dim_location on dim_location.location_id = int_event.location_id
join dim_currency on dim_currency.currency_code = stg_ad.original_listing_currency