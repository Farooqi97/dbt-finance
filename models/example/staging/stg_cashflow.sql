SELECT  
  stock,
  "endDate" AS end_date
FROM {{ ref('cashflowStatement_annually') }}
