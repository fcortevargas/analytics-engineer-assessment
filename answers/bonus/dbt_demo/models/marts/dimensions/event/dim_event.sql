with int_event as (
    select
        *
    from
        {{ ref('int_event') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['int_event.event_id']) }} as event_key,
    event_id,
    event_title,
    event_start_at
from
    int_event