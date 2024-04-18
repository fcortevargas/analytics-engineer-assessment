WITH verified_events AS (
    -- CTE to select the verified events
    SELECT
        id AS event_id,
        event_end,
        is_expired
    FROM
        website.event
    WHERE
        is_verified
    -- Removed ORDER BY created_at because it's unnecessary in a CTE unless there is a LIMIT after
),
ad_ticket_counts AS (
    -- CTE to count ad tickets
    SELECT
        ad_id,
        id AS ticket_id,  -- Assuming 'id' uniquely identifies each row in website.ad_ticket
        COUNT(*) AS counter
    FROM
        website.ad_ticket
    GROUP BY
        ad_id, id  -- The GROUP BY should include 'id' if it's used as ticket_id to avoid aggregation conflicts
)
SELECT
    a.id AS ad_id,
    adt.ticket_id AS ad_ticket_id,
    ev.event_end AS verified_event_end,
    adt.counter AS ad_ticket_count,
    SUM(CASE WHEN ev.is_expired THEN 1 ELSE 0 END) AS verified_event_expired_count
FROM
    website.ad a
LEFT JOIN
    verified_events ev ON a.event_id = ev.event_id
LEFT JOIN
    ad_ticket_counts adt ON a.id = adt.ad_id
WHERE
    a.source NOT IN ('web-mobile', 'web') AND a.source IS NOT NULL
GROUP BY
    a.id, adt.ticket_id, ev.event_end, adt.counter;