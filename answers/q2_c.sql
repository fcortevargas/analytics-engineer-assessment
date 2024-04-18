-- Question: What was the number of sold listings for Pixies concerts?
-- Answer:
SELECT
    COUNT(*) as count_sold_pixies_listings
FROM
    ad
    JOIN event ON event.id = ad.event_id
WHERE
    LOWER(event.title) LIKE '%pixies%' -- Lower the titles for collations where LIKE is case-sensitive
    AND ad.is_sold = 1;