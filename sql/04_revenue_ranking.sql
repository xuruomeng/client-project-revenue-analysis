-- 1. Rank clients by total invoice revenue

WITH client_revenue AS (
    SELECT
        client,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY client
)

SELECT
    client,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM client_revenue
ORDER BY revenue_rank;


-- 2. Calculate revenue share by client

WITH client_revenue AS (
    SELECT
        client,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY client
)

SELECT
    client,
    total_revenue,
    ROUND(
        total_revenue * 100.0 / SUM(total_revenue) OVER (),
        2
    ) AS revenue_share_percent
FROM client_revenue
ORDER BY total_revenue DESC;


-- 3. Rank projects by total invoice revenue

WITH project_revenue AS (
    SELECT
        project,
        project_code,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY project, project_code
)

SELECT
    project,
    project_code,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM project_revenue
ORDER BY revenue_rank;


-- 4. Calculate cumulative revenue share by client

WITH client_revenue AS (
    SELECT
        client,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY client
),
ranked_clients AS (
    SELECT
        client,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
        ROUND(
            total_revenue * 100.0 / SUM(total_revenue) OVER (),
            2
        ) AS revenue_share_percent,
        ROUND(
            SUM(total_revenue) OVER (
                ORDER BY total_revenue DESC
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) * 100.0 / SUM(total_revenue) OVER (),
            2
        ) AS cumulative_revenue_share_percent
    FROM client_revenue
)

SELECT
    client,
    total_revenue,
    revenue_rank,
    revenue_share_percent,
    cumulative_revenue_share_percent
FROM ranked_clients
ORDER BY revenue_rank;


-- 5. Top 3 clients by invoice revenue

WITH client_revenue AS (
    SELECT
        client,
        SUM(invoice_amount) AS total_revenue
    FROM invoices
    GROUP BY client
),
ranked_clients AS (
    SELECT
        client,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM client_revenue
)

SELECT
    client,
    total_revenue,
    revenue_rank
FROM ranked_clients
WHERE revenue_rank <= 3
ORDER BY revenue_rank;
