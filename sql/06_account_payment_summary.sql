-- Account payment summary

SELECT
    client,
    SUM(CASE WHEN payment_status = 'Paid' THEN invoice_amount ELSE 0 END) AS paid_amount,
    SUM(CASE WHEN payment_status = 'Pending' THEN invoice_amount ELSE 0 END) AS pending_amount,
    SUM(CASE WHEN payment_status = 'Overdue' THEN invoice_amount ELSE 0 END) AS overdue_amount,
    SUM(invoice_amount) AS total_invoiced_amount,
    SUM(CASE WHEN payment_status <> 'Paid' THEN 1 ELSE 0 END) AS unpaid_invoice_count
FROM invoices
GROUP BY client
ORDER BY total_invoiced_amount DESC;
