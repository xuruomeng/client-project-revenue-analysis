-- Account rate summary

WITH billable_summary AS (
    SELECT
        client,
        SUM(CASE WHEN billable = 'Yes' THEN hours ELSE 0 END) AS total_billable_hours,
        SUM(CASE WHEN billable = 'Yes' THEN billable_amount ELSE 0 END) AS total_billable_amount
    FROM timesheets
    GROUP BY client
)

SELECT
    client,
    total_billable_hours,
    total_billable_amount,
    ROUND(
        total_billable_amount * 1.0 / NULLIF(total_billable_hours, 0),
        2
    ) AS avg_billable_rate,
    ROUND(
        total_billable_amount * 1.0 / NULLIF(total_billable_hours, 0),
        2
    ) AS revenue_per_billable_hour
FROM billable_summary
ORDER BY total_billable_amount DESC;
