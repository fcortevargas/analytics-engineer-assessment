-- Question: What is the percentage of ads from a Hungarian event location?
-- Answer:
WITH listings_in_hungary AS (
    -- CTE to select the count of listings where the event location is in Hungary.
    SELECT
        COUNT(ad.id) AS number_of_listings_in_hungary
    FROM
        ad
        JOIN event ON ad.event_id = event.id
        JOIN event_location ON event_location.id = event.location_id
    WHERE
        event_location.country = 'HU'
), all_listings AS (
    -- CTE to select the count of all listings.
    SELECT
        COUNT(ad.id) as total_number_of_listings
    FROM
        ad
)
SELECT
    -- Calculates the percentage of Hungarian listings.
    (CAST(number_of_listings_in_hungary AS FLOAT) / total_number_of_listings) * 100 AS percentage_of_listings_in_hungary
FROM
    listings_in_hungary,
    all_listings;