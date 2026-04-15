-- 1. Total invoice revenue by client

SELECT
    client,
    SUM(invoice_amount) AS total_revenue
FROM invoices
GROUP BY client
ORDER BY total_revenue DESC;


-- 2. Number of projects by client

SELECT
    c.client_name,
    COUNT(p.project_id) AS number_of_projects
FROM clients c
LEFT JOIN projects p
    ON c.client_id = p.client_id
GROUP BY c.client_name
ORDER BY number_of_projects DESC;


-- 3. Total billable hours by client

SELECT
    client,
    SUM(hours) AS total_billable_hours
FROM timesheets
WHERE billable = 'Yes'
GROUP BY client
ORDER BY total_billable_hours DESC;


-- 4. Total non-billable hours by client

SELECT
    client,
    SUM(hours) AS total_non_billable_hours
FROM timesheets
WHERE billable = 'No'
GROUP BY client
ORDER BY total_non_billable_hours DESC;


-- 5. Total billable amount by client

SELECT
    client,
    SUM(billable_amount) AS total_billable_amount
FROM timesheets
WHERE billable = 'Yes'
GROUP BY client
ORDER BY total_billable_amount DESC;
