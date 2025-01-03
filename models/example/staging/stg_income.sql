SELECT
  stock,
  "totalRevenue" AS total_revenue,
  "grossProfit" AS gross_profit,
  "ebit" AS ebit,
  "interestExpense" AS interest_expense,
  "incomeTaxExpense" AS income_tax_expense,
  "costOfRevenue" AS cost_of_revenue,
  "endDate" AS end_date
FROM {{ ref('incomeStatementHistory_annually') }}
