-- 1. Total invoice revenue by project

SELECT
    project,
    project_code,
    SUM(invoice_amount) AS total_revenue
FROM invoices
GROUP BY project, project_code
ORDER BY total_revenue DESC;


-- 2. Total billable hours by project

SELECT
    project,
    project_code,
    SUM(hours) AS total_billable_hours
FROM timesheets
WHERE billable = 'Yes'
GROUP BY project, project_code
ORDER BY total_billable_hours DESC;


-- 3. Total non-billable hours by project

SELECT
    project,
    project_code,
    SUM(hours) AS total_non_billable_hours
FROM timesheets
WHERE billable = 'No'
GROUP BY project, project_code
ORDER BY total_non_billable_hours DESC;


-- 4. Total billable amount by project

SELECT
    project,
    project_code,
    SUM(billable_amount) AS total_billable_amount
FROM timesheets
WHERE billable = 'Yes'
GROUP BY project, project_code
ORDER BY total_billable_amount DESC;


-- 5. Compare billable amount and invoice amount by project

SELECT
    t.project,
    t.project_code,
    SUM(t.billable_amount) AS total_billable_amount,
    i.invoice_amount
FROM timesheets t
LEFT JOIN invoices i
    ON t.project_code = i.project_code
WHERE t.billable = 'Yes'
GROUP BY t.project, t.project_code, i.invoice_amount
ORDER BY total_billable_amount DESC;


-- 6. Projects with unpaid invoices

SELECT
    project,
    project_code,
    invoice_amount,
    payment_status
FROM invoices
WHERE payment_status <> 'Paid'
ORDER BY invoice_amount DESC;
