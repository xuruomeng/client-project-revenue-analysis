# Client Project Revenue Analysis

This is a beginner SQL portfolio project about client and project revenue analysis.

The goal of this project is to explore business data from a small service company and answer simple revenue-related questions.  
The analysis is based on four tables: clients, projects, timesheets, and invoices.

## Project Overview

In this project, I worked with SQL to analyze:

- total revenue by client
- total revenue by project
- number of projects by client
- billable and non-billable hours
- payment status of invoices
- top clients and projects by revenue

This project is meant to show basic SQL skills in a business-focused context.

## Dataset

The project uses four tables:

- `clients.csv`  
  Basic client information

- `projects.csv`  
  Project information and client mapping

- `timesheets.csv`  
  Harvest-style work hour report with billable hours and billable amount

- `invoices.csv`  
  Invoice data including invoice amount and payment status

## Tools Used

- SQL
- GitHub
- CSV files as source data

## SQL Skills Used

In this project, I used:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `LEFT JOIN`
- aggregate functions such as `SUM()` and `COUNT()`
- `CTE`
- window functions such as `RANK()` and cumulative sums

## Files

### Data
- `data/clients.csv`
- `data/projects.csv`
- `data/timesheets.csv`
- `data/invoices.csv`

### SQL
- `sql/01_exploration.sql`  
  First look at the tables

- `sql/02_client_revenue_analysis.sql`  
  Revenue and hours analysis by client

- `sql/03_project_revenue_analysis.sql`  
  Revenue and hours analysis by project

- `sql/04_revenue_ranking.sql`  
  Ranking, revenue share, and cumulative revenue share using CTEs and window functions

## Business Questions

This project looks at the following questions:

1. Which clients generate the most revenue?
2. Which projects generate the most revenue?
3. How many projects does each client have?
4. How many billable and non-billable hours are recorded?
5. Which invoices are still pending or overdue?
6. What share of total revenue comes from the top clients?

## Example Analysis

Some example SQL outputs from this project include:

- total invoice revenue by client
- total billable amount by project
- unpaid invoices by payment status
- client revenue ranking
- cumulative revenue share by client

## Key Takeaways

This project shows how SQL can be used to answer simple business questions with client, project, timesheet, and invoice data.

It also shows a basic workflow:
- explore the data
- aggregate revenue and hours
- compare billable work and invoice values
- rank clients and projects by revenue

## Possible Next Steps

Some possible next steps for this project are:

- add charts or dashboard screenshots in the `images` folder
- build a simple dashboard in Excel or Power BI
- add monthly revenue trend analysis
- compare invoice amount and billable amount in more detail

## Author

Ruomeng Xu
