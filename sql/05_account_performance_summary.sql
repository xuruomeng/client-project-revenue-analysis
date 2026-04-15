-- Account performance summary

WITH project_summary AS (
    SELECT
        c.client_name AS client,
        COUNT(p.project_id) AS total_projects
    FROM clients c
    LEFT JOIN projects p
        ON c.client_id = p.client_id
    GROUP BY c.client_name
),

timesheet_summary AS (
    SELECT
        client,
        SUM(hours) AS total_hours,
        SUM(CASE WHEN billable = 'Yes' THEN hours ELSE 0 END) AS billable_hours,
        SUM(CASE WHEN billable = 'No' THEN hours ELSE 0 END) AS non_billable_hours,
        SUM(CASE WHEN billable = 'Yes' THEN billable_amount ELSE 0 END) AS total_billable_amount
    FROM timesheets
    GROUP BY client
),

invoice_summary AS (
    SELECT
        client,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY client
)

SELECT
    ps.client,
    ps.total_projects,
    COALESCE(isum.total_revenue, 0) AS total_revenue,
    COALESCE(ts.total_hours, 0) AS total_hours,
    COALESCE(ts.billable_hours, 0) AS billable_hours,
    COALESCE(ts.non_billable_hours, 0) AS non_billable_hours,
    ROUND(
        COALESCE(ts.billable_hours, 0) * 100.0 / NULLIF(COALESCE(ts.total_hours, 0), 0),
        2
    ) AS billability_rate_percent,
    COALESCE(ts.total_billable_amount, 0) AS total_billable_amount
FROM project_summary ps
LEFT JOIN timesheet_summary ts
    ON ps.client = ts.client
LEFT JOIN invoice_summary isum
    ON ps.client = isum.client
ORDER BY total_revenue DESC;
