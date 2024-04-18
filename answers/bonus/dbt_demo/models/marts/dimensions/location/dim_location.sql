with stg_event_location as (
    select
        *
    from
        {{ ref('stg_event_location') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['stg_event_location.location_id']) }} as location_key,
    location_id,
    country,
    venue_name,
    city
from
    stg_event_location