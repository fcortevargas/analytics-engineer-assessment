with stg_ad as (
    select
        *
    from
        {{ ref('stg_ad') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['stg_ad.original_listing_currency']) }} as currency_key,
    original_listing_currency as currency_code
from
    stg_ad
group by 
    original_listing_currency