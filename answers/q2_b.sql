-- Question: What is the average original price of events in the Netherlands?
-- Answer:
SELECT
    -- Select the currency because not all listings in the Netherlands are in euros.
    ad.original_price_currency,
    -- Divide by 100 because the prices are in cents
    AVG(ad.original_price) / 100 AS average_original_price
FROM
    ad
    JOIN event ON ad.event_id = event.id
    JOIN event_location ON event.location_id = event_location.id
WHERE
    event_location.country = 'NL'
GROUP BY
    -- Groups by currency to calculate the average of the same currency.
    ad.original_price_currency;