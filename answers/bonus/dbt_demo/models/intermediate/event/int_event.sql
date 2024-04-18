with stg_event as (
    select
        *
    from
        {{ ref('stg_event') }}
)
select
    event_id,
    location_id,
    event_title,
    event_start_at
from
    stg_event